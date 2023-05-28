IMPLEMENTATION MODULE GEMShare;
(*$L-, N+, Y+*)
#define REF


(*      Megamax Modula-2 GEM Library: Von allen GEM-Library-Modulen genutzte
 *                                    Definitionen und Routinen.
 *                                    (INTERNES MODUL)
 *
 *      Autor: Manuel Chakravarty       Erstellt: MÑrz-Dezember 1987
 *
 *      MS: Michael Seyfried
 *
 *      Version 2.1     V#0191
 *)
 
(*  28.12.87    | Switching der Prozeûkennung bei Accsessories
 *  02.01.88    | Die Vektorexchangeroutine benutzen nun das 'DeviceHandle'
 *                und nicht die VDI-GerÑtekennung
 *  22.01.88 TT | vdi_if lÑdt handle runter bei opcode = open_v_work
 *  07.02.88    | Process-switching bei 'aes_call' funktioniert nun korrekt
 *  04.05.88    | VorlÑufige Version ohne Process-switching (fÅr Dietmar
 *              | Rabich)
 *  02.06.88    | 'removeTimerVec' korrigiert
 *  08.04.89    | process switching ganz raus.
 *  28.06.89    | 'checkErrorTest' hat den Zeiger auf die Prozedurvariable
 *                beim Benutzen nicht dereferenziert.
 *  02.08.89    | No more 'suspendedID', 'startID'
 *  03.08.89    | LINK in 'selectFile'
 *  ???????? TT | REF-Parm.
 *  02.04.90    | Aufteilung in public und private Datenstrukturen
 *  13.06.90 TT | echantSuperMode gelîscht
 *  05.10.90    | 'shellRead' def. + impl.
 *  25.11.90 TT | Um Rekursion in GEMError zu verhindern, wird "error" schon
 *                VOR Aufruf des Error-Handlers gelîscht; 'errNum' wird in
 *                setINT0attribut & gemErrorOccured auf Null gesetzt, damit
 *                zumindest ein definierter Wert darin enthalten ist.
 *                'ptrToErrHdler' neu - wird bei Auftreten eines Fehlers
 *                indirekt Åber die GemEnv-Var. "ErrHdlProc" aufgerufen.
 *                öberhaupt: 'testINTOUT0' signalisiert nur einen Fehler,
 *                wenn 'errNum' Null ist. Wozu dann Åberhaupt eine Var dafÅr?
 *  04.12.90 TT | stringIntoCFormat: SUB D1,D0 nun als Long-Operation!
 *  25.02.91 TT | unloadFonts aus VDIControls Åbertragen
 *  20.05.91 MS | unloadFonts korrigiert
 *  21.08.91 TT | 'signalGemError' macht RTS statt Runtime-Error, wenn
 *                'ptrToErrHdler' = NIL ist.
 *  22.05.93 TT | 'signalGemError': LINK A5,#0
 *  25.05.23 THO| Port to gm2
 *)


FROM SYSTEM     IMPORT BYTE, ADR, INTEGER32, SHIFT;

FROM MOSGlobals IMPORT OutOfStack, IllegalPointer, StringOverflow;

FROM GrafBase   IMPORT Point, Rectangle, PtrMouseFormDef;
FROM ErrBase IMPORT TRAP6;

#include "gemops.icl"
#include "gemcnf.icl"



              (*  Misc. subroutines  *)
              (*  =================  *)

PROCEDURE getCalcedFrame(frame:Rectangle; VAR pxy: PXY4);
BEGIN
  pxy[0] := frame.x;
  pxy[1] := frame.y;
  pxy[2] := frame.x + frame.w - 1;
  pxy[3] := frame.y + frame.h - 1;
END getCalcedFrame;


