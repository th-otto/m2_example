IMPLEMENTATION MODULE VDIAttributes;


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Attributfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  04.11.87
 *
 *  Version   2.2     V#0032
 *)

(*  04.11.87    | Uebernahme aus 'GEMBase' und 'GEMExt'
 *  01.02.90    | Anpassung auf Compilerversion 4.0 (SET's verdreht)
 *  13.02.90    | 'SetAbsTHeight' setzt 'errNum' korrekt
 *  02.04.90    | Anpassung auf public arrays
 *  25.02.91 TT | "error"-Setzung ueber occured-Funktion
 *  09.04.91 TT | SetAbsTHeight/SetPtsTHeight: Return-Parms vertauscht
 *  01.08.91 TT | DefUserFill geht nun (enthielt gleich zwei Fehler).
 *  22.05.93 TT | SetAbsTHeight/SetPtsTHeight: keine GemError-Abfrage mehr
 *  10.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR, INTEGER16;

FROM    GrafBase        IMPORT WritingMode;

FROM    GEMGlobals      IMPORT LineType, MarkerType, FillType, TEffectSet,
                               LineEnding, THorJust, TVertJust;
FROM GEMBase IMPORT PtrIntinArray;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GEMConf IMPORT VDIChecks;

#include "VdiCtrl.i"


(*  setINT0attribute -- geg.: D0 Wert eines Attributes und D1 VDI-Fktsopcode*
 *                      ges.: Aufruf der Funktion die dem Opcode entspricht *
 *                            wobei der Wert uebergeben wird. Die Globale    *
 *                            Var. 'error' wird 'TRUE', falls der Wert vom  *
 *                            VDI nicht angenommen wird.                    *

 *      Aufruf nur von ASSEMBLER-Teilen!                                    *)
PROCEDURE setINT0attribut(handle:DeviceHandle; ctrlcode:CARDINAL32; intin0: INTEGER16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := intin0;
  GEMShare.vdi_if(handle, ctrlcode);
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.vINTOUT[0] <> intin0 THEN
      GEMShare.gemErrorOccured();
    END;
  END;
END setINT0attribut;


PROCEDURE SetWritingMode(handle:DeviceHandle;mode:WritingMode);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(mode);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_WRITING_MODE, 0, 0, 1));
END SetWritingMode;


PROCEDURE DefineColor(handle:DeviceHandle;color,red,green,blue:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := color;
  GEMShare.our_cb^.pubs.vINTIN[1] := red;
  GEMShare.our_cb^.pubs.vINTIN[2] := green;
  GEMShare.our_cb^.pubs.vINTIN[3] := blue;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_COLOR_REP, 0, 0, 4));
END DefineColor;


PROCEDURE SetColour(handle: DeviceHandle; color: INTEGER; rgb: PxyArrayType);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := color;
  GEMShare.our_cb^.pubs.vINTIN[1] := rgb[0];
  GEMShare.our_cb^.pubs.vINTIN[2] := rgb[1];
  GEMShare.our_cb^.pubs.vINTIN[3] := rgb[2];
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_COLOR_REP, 0, 0, 4));
END SetColour;


(*  Line Attributs  *)
(*  ==============  *)

PROCEDURE SetLineWidth(handle:DeviceHandle;width:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := width;
  GEMShare.our_cb^.pubs.PTSIN[1] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_LINE_WIDTH, 0, 1, 0));
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.PTSOUT[0] <> VAL(INTEGER16, width) THEN
      GEMShare.gemErrorOccured();
    END;
  END;
END SetLineWidth;


PROCEDURE SetLineEndings(handle:DeviceHandle;begin,end:LineEnding);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(begin);
  GEMShare.our_cb^.pubs.vINTIN[1] := ORD(end);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_LINE_END, 0, 0, 2));
END SetLineEndings;


PROCEDURE DefUserLine(handle:DeviceHandle;pattern:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := pattern;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_LINE_USER, 0, 0, 1));
END DefUserLine;


PROCEDURE SetLineColor(handle:DeviceHandle;color:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_LINE_COLOR, 0, 0, 1), color);
END SetLineColor;


PROCEDURE SetLineType(handle:DeviceHandle;type:LineType);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_LINE_TYPE, 0, 0, 1), ORD(type));
END SetLineType;


(*  Marker Attributs  *)
(*  ================  *)

PROCEDURE SetMarkerHeight(handle:DeviceHandle;height:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := 0;
  GEMShare.our_cb^.pubs.PTSIN[1] := height;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_MARKER_HEIGHT, 0, 1, 0));
  IF VDIChecks THEN
    IF GEMShare.our_cb^.pubs.PTSOUT[1] <> VAL(INTEGER16, height) THEN
      GEMShare.gemErrorOccured();
    END;
  END;
