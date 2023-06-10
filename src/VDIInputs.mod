IMPLEMENTATION MODULE VDIInputs;


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Eingabefunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  04.11.87
 *
 *  Version   2.2     V#0039
 *)

(*  04.11.87    | Uebernahme aus 'GEMBase' und 'GEMExt'
 *  27.12.87    | Vector-Handler arbeiten im Usermode
 *                'SetInputMode' arbeitet lokal zum aktuellen device
 *  14.6.88     | 'GetMouseState' behandelt das 'MButtonSet' mit .B
 *  01.02.90    | Anpassung auf Compiler V4.0 (verdrehte SET's)
 *  02.04.90    | Anpassung auf public arrays
 *  25.02.91 TT | "error"-Setzung ueber occured-Funktion
 *  15.09.91 MS | KeyboardState korrigiert
 *  14.07.93 TT | ButChg/MouseMove/Timer-IR-Routinen korrigiert (SSP wird nun
 *                ebenfalls gerettet/restauriert).
 *  10.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR, INTEGER16;

FROM    GrafBase        IMPORT Point, Rectangle, PtrMouseFormDef;

FROM    GEMGlobals      IMPORT GemChar, MButtonSet, SpecialKeySet;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GEMConf IMPORT VDIChecks;
FROM GEMBase IMPORT PtrIntinArray, PtrPtsinArray;

#include "VdiCtrl.i"


(*  SetInputMode -- Legt das logische Eingabegeraet und dessen Eingabe-  *
 *                  modus fest. Der Aufruf wird nur ausgefuehrt, wenn    *
 *                  die zu setzende Einstellung sich von der momentanen *
 *                  Einstellung unterscheidet. !! 'GemError' beachten!! *)
PROCEDURE SetInputMode (handle:DeviceHandle; dev:GEMShare.logInpDev;mode: GEMShare.inputMode);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(dev);
  GEMShare.our_cb^.pubs.vINTIN[1] := ORD(mode);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_INPUT_MODE, 0, 0, 2));
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.vINTOUT[0] <> VAL(INTEGER16, ORD(mode)) THEN
      GEMShare.gemErrorOccured();
    END;
  END;
END SetInputMode;


PROCEDURE RequestLoc(handle:DeviceHandle; start:Point;
                     VAR termBut:CHAR;VAR loc:Point);
BEGIN
  SetInputMode(handle, location, request);
  GEMShare.our_cb^.pubs.PTSIN[0] := start.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := start.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_LOCATOR, 0, 1, 0));
  loc.x := GEMShare.our_cb^.pubs.PTSOUT[0];
  loc.y := GEMShare.our_cb^.pubs.PTSOUT[1];
  termBut := VAL(CHAR, GEMShare.our_cb^.pubs.vINTOUT[0]);
END RequestLoc;


PROCEDURE TestLoc(handle:DeviceHandle; start:Point;
                  VAR termbut:CHAR;VAR keyPress,koorChange:BOOLEAN;
                  VAR loc:Point);
BEGIN
  SetInputMode(handle, location, sample);
  GEMShare.our_cb^.pubs.PTSIN[0] := start.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := start.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_LOCATOR, 0, 1, 0));
  IF GEMShare.our_cb^.V_CONTRL.nintout <> 0 THEN
    termbut := VAL(CHAR, GEMShare.our_cb^.pubs.vINTOUT[0]);
    keyPress := TRUE;
  ELSE
    termbut := 0C;
    keyPress := FALSE;
  END;
  IF GEMShare.our_cb^.V_CONTRL.nptsout <> 0 THEN
    loc.x := GEMShare.our_cb^.pubs.PTSOUT[0];
    loc.y := GEMShare.our_cb^.pubs.PTSOUT[1];
    koorChange := TRUE;
  ELSE
    loc := start;
    koorChange := FALSE;
  END;
END TestLoc;


