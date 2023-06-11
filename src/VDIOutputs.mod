IMPLEMENTATION MODULE VDIOutputs;
#define REF


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Ausgabefunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  31.10.87
 *
 *  Version   2.2     V#0023
 *)

(*  22.01.88 TT         | PolyLine: TST (A3)+ -> TST -(A3)
 *  ???????? TT  V2.1   | REF-Parm.
 *  02.04.90 MCH V2.2   | Anpassung an public arrays
 *  26.03.91 TT         | PolyMarker: TST (A3)+ -> TST -(A3)
 *  11.06.23 THO        | Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL16, CARDINAL32, SHIFT, ADR, ADDRESS, INTEGER16;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GEMBase IMPORT PtrIntinArray, PtrPtsinArray;
FROM ErrBase IMPORT DoTRAP6, TRAP6_CONT;

#include "VdiCtrl.i"


(*  callPolyMG -- Macht den gesamten Aufruf fuer die Funktionen          *
 *                PolyMarker,Polygon.                                   *
 *                In 'cmd' steht der VDI-Opcode der Funktion            *)
PROCEDURE callPolyMG(handle:DeviceHandle;pts: ADDRESS;n:CARDINAL;
                     cmd:CARDINAL);
VAR oldpts: PtrPtsinArray;
    cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  oldpts := cb^.vdipb.ptsin;
  cb^.vdipb.ptsin := pts;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(cmd, 0, n, 0));
  cb^.vdipb.ptsin := oldpts;
END callPolyMG;


PROCEDURE PolyLine(handle:DeviceHandle;VAR (* REF *) pts:ARRAY OF Point;noLines:CARDINAL);
VAR n: CARDINAL;
BEGIN
  n := HIGH(pts) + 1;
  IF (noLines <> 0) AND (noLines < n) THEN
    n := noLines;
  END;
  callPolyMG(handle, ADR(pts), n, GEMOps.POLYLINE);
END PolyLine;


PROCEDURE PolyMarker(handle:DeviceHandle;VAR (* REF *) marks:ARRAY OF Point;noMarks:CARDINAL);
VAR n: CARDINAL;
BEGIN
  n := HIGH(marks) + 1;
  IF (noMarks <> 0) AND (noMarks < n) THEN
    n := noMarks;
  END;
  callPolyMG(handle, ADR(marks), n, GEMOps.POLYMARKER);
END PolyMarker;


PROCEDURE Polygon(handle:DeviceHandle;VAR (* REF *) pts:ARRAY OF Point;noEdges:CARDINAL);
VAR n: CARDINAL;
BEGIN
  n := HIGH(pts) + 1;
  IF (noEdges <> 0) AND (noEdges < n) THEN
    n := noEdges;
  END;
  callPolyMG(handle, ADR(pts), n, GEMOps.FILLED_AREA);
END Polygon;


PROCEDURE FillArea(handle: DeviceHandle; noEdges: CARDINAL; VAR (* REF *) pts: ARRAY OF INTEGER16);
VAR n: CARDINAL;
BEGIN
  n := HIGH(pts) + 1;
  IF (noEdges <> 0) AND (noEdges < n) THEN
    n := noEdges;
  END;
  callPolyMG(handle, ADR(pts), n, GEMOps.FILLED_AREA);
END FillArea;


PROCEDURE Line(handle:DeviceHandle;p,q:Point);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := p.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := p.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := q.x;
  GEMShare.our_cb^.pubs.PTSIN[3] := q.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.POLYLINE, 0, 2, 0));
END Line;


PROCEDURE Mark(handle:DeviceHandle;p:Point);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := p.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := p.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.POLYMARKER, 0, 1, 0));
END Mark;


PROCEDURE CellArray (handle:DeviceHandle; frame:Rectangle;
                     rowLength,usedElems,noRows:CARDINAL;
                     mode:WritingMode; REF colArray:ARRAY OF CARDINAL);
BEGIN
  (* not implemented in any VDI *)
  handle := NIL;
  frame.x := 0;
  rowLength := 0;
  usedElems := 0;
  noRows := 0;
  mode := 0;
  IF colArray[0] <> 0 THEN END;
  DoTRAP6(MOSGlobals.IllegalCall);
END CellArray;


PROCEDURE GrafText(handle:DeviceHandle;start:Point;REF text:ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  n := GEMShare.stringIntoINTIN(text, 0);
  GEMShare.our_cb^.pubs.PTSIN[0] := start.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := start.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_TEXT, 0, 1, n));
END GrafText;


PROCEDURE GraphicText(handle: DeviceHandle; x, y: INTEGER; REF text: ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  n := GEMShare.stringIntoINTIN(text, 0);
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_TEXT, 0, 1, n));
END GraphicText;


PROCEDURE ContourFill(handle:DeviceHandle;start:Point;tagColor:CARDINAL;
                      useTag:BOOLEAN);
BEGIN
  IF NOT useTag THEN tagColor := CARDINAL16(-1) END;
  GEMShare.our_cb^.pubs.vINTIN[0] := tagColor;
  GEMShare.our_cb^.pubs.PTSIN[0] := start.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := start.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.CONTOUR_FILL, 0, 1, 1));
END ContourFill;


PROCEDURE FillRectangle(handle:DeviceHandle;frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.FILL_RECTANGLE, 0, 2, 0));
END FillRectangle;


