IMPLEMENTATION MODULE AESWindows;


(*  Megamax Modula-2 GEM-Library :  Die AES Fensterfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0029
 *)

(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  20.11.87    | Def. + Impl. von 'ResetWindows'
 *  15.02.90    | Anpassung an Compilerversion 4.0
 *  02.04.90    | Anpassung an public arrays
 *  05.10.90    | Keine verdrehten SETs mehr
 *  09.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL16, CARDINAL32, SHIFT, ADR, ADDRESS;

FROM    GrafBase        IMPORT Point, Rectangle;

FROM    GEMGlobals      IMPORT PtrMaxStr, PtrObjTree;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;



PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE CreateWindow(elems:WElementSet;max:Rectangle; VAR handle:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := VAL(CARDINAL, elems);
  GEMShare.our_cb^.pubs.aINTIN[1] := max.x;
  GEMShare.our_cb^.pubs.aINTIN[2] := max.y;
  GEMShare.our_cb^.pubs.aINTIN[3] := max.w;
  GEMShare.our_cb^.pubs.aINTIN[4] := max.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_CREATE, 5, 1, 0));
  handle := VAL(CARDINAL16, GEMShare.our_cb^.pubs.aINTOUT[0]);
  IF (handle <> NoWindow) AND (handle <= MAX(GEMShare.windowSet)) THEN
    INCL(GEMShare.our_cb^.SUPERVISION.createWinds, handle);
  END;
END CreateWindow;


PROCEDURE OpenWindow(handle:CARDINAL;frame:Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  GEMShare.our_cb^.pubs.aINTIN[1] := frame.x;
  GEMShare.our_cb^.pubs.aINTIN[2] := frame.y;
  GEMShare.our_cb^.pubs.aINTIN[3] := frame.w;
  GEMShare.our_cb^.pubs.aINTIN[4] := frame.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_OPEN, 5, 1, 0));
  GEMShare.testINTOUT0();
  IF (GEMShare.our_cb^.pubs.aINTOUT[0] <> 0) AND (handle <= MAX(GEMShare.windowSet)) THEN
    INCL(GEMShare.our_cb^.SUPERVISION.openWinds, handle);
  END
END OpenWindow;


PROCEDURE CloseWindow(handle:CARDINAL);
BEGIN
  GEMShare.closeWindow(handle);
END CloseWindow;


PROCEDURE DeleteWindow(handle:CARDINAL);
BEGIN
  GEMShare.deleteWindow(handle);
END DeleteWindow;


(* Aufteilung von 'wind_get' *)

PROCEDURE WindowSize(handle:CARDINAL;typ:WSizeMode):Rectangle;
VAR r: Rectangle;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  CASE typ OF
    workSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_WORKXYWH; |
    borderSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_CURRXYWH; |
    previousSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_PREVXYWH; |
    fullSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_FULLXYWH; |
    ELSE GEMShare.gemErrorOccured(); RETURN;
  END;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_GET, 2, 5, 0));
  GEMShare.testINTOUT0();
  r.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  r.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  r.w := GEMShare.our_cb^.pubs.aINTOUT[3];
  r.h := GEMShare.our_cb^.pubs.aINTOUT[4];
  RETURN r;
END WindowSize;


PROCEDURE WindowSliderValue(handle:CARDINAL;typ:WSliderMode):INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  CASE typ OF
    horPosition: GEMShare.our_cb^.pubs.aINTIN[1] := WF_HSLIDE; |
    vertPosition: GEMShare.our_cb^.pubs.aINTIN[1] := WF_VSLIDE; |
    horSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_HSLSIZE; |
    vertSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_VSLSIZE; |
    ELSE GEMShare.gemErrorOccured(); RETURN 0;
  END;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_GET, 2, 5, 0));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[1];
END WindowSliderValue;


PROCEDURE TopWindow():CARDINAL;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := DeskHandle;
  GEMShare.our_cb^.pubs.aINTIN[1] := WF_TOP;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_GET, 2, 5, 0));
  GEMShare.testINTOUT0();
  RETURN GEMShare.our_cb^.pubs.aINTOUT[1];
END TopWindow;


PROCEDURE WindowRectList(handle:CARDINAL;typ:RListMode):Rectangle;
VAR r: Rectangle;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  CASE typ OF
    firstElem: GEMShare.our_cb^.pubs.aINTIN[1] := WF_FIRSTXYWH; |
    nextElem: GEMShare.our_cb^.pubs.aINTIN[1] := WF_NEXTXYWH; |
    ELSE GEMShare.gemErrorOccured(); RETURN r;
  END;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_GET, 2, 5, 0));
  GEMShare.testINTOUT0();
  r.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  r.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  r.w := GEMShare.our_cb^.pubs.aINTOUT[3];
  r.h := GEMShare.our_cb^.pubs.aINTOUT[4];
  RETURN r;
END WindowRectList;


PROCEDURE ScreenBuffer(handle:CARDINAL):MOSGlobals.MemArea;
VAR mem: MOSGlobals.MemArea;
    p: POINTER TO ADDRESS;
    pl: POINTER TO CARDINAL32;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  GEMShare.our_cb^.pubs.aINTIN[1] := WF_SCREEN;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_GET, 2, 5, 0));
  GEMShare.testINTOUT0();
  p := ADR(GEMShare.our_cb^.pubs.aINTOUT[1]);
  mem.bottom := p^;
  pl := ADR(GEMShare.our_cb^.pubs.aINTOUT[3]);
  mem.length := pl^;
  RETURN mem;
