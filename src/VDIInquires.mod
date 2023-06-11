IMPLEMENTATION MODULE VDIInquires;
#define REF


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Nachfragefunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  04.11.87
 *
 *  Version   2.2     V#0031
 *)

(*  18.08.89 MCH V0.11  | 'GetLineStyle' um die Linienenden erweitert
 *  ???????? TT  V2.1   | REF-Parm.
 *  02.04.90 MCH V2.2   | Anpassung an public arrays
 *  25.02.91 TT           "error"-Setzung ueber occured-Funktion
 *  17.04.91 TT         | 'GetLineStyle' korrigiert: 'handle' wurde falsch
 *                        ermittelt - fuehrte zu Laufzeitfehler
 *  28.04.91 TT         | 'GetLineStyle' korrigiert (Parms stimmten nicht)
 *                        und getestet.
 *  11.06.23 THO        | Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL16, CARDINAL32, SHIFT, ADR, INTEGER16;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GEMConf IMPORT VDIChecks;
FROM ErrBase IMPORT DoTRAP6, TRAP6_CONT;
FROM GEMBase IMPORT PtrPtsoutArray, PtrIntoutArray;

#include "VdiCtrl.i"

CONST   maxParm         = 56;


PROCEDURE ExtendedInquire (handle: DeviceHandle; owflag: BOOLEAN; VAR param: ARRAY OF INTEGER16);
VAR     oldpts: PtrPtsoutArray;
        oldint: PtrIntoutArray;
VAR cb: GEMShare.GemHandle;
BEGIN
  IF HIGH(param)<maxParm THEN        (* Nicht genug Platz fuer die Parameter *)
    DoTRAP6(MOSGlobals.GeneralErr - TRAP6_CONT);
    RETURN;
  END;
  cb := GEMShare.our_cb;
  oldpts := cb^.vdipb.ptsout;
  oldint := cb^.vdipb.intout;
  cb^.vdipb.intout := ADR (param[0]);
  cb^.vdipb.ptsout := ADR (param[45]);
  cb^.pubs.vINTIN[0] := ORD(owflag);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.EXTENDED_INQUIRE, 0, 0, 1));
  cb^.vdipb.intout := oldint;
  cb^.vdipb.ptsout := oldpts;
END ExtendedInquire;


PROCEDURE GetColorDef(handle:DeviceHandle;color:CARDINAL;set:BOOLEAN;
                      VAR r,g,b:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := color;
  GEMShare.our_cb^.pubs.vINTIN[1] := ORD(set);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_COLOR, 0, 0, 2));
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.vINTOUT[0] < 0 THEN
      GEMShare.gemErrorOccured();
    END;
  END;
  r := GEMShare.our_cb^.pubs.vINTOUT[1];
  g := GEMShare.our_cb^.pubs.vINTOUT[2];
  b := GEMShare.our_cb^.pubs.vINTOUT[3];
END GetColorDef;


PROCEDURE InquireColour(handle: DeviceHandle; color: INTEGER; set: INTEGER; VAR rgb: RGBArrayType);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := color;
  GEMShare.our_cb^.pubs.vINTIN[1] := ORD(set);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_COLOR, 0, 0, 2));
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.vINTOUT[0] < 0 THEN
      GEMShare.gemErrorOccured();
    END;
  END;
  rgb[0] := GEMShare.our_cb^.pubs.vINTOUT[1];
  rgb[1] := GEMShare.our_cb^.pubs.vINTOUT[2];
  rgb[2] := GEMShare.our_cb^.pubs.vINTOUT[3];
END InquireColour;


PROCEDURE GetLineStyle(    handle: DeviceHandle;
                       VAR typ   : LineType;
                       VAR color : CARDINAL;
                       VAR mode  : WritingMode;
                       VAR begin,
                           end   : LineEnding;
                       VAR width : CARDINAL    );

BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_LINE, 0, 0, 0));
  width := GEMShare.our_cb^.pubs.PTSOUT[0];
  typ := VAL(LineType, GEMShare.our_cb^.pubs.vINTOUT[0]);
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  mode := VAL(WritingMode, GEMShare.our_cb^.pubs.vINTOUT[2]);
  IF GEMShare.our_cb^.V_CONTRL.nintout > 3 THEN
    begin := VAL(LineEnding, GEMShare.our_cb^.pubs.vINTOUT[3]);
    end := VAL(LineEnding, GEMShare.our_cb^.pubs.vINTOUT[4]);
  ELSE
    begin := edgedLn;
    end := edgedLn;
  END;
END GetLineStyle;


