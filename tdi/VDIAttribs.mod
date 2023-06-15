IMPLEMENTATION MODULE VDIAttribs;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin;


PROCEDURE SetWritingMode(handle: INTEGER; mode: INTEGER): INTEGER;
BEGIN
  intin[0] := mode;
  SetContrl(32, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetWritingMode;


PROCEDURE SetColour(handle: INTEGER; color: INTEGER; rgb: PxyArrayType);
BEGIN
  intin[0] := color;
  intin[1] := rgb[0];
  intin[2] := rgb[1];
  intin[3] := rgb[2];
  SetContrl(14, 0, 4, 0, handle);
  CallVDI();
END SetColour;


PROCEDURE SetLineType(handle: INTEGER; type: INTEGER): INTEGER;
BEGIN
  intin[0] := type;
  SetContrl(15, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetLineType;


PROCEDURE DefineLineStyle(handle: INTEGER; pattern: INTEGER);
BEGIN
  intin[0] := pattern;
  SetContrl(113, 0, 1, 0, handle);
  CallVDI();
END DefineLineStyle;


PROCEDURE SetLineWidth(handle: INTEGER; width: INTEGER): INTEGER;
BEGIN
  ptsin[0] := width;
  ptsin[1] := 0;
  SetContrl(16, 1, 0, 0, handle);
  CallVDI();
  RETURN ptsout[0];
END SetLineWidth;


PROCEDURE SetLineColour(handle: INTEGER; color: INTEGER): INTEGER;
BEGIN
  intin[0] := color;
  SetContrl(17, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetLineColour;


PROCEDURE SetEndLineStyle(handle: INTEGER; begin, end: INTEGER);
BEGIN
  intin[0] := begin;
  intin[1] := end;
  SetContrl(108, 0, 2, 0, handle);
  CallVDI();
END SetEndLineStyle;


PROCEDURE SetMarkerType(handle: INTEGER; type: INTEGER): INTEGER;
BEGIN
  intin[0] := type;
  SetContrl(18, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetMarkerType;


PROCEDURE SetMarkerHeight(handle: INTEGER; height: INTEGER): INTEGER;
BEGIN
  ptsin[0] := 0;
  ptsin[1] := height;
  SetContrl(19, 1, 0, 0, handle);
  CallVDI();
  RETURN ptsout[1];
END SetMarkerHeight;


PROCEDURE SetMarkerColour(handle: INTEGER; color: INTEGER): INTEGER;
BEGIN
  intin[0] := color;
  SetContrl(20, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetMarkerColour;


PROCEDURE SetAbsCharHeight(handle: INTEGER; height: INTEGER; VAR charW, charH, cellW, cellH: INTEGER);
BEGIN
  ptsin[0] := 0;
  ptsin[1] := height;
  SetContrl(12, 1, 0, 0, handle);
  CallVDI();
  charW := ptsout[0];
  charH := ptsout[1];
  cellW := ptsout[2];
  cellH := ptsout[3];
END SetAbsCharHeight;


PROCEDURE SetPointCharHeight(handle: INTEGER; height: INTEGER; VAR charW, charH, cellW, cellH: INTEGER): INTEGER;
BEGIN
  intin[0] := height;
  SetContrl(107, 0, 1, 0, handle);
  CallVDI();
  charW := ptsout[0];
  charH := ptsout[1];
  cellW := ptsout[2];
  cellH := ptsout[3];
  RETURN intout[0]; (* was: intout[1] *)
END SetPointCharHeight;


PROCEDURE SetRotation(handle: INTEGER; angle: INTEGER): INTEGER;
BEGIN
  intin[0] := angle;
  SetContrl(13, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetRotation;


PROCEDURE SetFont(handle: INTEGER; font: INTEGER): INTEGER;
BEGIN
  intin[0] := font;
  SetContrl(21, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetFont;


PROCEDURE SetGraphicTextColour(handle: INTEGER; color: INTEGER): INTEGER;
BEGIN
  intin[0] := color;
  SetContrl(22, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetGraphicTextColour;


PROCEDURE SetGraphicTextEffects(handle: INTEGER; effects: INTEGER): INTEGER;
BEGIN
  intin[0] := effects;
  SetContrl(106, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetGraphicTextEffects;


PROCEDURE SetGraphicTextAlignment(handle: INTEGER; hor, ver: INTEGER; VAR horout, verout: INTEGER);
BEGIN
  intin[0] := hor;
  intin[1] := ver;
  SetContrl(39, 0, 2, 0, handle);
  CallVDI();
  horout := intout[0];
  verout := intout[1];
END SetGraphicTextAlignment;


PROCEDURE SetFillInteriorStyle(handle: INTEGER; type: INTEGER): INTEGER;
BEGIN
  intin[0] := type;
  SetContrl(23, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetFillInteriorStyle;


PROCEDURE SetFillStyle(handle: INTEGER; index: INTEGER): INTEGER;
BEGIN
  intin[0] := index;
  SetContrl(24, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetFillStyle;


PROCEDURE SetFillColour(handle: INTEGER; color: INTEGER): INTEGER;
BEGIN
  intin[0] := color;
  SetContrl(25, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetFillColour;


PROCEDURE SetFillPerimeterVisibility(handle: INTEGER; visible: INTEGER): INTEGER;
BEGIN
  intin[0] := visible;
  SetContrl(104, 0, 1, 0, handle);
  CallVDI();
  RETURN intout[0];
END SetFillPerimeterVisibility;


PROCEDURE DefineFillPattern(handle: INTEGER; VAR pattern: ARRAY OF INTEGER; planes: INTEGER);
BEGIN
  SetContrl(112, 0, planes * 16, 0, handle);
  parameterBlock[1] := ADR(pattern);
  CallVDI();
  parameterBlock[1] := ADRintin;
END DefineFillPattern;


END VDIAttribs.
