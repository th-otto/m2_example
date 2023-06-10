IMPLEMENTATION MODULE GEMShare;
#define REF


(*      Megamax Modula-2 GEM Library: Von allen GEM-Library-Modulen genutzte
 *                                    Definitionen und Routinen.
 *                                    (INTERNES MODUL)
 *
 *      Autor: Manuel Chakravarty       Erstellt: Maerz-Dezember 1987
 *
 *      MS: Michael Seyfried
 *
 *      Version 2.1     V#0191
 *)

(*  28.12.87    | Switching der Prozesskennung bei Accsessories
 *  02.01.88    | Die Vektorexchangeroutine benutzen nun das 'DeviceHandle'
 *                und nicht die VDI-Geraetekennung
 *  22.01.88 TT | vdi_if laedt handle runter bei opcode = open_v_work
 *  07.02.88    | Process-switching bei 'aes_call' funktioniert nun korrekt
 *  04.05.88    | Vorlaeufige Version ohne Process-switching (fuer Dietmar
 *              | Rabich)
 *  02.06.88    | 'removeTimerVec' korrigiert
 *  08.04.89    | process switching ganz raus.
 *  28.06.89    | 'checkErrorTest' hat den Zeiger auf die Prozedurvariable
 *                beim Benutzen nicht dereferenziert.
 *  02.08.89    | No more 'suspendedID', 'startID'
 *  03.08.89    | LINK in 'selectFile'
 *  ???????? TT | REF-Parm.
 *  02.04.90    | Aufteilung in public und private Datenstrukturen
 *  13.06.90 TT | echantSuperMode geloescht
 *  05.10.90    | 'shellRead' def. + impl.
 *  25.11.90 TT | Um Rekursion in GEMError zu verhindern, wird "error" schon
 *                VOR Aufruf des Error-Handlers geloescht; 'errNum' wird in
 *                setINT0attribut & gemErrorOccured auf Null gesetzt, damit
 *                zumindest ein definierter Wert darin enthalten ist.
 *                'ptrToErrHdler' neu - wird bei Auftreten eines Fehlers
 *                indirekt ueber die GemEnv-Var. "ErrHdlProc" aufgerufen.
 *                Ueberhaupt: 'testINTOUT0' signalisiert nur einen Fehler,
 *                wenn 'errNum' Null ist. Wozu dann ueberhaupt eine Var dafuer?
 *  04.12.90 TT | stringIntoCFormat: SUB D1,D0 nun als Long-Operation!
 *  25.02.91 TT | unloadFonts aus VDIControls uebertragen
 *  20.05.91 MS | unloadFonts korrigiert
 *  21.08.91 TT | 'signalGemError' macht RTS statt Runtime-Error, wenn
 *                'ptrToErrHdler' = NIL ist.
 *  22.05.93 TT | 'signalGemError': LINK A5,#0
 *  25.05.23 THO| Port to gm2
 *)


FROM SYSTEM     IMPORT BYTE, ADR, INTEGER32, SHIFT;

IMPORT MOSGlobals;

FROM GrafBase   IMPORT Point, Rectangle, PtrMouseFormDef;
FROM ErrBase IMPORT DoTRAP6, TRAP6_SELF, TRAP6_CONT;
FROM GEMConf IMPORT doSupervision;
IMPORT GEMOps;

(*  Misc. subroutines  *)
(*  =================  *)
#include "AesCtrl.i"
#include "VdiCtrl.i"


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


PROCEDURE stringIntoCFormat(REF str: ARRAY OF CHAR; VAR dst: MaxStr);
VAR i, count: CARDINAL;
BEGIN
  count := HIGH(str) + 1;
  IF count >= HIGH(dst) THEN count := HIGH(dst); END;
  i := 0;
  (* Kopiere bis 0C oder max. Arrayindex *)
  LOOP
    IF count = 0 THEN EXIT END;
    IF str[i] = 0C THEN EXIT END;
    dst[i] := str[i];
    INC(i);
    DEC(count);
  END;
  dst[i] := 0C;
END stringIntoCFormat;


PROCEDURE stringFromCFormat(REF str: MaxStr; VAR dst:ARRAY OF CHAR);
VAR i, count: CARDINAL;
BEGIN
  count := HIGH(dst);
  i := 0;
  (* Kopiere bis 0C oder max. Arrayindex *)
  LOOP
    IF count = 0 THEN EXIT END;
    IF str[i] = 0C THEN EXIT END;
    dst[i] := str[i];
    INC(i);
    DEC(count);
  END;
  dst[i] := 0C;
END stringFromCFormat;