PROCEDURE InquireLineAttributes(handle: DeviceHandle; VAR attr: LineAttrArrayType);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_LINE, 0, 0, 0));
  attr[0] := GEMShare.our_cb^.pubs.vINTOUT[0];
  attr[1] := GEMShare.our_cb^.pubs.vINTOUT[1];
  attr[2] := GEMShare.our_cb^.pubs.vINTOUT[2];
  attr[3] := GEMShare.our_cb^.pubs.PTSOUT[0];
  IF GEMShare.our_cb^.V_CONTRL.nintout > 3 THEN
    attr[4] := GEMShare.our_cb^.pubs.vINTOUT[3];
    attr[5] := GEMShare.our_cb^.pubs.vINTOUT[4];
  ELSE
    attr[4] := ORD(edgedLn);
    attr[5] := ORD(edgedLn);
  END;
END InquireLineAttributes;


PROCEDURE GetMarkerStyle(handle:DeviceHandle;VAR typ:MarkerType;
                         VAR color:CARDINAL;VAR mode:WritingMode;
                         VAR height:CARDINAL);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_MARKER, 0, 0, 0));
  typ := VAL(MarkerType, GEMShare.our_cb^.pubs.vINTOUT[0] + 1); (* workaround GEM-Bug *)
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  mode := VAL(WritingMode, GEMShare.our_cb^.pubs.vINTOUT[2]);
  height := GEMShare.our_cb^.pubs.PTSOUT[1];
END GetMarkerStyle;


PROCEDURE InquireMarkerAttributes(handle:DeviceHandle; VAR attr:MarkerAttrArrayType);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_MARKER, 0, 0, 0));
  attr[0] := GEMShare.our_cb^.pubs.vINTOUT[0] + 1;
  attr[1] := GEMShare.our_cb^.pubs.vINTOUT[1];
  attr[2] := GEMShare.our_cb^.pubs.vINTOUT[2];
  attr[3] := GEMShare.our_cb^.pubs.PTSOUT[1];
END InquireMarkerAttributes;


PROCEDURE GetFillStyle(handle:DeviceHandle;VAR typ:FillType;VAR color:CARDINAL;
                       VAR index:CARDINAL;VAR mode:WritingMode;
                       VAR peri:BOOLEAN);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_FILL, 0, 0, 0));
  typ := VAL(FillType, GEMShare.our_cb^.pubs.vINTOUT[0]);
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  index := GEMShare.our_cb^.pubs.vINTOUT[2];
  mode := VAL(WritingMode, GEMShare.our_cb^.pubs.vINTOUT[3]);
  peri := VAL(BOOLEAN, GEMShare.our_cb^.pubs.vINTOUT[4]);
END GetFillStyle;


PROCEDURE InquireFillAttributes(handle:DeviceHandle; VAR attr: LineAttrArrayType);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_FILL, 0, 0, 0));
  attr[0] := GEMShare.our_cb^.pubs.vINTOUT[0];
  attr[1] := GEMShare.our_cb^.pubs.vINTOUT[1];
  attr[2] := GEMShare.our_cb^.pubs.vINTOUT[2];
  attr[3] := GEMShare.our_cb^.pubs.vINTOUT[3];
  attr[4] := GEMShare.our_cb^.pubs.vINTOUT[4];
END InquireFillAttributes;


PROCEDURE GetTextStyle(handle:DeviceHandle;VAR font,color,angle:CARDINAL;
                       VAR hor:THorJust;VAR vert:TVertJust;VAR mode:WritingMode;
                       VAR charW,charH,boxW,boxH:CARDINAL);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_TEXT, 0, 0, 0));
  charW := GEMShare.our_cb^.pubs.PTSOUT[0];
  charH := GEMShare.our_cb^.pubs.PTSOUT[1];
  boxW := GEMShare.our_cb^.pubs.PTSOUT[2];
  boxH := GEMShare.our_cb^.pubs.PTSOUT[3];
  font := GEMShare.our_cb^.pubs.vINTOUT[0];
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  angle := GEMShare.our_cb^.pubs.vINTOUT[2];
  hor := VAL(TVertJust, GEMShare.our_cb^.pubs.vINTOUT[3]);
  vert := VAL(TVertJust, GEMShare.our_cb^.pubs.vINTOUT[4]);
  mode := VAL(WritingMode, GEMShare.our_cb^.pubs.vINTOUT[5] + 1); (* workaround GEM-Bug *)
END GetTextStyle;


