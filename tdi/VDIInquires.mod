IMPLEMENTATION MODULE VDIInquires;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR, ADDRESS;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRintout, ADRptsin, ADRptsout, VDIWorkInType, VDIWorkOutType;
FROM GEMVDIbase IMPORT TextAttrArrayType, BigPxyArrayType, FontNameType, DistanceArrayType, RGBArrayType;

VAR i, h: INTEGER;


PROCEDURE ExtendedInquire(handle: INTEGER; owflag: INTEGER; VAR workout: VDIWorkOutType);
BEGIN
  intin[0] := owflag;
  SetContrl(102, 0, 1, 0, handle);
  CallVDI();
  FOR i := 0 TO 44 DO
    workout[i] := intout[i];
  END;
  FOR i := 45 TO 56 DO
    workout[i] := ptsout[i - 45];
  END;
END ExtendedInquire;


PROCEDURE InquireColour(handle: INTEGER; color: INTEGER; set: INTEGER; VAR rgb: RGBArrayType);
BEGIN
  intin[0] := color;
  intin[1] := set;
  SetContrl(26, 0, 2, 0, handle);
  CallVDI();
  rgb[0] := intout[1];
  rgb[1] := intout[2];
  rgb[2] := intout[3];
END InquireColour;


(* FIXME: may return up to 6 attributes *)
PROCEDURE InquireLineAttributes(handle: INTEGER; VAR attr: PxyArrayType);
BEGIN
  SetContrl(35, 0, 0, 0, handle);
  CallVDI();
  attr[0] := intout[0];
  attr[1] := intout[1];
  attr[2] := intout[2];
  attr[3] := ptsout[0];
END InquireLineAttributes;


(* FIXME: returns 5 attributes *)
PROCEDURE InquireMarkerAttributes(handle: INTEGER; VAR attr: PxyArrayType);
BEGIN
  SetContrl(36, 0, 0, 0, handle);
  CallVDI();
  attr[0] := intout[0];
  attr[1] := intout[1];
  attr[2] := intout[2];
  attr[3] := ptsout[1];
END InquireMarkerAttributes;


(* FIXME: returns 5 attributes *)
PROCEDURE InquireFillAttributes(handle: INTEGER; VAR attr: PxyArrayType);
BEGIN
  SetContrl(37, 0, 0, 0, handle);
  CallVDI();
  FOR i := 0 TO 3 DO
    attr[i] := intout[i];
  END;
END InquireFillAttributes;


PROCEDURE InquireTextAttributes(handle: INTEGER; VAR attr: TextAttrArrayType);
BEGIN
  SetContrl(38, 0, 0, 0, handle);
  CallVDI();
  FOR i := 0 TO 5 DO
    attr[i] := intout[i];
  END;
  FOR i := 6 TO 9 DO
    attr[i] := ptsout[i - 6];
  END;
END InquireTextAttributes;


PROCEDURE InquireTextExtent(handle: INTEGER; VAR str: ARRAY OF CHAR; extent: BigPxyArrayType); (* BUG: extents passed by value *)
BEGIN
  i := 0;
  h := HIGH(str);
  LOOP
    IF (i > h) OR (str[i] = 0C) THEN EXIT END;
    intin[i] := ORD(str[i]);
    INC(i);
  END;
  SetContrl(116, 0, i, 0, handle);
  parameterBlock[4] := ADR(extent);
  CallVDI();
  parameterBlock[4] := ADRptsout;
END InquireTextExtent;


PROCEDURE InquireCharWidth(handle: INTEGER; ch: CHAR; VAR width: INTEGER; VAR dLeft: INTEGER; VAR dRight: INTEGER): INTEGER;
BEGIN
  intin[0] := ORD(ch);
  SetContrl(117, 0, 1, 0, handle);
  CallVDI();
  width := ptsout[0];
  dLeft := ptsout[2];
  dRight := ptsout[4];
  RETURN intout[0];
END InquireCharWidth;


PROCEDURE InquireFaceName(handle: INTEGER; font: INTEGER; VAR name: FontNameType): INTEGER;
BEGIN
  intin[0] := font;
  SetContrl(130, 0, 1, 0, handle);
  CallVDI();
  FOR i := 1 TO 32 DO
    name[i - 1] := CHR(intout[i]);
  END;
  RETURN intout[0];
END InquireFaceName;


PROCEDURE InquireCellArray(handle: INTEGER; VAR pxy: PxyArrayType; rowLength: INTEGER; numRows: INTEGER; VAR elUsed: INTEGER; VAR rowsUsed: INTEGER; VAR status: INTEGER; VAR colarray: ARRAY OF INTEGER);
BEGIN
  FOR i := 0 TO 3 DO
    ptsin[i] := pxy[i];
  END;
  contrl[7] := rowLength;
  contrl[8] := numRows;
  SetContrl(27, 2, 0, 0, handle);
  parameterBlock[3] := ADR(colarray);
  CallVDI();
  parameterBlock[3] := ADRintout;
  elUsed := contrl[9];
  rowsUsed := contrl[10];
  status := contrl[11];
END InquireCellArray;


PROCEDURE InquireInputMode(handle: INTEGER; dev: INTEGER; VAR input: INTEGER);
BEGIN
  intin[0] := dev;
  SetContrl(115, 0, 1, 0, handle);
  CallVDI();
  input := intout[0];
END InquireInputMode;


PROCEDURE InquireFaceInfo(handle: INTEGER; VAR minADE: INTEGER; VAR maxADE: INTEGER; VAR dist: DistanceArrayType; VAR maxWidth: INTEGER; VAR effects: RGBArrayType);
BEGIN
  SetContrl(131, 0, 0, 0, handle);
  CallVDI();
  minADE := intout[0];
  maxADE := intout[1];
  FOR i := 0 TO 4 DO
    dist[i] := ptsout[i * 2 + 1];
  END;
  maxWidth := ptsout[0];
  effects[0] := ptsout[2];
  effects[1] := ptsout[4];
  effects[2] := ptsout[6];
END InquireFaceInfo;


END VDIInquires.