(*  global error handling  *)
(*  =====================  *)

(*
 * Hier wird "error" auf TRUE gesetzt, so dass der User den Fehler
 * dann abfragen kann.
 * Falls aber mittels des Util-Moduls "GemErrLocator" der unmittelbare
 * Error-Handler installiert ist, wird sofort darueber der Fehler
 * angezeigt, so dass ein Scanning auf den Verursacher moeglich ist.
 *)
PROCEDURE signalGemError;
BEGIN
  error := TRUE;
  IF ptrToErrHdler <> NIL THEN
    ptrToErrHdler^();
  END;
END signalGemError;


(*
 * Aufzurufen nach einem AES-Call. INTOUT[0] wird geprueft. Wenn Fehler
 * angezeigt, wird 'error'-Flag gesetzt.
 *)
PROCEDURE testINTOUT0();
BEGIN
  errNum := our_cb^.aespb.pintout^[0];
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
      DoTRAP6(MOSGlobals.IllegalPointer - TRAP6_SELF);
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
      DoTRAP6(MOSGlobals.IllegalPointer);
      RETURN FALSE
    ELSE
      our_cb^.CURDEVICE := handle;
      RETURN TRUE
    END
  END;
END setDevice;


(*  A E S  *)
(*  =====  *)

PROCEDURE aes_call(pb: GemHandle);
BEGIN
  ASM VOLATILE("move.l %0,%%d1; move.w #200,%%d0; trap #2"
     :
     : "g"(ADR(pb^.aespb))
     : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
END aes_call;


PROCEDURE aes_if(ctrlcode:CARDINAL32);
BEGIN
  testErrorCheck();
  our_cb^.pubs.aINTOUT[0] := 0;
  our_cb^.A_CONTRL.opcode := INTEGER(SHIFT(BITSET(ctrlcode), -24) * BITSET(255));
  our_cb^.A_CONTRL.nintin := INTEGER(SHIFT(BITSET(ctrlcode), -16) * BITSET(255));
  our_cb^.A_CONTRL.nintout := INTEGER(SHIFT(BITSET(ctrlcode), -8) * BITSET(255));
  our_cb^.A_CONTRL.naddrin := INTEGER(SHIFT(BITSET(ctrlcode), 0) * BITSET(255));
  /* naddrout left alone; only rsrc_gaddr needs it */
  aes_call(our_cb);
END aes_if;


(*  V D I  *)
(*  =====  *)

PROCEDURE vdi_call(para: GemHandle);
BEGIN
  ASM VOLATILE("move.l %0,%%d1; move.w #115,%%d0; trap #2"
     :
     : "g"(ADR(para^.vdipb))
     : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
END vdi_call;


PROCEDURE vdi_if(handle:DeviceHandle;ctrlcode:CARDINAL32);
BEGIN
  testErrorCheck();
  our_cb^.V_CONTRL.opcode := INTEGER(SHIFT(BITSET(ctrlcode), -24) * BITSET(255));
  our_cb^.V_CONTRL.subcmd := INTEGER(SHIFT(BITSET(ctrlcode), -16) * BITSET(255));
  our_cb^.V_CONTRL.nptsin := INTEGER(SHIFT(BITSET(ctrlcode), -8) * BITSET(255));
  our_cb^.V_CONTRL.nintin := INTEGER(SHIFT(BITSET(ctrlcode), 0) * BITSET(255));
  IF ((our_cb^.V_CONTRL.opcode <> GEMOps.V_OPNWK) AND (our_cb^.V_CONTRL.opcode <> GEMOps.OPEN_V_WORK)) THEN
    IF NOT setDevice(handle) THEN RETURN END;
    our_cb^.V_CONTRL.handle := handle^.handle;
  END;
  vdi_call(our_cb);
END vdi_if;


(*  Von mehreren GEM Moduln benutzte GEM-Calls  *)
(*  ==========================================  *)

PROCEDURE GrafMouse(form: MouseForm;
                  mFormDefPtr:PtrMouseFormDef);
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
      IF doSupervision THEN RETURN END;
    ELSE
      DEC(our_cb^.SUPERVISION.noGrafMouse);
    END
  | ELSE
  END;
  aes_if(AES_CTRL_CODE(GEMOps.GRAF_MOUSE, 1, 1, 1));
  testINTOUT0();
END GrafMouse;



PROCEDURE showCursor(device:DeviceHandle; force:BOOLEAN);
BEGIN
  IF setDevice(device) THEN
    IF NOT force THEN
      IF device^.noHdCurs = 0 THEN RETURN; END;
      DEC(device^.noHdCurs);
    ELSE
      device^.noHdCurs := 0;
    END;
    our_cb^.pubs.vINTIN[0] := INTEGER(BITSET(ORD(force)) / BITSET(1));
    vdi_if(device, VDI_CTRL_CODE(GEMOps.SHOW_CURSOR, 0, 0, 1));
  END;
END showCursor;


PROCEDURE hideCursor(device:DeviceHandle);
BEGIN
  IF setDevice(device) THEN
    DEC(device^.noHdCurs);
    vdi_if(device, VDI_CTRL_CODE(GEMOps.HIDE_CURSOR, 0, 0, 0));
  END;
END hideCursor;


PROCEDURE unloadFonts(handle:DeviceHandle;select:INTEGER16);
BEGIN
  IF setDevice(handle) THEN
    our_cb^.pubs.vINTIN[0] := select;
    vdi_if(handle, VDI_CTRL_CODE(GEMOps.UNLOAD_FONTS, 0, 0, 1));
    handle^.fontsLoaded := FALSE;
  END;
END unloadFonts;


PROCEDURE updateWindow(update: UpdateWindowType);
BEGIN
  CASE update OF
  | EndUpdate:
    IF our_cb^.SUPERVISION.noUpWind = 0 THEN
      IF doSupervision THEN RETURN END;
    ELSE
      DEC(our_cb^.SUPERVISION.noUpWind);
    END;
  | BegUpdate:
      INC(our_cb^.SUPERVISION.noUpWind);
  | EndMctrl:
    IF our_cb^.SUPERVISION.noMouseCtrl = 0 THEN
      IF doSupervision THEN RETURN END;
    ELSE
      DEC(our_cb^.SUPERVISION.noMouseCtrl);
    END;
  | BegMctrl:
      INC(our_cb^.SUPERVISION.noMouseCtrl);
  END;
  our_cb^.pubs.aINTIN[0] := ORD(update);
  aes_if(AES_CTRL_CODE(GEMOps.WIND_UPDATE, 1, 1, 0));
  testINTOUT0();
END updateWindow;


PROCEDURE closeWindow(handle:CARDINAL);
BEGIN
  IF handle <= MaxWinds THEN
    EXCL(our_cb^.SUPERVISION.openWinds, handle);
  END;
  our_cb^.pubs.aINTIN[0] := handle;
  aes_if(AES_CTRL_CODE(GEMOps.WIND_CLOSE, 1, 1, 0));
  testINTOUT0();
END closeWindow;


PROCEDURE deleteWindow(handle:CARDINAL);
BEGIN
  IF handle <= MaxWinds THEN
    EXCL(our_cb^.SUPERVISION.createWinds, handle);
  END;
  our_cb^.pubs.aINTIN[0] := handle;
  aes_if(AES_CTRL_CODE(GEMOps.WIND_DELETE, 1, 1, 0));
  testINTOUT0();
END deleteWindow;


(* IR-Vector routines (must be global for supervision) *)

PROCEDURE exchangeTimerVec(newproc: PROC; VAR time:CARDINAL): [ PROC ];
BEGIN
  our_cb^.V_CONTRL.ptr1.proc := newproc;
  vdi_if(our_cb^.CURDEVICE, VDI_CTRL_CODE(GEMOps.EX_TIMER_INTER, 0, 0, 0));
  time := our_cb^.pubs.vINTOUT[0];
  RETURN our_cb^.V_CONTRL.ptr2.proc;
END exchangeTimerVec;


PROCEDURE exchangeMouseVec(opcode:CARDINAL; newproc:PROC): [ PROC ];
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
        exchangeMouseVec(GEMOps.EX_BUT_CHANGE, orgButChgVec);
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
        exchangeMouseVec(GEMOps.EX_MOUSE_MOVE, orgMsMoveVec);
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
        exchangeMouseVec(GEMOps.EX_MOUSE_CHANGE, orgCurChgVec);
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
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
  (*  Liste initalisieren *)
  root_cb := NIL;
  our_cb := NIL;

  error := FALSE;         (*  Kein Fehler aufgetreten  *)
  errorProcPtr := NIL;    (*  Keine Fehlerroutine angemeldet  *)
  ptrToErrHdler := NIL;

  (*  'Plugs' zuruecksetzen  *)

  keyboardPlug := keyboardPlugProc(0);
  buttonPlug := buttonPlugProc(0);
  firstRectPlug := rectPlugProc(0);
  secondRectPlug := rectPlugProc(0);
  messagePlug := messagePlugProc(0);
  timerPlug := timerPlugProc(0);

END GEMShare.