PROCEDURE stringIntoINTIN(REF str:ARRAY OF CHAR; offset: CARDINAL):CARDINAL;
VAR i, count: CARDINAL;
BEGIN
  count := intinMax - offset;
  (* Wenn String zu lang, benutze nur den Teil, der noch ins Array passt *)
  IF count > HIGH(str) + 1 THEN count := HIGH(str) + 1; END;
  i := 0;
  (* Kopiere bis 0C oder max. Arrayindex *)
  LOOP
    IF i >= count THEN EXIT END;
    IF str[i] = 0C THEN EXIT END;
    our_cb^.pubs.vINTIN[offset] := str[i];
    INC(offset);
    INC(i);
  END;
  (* Anzahl kopierter Zeichen ermitteln und zurueckgeben *)
  RETURN i;
END stringIntoINTIN;


PROCEDURE stringIntoCFormat (REF str: ARRAY OF CHAR; VAR dst: MaxStr);
VAR i, count: CARDINAL;
BEGIN
  count := HIGH(str);
  IF count > HIGH(dst) THEN count := HIGH(dst); END;
  i := 0;
  (* Kopiere bis 0C oder max. Arrayindex *)
  LOOP
    IF i > count THEN EXIT END;
    IF str[i] = 0C THEN EXIT END;
    dst[i] := str[i];
    INC(i);
  END;
  dst[i] := 0C;
END stringIntoCFormat;


                      (*  global error handling  *)
                      (*  =====================  *)
 
(*
 * Hier wird "error" auf TRUE gesetzt, so daû der User den Fehler
 * dann abfragen kann.
 * Falls aber mittels des Util-Moduls "GemErrLocator" der unmittelbare
 * Error-Handler installiert ist, wird sofort darÅber der Fehler
 * angezeigt, so daû ein Scanning auf den Verursacher mîglich ist.
 *)
PROCEDURE signalGemError;
BEGIN
  error := TRUE;
  IF ptrToErrHdler <> NIL THEN
    ptrToErrHdler^();
  END;
END signalGemError;


(*
 * Aufzurufen nach einem AES-Call. INTOUT[0] wird geprÅft. Wenn Fehler
 * angezeigt, wird 'error'-Flag gesetzt.
 *)
PROCEDURE testINTOUT0(pb: PtrAESPB);
BEGIN
  errNum := pb^.pintin^[0];
  IF errNum = 0 THEN signalGemError; END;
END testINTOUT0;


(*
 * Aufzurufen zu Beginn einer GEM-Routine. Falls 'error'-Flag gesetzt,
 * wird GEM-Fehler gemeldet.
 *)
PROCEDURE testErrorCheck;
BEGIN
  IF error THEN
    error := FALSE; (* verhindert Rekursion *)
    IF errorProcPtr <> NIL THEN
      errorProcPtr^()
    ELSE
      TRAP6(IllegalPointer - 04000H);
    END;
  END;
END testErrorCheck;


(*
 * Aufzurufen, wenn Fehler auftrat. 'error'-Flag wird gesetzt.
 *)
PROCEDURE gemErrorOccured;
BEGIN
  errNum := 0;
  signalGemError();
END gemErrorOccured;


PROCEDURE setDevice(handle:DeviceHandle): BOOLEAN;
BEGIN
  testErrorCheck();
  IF handle = NIL THEN
    gemErrorOccured();
    RETURN FALSE
  ELSE
    IF handle^.magic <> deviceMagic THEN
      TRAP6(IllegalPointer);
      RETURN FALSE
    ELSE
      our_cb^.CURDEVICE := handle;
      RETURN TRUE
    END
  END;
END setDevice;


(*  A E S  *)
(*  =====  *)