(*  Generalized Drawing Primitives  *)
(*  ==============================  *)

PROCEDURE Bar(handle:DeviceHandle;frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.BAR, 2, 0));
END Bar;


PROCEDURE DrawBar(handle: DeviceHandle; REF pxy: PxyArrayType);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := pxy[0];
  GEMShare.our_cb^.pubs.PTSIN[1] := pxy[1];
  GEMShare.our_cb^.pubs.PTSIN[2] := pxy[2];
  GEMShare.our_cb^.pubs.PTSIN[3] := pxy[3];
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.BAR, 2, 0));
END DrawBar;


PROCEDURE Arc(handle:DeviceHandle;middle:Point;radius,beg,end:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := 0;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.our_cb^.pubs.PTSIN[6] := radius;
  GEMShare.our_cb^.pubs.PTSIN[7] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ARC, 4, 2));
END Arc;


PROCEDURE DrawArc(handle: DeviceHandle; x, y, radius, beg, end: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := 0;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.our_cb^.pubs.PTSIN[6] := radius;
  GEMShare.our_cb^.pubs.PTSIN[7] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ARC, 4, 2));
END DrawArc;


PROCEDURE Pie(handle:DeviceHandle;middle:Point;radius,beg,end:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := 0;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.our_cb^.pubs.PTSIN[6] := radius;
  GEMShare.our_cb^.pubs.PTSIN[7] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.PIE, 4, 2));
END Pie;


PROCEDURE DrawPieSlice(handle: DeviceHandle; x, y, radius, beg, end: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := 0;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.our_cb^.pubs.PTSIN[6] := radius;
  GEMShare.our_cb^.pubs.PTSIN[7] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.PIE, 4, 2));
END DrawPieSlice;


PROCEDURE Circle(handle:DeviceHandle;middle:Point;radius:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := radius;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.CIRCLE, 3, 0));
END Circle;


PROCEDURE DrawCircle(handle: DeviceHandle; x, y, radius: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := 0;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.our_cb^.pubs.PTSIN[4] := radius;
  GEMShare.our_cb^.pubs.PTSIN[5] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.CIRCLE, 3, 0));
END DrawCircle;


PROCEDURE Ellipse(handle:DeviceHandle;middle:Point;xradius,yradius:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPSE, 2, 0));
END Ellipse;


PROCEDURE DrawEllipse(handle: DeviceHandle; x, y, xradius, yradius: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPSE, 2, 0));
END DrawEllipse;


PROCEDURE ElliptArc(handle:DeviceHandle;middle:Point;xradius,yradius,beg,end:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPTICAL_ARC, 2, 2));
END ElliptArc;


PROCEDURE DrawEllipticalArc(handle: DeviceHandle; x, y, xradius, yradius, beg, end: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPTICAL_ARC, 2, 2));
END DrawEllipticalArc;


PROCEDURE ElliptPie(handle:DeviceHandle;middle:Point;xradius,yradius,beg,end:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := middle.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := middle.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPTICAL_PIE, 2, 2));
END ElliptPie;


PROCEDURE DrawEllipticalPie(handle: DeviceHandle; x, y, xradius, yradius, beg, end: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := beg;
  GEMShare.our_cb^.pubs.vINTIN[1] := end;
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.our_cb^.pubs.PTSIN[2] := xradius;
  GEMShare.our_cb^.pubs.PTSIN[3] := yradius;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ELLIPTICAL_PIE, 2, 2));
END DrawEllipticalPie;


PROCEDURE RoundRect(handle:DeviceHandle;frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ROUNDED_RECT, 2, 0));
END RoundRect;


PROCEDURE DrawRoundedBox(handle: DeviceHandle; REF pts: PxyArrayType);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := pts[0];
  GEMShare.our_cb^.pubs.PTSIN[1] := pts[1];
  GEMShare.our_cb^.pubs.PTSIN[2] := pts[2];
  GEMShare.our_cb^.pubs.PTSIN[3] := pts[3];
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.ROUNDED_RECT, 2, 0));
END DrawRoundedBox;


PROCEDURE FillRoundRect(handle:DeviceHandle;frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.FILL_ROUND_RECT, 2, 0));
END FillRoundRect;


PROCEDURE DrawRoundedFilledBox(handle: DeviceHandle; REF pts: PxyArrayType);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := pts[0];
  GEMShare.our_cb^.pubs.PTSIN[1] := pts[1];
  GEMShare.our_cb^.pubs.PTSIN[2] := pts[2];
  GEMShare.our_cb^.pubs.PTSIN[3] := pts[3];
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.FILL_ROUND_RECT, 2, 0));
END DrawRoundedFilledBox;


PROCEDURE JustifiedText(handle:DeviceHandle;start:Point;length:CARDINAL;
                        wSpace,cSpace:BOOLEAN;REF str:ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  n := GEMShare.stringIntoINTIN(str, 2);
  GEMShare.our_cb^.pubs.vINTIN[0] := wSpace;
  GEMShare.our_cb^.pubs.vINTIN[1] := cSpace;
  GEMShare.our_cb^.pubs.PTSIN[0] := start.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := start.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := length;
  GEMShare.our_cb^.pubs.PTSIN[3] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GRAF_STANDARD, GEMOps.JUST_TEXT, 2, n));
END JustifiedText;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIOutputs.