END ScreenBuffer;


(* Aufteilung von 'wind_set' *)
PROCEDURE SetWindowString(handle:CARDINAL;typ:WStringMode;str:PtrMaxStr);
VAR p: POINTER TO PtrMaxStr;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  CASE typ OF
    nameStr: GEMShare.our_cb^.pubs.aINTIN[1] := WF_NAME; |
    infoStr: GEMShare.our_cb^.pubs.aINTIN[1] := WF_INFO; |
    ELSE GEMShare.gemErrorOccured(); RETURN;
  END;
  p := ADR(GEMShare.our_cb^.pubs.aINTIN[2]);
  p^ := str;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_SET, 6, 1, 0));
  GEMShare.testINTOUT0();
END SetWindowString;


PROCEDURE SetWindowSize(handle:CARDINAL;frame:Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  GEMShare.our_cb^.pubs.aINTIN[1] := WF_CURRXYWH;
  GEMShare.our_cb^.pubs.aINTIN[1] := frame.x;
  GEMShare.our_cb^.pubs.aINTIN[2] := frame.y;
  GEMShare.our_cb^.pubs.aINTIN[3] := frame.w;
  GEMShare.our_cb^.pubs.aINTIN[4] := frame.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_SET, 6, 1, 0));
  GEMShare.testINTOUT0();
END SetWindowSize;


PROCEDURE SetWindowSlider(handle:CARDINAL;typ:WSliderMode;value:INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  CASE typ OF
    horPosition: GEMShare.our_cb^.pubs.aINTIN[1] := WF_HSLIDE; |
    vertPosition: GEMShare.our_cb^.pubs.aINTIN[1] := WF_VSLIDE; |
    horSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_HSLSIZE; |
    vertSize: GEMShare.our_cb^.pubs.aINTIN[1] := WF_VSLSIZE; |
    ELSE GEMShare.gemErrorOccured(); RETURN;
  END;
  GEMShare.our_cb^.pubs.aINTIN[2] := value;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_SET, 6, 1, 0));
  GEMShare.testINTOUT0();
END SetWindowSlider;


PROCEDURE SetTopWindow(handle:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := handle;
  GEMShare.our_cb^.pubs.aINTIN[1] := WF_TOP;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_SET, 6, 1, 0));
  GEMShare.testINTOUT0();
END SetTopWindow;


PROCEDURE SetNewDesk(tree:PtrObjTree;first:CARDINAL);
VAR p: POINTER TO PtrObjTree;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := DeskHandle;
  GEMShare.our_cb^.pubs.aINTIN[1] := WF_NEWDESK;
  p := ADR(GEMShare.our_cb^.pubs.aINTIN[2]);
  p^ := tree;
  GEMShare.our_cb^.pubs.aINTIN[4] := first;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_SET, 6, 1, 0));
  GEMShare.testINTOUT0();
END SetNewDesk;


PROCEDURE FindWindow(loc:Point) :CARDINAL;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := loc.x;
  GEMShare.our_cb^.pubs.aINTIN[1] := loc.y;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_FIND, 2, 1, 0));
  RETURN CARDINAL16(GEMShare.our_cb^.pubs.aINTOUT[0]);
END FindWindow;


PROCEDURE MouseControl(user:BOOLEAN);
VAR typ: GEMShare.UpdateWindowType;
BEGIN
  IF user THEN typ := GEMShare.BegMctrl ELSE typ := GEMShare.EndMctrl END;
  GEMShare.updateWindow(typ);             (* Rufe eigentliche Routine auf *)
END MouseControl;


PROCEDURE UpdateWindow(update:BOOLEAN);
VAR typ: GEMShare.UpdateWindowType;
BEGIN
  IF update THEN typ := GEMShare.BegUpdate ELSE typ := GEMShare.EndUpdate END;
  GEMShare.updateWindow(typ);             (* Rufe eigentliche Routine auf *)
END UpdateWindow;


PROCEDURE CalcWindow(typ:WCalcMode;elems:WElementSet;in:Rectangle):Rectangle;
VAR r: Rectangle;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(typ);
  GEMShare.our_cb^.pubs.aINTIN[1] := VAL(CARDINAL, elems);
  GEMShare.our_cb^.pubs.aINTIN[2] := in.x;
  GEMShare.our_cb^.pubs.aINTIN[3] := in.y;
  GEMShare.our_cb^.pubs.aINTIN[4] := in.w;
  GEMShare.our_cb^.pubs.aINTIN[5] := in.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_CALC, 6, 5, 0));
  GEMShare.testINTOUT0();
  r.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  r.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  r.w := GEMShare.our_cb^.pubs.aINTOUT[3];
  r.h := GEMShare.our_cb^.pubs.aINTOUT[4];
  RETURN r;
END CalcWindow;


PROCEDURE ResetWindows();
BEGIN
  GEMShare.our_cb^.SUPERVISION.noMouseCtrl := 0;
  GEMShare.our_cb^.SUPERVISION.noUpWind := 0;
  GEMShare.our_cb^.SUPERVISION.createWinds := GEMShare.windowSet{};
  GEMShare.our_cb^.SUPERVISION.openWinds := GEMShare.windowSet{};
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.WIND_NEW, 0, 0, 0));
END ResetWindows;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESWindows.