PROCEDURE aes_call (pb: GemHandle);
BEGIN
  ASM VOLATILE("move.l %0,%%d1; move.w #200,%%d0; trap #1"
     :
     : "g"(ADR(pb^.aespb))
     : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
END aes_call;


PROCEDURE aes_if(ctrlcode:CARDINAL32);
BEGIN
  testErrorCheck();
  our_cb^.pubs.aINTOUT[0] := 0;
  our_cb^.A_CONTRL.opcode := INTEGER(SHIFT(BITSET(ctrlcode), -24));
  our_cb^.A_CONTRL.nintin := INTEGER(SHIFT(BITSET(ctrlcode), -16) * BITSET(255));
  our_cb^.A_CONTRL.nintout := INTEGER(SHIFT(BITSET(ctrlcode), -8) * BITSET(255));
  our_cb^.A_CONTRL.naddrin := INTEGER(SHIFT(BITSET(ctrlcode), 0) * BITSET(255));
  /* naddrout left alone; only rsrc_gaddr needs it */
  aes_call(our_cb);
END aes_if;


(*  V D I  *)
(*  =====  *)

PROCEDURE vdi_call (para: GemHandle);
BEGIN
  ASM VOLATILE("move.l %0,%%d1; move.w #115,%%d0; trap #1"
     :
     : "g"(ADR(para^.vdipb))
     : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
END vdi_call;


PROCEDURE vdi_if (handle:DeviceHandle;ctrlcode:CARDINAL32);
BEGIN
  testErrorCheck();
  our_cb^.V_CONTRL.opcode := INTEGER(SHIFT(BITSET(ctrlcode), -24));
  our_cb^.V_CONTRL.subcmd := INTEGER(SHIFT(BITSET(ctrlcode), -16) * BITSET(255));
  our_cb^.V_CONTRL.nptsin := INTEGER(SHIFT(BITSET(ctrlcode), -8) * BITSET(255));
  our_cb^.V_CONTRL.nintin := INTEGER(SHIFT(BITSET(ctrlcode), 0) * BITSET(255));
  IF ((our_cb^.V_CONTRL.opcode <> V_OPNWK) AND (our_cb^.V_CONTRL.opcode <> OPEN_V_WORK)) THEN
    IF NOT setDevice(handle) THEN RETURN END;
    our_cb^.V_CONTRL.handle := handle^.handle;
  END;
  vdi_call(our_cb);
END vdi_if;


PROCEDURE setINT0attribut(handle:DeviceHandle; ctrlcode:CARDINAL32; intin0: INTEGER16);
BEGIN
  our_cb^.pubs.vINTIN[0] := intin0;
  vdi_if(handle, ctrlcode);
  IF our_cb^.pubs.vINTIN[0] <> intin0 THEN
    errNum := 0;
    signalGemError();
  END;
END setINT0attribut;


(*  Von mehreren GEM Moduln benutzte GEM-Calls  *)
(*  ==========================================  *)
              
PROCEDURE grafMouse(form:INTEGER16(* ~ AESGraphics.MouseForm*);
                  mFormDefPtr:PtrMouseFormDef);
                  
                  
(* !!!!!!!!! Muû 'AESGraphics.MouseForm' entsprechen !!!!!!!!!! *)

TYPE    MouseForm       = (arrow, textCursor, bee, pointHand, flatHand,
                         thinCross, thickCross, outlineCross, userCursor,
                         mouseOff, mouseOn);
     
BEGIN
  our_cb^.pubs.ADDRIN[0] := mFormDefPtr;
  IF (form = userCursor) OR (form = mouseOff) OR (form = mouseOn) THEN
    our_cb^.pubs.aINTIN[0] := ORD(form) - ORD(userCursor) + 255;
  ELSE
    our_cb^.pubs.aINTIN[0] := ORD(form);
  END;
  CASE form OF
  | mouseOff:
    INC(our_cb^.SUPERVISION.noGrafMouse);
  | mouseOn:
    IF our_cb^.SUPERVISION.noGrafMouse = 0 THEN
#if doSupervision
      RETURN;
#endif
    ELSE
      DEC(our_cb^.SUPERVISION.noGrafMouse);
    END
  | ELSE
  END;
  aes_if(AES_CTRL_CODE(GRAF_MOUSE, 1, 1, 1));
  testINTOUT0(ADR(our_cb^.aespb));
END grafMouse;



PROCEDURE showCursor (device:DeviceHandle; force:BOOLEAN);
BEGIN
  IF setDevice(device) THEN
    IF NOT force THEN
      IF device^.noHdCurs = 0 THEN RETURN; END;
      DEC(device^.noHdCurs);
    ELSE
      device^.noHdCurs := 0;
    END;
    our_cb^.pubs.vINTIN[0] := INTEGER(BITSET(ORD(force)) / BITSET(1));
    vdi_if(device, VDI_CTRL_CODE(SHOW_CURSOR, 0, 0, 1));
  END;
END showCursor;


PROCEDURE hideCursor (device:DeviceHandle);
BEGIN
  IF setDevice(device) THEN
    DEC(device^.noHdCurs);
    vdi_if(device, VDI_CTRL_CODE(HIDE_CURSOR, 0, 0, 0));
  END;
END hideCursor;


PROCEDURE unloadFonts(handle:DeviceHandle;select:INTEGER16);
BEGIN
  IF setDevice(handle) THEN
    our_cb^.pubs.vINTIN[0] := select;
    vdi_if(handle, VDI_CTRL_CODE(UNLOAD_FONTS, 0, 0, 1));
    handle^.fontsLoaded := FALSE;
  END;
END unloadFonts;


PROCEDURE updateWindow (update: UpdateWindowType);
BEGIN
  CASE update OF
  | EndUpdate:
    IF our_cb^.SUPERVISION.noUpWind = 0 THEN
#if doSupervision
      RETURN
#endif
    ELSE
      DEC(our_cb^.SUPERVISION.noUpWind);
    END;
  | BegUpdate:
      INC(our_cb^.SUPERVISION.noUpWind);
  | EndMctrl:
    IF our_cb^.SUPERVISION.noMouseCtrl = 0 THEN
#if doSupervision
      RETURN
#endif
    ELSE
      DEC(our_cb^.SUPERVISION.noMouseCtrl);
    END;
  | BegMctrl:
      INC(our_cb^.SUPERVISION.noMouseCtrl);
  END;
  our_cb^.pubs.aINTIN[0] := ORD(update);
  aes_if(AES_CTRL_CODE(WIND_UPDATE, 1, 1, 0));
  testINTOUT0(ADR(our_cb^.aespb));
END updateWindow;


PROCEDURE closeWindow(handle:CARDINAL);
BEGIN
  IF handle <= MaxWinds THEN
    EXCL(our_cb^.SUPERVISION.openWinds, handle);
  END;
  our_cb^.pubs.aINTIN[0] := handle;
  aes_if(AES_CTRL_CODE(WIND_CLOSE, 1, 1, 0));
  testINTOUT0(ADR(our_cb^.aespb));
END closeWindow;


PROCEDURE deleteWindow(handle:CARDINAL);
BEGIN
  IF handle <= MaxWinds THEN
    EXCL(our_cb^.SUPERVISION.createWinds, handle);
  END;
  our_cb^.pubs.aINTIN[0] := handle;
  aes_if(AES_CTRL_CODE(WIND_DELETE, 1, 1, 0));
  testINTOUT0(ADR(our_cb^.aespb));
END deleteWindow;


(* IR-Vector routines (must be global for supervision) *)

PROCEDURE exchangeTimerVec(newproc: PROC; VAR time:CARDINAL): [ PROC ];
BEGIN
  our_cb^.V_CONTRL.ptr1.proc := newproc;
  vdi_if(our_cb^.CURDEVICE, VDI_CTRL_CODE(EX_TIMER_INTER, 0, 0, 0));
  time := our_cb^.pubs.vINTOUT[0];
  RETURN our_cb^.V_CONTRL.ptr2.proc;
END exchangeTimerVec;


PROCEDURE exchangeMouseVec (opcode:CARDINAL; newproc:PROC): [ PROC ];
BEGIN
  our_cb^.V_CONTRL.ptr1.proc := newproc;
  vdi_if(our_cb^.CURDEVICE, VDI_CTRL_CODE(opcode, 0, 0, 0));
  RETURN our_cb^.V_CONTRL.ptr2.proc;
END exchangeMouseVec;


PROCEDURE removeTimerVector(VAR hdl:vecListElem);
VAR list: POINTER TO ptrVectorList;
VAR dummy: CARDINAL;
VAR phdl: ptrVectorList;
BEGIN
  phdl := ADR(hdl);
  list := ADR(timerVecList);
  LOOP
    IF list^ = NIL THEN EXIT END;
    IF list^ = phdl THEN
      (* ausketten *)
      list^ := list^^.next;
      IF timerVecList = NIL THEN
        (* Setze Vector wieder in Normalzustand *)
        exchangeTimerVec(orgTimerVec, dummy);
      END;
      EXIT;
    END;
    list := ADR(list^^.next);
  END;
  IF our_cb^.SUPERVISION.timerPrev = timerVecList THEN
    (* Set flag to 'no timervec' *)
    our_cb^.SUPERVISION.timerChgd := FALSE;
  END;
END removeTimerVector;


PROCEDURE removeButChgVector(VAR hdl:vecListElem);
VAR list: POINTER TO ptrVectorList;
VAR phdl: ptrVectorList;
BEGIN
  phdl := ADR(hdl);
  list := ADR(butChgVecList);
  LOOP
    IF list^ = NIL THEN EXIT END;
    IF list^ = phdl THEN
      (* ausketten *)
      list^ := list^^.next;
      IF butChgVecList = NIL THEN
        (* Setze Vector wieder in Normalzustand *)
        exchangeMouseVec(EX_BUT_CHANGE, orgButChgVec);
      END;
      EXIT;
    END;
    list := ADR(list^^.next);
  END;
  IF our_cb^.SUPERVISION.butChgPrev = butChgVecList THEN
    (* Set flag to 'no butChgvec' *)
    our_cb^.SUPERVISION.butChgChgd := FALSE;
  END;
END removeButChgVector;


PROCEDURE removeMsMoveVector(VAR hdl:vecListElem);
VAR list: POINTER TO ptrVectorList;
VAR phdl: ptrVectorList;
BEGIN
  phdl := ADR(hdl);
  list := ADR(msMoveVecList);
  LOOP
    IF list^ = NIL THEN EXIT END;
    IF list^ = phdl THEN
      (* ausketten *)
      list^ := list^^.next;
      IF msMoveVecList = NIL THEN
        (* Setze Vector wieder in Normalzustand *)
        exchangeMouseVec(EX_MOUSE_MOVE, orgMsMoveVec);
      END;
      EXIT;
    END;
    list := ADR(list^^.next);
  END;
  IF our_cb^.SUPERVISION.butChgPrev = msMoveVecList THEN
    (* Set flag to 'no butChgvec' *)
    our_cb^.SUPERVISION.msMoveChgd := FALSE;
  END;
END removeMsMoveVector;


PROCEDURE removeCurChgVector(VAR hdl:vecListElem);
VAR list: POINTER TO ptrVectorList;
VAR phdl: ptrVectorList;
BEGIN
  phdl := ADR(hdl);
  list := ADR(curChgVecList);
  LOOP
    IF list^ = NIL THEN EXIT END;
    IF list^ = phdl THEN
      (* ausketten *)
      list^ := list^^.next;
      IF curChgVecList = NIL THEN
        (* Setze Vector wieder in Normalzustand *)
        exchangeMouseVec(EX_MOUSE_CHANGE, orgCurChgVec);
      END;
      EXIT;
    END;
    list := ADR(list^^.next);
  END;
  IF our_cb^.SUPERVISION.curChgPrev = curChgVecList THEN
    (* Set flag to 'no curChgvec' *)
    our_cb^.SUPERVISION.curChgChgd := FALSE;
  END;
END removeCurChgVector;


BEGIN
  (*  Liste initalisieren
   *)
  root_cb := NIL;
  our_cb := NIL;

  error := FALSE;         (*  Kein Fehler aufgetreten  *)
  errorProcPtr := NIL;    (*  Keine Fehlerroutine angemeldet  *)
  ptrToErrHdler := NIL;

  (*  'Plugs' zurÅcksetzen  *)

  keyboardPlugActive := FALSE;
  buttonPlugActive := FALSE;
  firstRectPlugActive := FALSE;
  secondRectPlugActive := FALSE;
  messagePlugActive := FALSE;
  timerPlugActive := FALSE;

END GEMShare.