PROCEDURE RequestValue(handle:DeviceHandle; start:CARDINAL;
                       VAR termBut:CHAR;VAR value:CARDINAL);
BEGIN
  SetInputMode(handle, GEMShare.value, request);
  GEMShare.our_cb^.pubs.vINTIN[0] := start;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_VALUATOR, 0, 0, 1));
  termBut := VAL(CHAR, GEMShare.our_cb^.pubs.vINTOUT[1]);
  value := GEMShare.our_cb^.pubs.vINTOUT[0];
END RequestValue;


PROCEDURE TestValue (handle:DeviceHandle; start:CARDINAL;
                     VAR termbut:CHAR; VAR status:TValState;
                     VAR value:CARDINAL);
BEGIN
  SetInputMode(handle, GEMShare.value, sample);
  GEMShare.our_cb^.pubs.vINTIN[0] := start;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_VALUATOR, 0, 0, 1));
  status := VAL(TValState, GEMShare.our_cb^.V_CONTRL.nintout);
  IF GEMShare.our_cb^.V_CONTRL.nintout = 0 THEN
    termbut := 0C;
    value := start;
  ELSE
    value := GEMShare.our_cb^.pubs.vINTOUT[0];
    IF GEMShare.our_cb^.V_CONTRL.nintout = 1 THEN
      termbut := 0C;
    ELSE
      termbut := VAL(CHAR, GEMShare.our_cb^.pubs.vINTOUT[1]);
    END;
  END;
END TestValue;


PROCEDURE RequestChoice(handle:DeviceHandle;start:CARDINAL;VAR choice:CARDINAL);
BEGIN
  SetInputMode(handle, GEMShare.choice, GEMShare.request);
  GEMShare.our_cb^.pubs.vINTIN[0] := start;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_CHOICE, 0, 0, 1));
  choice := GEMShare.our_cb^.pubs.vINTOUT[0];
END RequestChoice;


PROCEDURE TestChoice(handle:DeviceHandle;
                     VAR keyPress:BOOLEAN;VAR choice:CARDINAL);
BEGIN
  SetInputMode(handle, GEMShare.choice, GEMShare.sample);
  GEMShare.our_cb^.pubs.vINTIN[0] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INPUT_CHOICE, 0, 0, 1));
  choice := GEMShare.our_cb^.V_CONTRL.nintout;
  IF GEMShare.our_cb^.V_CONTRL.nintout = 0 THEN
    keyPress := FALSE;
  ELSE
    keyPress := TRUE;
  END;
END TestChoice;


PROCEDURE RequestString(handle:DeviceHandle;
                        VAR str:ARRAY OF CHAR; echo:BOOLEAN;echoLoc:Point);
BEGIN
  (* NYI *)
  handle := NIL;
  str[0] := 0C;
  echo := FALSE;
  echoLoc.x := 0;
END RequestString;


PROCEDURE TestString(handle:DeviceHandle;
                     VAR str:ARRAY OF CHAR; echo:BOOLEAN;echoLoc:Point;
                     VAR success:BOOLEAN);
BEGIN
  (* NYI *)
  handle := NIL;
  str[0] := 0C;
  echo := FALSE;
  echoLoc.x := 0;
  success := FALSE;
END TestString;


PROCEDURE SetMouseForm(handle:DeviceHandle; newForm:PtrMouseFormDef);
VAR oldint: PtrIntinArray;
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  oldint := cb^.vdipb.intin;
  cb^.vdipb.intin := VAL(PtrIntinArray, newForm);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_MOUSE_FORM, 0, 0, 37));
  cb^.vdipb.intin := oldint;
END SetMouseForm;


PROCEDURE ShowCursor(handle:DeviceHandle;force:BOOLEAN);
BEGIN
  GEMShare.showCursor(handle, force);
END ShowCursor;


PROCEDURE HideCursor(handle:DeviceHandle);
BEGIN
  GEMShare.hideCursor(handle);