PROCEDURE InquireTextAttributes(handle: DeviceHandle; VAR attr: TextAttrArrayType);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_TEXT, 0, 0, 0));
  attr[0] := GEMShare.our_cb^.pubs.vINTOUT[0];
  attr[1] := GEMShare.our_cb^.pubs.vINTOUT[1];
  attr[2] := GEMShare.our_cb^.pubs.vINTOUT[2];
  attr[3] := GEMShare.our_cb^.pubs.vINTOUT[3];
  attr[4] := GEMShare.our_cb^.pubs.vINTOUT[4];
  attr[5] := GEMShare.our_cb^.pubs.vINTOUT[5] + 1; (* workaround GEM-Bug *)
  attr[6] := GEMShare.our_cb^.pubs.PTSOUT[0];
  attr[7] := GEMShare.our_cb^.pubs.PTSOUT[1];
  attr[8] := GEMShare.our_cb^.pubs.PTSOUT[2];
  attr[9] := GEMShare.our_cb^.pubs.PTSOUT[3];
END InquireTextAttributes;


PROCEDURE TextExtent(handle:DeviceHandle;REF str:ARRAY OF CHAR):Rectangle;
VAR r: Rectangle;
VAR n: CARDINAL;
VAR x1, y1, x2, y2, tmp: INTEGER16;
BEGIN
  n := GEMShare.stringIntoINTIN(str, 0);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.TEXT_EXTENT, 0, 0, n));
  x1 := GEMShare.our_cb^.pubs.PTSOUT[0]; (* smallest x *)
  y1 := GEMShare.our_cb^.pubs.PTSOUT[1]; (* smallest y *)
  x2 := GEMShare.our_cb^.pubs.PTSOUT[2]; (* greatest x *)
  y2 := GEMShare.our_cb^.pubs.PTSOUT[3]; (* greatest y *)
  IF x1 > x2 THEN
    tmp := x1;
    x1 := x2;
    x2 := tmp;
  END;
  IF y1 > y2 THEN
    tmp := y1;
    y1 := y2;
    y2 := tmp;
  END;
  tmp := GEMShare.our_cb^.pubs.PTSOUT[4];
  IF tmp < x1 THEN x1 := tmp END;
  IF tmp > x2 THEN x2 := tmp END;
  tmp := GEMShare.our_cb^.pubs.PTSOUT[5];
  IF tmp < y1 THEN y1 := tmp END;
  IF tmp > y2 THEN y2 := tmp END;
  tmp := GEMShare.our_cb^.pubs.PTSOUT[6];
  IF tmp < x1 THEN x1 := tmp END;
  IF tmp > x2 THEN x2 := tmp END;
  tmp := GEMShare.our_cb^.pubs.PTSOUT[7];
  IF tmp < y1 THEN y1 := tmp END;
  IF tmp > y2 THEN y2 := tmp END;
  r.x := x1;
  r.y := y1;
  r.w := x2 - x1 + 1;
  r.h := y2 - y1 + 1;
  RETURN r;
END TextExtent;


PROCEDURE InquireTextExtent(handle: DeviceHandle; REF str: ARRAY OF CHAR; VAR extent: BigPxyArrayType);
VAR n: CARDINAL;
BEGIN
  n := GEMShare.stringIntoINTIN(str, 0);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.TEXT_EXTENT, 0, 0, n));
  extent[0] := GEMShare.our_cb^.pubs.PTSOUT[0];
  extent[1] := GEMShare.our_cb^.pubs.PTSOUT[1];
  extent[2] := GEMShare.our_cb^.pubs.PTSOUT[2];
  extent[3] := GEMShare.our_cb^.pubs.PTSOUT[3];
  extent[4] := GEMShare.our_cb^.pubs.PTSOUT[4];
  extent[5] := GEMShare.our_cb^.pubs.PTSOUT[5];
  extent[6] := GEMShare.our_cb^.pubs.PTSOUT[6];
  extent[7] := GEMShare.our_cb^.pubs.PTSOUT[7];
END InquireTextExtent;


PROCEDURE GetCharSize(handle:DeviceHandle;
                      ch:CHAR; VAR width,dLeft,dRight:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(ch);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_CELL, 0, 0, 1));
  IF GEMShare.our_cb^.pubs.vINTOUT[0] < 0 THEN
    IF VDIChecks THEN
      GEMShare.gemErrorOccured();
    END;
    width := 0;
    dLeft := 0;
    dRight := 0;
  ELSE
    width := GEMShare.our_cb^.pubs.PTSOUT[0];
    dLeft := GEMShare.our_cb^.pubs.PTSOUT[2];
    dRight := GEMShare.our_cb^.pubs.PTSOUT[4];
  END;
END GetCharSize;


