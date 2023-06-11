IMPLEMENTATION MODULE VDIInputx;

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

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GrafBase IMPORT Point;
FROM GEMGlobals IMPORT MButtonSet;
FROM GEMConf IMPORT VDIChecks;
FROM GEMBase IMPORT PtrIntinArray, PtrPtsinArray;
FROM GEMEnv IMPORT removeVDIVecs;
FROM GEMConf IMPORT doSupervision;

#include "VdiCtrl.i"

VAR deltaT: CARDINAL;

        (* Vector Variablen *)
VAR timerVecList: GEMShare.ptrVectorList;
VAR butChgVecList: GEMShare.ptrVectorList;
VAR msMoveVecList: GEMShare.ptrVectorList;
VAR curChgVecList: GEMShare.ptrVectorList;
VAR orgTimerVec: PROC;
VAR orgButChgVec: PROC;
VAR orgMsMoveVec: PROC;
VAR orgCurChgVec: PROC;


(*  exchangeTimeVec -- geg.: 'newproc' der neue Timerinterrupt vector *
 *                     ges.: In 'time' steht die Zeit die zwischen 2 *
 *                           Timerinter. vergeht(in ms), der neue    *
 *                           Vector ist beim VDI angemeldet und der  *
 *                           alte Vector ist Rueckgabewert.           *)
PROCEDURE exchangeTimerVec(newproc: PROC; VAR time:CARDINAL): [ PROC ];
BEGIN
  GEMShare.our_cb^.V_CONTRL.ptr1.proc := newproc;
  GEMShare.vdi_if(GEMShare.our_cb^.CURDEVICE, VDI_CTRL_CODE(GEMOps.EX_TIMER_INTER, 0, 0, 0));
  time := GEMShare.our_cb^.pubs.vINTOUT[0];
  RETURN GEMShare.our_cb^.V_CONTRL.ptr2.proc;
END exchangeTimerVec;


(*  exchangeMouseVec -- geg.: 'opcode' der VDI-Opcode fuer einen Mouse- *
 *                            vector exchange und 'newproc' die neue Proc. *
 *                      ges.: neue Proc. bei VDI angemeldet und alter  *
 *                            Vector als Rueckgabewert                  *)
PROCEDURE exchangeMouseVec(opcode:CARDINAL; newproc:PROC): [ PROC ];
BEGIN
  GEMShare.our_cb^.V_CONTRL.ptr1.proc := newproc;
  GEMShare.vdi_if(GEMShare.our_cb^.CURDEVICE, VDI_CTRL_CODE(opcode, 0, 0, 0));
  RETURN GEMShare.our_cb^.V_CONTRL.ptr2.proc;
END exchangeMouseVec;



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
  vec := timerVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.timerVec;
    IF NOT p() THEN RETURN END;
    vec := vec^.next;
  END;
  orgTimerVec();
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
  vec := butChgVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.buttonChgVec;
    IF NOT p(butsTemp) THEN
      ASM VOLATILE("move.w %0,%%d0" : : "g"(butsTemp) : "d0", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; jsr (%1)" : : "g"(butsTemp), "a"(orgButChgVec) : "d0", "cc", "memory");
END butChgIRHandler;


(*  msMoveIRHandler -- siehe 'timerIRHandler' *)
PROCEDURE msMoveIRHandler;
VAR vec: GEMShare.ptrVectorList;
VAR p: MsMoveVecProc;
VAR loc: Point;
BEGIN
  (* current mouse position is passed in D0/D1 *)
  ASM VOLATILE("move.w %%d0,%0; move.w %%d1,%1" : "=m"(loc.x), "=m"(loc.y) : : "cc", "memory");
  vec := msMoveVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.moveVec;
    IF NOT p(loc) THEN
      ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1" : : "g"(loc.x), "g"(loc.y) : "d0", "d1", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1; jsr (%2)" : : "g"(loc.x), "g"(loc.y), "a"(orgMsMoveVec) : "d0", "d1", "cc", "memory");
END msMoveIRHandler;


(*  CurChgIRHandler -- siehe 'timerIRHandler' *)
PROCEDURE curChgIRHandler;
VAR vec: GEMShare.ptrVectorList;
VAR p: CurChgVecProc;
VAR loc: Point;
BEGIN
  (* current mouse position is passed in D0/D1 *)
  ASM VOLATILE("move.w %%d0,%0; move.w %%d1,%1" : "=m"(loc.x), "=m"(loc.y) : : "cc", "memory");
  vec := curChgVecList;
  LOOP
    IF vec = NIL THEN EXIT END;
    p := vec^.curVec;
    IF NOT p(loc) THEN
      ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1" : : "g"(loc.x), "g"(loc.y) : "d0", "d1", "cc", "memory");
      RETURN;
    END;
    vec := vec^.next;
  END;
  ASM VOLATILE("move.w %0,%%d0; move.w %1,%%d1; jsr (%2)" : : "g"(loc.x), "g"(loc.y), "a"(orgCurChgVec) : "d0", "d1", "cc", "memory");
END curChgIRHandler;