END HideCursor;


PROCEDURE GetMouseState(    handle  : DeviceHandle;
                        VAR position: Point;
                        VAR buts    : MButtonSet);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.MOUSE_BUTTONS, 0, 0, 0));
  position.x := GEMShare.our_cb^.pubs.PTSOUT[0];
  position.y := GEMShare.our_cb^.pubs.PTSOUT[1];
  buts := VAL(MButtonSet, GEMShare.our_cb^.pubs.vINTOUT[0]);
END GetMouseState;


PROCEDURE KeyboardState (handle: DeviceHandle): SpecialKeySet;
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.KEY_STATE, 0, 0, 0));
  RETURN VAL(SpecialKeySet, GEMShare.our_cb^.pubs.vINTOUT[0]);
END KeyboardState;


VAR deltaT: CARDINAL;

(*  timerIRHandler -- Wird vom GEM bei jedem Timerinterrupt angesprungen, *
 *                    falls sich eine Userroutine ueber 'SetTimerVector'   *
 *                    angemeldet hat. Bei jedem Aufruf springt 'timerIR-  *
 *                    Handler' die Elemente der TimerVecList der Reihen-  *
 *                    folge entsprechend, beim Listenanfang beginnend an, *
 *                    bis eine Procedur FALSE als Rueckgabe liefert ,oder  *
 *                    das Listenende erreicht ist.                        *)

PROCEDURE timerIRHandler;
VAR vec: GEMShare.ptrVectorList;
VAR p: TimerVecProc;
BEGIN
  vec := GEMShare.timerVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.timerVec;
    IF NOT p() THEN RETURN END;
    vec := vec^.next;
  END;
  GEMShare.orgTimerVec();
END timerIRHandler;


(*  butChgIRHandler -- siehe 'timerIRHandler' *)
PROCEDURE butChgIRHandler();
VAR vec: GEMShare.ptrVectorList;
VAR p: ButChgVecProc;
VAR butsTemp: MButtonSet;
    r: INTEGER16;
BEGIN
  (* current mouse button state is passed in D0 *)
  ASM VOLATILE("move.w %%d0,%0" : "=m"(butsTemp) : : "cc", "memory");
  vec := GEMShare.butChgVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.buttonChgVec;
    IF NOT p(butsTemp) THEN
      ASM VOLATILE("move.w %0,%%d0" : : "g"(butsTemp) : "d0", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; jsr (%1)" : : "g"(butsTemp), "a"(GEMShare.orgButChgVec) : "d0", "cc", "memory");
END butChgIRHandler;


(*  msMoveIRHandler -- siehe 'timerIRHandler' *)
PROCEDURE msMoveIRHandler;
VAR vec: GEMShare.ptrVectorList;
VAR p: MsMoveVecProc;
VAR loc: Point;
BEGIN
  (* current mouse position is passed in D0/D1 *)
  ASM VOLATILE("move.w %%d0,%0; move.w %%d1,%1" : "=m"(loc.x), "=m"(loc.y) : : "cc", "memory");
  vec := GEMShare.msMoveVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.moveVec;
    IF NOT p(loc) THEN
      ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1" : : "g"(loc.x), "g"(loc.y) : "d0", "d1", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1; jsr (%2)" : : "g"(loc.x), "g"(loc.y), "a"(GEMShare.orgMsMoveVec) : "d0", "d1", "cc", "memory");
END msMoveIRHandler;


(*  CurChgIRHandler -- siehe 'timerIRHandler' *)
PROCEDURE curChgIRHandler;
VAR vec: GEMShare.ptrVectorList;
VAR p: CurChgVecProc;
VAR loc: Point;
BEGIN
  (* current mouse position is passed in D0/D1 *)
  ASM VOLATILE("move.w %%d0,%0; move.w %%d1,%1" : "=m"(loc.x), "=m"(loc.y) : : "cc", "memory");
  vec := GEMShare.curChgVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.curVec;
    IF NOT p(loc) THEN
      ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1" : : "g"(loc.x), "g"(loc.y) : "d0", "d1", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1; jsr (%2)" : : "g"(loc.x), "g"(loc.y), "a"(GEMShare.orgCurChgVec) : "d0", "d1", "cc", "memory");
