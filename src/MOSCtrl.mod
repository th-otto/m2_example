IMPLEMENTATION MODULE MOSCtrl; (* V#0193 *)

(*
  22.07.87: Bei Terminierung des gesamten MOS-Prozesses werden alle noch
            aktiven Modlevels abgebaut mit jew. Termprocess-Aufruf.
  30.08.87: ModLevel wird bei Push/PopPDB veraendert. Bei unterstem ModLevel
            ist der Wert = 1.
  01.10.88: PopPDB wird bei Ende des untersten Prozesse aufgerufen, damit
            f. residente Prgs ModLevel dann auf Null steht.
  23.10.88: GetPDB liefert ggf. NIL (siehe Def-Text); Removal-Behandlung neu;
            Term-Handler wird bei residenten Programmen erst beim Freigeben
            ausgelinkt.
  15.01.89: PushPDB aktualisiert ggf. BaseProcess und ActMosProcess, da bei
            ACCs sonst Unsinn drin stuende.
  26.07.89: 408-Vektor wird auch bei residenten Prgs bei Prozessende ausgelinkt.
  04.08.89: 408-Vektor wird mit XBRA ('MM2T') eingelinkt.
  16.08.89: Kein infinite Loop, wenn Runtime-Error bei Removal-Calls
  20.11.89: Process-ID wird bei TOS 1.0 wieder korrekt ermittelt - MM2 laeuft
            nun wieder mit TOS 1.0
  21.11.90: Term-Handler: Wird bei ACCs nicht installiert, dafuer aber nach
            Aushaengung beim erneuten PushPDB (damit's mit ModLoad klappt);
            wenn waehrend der Terminierung wieder Pterm aufgerufen wird, wird
            weitergemacht, als sei nix gewesen (die restlichen Term-Handler
            werden trotzdem aufgerufen usw).
            -nicht getestet!-
  25.11.90: Term-Handler: Wenn ein Modul mit TermProcess(0) zurueckkehrt, wird
            der vorherige ExitCode/termState nicht veraendert.
  08.12.90: Term-Handler: Der SSP wird nicht mehr aus Prozess-Daten ermittelt
            (denn das Format koennte sich ja mal aendern), sondern wird auf
            den Startwert vom Prgstart zurueckgesetzt.
  05.07.91: Term-Handler: ExitCode-Position wird gesucht, damit's auch mit
            KAOS klappt.
  03.02.92: 408-Vektor wird wg. MiNT per Bios-Funktion gesetzt.
  14.02.92: Wenn MiNT installiert, keine ExitCode-Positionssuche und Term-Hdlr
            laeuft als Subroutine statt ein 2. Pterm am Ende zu machen.
  17.02.92: Wenn MiNT installiert, wird Term-Handler bei jedem neuen Prozess
            in SetProcessState neu installiert. Achtung: bisher wird jedoch
            der alte Vektor vom Base-Prozess jedesmal weiterhin gechained,
            obwohl MiNT eigentlich fuer den neuen Prozess keine anderen Term-Hdlr
            mehr drin hat -> 'vSave' in der XBRA-Struktur muesste in PushPDB
            gestacked werden und jedesmal in SetProcessState neu gesetzt werden!
  19.02.92: Nun wird bei neuem Prozess unabh. v. MiNT geprueft, ob der Term-Hdler
            noch in der etv_term-Kette installiert ist und ggf. neu installiert;
            Auf 408-Vektor wird wieder direkt statt ueber BIOS zugegriffen.
            Leider darf die Exitcode-Suche weiterhin nicht unter MiNT erfolgen,
            weil der naechste Supexec-Aufruf nach Pterm() zum Terminate fuehrt.
  08.01.94: Mag!X-Anpassung (v. Dirk Steins): Ebenfalls keine Exitcode-Suche
  17.01.94: Neues Termination-Handling: 'PrgCtrl.TermProcess' fuehrt bereits die
            Term-Handler vor Pterm() aus. Stellen wir im etv_term-Handler fest,
            dass noch nicht alles abgemeldet wurde, versuchen wir nicht mehr,
            den Exitcode zu korrigieren, denn das Abbrechen des Programms per
            Pterm() ist nicht mehr als "saubere" Methode erlaubt.
            Der etv_term-Handler wird am Ende immer per Pterm verlassen, auch
            bei MiNT/Magix.
  08.02.94: Korrektur seit 17.01.94: Falls wir, z.B. durch im Tochterprozess
            noch installiertem GEMError, einen fremden Prozess beenden, fuehren
            wir natuerlich nicht die eigenen Term-Handler aus sondern rufen
            Pterm sofort auf.
  03.06.94: Noch ein Versuch wg. Problemen, falls ein Prg trotzdem GEMDOS-Pterm
            direkt aufruft und MetaDOS o.a. Prgs installiert sind, die im
            GEMDOS-Trap haengen und waehrend des Pterm-Handlings mit aufgerufen
            werden und es nicht moegen, wenn dann der SSP auf dem fixen Pterm-
            Stack bereits steht: Vor Aufruf der Exit-Procs wird der SSP auf
            den Programm-USP gesetzt und der USP 512 Byte darunter. Am Ende,
            wenn die Exit-Procs ausgefuehrt wurden, wird wieder der alte SSP
            zurueckgesetzt, damit es hoffentlich weiter mit rekursiven
            Pterms, wie bei Magix moeglich, klappt.
  24.06.94: Falls ModCtrl BaseResident auf TRUE gesetzt hat und wir den
            Basisprozess beenden, wird am Ende Ptermres statt Pterm aufgerufen.
  03.06.23: Port to gm2
*)

FROM SYSTEM IMPORT ADR, ADDRESS, BYTE, INTEGER32, CARDINAL32, CSIZE_T;

FROM MOSGlobals IMPORT MemArea, IllegalCall, IllegalPointer, OutOfStack;
FROM GEMDOS IMPORT TermRes, Term, Super;
FROM SysVars IMPORT _sysbase, etv_term;
FROM XBIOS IMPORT SuperExec;
FROM ErrBase IMPORT DoTRAP6;
FROM CookieJar IMPORT GetCookie;


(* ! Storage darf nicht importiert werden ! *)


CONST layout = 4;

(*
 * Die folg. Konstante legt fest, wie viel Sicherheitsbereich der SSP
 * erhalten soll - gleich darunter wird der USP gelegt.
 *)
CONST SupervisorStackAmount = 512;

(*
 * Ist die folg Konstanten TRUE, wird bei MiNT & Mag!X am Ende der
 * Prozessterminierung im etv_term-Handler nicht erneut Pterm()
 * aufgerufen, sondern ein RTS ausgefuehrt. Das klappt auch, ist
 * aber z.Zt. offenbar ueberfluessig, da das Verfahren des wiederholten
 * Pterm-Aufrufs genausogut in allen Situationen zu klappen scheint.
 *)
CONST MiNTaware = FALSE;

CONST XBRA_Magic = 058425241H; (* 'XBRA' *)

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

VAR termVectorInstalled: BOOLEAN;
VAR MagXavail, MiNTavail: BOOLEAN;
TOSHdr: PtrOSHeader;

VAR PtermSSP, mySSP: ADDRESS;
didPterm: BOOLEAN;
(* wird gesetzt, falls InstallModule aufgerufen *)
(* wurde, um dann Ptermres() aufzurufen         *)
makeResident: BOOLEAN;

VAR rem408carrier: RemovalEntry;

PROCEDURE GetPDB ( VAR pdb : PtrPDB; VAR process: ADDRESS );
BEGIN
  process := ProcessID^;
  (* ist Programm ein ACC ? *)
  (* und ist Acc-Prozess aktiv? *)
  IF ((NOT BaseIsAccessory) OR (ModLevel <> 1)) AND
     (* Akt. Prozess gleich letztem MOS-Prozess ? *)
     (ActMOSProcess = ProcessID^) AND
     (* oder kein MOS-Prozess mehr aktiv ? *)
     (ModLevel <> 0)
  THEN
     pdb := NIL;
  ELSE
     pdb := ActPDB;
  END;
END GetPDB;



PROCEDURE CallSub ( subRoutine: PROC; VAR wsp: MemArea );
VAR sp, oldsp: ADDRESS;
BEGIN
  (* alten SP laden zum Retten *)
  ASM VOLATILE("move.l %%a7,%0" : "=g"(oldsp));
  IF (wsp.bottom <> NIL) AND (wsp.length <> 0) THEN
    IF wsp.length < 20 THEN
      (* Stack zu klein*)
      DoTRAP6(OutOfStack);
      RETURN;
    ELSE
      (* neuen SP verwenden *)
      sp := wsp.bottom;
      INC(sp, wsp.length);
      ASM VOLATILE("move.l %0,%%a7; jsr (%1); move.l %2,%%a7" : : "r"(sp), "a"(subRoutine), "r"(oldsp) : "d0", "d1", "a0", "a1", "cc", "memory");
    END;
  ELSE
    (* alten SP verwenden *)
    subRoutine();
  END;
END CallSub;


PROCEDURE CallTermProcs;
VAR pdb: PtrPDB;
    term: TermList;
BEGIN
  pdb := ActPDB;
  IF pdb <> NIL THEN
    LOOP
      term := pdb^.termProcs;
      IF term = NIL THEN EXIT END;
      pdb^.termProcs := term^.next;
      CallSub(term^.call, term^.wsp);
    END;
  END;
END CallTermProcs;


(* alle Catcher in umgekehrter Anmeldereihenfolge aufrufen *)
PROCEDURE CallRemoveProcs;
VAR prev: RemovalList;
BEGIN
  LOOP
    prev := RemovalRoot.prev;
    IF prev = ADR(RemovalRoot) THEN EXIT END;
    RemovalRoot.prev := prev^.prev;
    CallSub(prev^.call, prev^.wsp);
  END;
END CallRemoveProcs;


PROCEDURE callExitProcs;
BEGIN
  (* Prozessende mitteilen *)
  CallTermProcs();
  IF ProcessID^ = BaseProcess THEN
    IF BaseResident THEN
      makeResident := TRUE;
    ELSE
      (* Modul-Entfernung mitteilen *)
      CallRemoveProcs();
    END;
    (* Prg terminiert *)
    BaseProcess := NIL;
    ActMOSProcess := NIL;
    ModLevel := 0;
  END;
END callExitProcs;


PROCEDURE setTermCode(pdb: PtrPDB; code: INTEGER);
BEGIN
  (*
   * Wenn ein Modul in der Deinit-Phase mit Exitcode 0 terminiert,
   * ist das kein Fehler.
   *)
  IF (pdb^.processState IN {created,opening,running}) OR (code <> 0) THEN
    ExitCode := code;
    pdb^.termState := pdb^.processState;
  END;
END setTermCode;


PROCEDURE HdlTerm;
VAR pdb: PtrPDB;
  r: INTEGER;
  sp: ADDRESS;
  hdlterm: PtrXBRA_Entry;
  p: PROC;
BEGIN
  (* We're now in supervisor mode! *)
  pdb := ActPDB;
  IF ((ProcessID^ = BaseProcess) OR (ProcessID^ = ActMOSProcess)) AND
    (pdb <> NIL) AND (* nanu?! *)
    NOT(pdb^.processState IN {finished,removed})
  THEN
    (* *** Prozessterminierung nachholen *** *)
    r := ExitCode;
    IF r = 0 THEN r := -1; END;
    setTermCode(pdb, r);
    IF (pdb^.processState <> closing) OR NOT(didPterm) THEN
      (* nun Deinit-Phase einleiten *)
      pdb^.processState := closing;
      ASM VOLATILE("move.l %%a7,%0" : "=g"(PtermSSP));
      didPterm := TRUE;
      (*
       *** SSP & USP setzen ***
       * Dabei pruefen, ob der Pterm-SSP evtl. innerhalb unseres Prozess-Stacks
       * liegt (z.B. verwendet MetaDOS bei Pterm den USP als SSP und ruft
       * dann selbst etv_term() auf). In diesem Fall wird der SSP weiterver-
       * wendet.
       *)
      ASM VOLATILE("move.l %%a7,%0" : "=g"(sp));
      IF (sp < pdb^.bottomOfStack) OR (sp >= pdb^.topOfStack) THEN
        ASM VOLATILE("move.l %0,%%a7" : : "g"(pdb^.topOfStack));
      END;
      ASM VOLATILE("move.l %%a7,%0" : "=g"(mySSP));
    ELSE
      (*
      idee: da am ende eh die bei rekursiven pterms benutzten stacks
      verworfen werden, kann gleich immer derselbe stack verwendet
      werden, so wie bei A3. allerdings muss ssp immer noch auf eigenen
      bereich zeigen (evtl. initialSSP?) und usp/ssp muessen
      geprueft werden, ob sie innerhalb des eigenen stacks bereits
      liegen und dann immer dieser wert verwendet werden, anstatt
      den stack neu auf dem vollbereich zu nutzen.
      *)
      ASM VOLATILE("move.l %0,%%a7" : : "g"(mySSP));
    END;
    (* *** setup Stack Pointers & enter User Mode *** *)
    ASM VOLATILE("lea -512(%%a7),%%a0; move.l %%a0,%%usp; andi.w #0xdfff,%%sr" : : : "a0"); (* SupervisorStackAmount *)
    (* *** call installed termination procedures *** *)
    (* last of them removes this handler from the etv_term vector *)
    callExitProcs();
    (* *** process is terminated, all exit procs have been called *** *)
    pdb^.processState := finished;
    (* *** call final 'Pterm' *** *)
    (* (get into Superv Mode to restore SSP) *)
    Super(0);
    ASM VOLATILE("move.l %0,%%a7" : : "g"(PtermSSP));
    IF makeResident THEN
      terminateResident();
    ELSE
      Term(ExitCode);
    END;
  ELSE
    ASM VOLATILE("move.l #hdlterm,%0" : "=g"(hdlterm));
    p := hdlterm^.prev.call;
    p();
  END;
END HdlTerm;


PROCEDURE dummyHdlTerm;
BEGIN
  ASM VOLATILE("jbra 1f; hdlterm: dc.l 0x58425241; dc.l 0x4d4d3254; dc.l 0; jbra %0; 1:" : : "m"(HdlTerm));
END dummyHdlTerm;


PROCEDURE linkOut408(): INTEGER32;
VAR hdlterm: PtrXBRA_Entry;
    pprev: POINTER TO PtrXBRA_Entry;
    prev: PtrXBRA_Entry;
BEGIN
  ASM VOLATILE("move.l #hdlterm+12,%0" : "=g"(hdlterm));
  pprev := ADDRESS(etv_term);
  LOOP
    (* 'entry' gefunden? *)
    prev := pprev^;
    IF prev = hdlterm THEN
      DEC(prev, SIZE(prev^));
      pprev^ := prev^.prev.prev;
      EXIT;
    END;
    (* Ist dies ein XBRA-Eintrag? *)
    DEC(prev, SIZE(prev^));
    IF prev^.magic <> XBRA_Magic THEN
      (* Nein -> entry hier trotzdem austragen *)
      DEC(hdlterm, SIZE(hdlterm^));
      pprev^ := hdlterm^.prev.prev;
      EXIT;
    END;
    pprev := ADR(prev^.prev.prev);
  END;
  RETURN 0;
END linkOut408;


PROCEDURE LinkOut408;
BEGIN
  SuperExec(linkOut408);
END LinkOut408;


PROCEDURE setTermHandler(): INTEGER32;
VAR hdlterm: PtrXBRA_Entry;
    pprev: POINTER TO PtrXBRA_Entry;
    prev: PtrXBRA_Entry;
BEGIN
  ASM VOLATILE("move.l #hdlterm+12,%0" : "=g"(hdlterm));
  pprev := ADDRESS(etv_term);
  LOOP
    (* 'entry' gefunden? *)
    prev := pprev^;
    IF prev = hdlterm THEN
      (* wenn TermHdlr noch installiert, ist alles OK *)
      EXIT;
    END;
    (* Ist dies ein XBRA-Eintrag? *)
    DEC(prev, SIZE(prev^));
    IF prev^.magic <> XBRA_Magic THEN
      (* Nein -> entry hier eintragen *)
      DEC(hdlterm, SIZE(hdlterm^));
      pprev := ADDRESS(etv_term);
      (* alten Vektor retten (in XBRA-Struktur) *)
      hdlterm^.prev.prev := pprev^;
      INC(hdlterm, SIZE(hdlterm^));
      pprev^ := hdlterm;
      EXIT;
    END;
    pprev := ADR(prev^.prev.prev);
  END;
  RETURN 0;
END setTermHandler;


PROCEDURE PushPDB ( pdb: PtrPDB; process: PtrBP );
VAR base: PtrBP;
    dummy: CARDINAL32;
VAR hdlterm: PtrXBRA_Entry;
    prev: RemovalList;
BEGIN
  IF (INTEGER32(pdb) <= 0) OR (INTEGER32(process) <= 0) THEN
    DoTRAP6(IllegalCall);
  ELSE
    IF pdb^.layout <> layout THEN
      DoTRAP6(IllegalPointer);
    ELSE
      ActMOSProcess := process;
      base := pdb^.basePageAddr;
      pdb^.prev := ActPDB;
      IF pdb^.prev = NIL THEN
        (* *** unterster PDB wird init. *** *)
        BaseProcess := base;
        ActMOSProcess := base;
        BaseIsAccessory := base^.p_parent = NIL;
        RealMode := pdb^.flags;
        IF MiNTaware THEN
          (* Ist MiNT installiert? *)
          MiNTavail := GetCookie(04D694E54H, dummy);
          (* Ist Mag!X installiert? *)
          MagXavail := GetCookie(04D616758H, dummy);
        END;
      END;
      ActPDB := pdb;
      (* alten etv_term-Link retten, da er ggf. in *)
      (* SetProcessState veraend. wird. *)
      ASM VOLATILE("move.l #hdlterm,%0" : "=g"(hdlterm));
      pdb^.prevTermHdlr := hdlterm^.prev.prev;
      pdb^.termState := running;
      ExitCode := 0;
      INC(ModLevel);

      (*
       * Da ACCs nie terminieren, braucht auch kein Term-Vektor installiert
       * werden. Ansonsten muss er immer so bald wie moeglich installiert werden.
       * Dies ist der Fall beim 1. PushPDB-Aufruf in normalen Prgs und bei
       * einem Prozess-Aufruf innerhalb von ACCs. Die Deinstallation muss auf
       * dem selben Level erfolgen. Macht sich z.B. ein Prg resident, muss
       * der Term-Vektor raus, aber wenn das res. Prg (z.B. ModLoad) dann
       * wieder einen Prozess startet, muss der Term-Vektor wieder rein.
       *)
      IF (base^.p_parent <> NIL) AND (NOT termVectorInstalled) THEN
        (* Pterm-Handler installieren *)
        SuperExec(setTermHandler);
        (* Catcher installieren, der beim Removal den etv_term wieder aushaengt *)
        rem408carrier.call := LinkOut408;
        rem408carrier.wsp.bottom := NIL;
        rem408carrier.wsp.length := 0;
        rem408carrier.next := ADR(RemovalRoot);
        prev := RemovalRoot.prev;
        rem408carrier.prev := prev;
        prev^.next := ADR(rem408carrier);
        RemovalRoot.prev := ADR(rem408carrier);
        termVectorInstalled := TRUE;
      END;
    END;
  END;
END PushPDB;


PROCEDURE PopPDB;
VAR prev: PtrPDB;
VAR hdlterm: PtrXBRA_Entry;
BEGIN
  prev := ActPDB;
  IF prev = NIL THEN
    DoTRAP6(IllegalCall);
  ELSE
    ActPDB := prev^.prev;
    ASM VOLATILE("move.l #hdlterm,%0" : "=g"(hdlterm));
    hdlterm^.prev.prev := prev^.prevTermHdlr;
    ActMOSProcess := ProcessID^;
    DEC(ModLevel);
  END;
END PopPDB;


PROCEDURE SetProcessState ( state: PState );
BEGIN
  IF ActPDB = NIL THEN
    DoTRAP6(IllegalCall);
  ELSE
    ActPDB^.processState := state;
    IF state = opening THEN
      SuperExec(setTermHandler);
    END;
  END;
END SetProcessState;


PROCEDURE terminateResident;
VAR size: ADDRESS;
BEGIN
  makeResident := FALSE;
  size := ActPDB^.topOfStack;
  DEC(size, ActPDB^.basePageAddr);
  TermRes(CSIZE_T(size), ExitCode);
END terminateResident;


PROCEDURE Pterm (exitCod: INTEGER);
VAR pdb: PtrPDB;
    r: INTEGER;
BEGIN
  pdb := ActPDB;
  IF (pdb = NIL) OR (* nanu?! *)
    (* ist es ueberhaupt unser eigener Prozess, den wir hier beenden? *)
    ((ProcessID^ <> BaseProcess) AND (ProcessID^ <> ActMOSProcess))
  THEN
    (* fremden Prozess beenden -> Pterm() direkt aufrufen. *)
    Term(exitCod);
  END;
  (* eigenen Prozess beenden -> vorher eigene Term-Handler aufrufen *)
  (* first get into User Mode *)
  (* ... but must load exitCode into register first, because that changes sp *)
  ASM VOLATILE("move.l %1,%0" : "=r"(r) : "g"(exitCod) : "cc");
  IF Super(1) = -1 THEN
    ASM VOLATILE ("andi.w #0xdfff,%%sr" : : : );
  END;
  setTermCode(pdb, r);
  IF pdb^.processState <> closing THEN
    pdb^.processState := closing;
    didPterm := FALSE;
  END;
  (* reload USP, do not change SSP here *)
  ASM VOLATILE ("move.l %0,%%a7" : : "g"(pdb^.topOfStack));
  (* may call this Pterm recursively *)
  callExitProcs();
  pdb^.processState := finished;
  (* call final 'Pterm'. *)
  IF makeResident THEN
    terminateResident();
  ELSE
    Term(ExitCode);
  END;
END Pterm;


PROCEDURE getTOSHdr(): INTEGER32;
TYPE PPtrOSHeader = POINTER TO PtrOSHeader;
VAR sysbase : PPtrOSHeader;
BEGIN
   sysbase := PPtrOSHeader(_sysbase);
   RETURN INTEGER32(sysbase^^.beg); (* wg. altem AHDI *)
END getTOSHdr;


BEGIN
  dummyHdlTerm(); (* must be referenced to not be optimized out *)

  TOSHdr := SuperExec(getTOSHdr);
  IF TOSHdr^.version <= 0102H THEN
    (* Spanisches TOS? *)
    IF TOSHdr^.conf = 8 THEN
      ProcessID := ADDRESS(0873CH);
    ELSE
      ProcessID := ADDRESS(0602CH);
    END;
  ELSE
    ProcessID := TOSHdr^.run;
  END;
  BaseIsAccessory := FALSE;
  BaseProcess := NIL;
  BaseResident := FALSE;
  ActMOSProcess := NIL;
  ActPDB := NIL;
  ModLevel := 0;
  termVectorInstalled := FALSE;
  makeResident := FALSE;
  EnvRoot.prev := ADR(EnvRoot);
  EnvRoot.next := ADR(EnvRoot);
  RemovalRoot.next := ADR(RemovalRoot);
  RemovalRoot.prev := ADR(RemovalRoot);

  didPterm := FALSE;
  mySSP := NIL;
  PtermSSP := NIL;

  IF MiNTaware THEN
    MagXavail := FALSE;
    MiNTavail := FALSE;
  END;

END MOSCtrl.
