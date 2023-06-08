IMPLEMENTATION MODULE KbdEvents;

(*------------------------------------------------------------------------------
 * Version 2.6  (fuer MEGAMAX MOS 2.2)
 *------------------------------------------------------------------------------
 * Copyright (c) 1989, 90, 91 by Michael Seyfried
 *------------------------------------------------------------------------------
 *                              Implementierungshinweise
 *
 * Die Routinen 'afterTrap2','Trap2Handler','IKBDHandler' und 'EtvTimerHandler'
 * mussten wegen besonderer Anforderungen in Assembler codiert werden. Ich habe
 * mich bemueht, die Routinen so gut wie moeglich zu kommentieren.
 * Damit der Fehler beim AES behoben werden kann wird 'Trap2Handler' auf den
 * TRAP2-Vektor installiert. Diese Routine sorgt dann dafuer, dass nach einem
 * Aufruf von 'evnt_keyboard' oder 'evnt_multi' vor der Rueckkehr zum Aufrufer
 * 'afterTrap2' aufgerufen wird.
 * 'OverflowHandler' verhindert ein Tastaturueberlauf ueber 'BufferKeyPtr' hinaus.
 * Dazu wird er ueber die Vektoren 'IKBD' und 'etv_timer' angesprungen.
 *------------------------------------------------------------------------------
 * 11.08.89   2.0   Fertigstellung der Version 2.0
 * 13.08.89   2.1   Falls ein Prozess 'evnt_multi' ruft, wird nur dann
 *                  'Trap2Handler' angesprungen, wenn auch auf ein Tastatur-
 *                  ereignis gewartet wird.
 * 14.08.89   2.1a  Bug in Trap2Handler behoben. 'evnt_multi' wurde nur
 *                  behandelt, wenn man auf ein MAUSEREIGNIS wartete.
 * 15.08.89   2.1b  Es werden nun alle Register gerettet, weil der Orginal-
 *                  dispatcher das auch macht.
 * 15.08.89   2.2   WriteToAppl gestrichen, weil unnoetig, wenn dieses Modul
 *                  sich mit SysInitGem anmeldet und vor ExitGem die Vektoren
 *                  restauriert.
 * 19.08.89   2.2a  Die Vektoren werden nun nicht mehr mit den Prozeduren aus
 *                  dem Modul 'XBRA' veraendert. Es ist nun ein lokales Modul
 *                  'xbra' vorhanden, das spezielle Prozeduren fuer (Assembler-)
 *                  Routinen enthaelt, die schon einen XBRA-Header haben.
 * 01.09.89   2.3   'LookAESKeys' und 'AESShift' wurden entfernt. Fehler bei der
 *                  Synchronisation behoben. Modul installiert sich nun nicht
 *                  mehr automatisch.
 * 17.09.89   2.4   Synchronisation korrigiert. Rechner 'haengt' nicht mehr bei
 *                  Ueberlauf des Puffers ueber BufferKeyPtr.
 * 02.05.90         Anpassung an Compiler 3.8, $Y+ vorn eingefuegt
 * 25.11.90   2.5   TT: InitApplication statt InitGem-Aufruf, TRAP #6 statt
 *                  RaiseError-Aufruf
 * 15.02.91   2.6   Fehler bei der Tastatursynchronisation behoben.
 * 97.06.23 THO     Port to gm2
 *------------------------------------------------------------------------------
 *)

FROM SYSTEM IMPORT ADDRESS, ADR, CARDINAL16, CARDINAL32, INTEGER32, SHIFT;

IMPORT MOSGlobals;

FROM XBIOS IMPORT IORECPTR, IORec, Keyboard;

FROM MOSCtrl IMPORT RemovalEntry, CatchRemoval;

FROM MOSSupport IMPORT ToSuper, ToUser;

FROM SysTypes IMPORT BBS;

FROM SysVars IMPORT etv_timer, conterm;

FROM GEMEnv IMPORT SysInitApplication, ExitGem, CurrGemHandle;
FROM ErrBase IMPORT DoTRAP6;

IMPORT GEMShare;
IMPORT GEMOps;
IMPORT XBRA;
FROM Builtins IMPORT return_address;