END curChgIRHandler;


PROCEDURE InstallTimerProc(VAR hdl:vecListElem;newProc:TimerVecProc;
                           wsp:MemArea;VAR deltaTime:CARDINAL);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.timerChgd THEN
    cb^.SUPERVISION.timerChgd := TRUE;
    cb^.SUPERVISION.timerPrev := GEMShare.timerVecList;
  END;
  IF GEMShare.timerVecList = NIL THEN
    GEMShare.orgTimerVec := GEMShare.exchangeTimerVec(timerIRHandler, deltaT);
  END;
  deltaTime := deltaT;
  hdl.wsp := wsp;
  hdl.timerVec := newProc;
  hdl.next := GEMShare.timerVecList;
  GEMShare.timerVecList := ADR(hdl);
END InstallTimerProc;


PROCEDURE RemoveTimerProc(VAR hdl:vecListElem);
BEGIN
  GEMShare.removeTimerVector(hdl);
END RemoveTimerProc;


PROCEDURE InstallButChgProc(VAR hdl:vecListElem;newProc:ButChgVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.butChgChgd THEN
    cb^.SUPERVISION.butChgChgd := TRUE;
    cb^.SUPERVISION.butChgPrev := GEMShare.butChgVecList;
  END;
  IF GEMShare.butChgVecList = NIL THEN
    GEMShare.orgButChgVec := GEMShare.exchangeMouseVec(GEMOps.EX_BUT_CHANGE, butChgIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.buttonChgVec := newProc;
  hdl.next := GEMShare.butChgVecList;
  GEMShare.butChgVecList := ADR(hdl);
END InstallButChgProc;


PROCEDURE RemoveButChgProc(VAR hdl:vecListElem);
BEGIN
  GEMShare.removeButChgVector(hdl);
END RemoveButChgProc;


PROCEDURE InstallMsMoveProc(VAR hdl:vecListElem;newProc:MsMoveVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.msMoveChgd THEN
    cb^.SUPERVISION.msMoveChgd := TRUE;
    cb^.SUPERVISION.msMovePrev := GEMShare.msMoveVecList;
  END;
  IF GEMShare.msMoveVecList = NIL THEN
    GEMShare.orgMsMoveVec := GEMShare.exchangeMouseVec(GEMOps.EX_MOUSE_MOVE, msMoveIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.moveVec := newProc;
  hdl.next := GEMShare.msMoveVecList;
  GEMShare.msMoveVecList := ADR(hdl);
END InstallMsMoveProc;


PROCEDURE RemoveMsMoveProc(VAR hdl:vecListElem);
BEGIN
  GEMShare.removeMsMoveVector(hdl);
END RemoveMsMoveProc;


PROCEDURE InstallCurChgProc(VAR hdl:vecListElem;newProc:CurChgVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.curChgChgd THEN
    cb^.SUPERVISION.curChgChgd := TRUE;
    cb^.SUPERVISION.curChgPrev := GEMShare.curChgVecList;
  END;
  IF GEMShare.curChgVecList = NIL THEN
    GEMShare.orgCurChgVec := GEMShare.exchangeMouseVec(GEMOps.EX_MOUSE_CHANGE, curChgIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.moveVec := newProc;
  hdl.next := GEMShare.curChgVecList;
  GEMShare.curChgVecList := ADR(hdl);
END InstallCurChgProc;


PROCEDURE RemoveCurChgProc(VAR hdl:vecListElem);
BEGIN
  GEMShare.removeCurChgVector(hdl);
END RemoveCurChgProc;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIInputs.