PROCEDURE InstallTimerProc(VAR hdl:vecListElem;newProc:TimerVecProc;
                           wsp:MemArea;VAR deltaTime:CARDINAL);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.timerChgd THEN
    cb^.SUPERVISION.timerChgd := TRUE;
    cb^.SUPERVISION.timerPrev := timerVecList;
  END;
  IF timerVecList = NIL THEN
    orgTimerVec := exchangeTimerVec(timerIRHandler, deltaT);
  END;
  deltaTime := deltaT;
  hdl.wsp := wsp;
  hdl.timerVec := newProc;
  hdl.next := timerVecList;
  timerVecList := ADR(hdl);
  removeVDIVecs := cleanupVecs;
END InstallTimerProc;


PROCEDURE RemoveTimerProc(VAR hdl:vecListElem);
VAR list: POINTER TO GEMShare.ptrVectorList;
VAR dummy: CARDINAL;
VAR phdl: GEMShare.ptrVectorList;
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
  IF GEMShare.our_cb^.SUPERVISION.timerPrev = timerVecList THEN
    (* Set flag to 'no timervec' *)
    GEMShare.our_cb^.SUPERVISION.timerChgd := FALSE;
  END;
END RemoveTimerProc;


PROCEDURE InstallButChgProc(VAR hdl:vecListElem;newProc:ButChgVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.butChgChgd THEN
    cb^.SUPERVISION.butChgChgd := TRUE;
    cb^.SUPERVISION.butChgPrev := butChgVecList;
  END;
  IF butChgVecList = NIL THEN
    orgButChgVec := exchangeMouseVec(GEMOps.EX_BUT_CHANGE, butChgIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.buttonChgVec := newProc;
  hdl.next := butChgVecList;
  butChgVecList := ADR(hdl);
  removeVDIVecs := cleanupVecs;
END InstallButChgProc;


PROCEDURE RemoveButChgProc(VAR hdl:vecListElem);
VAR list: POINTER TO GEMShare.ptrVectorList;
VAR phdl: GEMShare.ptrVectorList;
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
  IF GEMShare.our_cb^.SUPERVISION.butChgPrev = butChgVecList THEN
    (* Set flag to 'no butChgvec' *)
    GEMShare.our_cb^.SUPERVISION.butChgChgd := FALSE;
  END;
END RemoveButChgProc;


PROCEDURE RemoveMsMoveProc(VAR hdl:vecListElem);
VAR list: POINTER TO GEMShare.ptrVectorList;
VAR phdl: GEMShare.ptrVectorList;
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
  IF GEMShare.our_cb^.SUPERVISION.butChgPrev = msMoveVecList THEN
    (* Set flag to 'no butChgvec' *)
    GEMShare.our_cb^.SUPERVISION.msMoveChgd := FALSE;
  END;
END RemoveMsMoveProc;


PROCEDURE RemoveCurChgProc(VAR hdl:vecListElem);
VAR list: POINTER TO GEMShare.ptrVectorList;
VAR phdl: GEMShare.ptrVectorList;
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
  IF GEMShare.our_cb^.SUPERVISION.curChgPrev = curChgVecList THEN
    (* Set flag to 'no curChgvec' *)
    GEMShare.our_cb^.SUPERVISION.curChgChgd := FALSE;
  END;
END RemoveCurChgProc;


PROCEDURE cleanupVecs(handle: GEMShare.GemHandle);
BEGIN
  IF doSupervision THEN
    (* Melde alle GEM-IR-Vektoren ab *)
    WHILE handle^.SUPERVISION.timerChgd DO
      RemoveTimerProc(timerVecList^)
    END;
    WHILE handle^.SUPERVISION.butChgChgd DO
      RemoveButChgProc(butChgVecList^)
    END;
    WHILE handle^.SUPERVISION.msMoveChgd DO
      RemoveMsMoveProc(msMoveVecList^)
    END;
    WHILE handle^.SUPERVISION.curChgChgd DO
      RemoveCurChgProc(curChgVecList^)
    END;
  END;
END cleanupVecs;


PROCEDURE InstallMsMoveProc(VAR hdl:vecListElem;newProc:MsMoveVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.msMoveChgd THEN
    cb^.SUPERVISION.msMoveChgd := TRUE;
    cb^.SUPERVISION.msMovePrev := msMoveVecList;
  END;
  IF msMoveVecList = NIL THEN
    orgMsMoveVec := exchangeMouseVec(GEMOps.EX_MOUSE_MOVE, msMoveIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.moveVec := newProc;
  hdl.next := msMoveVecList;
  msMoveVecList := ADR(hdl);
  removeVDIVecs := cleanupVecs;
END InstallMsMoveProc;


PROCEDURE InstallCurChgProc(VAR hdl:vecListElem;newProc:CurChgVecProc;
                            wsp:MemArea);
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  IF NOT cb^.SUPERVISION.curChgChgd THEN
    cb^.SUPERVISION.curChgChgd := TRUE;
    cb^.SUPERVISION.curChgPrev := curChgVecList;
  END;
  IF curChgVecList = NIL THEN
    orgCurChgVec := exchangeMouseVec(GEMOps.EX_MOUSE_CHANGE, curChgIRHandler);
  END;
  hdl.wsp := wsp;
  hdl.moveVec := newProc;
  hdl.next := curChgVecList;
  curChgVecList := ADR(hdl);
  removeVDIVecs := cleanupVecs;
END InstallCurChgProc;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;

  (* Vektorlisten initialisieren *)
  timerVecList := NIL;
  butChgVecList := NIL;
  msMoveVecList := NIL;
  curChgVecList := NIL;

END VDIInputx.
