IMPLEMENTATION MODULE Excepts;
#define REF

(* V#107 *)

(*!!! Es fehlen die Etv-Vektoren. *)

(*
09.04.88 TT  Alle Funktionen f. 68020 angepasst. 2 Versionen m. cond.
             compiling! Achtung: RaiseExc nicht f. Bus/Addr-Error bei 68020!
28.08.88 TT  Level wird bei ..Install.. richtig gesetzt, sodass Sys-Funktionen
             nun laufen.
             Bei Sys-Funktionen wird nicht mehr automatisch abgemeldet
25.10.88 TT  CatchRemoval-Aufruf
04.07.89 TT  CPU_FPU.CNF wird included;
             XBRA-Kennung ("MM2X") eingefuegt
19.08.89 TT  RaiseExc laeuft nun sowohl mit 020 als mit 000; f. 020
             Korrekturen von GS uebernommen; CPU_FPU.CNF nicht mehr importiert
01.05.90 TT  ResetVec maskiert High-Byte vor Vergleich aus.
11.06.90 TT  excHandler20 springt vorigen Vektor korrekt an
13.06.90 TT  EnterSupervisorMode raus
27.11.90 TT  Kleine Korrekturen; Vom Supervisor-Stack werden bei 68000 alle
             Daten (SR/PC, ggf. Buserror-Daten), bei 68010 und hoeher nur noch
             SR/PC runtergeholt, alle weitere Daten bleiben drauf;
             'ExcDesc' enthaelt nicht mehr das Felder 'parm'.
12.12.90 TT  Pre/Post-Handler definiert, InstallPostExc fehlt aber noch!
14.02.92 TT  GEMDOS.Super-Aufrufe statt Supexec wg. MinT.
06.06.23 THO Port to gm2
*)

FROM SYSTEM IMPORT CARDINAL16, CARDINAL32, INTEGER32, ADDRESS, TSIZE, ADR, CSIZE_T;
IMPORT MOSGlobals;
FROM MOSSupport IMPORT ToSuper, ToUser;
FROM Storage IMPORT ALLOCATE, DEALLOCATE;
FROM SysTypes IMPORT ExcSet, ExcDesc, Exceptions;
FROM PrgCtrl IMPORT EnvlpCarrier, SetEnvelope, CatchProcessTerm, TermCarrier;
FROM MOSCtrl IMPORT RemovalEntry, CatchRemoval;
FROM ErrBase IMPORT DoTRAP6;
FROM libc IMPORT memcpy;
FROM BIOS IMPORT SetException;

IMPORT SysInfo;


CONST   DftSF = 00010H;

CONST XBRA_Magic = 058425241H; (* 'XBRA' *)
      XBRA_ID = 04D4D3258H; (* 'MM2X' *)

TYPE PtrXBRA_Entry = POINTER TO XBRA_Entry;
TYPE XBRA_Prev = RECORD CASE :BOOLEAN OF
 | FALSE: prev : ADDRESS; (* voriger Vektor *)
 | TRUE: call : PROC;
 END
END;
TYPE XBRA_Entry = RECORD      (* Interne Datenstruktur - nicht darauf zugreifen! *)
              magic: CARDINAL32;        (* CONST 'XBRA' *)
              name : CARDINAL32;        (* individuelle Kennung *)
              prev : XBRA_Prev;
END;

TYPE    PtrEntry = POINTER TO Entry;
Entry    = RECORD
	desc: ExcDesc; (* muss am Anfang bleiben! *)
	call: PreExcProc; (* 90 *)
	stackLow : ADDRESS; (* 94 *)
	stackHigh: ADDRESS; (* 98 *)
	xbra: XBRA_Entry;
	(* hier folgt direkt das EntryData-Record *)
END;

TYPE    PtrUser = POINTER TO User;
User    = RECORD
	v    : POINTER TO ARRAY [0..60000] OF PtrEntry;
	numbs: ExcSet;
	level: INTEGER;
	next, prev : PtrUser;
	(* es folgen:
	- ARRAY [0..n-1] OF PtrEntry
	- alle 'Entry' mit jew. einer entryProc dahinter
	*)
END;

VAR root: User;
VAR Level: INTEGER;
VAR raiseV: PROCEDURE(HardExceptions);
VAR busHdl: PROC;


TYPE    EntryData = RECORD
#ifdef __mcoldfire__
	d1: CARDINAL16; (* move.l %%a0,-(%%a7) *)
	d2: CARDINAL16; (* movem.l %%d0-%%a6 *)
	pEntry1: PtrEntry; (* abs.l *)
	d4: CARDINAL16; (* movem.l %%d0-%%a6,(%%a0) *)
	d5: CARDINAL16;
	d6: CARDINAL16; (* move.l (%%a7)+,32(%%a0)" *)
	d7: CARDINAL16;
#else
	d1: CARDINAL16; (* movem.l %%d0-%%a6 *)
	d2: CARDINAL16;
	pEntry1: PtrEntry; (* abs.l *)
	d3: CARDINAL16; (* move.l # *)
	pEntry2: PtrEntry; (* abs.l *)
#endif
	d8: CARDINAL16; (* move.w # *)
	excNo: CARDINAL16 (* abs.w *)
	(* ... und noch beliebig mehr Bytes... *)
END;


PROCEDURE busEntry;
BEGIN
  (* instruction sequence here must match EntryData above *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.l %%a0,-(%%a7)" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
  ASM VOLATILE("movem.l %%d0-%%a6,(%%a0)" : : );
  ASM VOLATILE("move.l (%%a7)+,32(%%a0)" : : );
#else
  ASM VOLATILE("movem.l %%d0-%%a6,0x123456" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
#endif
  ASM VOLATILE("move.w #1234,82(%%a0)" : : ); (* excNo *)
  ASM VOLATILE("move.l %0,-(%%a7)" : : "m"(busHdl) : );
  ASM VOLATILE("rts" : : );
  ASM VOLATILE("busEntryEnd:" : : );
END busEntry;


PROCEDURE normEntry0;
BEGIN
  (* instruction sequence here must match EntryData above *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.l %%a0,-(%%a7)" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
  ASM VOLATILE("movem.l %%d0-%%a6,(%%a0)" : : );
  ASM VOLATILE("move.l (%%a7)+,32(%%a0)" : : );
#else
  ASM VOLATILE("movem.l %%d0-%%a6,0x123456" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
#endif
  ASM VOLATILE("move.w #1234,82(%%a0)" : : ); (* excNo *)
  ASM VOLATILE("move.w (%%a7)+,72(%%a0)" : : ); (* regSR *)
  ASM VOLATILE("move.l (%%a7)+,68(%%a0)" : : ); (* regPC *)
  ASM VOLATILE("jmp %0" : : "m"(excHandler0) : );
  ASM VOLATILE("normEntry0End:" : : : );
END normEntry0;


PROCEDURE normEntry20;
BEGIN
  (* instruction sequence here must match EntryData above *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.l %%a0,-(%%a7)" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
  ASM VOLATILE("movem.l %%d0-%%a6,(%%a0)" : : );
  ASM VOLATILE("move.l (%%a7)+,32(%%a0)" : : );
#else
  ASM VOLATILE("movem.l %%d0-%%a6,0x123456" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
#endif
  ASM VOLATILE("move.w #1234,82(%%a0)" : : ); (* excNo *)
  ASM VOLATILE("move.w (%%a7)+,72(%%a0)" : : ); (* regSR *)
  ASM VOLATILE("move.l (%%a7)+,68(%%a0)" : : ); (* regPC *)
  ASM VOLATILE("jmp %0" : : "m"(excHandler20) : );
  ASM VOLATILE("normEntry20End:" : : : );
END normEntry20;


PROCEDURE fastEntry;
BEGIN
  (* instruction sequence here must match EntryData above *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.l %%a0,-(%%a7)" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
  ASM VOLATILE("movem.l %%d0-%%a6,(%%a0)" : : );
  ASM VOLATILE("move.l (%%a7)+,32(%%a0)" : : );
#else
  ASM VOLATILE("movem.l %%d0-%%a6,0x123456" : : );
  ASM VOLATILE("move.l #0x123456,%%a0" : : );
#endif
  ASM VOLATILE("move.w #1234,82(%%a0)" : : ); (* excNo *)
  ASM VOLATILE("move.w (%%a7)+,72(%%a0)" : : ); (* regSR *)
  ASM VOLATILE("move.l (%%a7)+,68(%%a0)" : : ); (* regPC *)

  ASM VOLATILE("move.l %%a7,60(%%a0)" : : ); (* regSSP *)
  ASM VOLATILE("move.l %%usp,%%a1" : : );
  ASM VOLATILE("move.l %%a1,64(%%a0)" : : ); (* regUSP *)
  (* ASM VOLATILE("move.l 94(%%a0),%%a3" : : ); (* stackLow *) *)
  ASM VOLATILE("move.l 98(%%a0),%%a7" : : ); (* stackHigh *)
  ASM VOLATILE("move.l %%a0,-(%%a7)" : : );
  ASM VOLATILE("move.l 90(%%a0),%%a0" : : ); (* entry.call *)
  ASM VOLATILE("jsr (%%a0)" : : );
  ASM VOLATILE("move.l (%%a7)+,%%a0" : : );
  (* register zuruecksetzen und rte *)
  ASM VOLATILE("move.l 64(%%a0),%%a1" : : ); (* regUSP *)
  ASM VOLATILE("move.l %%a1,%%usp" : : );
  ASM VOLATILE("move.l 60(%%a0),a7" : : ); (* regSSP *)
  ASM VOLATILE("move.l 68(%%a0),-(%%a7)" : : ); (* regPC *)
  ASM VOLATILE("move.w 72(%%a0),-(%%a7)" : : ); (* regSR *)
  ASM VOLATILE("tst.w %%d0" : : ); (* vorigen vektor anspringen *)
  ASM VOLATILE("bne.s 1f" : : ); (* ja *)
  ASM VOLATILE("movem.l (%%a0),%%d0-%%a6" : : );
  ASM VOLATILE("rte" : : );
  ASM VOLATILE("1:" : : );
  ASM VOLATILE("move.l 110(%%a0),-(%%a7)" : : ); (* entry.old *)
  ASM VOLATILE("movem.l (%%a0),%%d0-%%a6" : : );
  ASM VOLATILE("rts" : : );
  ASM VOLATILE("fastEntryEnd:" : : );
END fastEntry;


(* EntryPtr in a0 *)
PROCEDURE busHdl0;
BEGIN
	ASM VOLATILE("move.w  (%%a7)+,78(%%a0)" : : ); (* superSR *)
	ASM VOLATILE("move.l  (%%a7)+,74(%%a0)" : : ); (* accessAddr *)
	ASM VOLATILE("move.w  (%%a7)+,%%d0" : : );
	ASM VOLATILE("move.w  %%d0,80(%%a0)" : : ); (* instruction *)
	
	ASM VOLATILE("move.w  (%%a7)+,%%d1" : : );                (* SR vom Stack *)
	ASM VOLATILE("move.w  %%d1,72(%%a0)" : : );
	ASM VOLATILE("move.l  (%%a7)+,%%a2" : : );                (* PC vom Stack *)
	
	(* Adr. der Instruktion suchen (2 bis 10 Bytes vor PC) *)
	ASM VOLATILE("moveq   #-2,%%d1" : : );
ASM VOLATILE("1:");
	ASM VOLATILE("cmp.w   0(%%a2,%%d1.l),%%d0" : : );   (* Instr. gefunden ? *)
	ASM VOLATILE("beq.s   3f" : : );              (* Ja, PC (A2) auf die Adr. setzen *)
	ASM VOLATILE("subq.l  #2,%%d1" : : );           (* weiter zurueck *)
	ASM VOLATILE("cmpi    #-10,%%d1" : : );         (* nicht mehr als 10 Bytes zurueck *)
	ASM VOLATILE("bcc.s   1b" : : );              (* weitersuchen *)
ASM VOLATILE("2:");
	ASM VOLATILE("move.l  %%a2,68(%%a0)" : : ); (* regPC *)
	ASM VOLATILE("jmp     %0" : : "m"(excHandler0) );     (* nicht gefunden, PC unveraendert lassen *)
ASM VOLATILE("3:");
	ASM VOLATILE("adda.l  %%d1,%%a2" : : );
	ASM VOLATILE("bra.s   2b" : : );
END busHdl0;


(* EntryPtr in a0 *)
PROCEDURE busHdl20;
BEGIN
	(* BusError-Daten holen *)
	ASM VOLATILE("move.w  (%%a7)+,72(%%a0)" : : ); (* SR vom Stack *)
	ASM VOLATILE("move.l  (%%a7)+,68(%%a0)" : : ); (* PC vom Stack *)
	
	ASM VOLATILE("move.w  4(%%a7),78(%%a0)" : : ); (* superSR *)
	ASM VOLATILE("move.l  10(%%a7),74(%%a0)" : : ); (* accessAddr *)
	ASM VOLATILE("move.w  6(%%a7),%%d0" : : );
	ASM VOLATILE("move.w  %%d0,80(%%a0)" : : ); (* instruction *)
	
	(* bei 68020 zeigt PC anscheinend schon auf die Error-Instr. *)
	ASM VOLATILE("jmp     %0" : :  "m"(excHandler20) );
END busHdl20;


(* EntryPtr in a0 *)
PROCEDURE excHandler0;
BEGIN
	ASM VOLATILE("move.l  %%a7,60(%%a0)" : : ); (* regSSP *)
	ASM VOLATILE("move.l  %%usp,%%a1" : : );
	ASM VOLATILE("move.l  %%a1,64(%%a0)" : : ); (* regUSP *)
	
	(* Routine aufrufen *)
#ifdef __mcoldfire__
	ASM VOLATILE("move.w  %%sr,%%d0" : : );
	ASM VOLATILE("andi.l  #0xcfff,%%d0" : : );
	ASM VOLATILE("move.w  %%d0,%%sr" : : );  (* User Mode *)
#else
	ASM VOLATILE("andi    #0xcfff,%%sr" : : );  (* User Mode *)
#endif
	ASM VOLATILE("move.l  94(%%a0),%%a3" : : ); (* Entry.stackLow *)
	ASM VOLATILE("move.l  98(%%a0),%%a7" : : ); (* Entry.stackHigh *)
	ASM VOLATILE("move.l  %%a0,-(%%a7)" : : );
	(* move.l  %%a0,(%%a3)+ *)
	ASM VOLATILE("move.l  90(%%a0),%%a0" : : ); (* Entry.call *)
	ASM VOLATILE("jsr     (%%a0)" : : );
	ASM VOLATILE("move.w  %%d0,-(%%a7)" : : );
	
	(* zurueck in den Supervisor-Mode *)
	ASM VOLATILE("clr.l   -(%%a7)" : : );
	ASM VOLATILE("move.w  #32,-(%%a7)" : : );
	ASM VOLATILE("trap    #1" : : );
	ASM VOLATILE("addq.l  #6,%%a7" : : );
	
	(* Register zuruecksetzen und RTE *)
	ASM VOLATILE("move.w  (%%a7)+,%%d0" : : );
	ASM VOLATILE("move.l  (%%a7)+,%%a2" : : );        (* ^Entry *)
	ASM VOLATILE("move.l  64(%%a2),%%a1" : : );       (* regUSP *)
	ASM VOLATILE("move.l  %%a1,%%usp" : : );
	ASM VOLATILE("move.l  60(%%a2),%%a7" : : ); (* regSSP *)
	ASM VOLATILE("move.l  68(%%a2),-(%%a7)" : : ); (* regPC *)
	ASM VOLATILE("move.w  72(%%a2),-(%%a7)" : : ); (* regSR *)
	
	ASM VOLATILE("tst.w   %%d0" : : );           (* vorigen Vektor anspringen ? *)
	ASM VOLATILE("bne.s   1f" : : );               (* ja *)
	
	ASM VOLATILE("movem.l (%%a2),%%d0-%%a6" : : );
	ASM VOLATILE("rte" : : );
	
ASM VOLATILE("1:" : : );
#ifdef __mcoldfire__
	ASM VOLATILE("move.w  82(%%a2),%%d0" : : ); (* excNo *)
	ASM VOLATILE("cmpi.w  #4,%%d0" : : );
	ASM VOLATILE("bcc.s   2f" : : );
#else
	ASM VOLATILE("cmpi.w  #4,82(%%a2)" : : ); (* excNo *)
	ASM VOLATILE("bcc.s   2f" : : );
#endif
	ASM VOLATILE("move.w  80(%%a2),-(%%a7)" : : ); (* instruction *)
	ASM VOLATILE("move.l  74(%%a2),-(%%a7)" : : ); (* accessAddr *)
	ASM VOLATILE("move.w  78(%%a2),-(%%a7)" : : ); (* superSR *)
ASM VOLATILE("2:" : : );
	ASM VOLATILE("move.l  110(%%a2),-(%%a7)" : : ); (* Entry.old *)
	ASM VOLATILE("movem.l (%%a2),%%d0-%%a6" : : );
END excHandler0;


(* EntryPtr in a0 *)
PROCEDURE excHandler20;
BEGIN
	(* wie excHandler0, nur ohne Sonderbehandlung fuer Bus/Adr-Error *)
	ASM VOLATILE("move.l  %%a7,60(%%a0)" : : ); (* regSSP *)
	ASM VOLATILE("move.l  %%usp,%%a1" : : );
	ASM VOLATILE("move.l  %%a1,64(%%a0)" : : ); (* regUSP *)
	
	(* Routine aufrufen *)
#ifdef __mcoldfire__
	ASM VOLATILE("move.w  %%sr,%%d0" : : );
	ASM VOLATILE("andi.l  #0xcfff,%%d0" : : );
	ASM VOLATILE("move.w  %%d0,%%sr" : : );  (* User Mode *)
#else
	ASM VOLATILE("andi    #0xcfff,%%sr" : : );     (* User Mode *)
#endif
	ASM VOLATILE("move.l  94(%%a0),%%a3" : : ); (* Entry.stackLow *)
	ASM VOLATILE("move.l  98(%%a0),%%a7" : : ); (* Entry.stackHigh *)
	ASM VOLATILE("move.l  %%a0,-(%%a7)" : : );
	(* move.l  %%a0,(%%a3)+ *)
	ASM VOLATILE("move.L  90(%%a0),%%a0" : : ); (* Entry.call *)
	ASM VOLATILE("jsr     (%%a0)" : : );
	ASM VOLATILE("move.w  %%d0,-(%%a7)" : : );
	
	(* zurueck in den Supervisor-Mode *)
	ASM VOLATILE("clr.l   -(%%a7)" : : );
	ASM VOLATILE("move.w  #32,-(%%a7)" : : );
	ASM VOLATILE("trap    #1" : : );
	ASM VOLATILE("addq.L  #6,%%a7" : : );
	
	(* Register zuruecksetzen und RTE *)
	ASM VOLATILE("move.w  (%%a7)+,%%d0" : : );
	ASM VOLATILE("move.l  (%%a7)+,%%a2" : : );        (* ^Entry *)
	ASM VOLATILE("move.l  64(%%a2),%%a1" : : );       (* regUSP *)
	ASM VOLATILE("move.l  %%a1,%%usp" : : );
	ASM VOLATILE("move.l  60(%%a2),%%a7" : : ); (* regSSP *)
	ASM VOLATILE("move.l  68(%%a2),-(%%a7)" : : ); (* regPC *)
	ASM VOLATILE("move.w  72(%%a2),-(%%a7)" : : );
	
	ASM VOLATILE("tst.w   %%d0" : : );              (* vorigen Vektor anspringen ? *)
	ASM VOLATILE("bne.s   1f" : : );                (* ja *)
	
	ASM VOLATILE("movem.l (%%a2),%%d0-%%a6" : : );
	ASM VOLATILE("rte" : : );
	
ASM VOLATILE("1:" : : );
	ASM VOLATILE("move.l  110(%%a2),-(%%a7)" : : ); (* Entry.old *)
	ASM VOLATILE("movem.L (%%a2),%%d0-%%a6" : : );
END excHandler20;


PROCEDURE SetVec (no: CARDINAL; newV: ADDRESS; VAR oldV: ADDRESS);
BEGIN
  oldV := SetException(no, newV);
END SetVec;


PROCEDURE ResetVec (no: CARDINAL; entry: PtrXBRA_Entry);
VAR pprev: POINTER TO PtrXBRA_Entry;
    prev: PtrXBRA_Entry;
    oldsp: INTEGER32;
BEGIN
  oldsp := ToSuper();
  pprev := ADDRESS(no * 4);
  LOOP
    (* 'entry' gefunden? *)
    prev := pprev^;
    IF prev = entry THEN
      (* Entry.old eintragen *)
      DEC(prev, SIZE(prev^));
      pprev^ := prev^.prev.prev;
      EXIT;
    END;
    (* Ist dies ein XBRA-Eintrag? *)
    DEC(prev, SIZE(prev^));
    IF prev^.magic <> XBRA_Magic THEN
      (* Nein -> entry hier trotzdem austragen *)
      DEC(entry, SIZE(entry^));
      pprev^ := entry^.prev.prev;
      EXIT;
    END;
    pprev := ADR(prev^.prev.prev);
  END;
  ToUser(oldsp);
END ResetVec;


PROCEDURE linkIn(p: PtrUser);
BEGIN
	p^.next := root.next;
	p^.prev := ADR(root);
	root.prev^.next := p;
	root.next := p
END linkIn;


PROCEDURE linkOut(p: PtrUser);
BEGIN
	p^.prev^.next := p^.next;
	p^.next^.prev := p^.prev;
END linkOut;


PROCEDURE Install ( REF traps: ExcSet; call0: PROC;
userMode: BOOLEAN; workSpace: MOSGlobals.MemArea;
VAR hdl: ADDRESS; mylevel: INTEGER; post: BOOLEAN );

VAR useSF: BOOLEAN;

  PROCEDURE entryLen (n:CARDINAL; VAR procS: PROC): CSIZE_T;
  VAR procE: PROC;
  BEGIN
    IF NOT(userMode) THEN
      procS := fastEntry;
      ASM VOLATILE("move.l #fastEntryEnd,%0" : "=g"(procE) : : );
    ELSIF n < 4 THEN
      procS := busEntry;
      ASM VOLATILE("move.l #busEntryEnd,%0" : "=g"(procE) : : );
    ELSIF useSF THEN
      procS := normEntry20;
      ASM VOLATILE("move.l #normEntry20End,%0" : "=g"(procE) : : );
    ELSE
      procS := normEntry0;
      ASM VOLATILE("move.l #normEntry0End,%0" : "=g"(procE) : : );
    END;
    RETURN ADDRESS(procE) - ADDRESS(procS);
  END entryLen;

VAR i,c:CARDINAL;
l: CSIZE_T;
procS: PROC;
procL: CSIZE_T;
pUser: PtrUser;
pEntry: PtrEntry;
pData: POINTER TO EntryData;

BEGIN
  useSF := SysInfo.UseStackFrame();
  hdl := NIL;
  IF post THEN
    HALT (* noch nicht impl. *);
    RETURN
  END;
  (* Zaehle Elemente in 'traps'-Set *)
  c := 0;
  l := TSIZE(User);
  FOR i := MIN(ExcSet) TO MAX(ExcSet) DO
    IF i IN traps THEN
      IF NOT(userMode) AND (i<4) THEN
        DoTRAP6(MOSGlobals.IllegalCall);
        RETURN;
      END;
      l := l + entryLen(i, procS) + TSIZE(Entry) + 4;
      INC(c);
    END;
  END;
  IF c <> 0 THEN
    ALLOCATE(hdl, l);
    IF hdl <> NIL THEN
      pUser := hdl;
      pUser^.numbs := traps;
      pUser^.level := mylevel;
      linkIn(pUser);
      pEntry := ADDRESS(pUser) + TSIZE(User);
      pUser^.v := ADDRESS(pEntry);
      pEntry := ADDRESS(pEntry) + 4 * c;
      c := 0;
      FOR i := MIN(ExcSet) TO MAX(ExcSet) DO
        IF i IN traps THEN
          pUser^.v^[c] := pEntry;
          pEntry^.stackLow := workSpace.bottom;
          pEntry^.stackHigh := workSpace.bottom + CSIZE_T(workSpace.length);
          pEntry^.call := PreExcProc(call0);
          pEntry^.xbra.magic := XBRA_Magic;
          pEntry^.xbra.name := XBRA_ID;
          pData := ADDRESS(pEntry) + TSIZE(Entry);
          procL := entryLen(i, procS);
          memcpy(pData, ADDRESS(procS), procL);
          pData^.excNo := i;
          pData^.pEntry1 := pEntry;
#ifndef __mcoldfire__
          pData^.pEntry2 := pEntry;
#endif
          SetVec(i, pData, pEntry^.xbra.prev.prev);
          
          pEntry := ADDRESS(pData) + procL;
          INC(c)
        END
      END
    END
  END
END Install;


PROCEDURE InstallPreExc (REF traps: ExcSet;
call: PreExcProc; usermode: BOOLEAN;
workSpace: MOSGlobals.MemArea; VAR hdl: ADDRESS);
BEGIN
  Install(traps, PROC(call), usermode, workSpace, hdl, Level, FALSE);
END InstallPreExc;


PROCEDURE InstallPostExc (REF traps: ExcSet;
call: PostExcProc; usermode: BOOLEAN;
workSpace: MOSGlobals.MemArea; VAR hdl: ADDRESS);
BEGIN
  Install(traps, PROC(call), usermode, workSpace, hdl, Level, TRUE);
END InstallPostExc;


PROCEDURE SysInstallPreExc (REF traps: ExcSet;
call: PreExcProc; usermode: BOOLEAN;
workSpace: MOSGlobals.MemArea; VAR hdl: ADDRESS);
BEGIN
  Install(traps, PROC(call), usermode, workSpace, hdl, -1, FALSE);
END SysInstallPreExc;


PROCEDURE SysInstallPostExc (REF traps: ExcSet;
call: PostExcProc; usermode: BOOLEAN;
workSpace: MOSGlobals.MemArea; VAR hdl: ADDRESS);
BEGIN
  Install(traps, PROC(call), usermode, workSpace, hdl, -1, TRUE);
END SysInstallPostExc;


PROCEDURE DeInstallExc ( VAR hdl: ADDRESS );
VAR i,c: CARDINAL;
pUser: PtrUser;
entry : PtrEntry;
BEGIN
  IF hdl <> NIL THEN
    pUser := hdl;
    c := 0;
    FOR i := MIN(ExcSet) TO MAX(ExcSet) DO
      IF i IN pUser^.numbs THEN
        entry := pUser^.v^[c];
        entry := ADDRESS(entry) + TSIZE(entry^);
        ResetVec(i, ADDRESS(entry)); (* Zeiger auf eigene Routine *)
      INC(c);
    END
  END;
  linkOut(pUser);
  DEALLOCATE(hdl, 0)
END;
END DeInstallExc;



PROCEDURE RaiseExc0 ( no: HardExceptions );
BEGIN
  (* platz f. pc/sr bei supervisormode *)
#ifdef __mcoldfire__
  ASM VOLATILE("subq.l  #6,%%a7; lea -24(%%a7),%%a7; movem.l %%d0-%%d2/%%a0-%%a2,(%%a7); move.l  %0,%%d2 " : : "d"(no));
#else
  ASM VOLATILE("subq.l  #6,%%a7; movem.l %%d0-%%d2/%%a0-%%a2,-(%%a7); move.l  %0,%%d2 " : : "d"(no));
#endif
  
  ASM VOLATILE("move.l  #1,-(%%a7)" : : );
  ASM VOLATILE("move.w  #32,-(%%a7)" : : );
  ASM VOLATILE("trap    #1" : : );
  ASM VOLATILE("addq.l  #6,%%a7" : : );
  ASM VOLATILE("tst.l   %%d0" : : );              (* sind wir schon im Supervisormode ? *)
  ASM VOLATILE("bne     1f" : : );
  
  (* In den Supervisor-Mode *)
  ASM VOLATILE("clr.l   -(%%a7)" : : );
  ASM VOLATILE("move.w  #32,-(%%a7)" : : );
  ASM VOLATILE("trap    #1" : : );
  ASM VOLATILE("addq.l  #6,%%a7" : : );
  ASM VOLATILE("move.l  %%a7,%%usp" : : );
  ASM VOLATILE("move.l  %%d0,%%a7" : : );
  
  ASM VOLATILE("lea     -10(%%a7),%%a7" : : );       (* platz v. rts-adr/sr/pc *)
  ASM VOLATILE("move    %%sr,%%d0" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("andi.l  #0xcfff,%%d0" : : );        (* User Mode *)
#else
  ASM VOLATILE("andi.w  #0xcfff,%%d0" : : );        (* User Mode *)
#endif
  ASM VOLATILE("move.w  %%d0,4(%%a7)" : : );        (* sr auf superv-stack *)
  ASM VOLATILE("move.l  %%usp,%%a0" : : );
  ASM VOLATILE("lea     24(%%a0),%%a0" : : );
  ASM VOLATILE("move.l  6(%%a0),6(%%a7)" : : );     (* pc auf superv-stack *)
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );     (* d0-d2/a0-a2 von user- auf superv-stack *)
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("lea     24+10(%%a0),%%a0" : : );
  ASM VOLATILE("move.l  %%a0,%%usp" : : );
  
#ifdef __mcoldfire__
  ASM VOLATILE("lsl.l   #2,%%d2" : : );             (* * 4 *)
#else
  ASM VOLATILE("lsl.w   #2,%%d2" : : );             (* * 4 *)
#endif
  ASM VOLATILE("move.w  %%d2,%%a0" : : );
  ASM VOLATILE("move.l  (%%a0),%%a0" : : );         (* vektor *)
  ASM VOLATILE("move.l  %%a0,24(%%a7)" : : );       (* als RTS-Wert hinter die 6 geretteten Regs *)
#ifdef __mcoldfire__
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
  ASM VOLATILE("rts" : : );

ASM VOLATILE("1:" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("lsl.l   #2,%%d2" : : );             (* * 4 *)
#else
  ASM VOLATILE("lsl.w   #2,%%d2" : : );             (* * 4 *)
#endif
  ASM VOLATILE("move.w  %%d2,%%a0" : : );
  ASM VOLATILE("move.l  (%%a0),%%a0" : : );         (* vektor *)
  ASM VOLATILE("move.l  %%a0,24(%%a7)" : : );       (* als RTS-Wert hinter die 6 geretteten Regs *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.w  %%sr,%%d0; move.w %%d0,24+4(%%a7)" : : );     (* SR auf Superv-Stack *)
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("move.w  %%sr,24+4(%%a7)" : : );     (* SR auf Superv-Stack *)
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
END RaiseExc0;


PROCEDURE RaiseExc20 ( no: HardExceptions );
BEGIN
  (* space for format/offset word 68020 *)
#ifdef __mcoldfire__
  ASM VOLATILE("subq.l  #8,%%a7; lea -24(%%a7),%%a7; movem.l %%d0-%%d2/%%a0-%%a2,(%%a7); move.l  %0,%%d2 " : : "d"(no));
#else
  ASM VOLATILE("subq.l  #8,%%a7; movem.l %%d0-%%d2/%%a0-%%a2,-(%%a7); move.l  %0,%%d2 " : : "d"(no));
#endif
  (*       ^  +30 W   Format/Offset (68020) *)
  (*       |  +28 W   SR *)
  (*       +  +24 L   PC for RTS *)
  (*       |  +20 L   A2 *)
  (*       |  +16 L   A1 *)
  (*       -  +12 L   A0 *)
  (*       |  + 8 L   D2 *)
  (*       v  + 4 L   D1 *)
  (*     A7 ->+ 0 L   D0 (points to low byte) *)
  ASM VOLATILE("move.l  32(%%a7),%%d0" : : );       (* return address *)
  ASM VOLATILE("move    %0,34(%%a7)" : : "i"(DftSF) );   (* +34 W   Format/Offset ( 68020 ) *)
  ASM VOLATILE("move.l  %%d0,30(%%a7)" : : );       (* +30 L   Callers return address *)
  
  ASM VOLATILE("move.l  #1,-(%%a7)" : : );
  ASM VOLATILE("move.w  #32,-(%%a7)" : : );
  ASM VOLATILE("trap    #1" : : );
  ASM VOLATILE("addq.l  #6,%%a7" : : );
  ASM VOLATILE("tst.l   %%d0" : : );              (* sind wir schon im Supervisormode ? *)
  ASM VOLATILE("bne     1f" : : );
  
  (* In den Supervisor-Mode *)
  ASM VOLATILE("clr.l   -(%%a7)" : : );
  ASM VOLATILE("move.w  #32,-(%%a7)" : : );
  ASM VOLATILE("trap    #1" : : );
  ASM VOLATILE("addq.l  #6,%%a7" : : );
  ASM VOLATILE("move.l  %%a7,%%usp" : : );
  ASM VOLATILE("move.l  %%d0,%%a7" : : );
  
  ASM VOLATILE("lea     -12(%%a7),%%a7" : : );      (* Platz v. RTS-Adr/SR/PC *)
  ASM VOLATILE("move.l  %%usp,%%a0" : : );
  ASM VOLATILE("lea     24(%%a0),%%a0" : : );
  ASM VOLATILE("move    %%sr,%%d0" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("andi.l  #0xcfff,%%d0" : : );        (* User Mode *)
#else
  ASM VOLATILE("andi.w  #0xcfff,%%d0" : : );        (* User Mode *)
#endif
  ASM VOLATILE("move.w  %%d0,4(%%a7)" : : );        (* SR auf Superv-Stack *)
  ASM VOLATILE("move.l  6(%%a0),6(%%a7)" : : );     (* PC auf Superv-Stack *)
  ASM VOLATILE("move.w  10(%%a0),10(%%a7)" : : );   (* SF auf Superv-Stack *)
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );     (* D0-D2/A0-A2 von User- auf Superv-Stack *)
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("move.l  -(%%a0),-(%%a7)" : : );
  ASM VOLATILE("lea     24+12(%%a0),%%a0" : : );
  ASM VOLATILE("move.l  %%a0,%%usp" : : );
  
#ifdef __mcoldfire__
  ASM VOLATILE("lsl.l   #2,%%d2" : : );             (* * 4 *)
#else
  ASM VOLATILE("lsl.w   #2,%%d2" : : );             (* * 4 *)
#endif
  ASM VOLATILE("move.w  %%d2,%%a0" : : );
  ASM VOLATILE("move.l  (%%a0),%%a0" : : );         (* vektor *)
  ASM VOLATILE("move.l  %%a0,24(%%a7)" : : );       (* als RTS-Wert hinter die 6 geretteten Regs *)
  
  ASM VOLATILE("cmpi    #16,%%d2" : : );          (* Bus- o. Address error ? *)
  ASM VOLATILE("bcs     2f" : : );          (* ja *)
#ifdef __mcoldfire__
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
  ASM VOLATILE("rts" : : );

ASM VOLATILE("2:" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
  ASM VOLATILE("subq.l  #8,%%a7" : : );
  ASM VOLATILE("move.l  8(%%a7),(%%a7)" : : );
  ASM VOLATILE("clr.l   4(%%a7)" : : );
  ASM VOLATILE("clr.l   8(%%a7)" : : );
  ASM VOLATILE("rts" : : );

ASM VOLATILE("1:" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("lsl.l   #2,%%d2" : : );             (* * 4 *)
#else
  ASM VOLATILE("lsl.w   #2,%%d2" : : );             (* * 4 *)
#endif
  ASM VOLATILE("move.w  %%d2,%%a0" : : );
  ASM VOLATILE("move.l  (%%a0),%%a0" : : );         (* vektor *)
  ASM VOLATILE("move.l  %%a0,24(%%a7)" : : );       (* als RTS-Wert hinter die 6 geretteten Regs *)
#ifdef __mcoldfire__
  ASM VOLATILE("move.w  %%sr,%%d0; move.w %%d0,24+4(%%a7)" : : );     (* SR auf Superv-Stack *)
#else
  ASM VOLATILE("move.w  %%sr,24+4(%%a7)" : : );     (* SR auf Superv-Stack *)
#endif
  
  ASM VOLATILE("cmpi    #16,%%d2" : : );          (* Bus- o. Address error ? *)
  ASM VOLATILE("bcs     3f" : : );          (* ja *)
#ifdef __mcoldfire__
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
  ASM VOLATILE("rts" : : );

ASM VOLATILE("3:" : : );
#ifdef __mcoldfire__
  ASM VOLATILE("movem.l (%%a7),%%d0-%%d2/%%a0-%%a2; lea 24(%%a7),%%a7" : : );
#else
  ASM VOLATILE("movem.l (%%a7)+,%%d0-%%d2/%%a0-%%a2" : : );
#endif
  ASM VOLATILE("subq.l  #8,%%a7" : : );
  ASM VOLATILE("move.l  8(%%a7),(%%a7)" : : );
  ASM VOLATILE("clr.l   4(%%a7)" : : );
  ASM VOLATILE("clr.l   8(%%a7)" : : );
END RaiseExc20;


PROCEDURE RaiseExc(excNo: HardExceptions);
BEGIN
  raiseV(excNo);
END RaiseExc;



PROCEDURE releaseLevel;
VAR p, pn: PtrUser;
BEGIN
	p := ADR (root);
	p := p^.next;
	WHILE p <> ADR (root) DO
		pn := p^.next;
		IF p^.level >= Level THEN
			DeInstallExc (p)
		END;
		p := pn;
	END
END releaseLevel;


PROCEDURE chgLevel (start:BOOLEAN; inChild:BOOLEAN; VAR exitCode:INTEGER);
BEGIN
	IF exitCode <> 0 THEN END;
	IF inChild THEN
		IF start THEN
			INC (Level)
		ELSE
			releaseLevel;
			DEC (Level)
		END
	END
END chgLevel;


PROCEDURE freeSys;
BEGIN
	Level := MIN(Level);
	releaseLevel();
END freeSys;


VAR eHdl: EnvlpCarrier;
tHdl: TermCarrier;
rHdl: RemovalEntry;
wsp: MOSGlobals.MemArea;

BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
  IF SysInfo.UseStackFrame() THEN
    busHdl := busHdl20;
    raiseV := RaiseExc20;
  ELSE
    busHdl := busHdl0;
    raiseV := RaiseExc0;
  END;
  root.next := ADR(root);
  root.prev := ADR(root);
  SetEnvelope(eHdl, chgLevel, wsp);
  wsp.bottom := NIL;
  wsp.length := 0;
  CatchProcessTerm(tHdl, releaseLevel, wsp);
  CatchRemoval(rHdl, freeSys, wsp);
END Excepts.