CONST KbShiftBit        = 3;      (* wichtige Bits in Conterm               *)
      KbRepeatBit       = 1;      (*           "                            *)
      HighTrap2PBList   = 25;     (* "Beschraenkung" auf 25 Prozesse         *)
      XBRAID            = 04B624576H; (* "KbEv"  *)
      TRAP2             = 0088H;  (* Adresse des TRAP2-Vektors              *)
      IKBD              = 0118H;  (* Adresse des IKBD-Vektors               *)
      JMPInstr          = 04EF9H;  (* Code fuer JMP     $xxxxxxxx             *)
      MOVEToStackInstr  = 02F3CH;  (* Code fuer MOVE.L  #$xxxxxxxx, -(SP)     *)

TYPE
      (* Trap2 Parameter Block *)
      PtrTrap2PB      = POINTER TO Trap2PB;
      Trap2PB         = RECORD
                          AESNo: CARDINAL;          (* AES-Funktionsnummer *)
                          AddrINTOUT: ADDRESS;      (* Adr. von IntOut *)
                          ReturnAddr: ADDRESS;      (* Returnadr. nach TRAP2 *)
                          moveToStackInstr: CARDINAL16;   (* MOVE.L #PBAddr, -(SP) *)
                          PBAddr: ADDRESS;          (* Adr. auf dieses Feld *)
                          jmpInstr: CARDINAL16;     (* JMP afterTrap2 *)
                          AfterTrap2Addr: PROC;     (* Adr. von afterTrap2 *)
                        END;

VAR   IoRecPtr: IORECPTR;           (* Zeiger auf IOREC-Struktur der Tastatur *)
      IbufPlusIbufsize: ADDRESS;    (* IoRec.ibuf + IoRec.ibufsize *)
      BufferKeyPtr: POINTER TO CARDINAL32; (* Ptr. auf akt. AES-Zeichen im Kbd-Buffer*)
      BufferKeyValid: BOOLEAN;      (* TRUE, wenn BufferKeyPtr gueltig *)

      rCarrier: RemovalEntry;     (* Fuer ordentliche Prozessbeendingung *)

      (* Speicher fuer alte und neue Werte *)
      oldConterm: BBS;

      (* In dieser Liste werden fuer jeden Prozess, der 'evnt_timer' oder
       * 'evnt_keyboard' gerufen hat, wichtige Daten zwischengespeichert.
       * Die nicht belegten Listeneintraege werden ueber 'Trap2PBFree' und
       * untereinander ueber 'AddrINTOUT' verkettet.
       *)
      Trap2PBList     : ARRAY [0..HighTrap2PBList] OF Trap2PB;
      Trap2PBFree     : PtrTrap2PB;     (* Zeiger auf unbenutzte Elemente *)

      (* Flags, die anzeigen, welche Vektoren DIESES Modul installiert hat *)
      TRAP2VecInstalled    : BOOLEAN;
      IKBDVecInstalled     : BOOLEAN;
      EtvTimerVecInstalled : BOOLEAN;

      (* GEM-Handle dieses Moduls *)
      GEMHandle: GEMShare.GemHandle;


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


(*
 * Effekt: Der AES-Puffer und Tastaturpuffer werden geloescht.
 *)
PROCEDURE FlushKbd;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := 33;          (* ev_mflags:= {keyboard, timer} *)
  GEMShare.our_cb^.pubs.aINTIN[14] := 0;          (* ev_mtlocount:= 0              *)
  GEMShare.our_cb^.pubs.aINTIN[15] := 0;          (* ev_mthicount:= 0              *)
  REPEAT
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MULTI, 16, 7, 1));
  UNTIL GEMShare.our_cb^.pubs.aINTOUT[0] = 32;    (* UNTIL ev_mwhich = {timer}     *)
END FlushKbd;


(*
 * Effekt:  BufferKeyPtr und HighBufferKey werden mit dem AES-Puffer
 *          synchronisiert. Dazu wird der AES-Buffer geloescht.
 *)
PROCEDURE SyncBuffer;
BEGIN
  BufferKeyPtr := IoRecPtr^.ibuf + VAL(CARDINAL, IoRecPtr^.ibuftl);
  BufferKeyValid := TRUE;
END SyncBuffer;


(*
 * Diese Routine wird bei der Rueckkehr aus einer der Routinen 'evnt_keyboard'
 * bzw. 'evnt_multi' aufgerufen. Sie setzt dann 'BufferKeyPtr' auf das richtige
 * Zeichen im Tastaturpuffer und kehrt zum Aufrufer, i.A. dem Anwenderprogramm,
 * zurueck.
 * Der letzte Punkt ist aber gar nicht so einfach, wie man glaubt. Denn auch
 * Accessorys rufen 'evnt_multi'. Es reicht also bei weitem nicht aus, die
 * Ruecksprungadresse in einer globalen Variablen zwischenzuspeichern. Auch die
 * Verwendung eines Stacks zum Ablegen dieser Adressen ist unmoeglich, da beim
 * Pseudo-Multitasking die Reihenfolge der Aufrufe von evnt_multi nicht immer
 * mit der Reihenfolge der Rueckspruenge aus diesen Routinen uebereinstimmt.
 * Zur Loesung diese Problems wird von 'Trap2Handler' fuer jeden Prozess, der
 * 'evnt_keyboard' oder 'evnt_multi' aufruft, ein Parameterblock angelegt, in
 * dem einige Daten und die Ruecksprungadresse abgelegt werden. Ausserdem steht
 * in diesem Parameterblock eine JMP-Anweisung auf 'afterTrap2'. Vor dieser JMP-
 * Anweisung steht ein Befehl, der die Adresse dieses PB in Register A0
 * schreibt. 'Trap2Handler' sorgt dafuer, dass bei der Rueckkehr aus einer AES-
 * Routine ueber diese Anweisungen 'afterTrap2' aufgerufen wird. Durch die
 * Adresse des PB in A0 erhaelt diese Routine so alle Daten und die richtige
 * Ruecksprungadresse.
 * Vor dem Ruecksprung zum Aufrufer wird in 'int_out[ 4] der Tastaturzustand bei
 * Tastendruck geschrieben. So liefert nun 'AESEvents.MultiEvent' den Status
 * der Sondertasten richtig zurueck.
 *
 * Es werden alle Register gerettet !
 *)
PROCEDURE afterTrap2;
BEGIN
                  (* Bei Eintritt steht auf dem Stack die Adresse des *)
                  (* zugehoerigen Parameter Blocks *)

                                (* Erstmal die benoetigten Register retten: *)
    ASM VOLATILE("              movem.l %%d0-%%d2/%%a0-%%a2,-(%%sp)" : : : );

                                (* Parameter holen: *)
    ASM VOLATILE("              move.l  24(%%sp),%%a0" : : : );              (* Adresse des PB holen *)
    ASM VOLATILE("              move.w  (%%a0),%%d0" : : : );                (* AES-Fktnr. nach D0 *)
    ASM VOLATILE("              move.l  2(%%a0),%%a1" : : : );               (* Adresse INTOUT *)
    ASM VOLATILE("              move.l  6(%%a0),24(%%sp)" : : : );           (* Rueckadr. auf Stack *)

                                (* PB in Free-Liste einfuegen *)
    ASM VOLATILE("              move.l  %0,2(%%a0)" : : "m"(Trap2PBFree) : ); (* ueber 'AddrINTOUT' verk. *)
    ASM VOLATILE("              move.l  %%a0,%0" : : "m"(Trap2PBFree) : );

    ASM VOLATILE("              tst.b   %0" : : "m"(BufferKeyValid) : );     (* BufferKeyPtr gueltig ? *)
    ASM VOLATILE("              beq.s   return" : : : );                     (* Nein->Nichts veranlassen *)

                                (* Falls vorhanden, Zeichen in D1 ermitteln *)
    ASM VOLATILE("              move.w  (%%a1),%%d1" : : : );                (* D1:= int_out[ 0] *)
    ASM VOLATILE("              cmpi.w  #20,%%d0" : : : );                   (* evnt_keyboard ? *)
    ASM VOLATILE("              beq.s   lookKey" : : : );                    (* => Zeichen in D1 *)

                                (* bei evnt_multi schauen, ob Taste ansteht *)
                                (* => ev_mwhich in D1 *)
    ASM VOLATILE("              btst    #0,%%d1" : : : );                    (* Tastaturereignis ? *)
    ASM VOLATILE("              beq.s   return" : : : );                     (* falls nicht => ret *)
    ASM VOLATILE("              move.w  10(%%a1),%%d1" : : : );              (* sonst Zeichen aus *)
                                                                             (* int_out[ 5] nach D1 *)

                  (* entsprechendes Zeichen im Tastaturpuffer "suchen" *)
                  (* Initialisierungen: *)
    ASM VOLATILE("lookKey:      move.l  %0,%%a0" : : "m"(IoRecPtr) : );      (* Adr IoRec nach A0 *)
    ASM VOLATILE("              move.w  8(%%a0),%%d0" : : : );               (* D0:= ibuftl *)
    ASM VOLATILE("              ext.l   %%d0" : : : );
    ASM VOLATILE("              add.l   (%%a0),%%d0" : : : );                (* D0 = ibuf + ibuftl *)
    ASM VOLATILE("              addq.l  #4,%%d0" : : : );                    (* INC( D0, 4) *)
    ASM VOLATILE("              move.l  %0,%%a2" : : "m"(IbufPlusIbufsize) : );      (* hoechster Wert+1 nach A2 *)
    ASM VOLATILE("              cmp.l   %%a2,%%d0" : : : );                  (* D0 >= A2 ? *)
    ASM VOLATILE("              blt.s   lookBuffer" : : : );                 (* falls nein, ok *)
    ASM VOLATILE("              move.l  (%%a0),%%d0" : : : );                (* sonst korrigieren *)

    ASM VOLATILE("lookBuffer:   move.l  %0,%%a0" : : "m"(BufferKeyPtr): );   (* Zeiger auf Puffer holen *)

    ASM VOLATILE("nextKey:" : : : );                                         (* A0:= (A0 + 4) MOD A2 *)
    ASM VOLATILE("              addq.l  #4,%%a0" : : : );                    (* BufferKeyPtr erhoehen *)
    ASM VOLATILE("              cmpa.l  %%a2,%%a0" : : : );                  (* A0 >= A2 ? *)
    ASM VOLATILE("              blt.s   getKey" : : : );                     (* nein *)
    ASM VOLATILE("              move.l  %0,%%a0" : : "m"(IoRecPtr) : );      (* Adr IoRec holen *)
    ASM VOLATILE("              move.l  (%%a0),%%a0" : : : );                (* A0:= ibuf *)

    ASM VOLATILE("getKey:       cmpa.l  %%d0,%%a0" : : : );                  (* BufferKeyPtr = ibuftl+4? *)
    ASM VOLATILE("              beq.s   notFound" : : : );                   (* falls ja nicht gefunden *)
    ASM VOLATILE("              move.l  (%%a0),%%d2" : : : );                (* Taste aus Puffer holen *)
    ASM VOLATILE("              cmp.b   %%d1,%%d2" : : : );                  (* ASCII-Codes gleich ? *)
    ASM VOLATILE("              bne.s   nextKey" : : : );                    (* wenn nein nochmal *)
    ASM VOLATILE("              swap    %%d2" : : : );                       (* scan-Code in low-Byte *)
    ASM VOLATILE("              ror.w   #8,%%d1" : : : );                    (* scan-Code in low-Byte *)
    ASM VOLATILE("              cmp.b   %%d1,%%d2" : : : );                  (* Scan-Codes gleich ? *)
    ASM VOLATILE("              beq.s   found" : : : );                      (* wenn ja, dann fertig *)
    ASM VOLATILE("              ror.w   #8,%%d1" : : : );                    (* wieder scan,ascii *)
    ASM VOLATILE("              bra.s   nextKey" : : : );                    (* nochmal *)

                  (* Zeichen wegen Pufferueberlauf nicht mehr im Puffer *)
    ASM VOLATILE("notFound:     clr.b   %0" : : "m"(BufferKeyValid): );      (* BufferKeyPtr nicht gueltig *)
    ASM VOLATILE("              bra.s   return" : : : );

                  (* Zeichen gefunden => Kbshift in int_out[ 4] schreiben *)
    ASM VOLATILE("found:        move.l  %%a0,%0" : : "m"(BufferKeyPtr) : );  (* BufferKeyPtr sichern *)
    ASM VOLATILE("              lsr.w   #8,%%d2" : : : );                    (* Kbshift in low-Byte *)
    ASM VOLATILE("              move.w  %%d2,8(%%a1)" : : : );               (* nach int_out[ 4] *)

    ASM VOLATILE("return:" : : : );                                          (* Zum Aufrufer der AES-Routine (TRAP2) zurueckkehren *)
    ASM VOLATILE("              movem.l (%%sp)+,%%d0-%%d2/%%a0-%%a2" : : : );   (* Regs restaurieren *)

                  (* nun steht die Ruecksprungadresse auf dem Stack und *)
                  (* RTS kehrt zurueck. *)
END afterTrap2;


(*
 * Diese Routine ist auf den TRAP2-Vektor installiert und wird daher bei
 * jedem AES oder VDI-Aufruf angesprungen. Zunaechst wird dann getestet,
 * ob ein AES-Aufruf (D0 = 200) vorliegt. Ist dies der Fall, dann wird
 * nachgefragt, ob evnt_keyboard (AES 20) oder evnt_multi (AES 25) auf-
 * gerufen wurde. Falls nicht, wird nichts weiter veranlasst und die vorher-
 * gehende TRAP2-Routine wird ausgefuehrt.
 * Im anderen Fall wird ein Parameter Block angelegt, der die AES-Funktions-
 * nummer, die Adresse des int_in-Arrays und die Ruecksprungadresse enthaelt.
 * Bei Modulinitialisierung wurden Anweisungen in diesen PB geschrieben, die
 * 'afterTrap2' mit der Adresse dieses PB als Parameter in A0 aufrufen.
 * Der Wert des PC auf dem SSP-Stack wird dann so veraendert, dass nach Rueckkehr
 * aus dem AES ueber diese Anweisungen 'afterTrap2' aufgerufen wird.
 *
 * Es werden alle Register gerettet !
 *)
VAR Trap2Carrier: XBRA.Carrier;

(* FIXME: does not work with -fno-omit-framepointer *)
PROCEDURE Trap2Handler;
BEGIN
                  (* hier ist die Einsprungadresse *)
                  (* feststellen, ob evnt_keyboard oder evnt_multi *)
                  (* aufgerufen wurde: *)
  ASM VOLATILE("                cmpi.w  #200,%%d0" : : : );              (* AES-Aufruf ? *)
  ASM VOLATILE("                bne.s   callPreviousV" : : : );

                  (* AES-Aufruf => erstmal die benoetigten Register retten *)
  ASM VOLATILE("                movem.l %%d2/%%a1-%%a3,-(%%sp)" : : : );
  ASM VOLATILE("                exg     %%d1,%%a0" : : : );              (* AESPB nach A0 *)

  ASM VOLATILE("                move.l  (%%a0),%%a1" : : : );            (* Adresse von control([0]) *)
  ASM VOLATILE("                move.w  (%%a1),%%a2" : : : );            (* Opcode fuer AES nach A2 *)
  ASM VOLATILE("                cmpa.w  #20,%%a2" : : : );               (* evnt_keyboard ? *)
  ASM VOLATILE("                beq.s   useAfterTrap2" : : : );
  ASM VOLATILE("                cmpa.w  #25,%%a2" : : : );               (* evnt_multi ? *)
  ASM VOLATILE("                bne.s   restore" : : : );

                  (* falls evnt_multi, feststellen, ob ueberhaupt auf ein *)
                  (* Tastaturereignis gewartet wird. *)
  ASM VOLATILE("                move.l  8(%%a0),%%a1" : : : );           (* Adresse von int_in([0]) *)
  ASM VOLATILE("                move.w  (%%a1),%%d2" : : : );            (* D2:= ev_mflags *)
  ASM VOLATILE("                btst    #0,%%d2" : : : );                (* keyboard IN ev_mflags ? *)
  ASM VOLATILE("                beq.s   restore" : : : );                (* nein => alte Rotine *)

                  (* falls BufferKeyPtr nicht gueltig, Puffer synchronisieren *)
  ASM VOLATILE("useAfterTrap2:  tst.b   %0" : : "m"(BufferKeyValid) : ); (* BufferKeyPtr gueltig ? *)
  ASM VOLATILE("                bne.s   createPB" : : : );               (* Ja -> weiter *)

                  (* BufferKeyPtr ist nicht gueltig => neu synchronisieren *)
  ASM VOLATILE("                movem.l %%d0-%%d1/%%a0/%%a2,-(%%sp)" : : : );    (* benoetigte Register retten *)
  ASM VOLATILE("                jsr     %0" : : "m"(SyncBuffer) : );             (* Puffer leeren u. sync. *)
  ASM VOLATILE("                movem.l (%%sp)+,%%d0-%%d1/%%a0/%%a2" : : : );    (* Register restaurieren *)

                  (* Trap2PB anlegen *)
  ASM VOLATILE("createPB:       move.l  %0,%%a1" : : "m"(Trap2PBFree) : );       (* Adr. vom freien Listenel. *)
  ASM VOLATILE("                move.l  2(%%a1),%0" : : "m"(Trap2PBFree) : );    (* aus FreeList ausketten *)
  ASM VOLATILE("                move.w  %%a2,(%%a1)+" : : : );           (* AES-Nr. ablegen *)
  ASM VOLATILE("                move.l  12(%%a0),(%%a1)+" : : : );       (* Adr. INTOUT ablegen *)
  ASM VOLATILE("                move.l  18(%%sp),(%%a1)+" : : : );       (* Return-Adresse ablegen *) (* "g"(return_address(0)) *)
  ASM VOLATILE("                move.l  %%a1,18(%%sp)" : : : );          (* n. ret. ueber PB afterTrap2 *)

                  (* Register restaurieren *)
  ASM VOLATILE("restore:        movem.l (%%sp)+,%%d2/%%a1-%%a3" : : : );
  ASM VOLATILE("                exg     %%a0,%%d1" : : : );

                  (* alte Trap2-Routine aufrufen *)
  ASM VOLATILE("callPreviousV:  move.l  %0,-(%%sp)" : : "m"(Trap2Carrier.head.prev.prev) : );  (* alten Vektor auf Stack *)

                  (* Auf dem Stack steht nun der alte Vektor. Dieser wird *)
                  (* durch RTS angesprungen. *)
  ASM VOLATILE("                " : : : );
END Trap2Handler;


(*
 * Diese Routine ueberwacht, ob 'IoRec.ibuf' + 'IoRec.head' 'BufferKeyPtr'
 * "ueberholt".
 *
 * Es werden alle Register gerettet !!
 *)
PROCEDURE OverflowHandler;
BEGIN
                      (* Einsprungadresse *)
                      (* Alter Vektor steht bei Eintritt auf dem Stack *)

                      (* Testen, ob Puffer uebergelaufen war *)
  ASM VOLATILE("                tst.b   %0" : : "m"(BufferKeyValid) : );
  ASM VOLATILE("                beq.s   callPreviousVo" : : : );            (* JA->alte Routine *)

  ASM VOLATILE("                movem.l %%a0-%%a1/%%d0-%%d1,-(%%sp)" : : : );    (* benoetigte Register retten *)

                  (* D0:= ibuf + ((ibufhd + 4L) MOD ibufsize) *)
  ASM VOLATILE("                move.l  %0,%%a0" : : "m"(IoRecPtr) : );    (* Adr. IoRec holen *)
  ASM VOLATILE("                move.w  6(%%a0),%%d0" : : : );             (* D0:= ibufhd *)
  ASM VOLATILE("                ext.l   %%d0" : : : );                     (* Longword daraus machen *)
  ASM VOLATILE("                add.l   (%%a0),%%d0" : : : );              (* D0:= ibuf + ibufhd *)
  ASM VOLATILE("                addq.l  #4,%%d0" : : : );                  (* INC( D0, 4) *)
  ASM VOLATILE("                move.l  %0,%%d1" : : "m"(IbufPlusIbufsize): );    (* D1:= ibuf + ibufsize *)
  ASM VOLATILE("                cmp.l   %%d1,%%d0" : : : );                (* D0 < D1? *)
  ASM VOLATILE("                blt.s   compare1" : : : );
  ASM VOLATILE("                move.l  (%%a0),%%d0" : : : );              (* evt. korrigieren D0=ibuf *)

                  (* hat head+4 den BufferKeyPtr erreicht ? *)
  ASM VOLATILE("compare1:       cmp.l   %0,%%d0" : : "m"(BufferKeyPtr) : );        (* D0 = BufferKeyPtr ? *)
  ASM VOLATILE("                beq.s   BufferOverflow" : : : );           (* JA->Ueberlauf *)

                  (* D0:= ibuf + ((ibufhd + 8L) MOD ibufsize) *)
  ASM VOLATILE("                addq.l  #4,%%d0" : : : );
  ASM VOLATILE("                cmp.l   %%d1,%%d0" : : : );                (* D0 < D1? *)
  ASM VOLATILE("                blt.s   compare2" : : : );
  ASM VOLATILE("                move.l  (%%a0),%%d0" : : : );              (* evt. korrigieren D0=ibuf *)

                  (* hat head+8 den BufferKeyPtr erreicht ? (wegen Protos) *)
  ASM VOLATILE("compare2:       cmp.l   %0,%%d0" : : "m"(BufferKeyPtr) : ); (* D0 = BufferKeyPtr? *)
  ASM VOLATILE("                bne.s   restoreo" : : : );                  (* Nein->alte Routine *)

  ASM VOLATILE("BufferOverflow: clr.b   %0" : : "m"(BufferKeyValid) : );    (* BufferKeyPtr nicht gueltig *)

                  (* alte Routine aufrufen *)
  ASM VOLATILE("restoreo:" : : : );
  ASM VOLATILE("                movem.l (%%sp)+,%%a0-%%a1/%%d0-%%d1" : : : );    (* Register restaurieren *)

                  (* nun wird ueber RTS der alte Vektor angesprungen !!! *)
  ASM VOLATILE("callPreviousVo:" : : : );
END OverflowHandler;

(*
 * XBRA-Header fuer IKBD-Routine
 *)
VAR IKBDCarrier: XBRA.Carrier;
VAR EtvTimerCarrier: XBRA.Carrier;

PROCEDURE IKBDHandler;
BEGIN
   ASM VOLATILE("move.l %0,-(%%sp)" : : "m"(IKBDCarrier.head.prev.prev) : );
   ASM VOLATILE("jmp %0" : : "m"(OverflowHandler));
END IKBDHandler;

PROCEDURE EtvTimerHandler;
BEGIN
   ASM VOLATILE("move.l %0,-(%%sp)" : : "m"(EtvTimerCarrier.head.prev.prev) : );
   ASM VOLATILE("jmp %0" : : "m"(OverflowHandler));
END EtvTimerHandler;



PROCEDURE KbdEventsInstalled(): BOOLEAN;
BEGIN
  RETURN IKBDVecInstalled OR EtvTimerVecInstalled OR TRAP2VecInstalled;
END KbdEventsInstalled;


PROCEDURE DeInstallKbdEvents;
VAR SupvHdl: INTEGER32;
    Conterm: POINTER TO BBS;
BEGIN
  SupvHdl := ToSuper();           (* Supervisormodus, da SysVars *)
  (* alte Vektoren restaurieren *)
  (* nur restaurieren, wenn DIESES Modul die Vektoren gesetzt hat !!! *)
  IF TRAP2VecInstalled THEN
    XBRA.Remove(Trap2Carrier, ADDRESS(TRAP2));
    TRAP2VecInstalled := FALSE;
  END;
  IF IKBDVecInstalled THEN
    XBRA.Remove(IKBDCarrier, ADDRESS(IKBD));
    IKBDVecInstalled := FALSE;
  END;
  IF EtvTimerVecInstalled THEN
    XBRA.Remove(EtvTimerCarrier, ADDRESS(etv_timer));
    EtvTimerVecInstalled := FALSE;
  END;
  (* Conterm zuruecksetzen *)
  Conterm := ADDRESS(conterm);
  Conterm^ := oldConterm;               (* alten Wert zurueckschreiben *)
  ToUser(SupvHdl);                    (* wieder in Usermodus schalten *)
END DeInstallKbdEvents;


PROCEDURE InstallKbdEvents;
VAR SupvHdl: INTEGER32;
    Conterm: POINTER TO BBS;
BEGIN
  (* Puffer synchronisieren *)
  SyncBuffer;
  FlushKbd;

  SupvHdl := ToSuper();           (* Supervisormodus, da SysVars *)

  (* Trap2Handler initialisieren *)
  IF NOT XBRA.Installed(XBRAID, ADDRESS(TRAP2)) THEN
    XBRA.Create(Trap2Carrier, XBRAID, Trap2Handler);
    XBRA.Install(Trap2Carrier , ADDRESS(TRAP2));
    TRAP2VecInstalled := TRUE;
  END;

  IF TRAP2VecInstalled THEN
    (* restliche Initialisierungen nur, wenn Trap2Handler installiert *)

    (* Conterm setzen *)
    Conterm := ADDRESS(conterm);
    INCL(Conterm^, KbShiftBit);         (* Kbshift-Bit setzen *)

    (* Ueberlauf des Tastaturpuffers ueber BufferKeyPtr verhindern *)
    IF NOT XBRA.Installed(XBRAID, ADDRESS(IKBD)) THEN
      (* Dazu OverflowHandler ueber IKBD und... *)
      XBRA.Create(IKBDCarrier, XBRAID, IKBDHandler);
      XBRA.Install(IKBDCarrier, ADDRESS(IKBD));
      IKBDVecInstalled := TRUE;
    END;
    IF NOT XBRA.Installed(XBRAID, etv_timer) THEN
      (* etv_timer aufrufen lassen. *)
      XBRA.Create(EtvTimerCarrier, XBRAID, EtvTimerHandler);
      XBRA.Install(EtvTimerCarrier, ADDRESS(etv_timer));
      EtvTimerVecInstalled := TRUE;
    END;
  END;
  ToUser(SupvHdl);         (* wieder in Usermodus schalten *)
END InstallKbdEvents;


(*
 * Diese Routine meldet das Modul beim GEM ab. Zuvor muessen die Register
 * restauriert werden.
 *)
PROCEDURE Removal;
BEGIN
  (* Vektoren restaurieren *)
  DeInstallKbdEvents;
   (* Nun zuletzt beim GEM abmelden. Dabei wird jedem Accessory, das auf
   * Message-Events wartet die Nachricht accClose geschickt. Weil die
   * Vektoren restauriert sind, klinken sich die Acc's aus dem Modul aus.
   * Daher kann nun das Modul terminieren.
   *)
  ExitGem(GEMHandle);
END Removal;


(*
 * Modul initialisieren.
 *)
PROCEDURE InitModule;
  PROCEDURE InitTrap2PBList;
  (*
   * Initialisiert die PB-Liste. Dazu werden alle PB's ueber 'Trap2PBFree'
   * verkettet. Ausserdem werden die richtigen Anweisungen zum Aufruf von
   * 'afterTrap2' in den PB eingetragen.
   *)
  VAR ListPtr: CARDINAL;

  BEGIN
    Trap2PBFree := ADR( Trap2PBList);  (* Trap2PBFree zeigt auf erstes El. *)
    FOR ListPtr := 0 TO HighTrap2PBList DO
        (* Liste ueber AddrIntOut verketten *)
        Trap2PBList[ListPtr].AESNo := 0;                           (* Kennung fuer freies Element *)
        IF ListPtr < HighTrap2PBList THEN
          Trap2PBList[ListPtr].AddrINTOUT := ADR( Trap2PBList[ ListPtr+1])
        ELSE
          Trap2PBList[ListPtr].AddrINTOUT := NIL
        END;
        Trap2PBList[ListPtr].moveToStackInstr := MOVEToStackInstr;
        Trap2PBList[ListPtr].PBAddr := ADR(Trap2PBList[ListPtr]);
        Trap2PBList[ListPtr].jmpInstr:= JMPInstr;
        Trap2PBList[ListPtr].AfterTrap2Addr := afterTrap2;
    END;
  END InitTrap2PBList;

VAR wsp: MOSGlobals.MemArea;
    SupvHdl: INTEGER32;
    success: BOOLEAN;
    Conterm: POINTER TO BBS;

BEGIN
  (* zunaechst beim GEM anmelden *)
  SysInitApplication(success);
  IF NOT success THEN
    DoTRAP6(MOSGlobals.OutOfMemory);
    RETURN;
  END;
  (* GEM-Handle fuer's abmelden merken *)
  GEMHandle := CurrGemHandle();

  (* Zeiger auf IOREC-Struktur der Tastatur ermitteln *)
  IoRecPtr := IORec(Keyboard);

  (* IbufPlusIbufsize errechnen *)
  IbufPlusIbufsize := IoRecPtr^.ibuf + VAL(CARDINAL, IoRecPtr^.ibufsize);

  (* Flags fuer Vektoren initialisieren *)
  TRAP2VecInstalled := FALSE;
  IKBDVecInstalled := FALSE;
  EtvTimerVecInstalled := FALSE;

  (* oldConterm initialisieren *)
  SupvHdl := ToSuper();               (* Supervisormodus, da SysVar *)
  Conterm := ADDRESS(conterm);
  oldConterm := Conterm^;
  ToUser(SupvHdl);                     (* wieder User-Modus *)

  (* Bei Terminierung deinitialisieren *)
  wsp.bottom := NIL;
  wsp.length := 0;
  CatchRemoval( rCarrier, Removal, wsp);

  (* Trap2PBList initialisieren *)
  InitTrap2PBList;
END InitModule;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
  (* Modul wird nun nicht mehr automatisch aktiv gesetzt !!! *)
  InitModule();
END KbdEvents.