END SetMarkerHeight;


PROCEDURE SetMarkerColor(handle:DeviceHandle;color:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_MARKER_COLOR, 0, 0, 1), color);
END SetMarkerColor;


PROCEDURE SetMarkerType(handle:DeviceHandle;type:MarkerType);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_MARKER_TYPE, 0, 0, 1), ORD(type));
END SetMarkerType;


(*  Text Attributs  *)
(*  ==============  *)

PROCEDURE SetPtsTHeight(handle:DeviceHandle; height:CARDINAL16;
                        VAR charW,charH,cellW,cellH:CARDINAL16): [ CARDINAL16 ];
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := height;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_HEIGHT_PTS, 0, 0, 1));
  charW := GEMShare.our_cb^.pubs.PTSOUT[0];
  charH := GEMShare.our_cb^.pubs.PTSOUT[1];
  cellW := GEMShare.our_cb^.pubs.PTSOUT[2];
  cellH := GEMShare.our_cb^.pubs.PTSOUT[3];
  RETURN GEMShare.our_cb^.pubs.vINTOUT[0];
END SetPtsTHeight;


PROCEDURE SetTBaseLine(handle:DeviceHandle;angle:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_BASELINE, 0, 0, 1), angle);
END SetTBaseLine;


PROCEDURE SetTextFace(handle:DeviceHandle;font:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_FACE, 0, 0, 1), font);
END SetTextFace;


PROCEDURE SetTAlignment(handle:DeviceHandle;hor:THorJust;vert:TVertJust);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(hor);
  GEMShare.our_cb^.pubs.vINTIN[1] := ORD(vert);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_ALIG, 0, 0, 2));
  IF VDIChecks THEN
    IF (GEMShare.our_cb^.pubs.vINTOUT[0] <> VAL(INTEGER16, ORD(hor))) OR (GEMShare.our_cb^.pubs.vINTOUT[1] <> VAL(INTEGER16, ORD(vert))) THEN
      GEMShare.gemErrorOccured();
    END;
  END;
END SetTAlignment;


PROCEDURE SetAbsTHeight (handle:DeviceHandle; height:CARDINAL16;
                         VAR charW,charH,cellW,cellH:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := 0;
  GEMShare.our_cb^.pubs.PTSIN[1] := height;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_HEIGHT_ABS, 0, 1, 0));
  charW := GEMShare.our_cb^.pubs.PTSOUT[0];
  charH := GEMShare.our_cb^.pubs.PTSOUT[1];
  cellW := GEMShare.our_cb^.pubs.PTSOUT[2];
  cellH := GEMShare.our_cb^.pubs.PTSOUT[3];
END SetAbsTHeight;


PROCEDURE SetTextColor(handle:DeviceHandle;color:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_COLOR, 0, 0, 1), color);
END SetTextColor;


PROCEDURE SetTextEffects(handle:DeviceHandle;effects:TEffectSet);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_TEXT_EFFECT, 0, 0, 1), VAL(INTEGER16, effects));
END SetTextEffects;


(*  Fill Attributs  *)
(*  ==============  *)

PROCEDURE DefUserFill(handle:DeviceHandle;pattern:PtrFillPattern);
VAR nintin: INTEGER;
oldintin: PtrIntinArray;
BEGIN
  nintin := pattern^.planes * 16;
  oldintin := GEMShare.our_cb^.vdipb.intin;
  GEMShare.our_cb^.vdipb.intin := ADR(pattern^.pattern);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_FILL_USER, 0, nintin, 0));
  GEMShare.our_cb^.vdipb.intin := oldintin;
END DefUserFill;


PROCEDURE SetFillColor(handle:DeviceHandle;color:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_FILL_COLOR, 0, 0, 1), color);
END SetFillColor;


PROCEDURE SetFillType(handle:DeviceHandle;type:FillType);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_FILL_INTERIOR, 0, 0, 1), ORD(type));
END SetFillType;


PROCEDURE SetFillIndex(handle:DeviceHandle;index:CARDINAL16);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_FILL_INDEX, 0, 0, 1), index);
END SetFillIndex;


PROCEDURE SetFillPerimeter(handle:DeviceHandle;visible:BOOLEAN);
BEGIN
  setINT0attribut(handle, VDI_CTRL_CODE(GEMOps.SET_FILL_PERIMETER, 0, 0, 1), ORD(visible));
END SetFillPerimeter;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIAttributes.