PROCEDURE InquireCharWidth(handle: DeviceHandle; ch: CHAR; VAR width: INTEGER; VAR dLeft: INTEGER; VAR dRight: INTEGER): INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(ch);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_CELL, 0, 0, 1));
  width := GEMShare.our_cb^.pubs.PTSOUT[0];
  dLeft := GEMShare.our_cb^.pubs.PTSOUT[2];
  dRight := GEMShare.our_cb^.pubs.PTSOUT[4];
  RETURN GEMShare.our_cb^.pubs.vINTOUT[0];
END InquireCharWidth;


PROCEDURE GetFaceName(handle:DeviceHandle;num:CARDINAL;VAR name:ARRAY OF CHAR);
CONST faceNameLen = 32;    (* Laenge des Fontnamens *)
VAR i: INTEGER;
BEGIN
  IF HIGH(name) < faceNameLen-1 THEN
    DoTRAP6(MOSGlobals.StringOverflow);
  END;
  GEMShare.our_cb^.pubs.vINTIN[0] := num;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.VQT_NAME, 0, 0, 1));
  FOR i := 0 TO faceNameLen-2 DO
    name[i] := CHR(GEMShare.our_cb^.pubs.vINTOUT[i]);
  END;
  name[faceNameLen - 1] := 0C;
END GetFaceName;


PROCEDURE InquireInputMode(handle: DeviceHandle; dev: logInpDev; VAR input: inputMode);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(dev);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.INQUIRE_INPUT, 0, 0, 1));
  input := VAL(inputMode, GEMShare.our_cb^.pubs.vINTOUT[0]);
END InquireInputMode;


PROCEDURE GetCellArray (handle:DeviceHandle; frame:Rectangle;
                        rowLength,numRows:CARDINAL;
                        VAR usedElems,usedRows:CARDINAL;
                        VAR undef:BOOLEAN; VAR colArray:ARRAY OF CARDINAL);
BEGIN
  (* not implemented in any VDI *)
  handle := NIL;
  frame.x := 0;
  rowLength := 0;
  numRows := 0;
  usedElems := 0;
  usedRows := 0;
  undef := FALSE;
  colArray[0] := 0;
  DoTRAP6(MOSGlobals.IllegalCall);
END GetCellArray;


PROCEDURE GetFaceInfo (handle:DeviceHandle; VAR minADE,maxADE:CARDINAL;
                       VAR bottom,descent,half,ascent,top:CARDINAL;
                       VAR maxWidth,deltaXSpecial,leftOff,rightOff:INTEGER);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.VQT_FONTINFO, 0, 0, 0));
  maxWidth := GEMShare.our_cb^.pubs.PTSOUT[0];
  deltaXSpecial := GEMShare.our_cb^.pubs.PTSOUT[2];
  leftOff := GEMShare.our_cb^.pubs.PTSOUT[4];
  rightOff := GEMShare.our_cb^.pubs.PTSOUT[6];
  bottom := GEMShare.our_cb^.pubs.PTSOUT[1];
  descent := GEMShare.our_cb^.pubs.PTSOUT[3];
  half := GEMShare.our_cb^.pubs.PTSOUT[5];
  ascent := GEMShare.our_cb^.pubs.PTSOUT[7];
  top := GEMShare.our_cb^.pubs.PTSOUT[9];
  minADE := GEMShare.our_cb^.pubs.vINTOUT[0];
  maxADE := GEMShare.our_cb^.pubs.vINTOUT[1];
END GetFaceInfo;


PROCEDURE InquireFaceInfo(handle: DeviceHandle; VAR minADE: INTEGER; VAR maxADE: INTEGER; VAR dist: DistanceArrayType; VAR maxWidth: INTEGER; VAR effects: RGBArrayType);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.VQT_FONTINFO, 0, 0, 0));
  minADE := GEMShare.our_cb^.pubs.vINTOUT[0];
  maxADE := GEMShare.our_cb^.pubs.vINTOUT[1];
  dist[0] := GEMShare.our_cb^.pubs.PTSOUT[1];
  dist[1] := GEMShare.our_cb^.pubs.PTSOUT[3];
  dist[2] := GEMShare.our_cb^.pubs.PTSOUT[5];
  dist[3] := GEMShare.our_cb^.pubs.PTSOUT[7];
  dist[4] := GEMShare.our_cb^.pubs.PTSOUT[9];
  maxWidth := GEMShare.our_cb^.pubs.PTSOUT[0];
  effects[0] := GEMShare.our_cb^.pubs.PTSOUT[2];
  effects[1] := GEMShare.our_cb^.pubs.PTSOUT[4];
  effects[2] := GEMShare.our_cb^.pubs.PTSOUT[6];
END InquireFaceInfo;

BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIInquires.
