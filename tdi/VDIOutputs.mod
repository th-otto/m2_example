IMPLEMENTATION MODULE VDIOutputs;

(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRptsin;

VAR i, h: INTEGER;


PROCEDURE PolyLine(handle: INTEGER; noLines: INTEGER; VAR pts: ARRAY OF INTEGER);
BEGIN
  SetContrl(6, noLines, 0, 0, handle);
  parameterBlock[2] := ADR(pts);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END PolyLine;


PROCEDURE PolyMarker(handle: INTEGER; noMarks: INTEGER; VAR pts: ARRAY OF INTEGER);
BEGIN
  SetContrl(7, noMarks, 0, 0, handle);
  parameterBlock[2] := ADR(pts);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END PolyMarker;


PROCEDURE GraphicText(handle: INTEGER; x, y: INTEGER; VAR text: ARRAY OF CHAR);
BEGIN
  i := 0;
  h := HIGH(text);
  LOOP
    IF (i > h) OR (text[i] = 0C) THEN EXIT END;
    intin[i] := ORD(text[i]);
    INC(i);
  END;
  SetContrl(8, 1, i, 0, handle);
  ptsin[0] := x;
  ptsin[1] := y;
  CallVDI();
END GraphicText;


PROCEDURE FillArea(handle: INTEGER; noEdges: INTEGER; VAR pts: ARRAY OF INTEGER);
BEGIN
  SetContrl(9, noEdges, 0, 0, handle);
  parameterBlock[2] := ADR(pts);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END FillArea;


PROCEDURE CellArray(handle: INTEGER; VAR pxy: PxyArrayType; rowLength: INTEGER; elUsed: INTEGER; numRows: INTEGER; wrtMode: INTEGER; VAR colarray: ARRAY OF INTEGER);
BEGIN
  FOR i := 0 TO 3 DO
    ptsin[i] := pxy[i];
  END;
  SetContrl(10, 2, numRows * elUsed, 0, handle);
  contrl[7] := rowLength;
  contrl[8] := elUsed;
  contrl[9] := numRows;
  contrl[10] := wrtMode;
  parameterBlock[2] := ADR(colarray);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END CellArray;


PROCEDURE ContourFill(handle: INTEGER; x, y: INTEGER; color: INTEGER);
BEGIN
  SetContrl(103, 1, 1, 0, handle);
  intin[0] := color;
  ptsin[0] := x;
  ptsin[1] := y;
  CallVDI();
END ContourFill;


PROCEDURE FillRectangle(handle: INTEGER; VAR pxy: PxyArrayType);
BEGIN
  SetContrl(114, 2, 0, 0, handle);
  parameterBlock[2] := ADR(pxy);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END FillRectangle;


PROCEDURE DrawBar(handle: INTEGER; VAR pxy: PxyArrayType);
BEGIN
  SetContrl(11, 2, 0, 1, handle);
  parameterBlock[2] := ADR(pxy);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END DrawBar;


PROCEDURE DrawArc(handle: INTEGER; x, y, radius, beg, end: INTEGER);
BEGIN
  SetContrl(11, 4, 2, 2, handle);
  intin[0] := beg;
  intin[1] := end;
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := 0;
  ptsin[3] := 0;
  ptsin[4] := 0;
  ptsin[5] := 0;
  ptsin[6] := radius;
  ptsin[7] := 0;
  CallVDI();
END DrawArc;


PROCEDURE DrawPieSlice(handle: INTEGER; x, y, radius, beg, end: INTEGER);
BEGIN
  SetContrl(11, 4, 2, 3, handle);
  intin[0] := beg;
  intin[1] := end;
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := 0;
  ptsin[3] := 0;
  ptsin[4] := 0;
  ptsin[5] := 0;
  ptsin[6] := radius;
  ptsin[7] := 0;
  CallVDI();
END DrawPieSlice;


PROCEDURE DrawCircle(handle: INTEGER; x, y, radius: INTEGER);
BEGIN
  SetContrl(11, 3, 0, 4, handle);
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := 0;
  ptsin[3] := 0;
  ptsin[4] := radius;
  ptsin[5] := 0;
  CallVDI();
END DrawCircle;


PROCEDURE DrawEllipticalArc(handle: INTEGER; x, y, xradius, yradius, beg, end: INTEGER);
BEGIN
  SetContrl(11, 2, 2, 6, handle);
  intin[0] := beg;
  intin[1] := end;
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := xradius;
  ptsin[3] := yradius;
  CallVDI();
END DrawEllipticalArc;


PROCEDURE DrawEllipticalPie(handle: INTEGER; x, y, xradius, yradius, beg, end: INTEGER);
BEGIN
  SetContrl(11, 2, 2, 7, handle);
  intin[0] := beg;
  intin[1] := end;
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := xradius;
  ptsin[3] := yradius;
  CallVDI();
END DrawEllipticalPie;


PROCEDURE DrawEllipse(handle: INTEGER; x, y, xradius, yradius: INTEGER);
BEGIN
  SetContrl(11, 2, 0, 5, handle);
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := xradius;
  ptsin[3] := yradius;
  CallVDI();
END DrawEllipse;


PROCEDURE DrawRoundedBox(handle: INTEGER; VAR pxy: PxyArrayType);
BEGIN
  SetContrl(11, 2, 0, 8, handle);
  parameterBlock[2] := ADR(pxy);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END DrawRoundedBox;


PROCEDURE DrawRoundedFilledBox(handle: INTEGER; VAR pxy: PxyArrayType);
BEGIN
  SetContrl(11, 2, 0, 9, handle);
  parameterBlock[2] := ADR(pxy);
  CallVDI();
  parameterBlock[2] := ADRptsin;
END DrawRoundedFilledBox;


PROCEDURE JustifiedText(handle: INTEGER; x, y: INTEGER; VAR str: ARRAY OF CHAR; length: INTEGER; wSpace, cSpace: INTEGER);
BEGIN
  intin[0] := wSpace;
  intin[1] := cSpace;
  ptsin[0] := x;
  ptsin[1] := y;
  ptsin[2] := length;
  ptsin[3] := 0;
  i := 0;
  h := HIGH(str);
  LOOP
    IF (i > h) OR (str[i] = 0C) THEN EXIT END;
    intin[i + 2] := ORD(str[i]);
    INC(i);
  END;
  SetContrl(11, 2, i + 2, 10, handle);
  CallVDI();
END JustifiedText;


END VDIOutputs.
