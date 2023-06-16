IMPLEMENTATION MODULE VDIInputs;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR, ADDRESS;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRptsin, VDIWorkInType, VDIWorkOutType;
FROM GEMVDIbase IMPORT BigPxyArrayType, SmallArrayType, MouseArrayType;

TYPE words = RECORD CASE : BOOLEAN OF
  FALSE: adr: ADDRESS; |
  TRUE: w: ARRAY[0..1] OF CARDINAL;
  END;
END;

VAR i, h: INTEGER;
    w: words;


PROCEDURE SetInputMode(handle: INTEGER; dev: INTEGER; mode: INTEGER);
BEGIN
  intin[0] := dev;
  intin[1] := mode;
  SetContrl(33, 0, 2, 0, handle);
  CallVDI();
END SetInputMode;


PROCEDURE InputLocatorRQ(handle: INTEGER; x, y: INTEGER; VAR locX, locY: INTEGER; VAR termBut: INTEGER);
BEGIN
  ptsin[0] := x;
  ptsin[1] := y;
  SetContrl(28, 1, 0, 0, handle);
  CallVDI();
  locX := ptsout[0];
  locY := ptsout[1];
  termBut := intout[0];
END InputLocatorRQ;


PROCEDURE InputLocatorSM(handle: INTEGER; x, y: INTEGER; VAR locX, locY: INTEGER; VAR termBut: INTEGER): INTEGER;
BEGIN
  ptsin[0] := x;
  ptsin[1] := y;
  SetContrl(28, 1, 0, 0, handle);
  CallVDI();
  locX := ptsout[0];
  locY := ptsout[1];
  termBut := intout[0];
  RETURN contrl[2];
END InputLocatorSM;


PROCEDURE InputValuatorRQ(handle: INTEGER; valuatorIn: INTEGER; VAR valuatorOut: INTEGER; VAR terminator: INTEGER);
BEGIN
  intin[0] := valuatorIn;
  SetContrl(29, 0, 1, 0, handle);
  CallVDI();
  valuatorOut := intout[0];
  terminator := intout[1];
END InputValuatorRQ;


PROCEDURE InputValuatorSM(handle: INTEGER; valuatorIn: INTEGER; VAR valuatorOut: INTEGER; VAR terminator: INTEGER; VAR status: INTEGER);
BEGIN
  intin[0] := valuatorIn;
  SetContrl(29, 0, 1, 0, handle);
  CallVDI();
  valuatorOut := intout[0];
  terminator := intout[1];
  status := contrl[4];
END InputValuatorSM;


PROCEDURE InputChoiceRQ(handle: INTEGER; chIn: INTEGER; VAR chOut: INTEGER);
BEGIN
  intin[0] := chIn;
  SetContrl(30, 0, 1, 0, handle);
  CallVDI();
  chOut := intout[0];
END InputChoiceRQ;


PROCEDURE InputChoiceSM(handle: INTEGER; VAR choice: INTEGER): INTEGER;
BEGIN
  SetContrl(30, 0, 0, 0, handle);
  CallVDI();
  choice := intout[0];
  RETURN contrl[4];
END InputChoiceSM;


PROCEDURE InputStringRQ(handle: INTEGER; maxLength: INTEGER; echoMode: INTEGER; VAR echoXy: SmallArrayType; VAR str: ARRAY OF CHAR);
BEGIN
  intin[0] := maxLength;
  intin[1] := echoMode;
  ptsin[0] := echoXy[0];
  ptsin[1] := echoXy[1];
  SetContrl(31, 1, 2, 0, handle);
  CallVDI();
  h := contrl[4] - 1;
  FOR i := 0 TO h DO
    str[i] := CHR(intout[i]);
  END;
  str[h + 1] := 0C;
END InputStringRQ;


PROCEDURE InputStringSM(handle: INTEGER; maxLength: INTEGER; echoMode: INTEGER; VAR echoXy: SmallArrayType; VAR str: ARRAY OF CHAR): INTEGER;
BEGIN
  intin[0] := maxLength;
  intin[1] := echoMode;
  ptsin[0] := echoXy[0];
  ptsin[1] := echoXy[1];
  SetContrl(31, 1, 2, 0, handle);
  CallVDI();
  h := contrl[4];
  IF h = 0 THEN RETURN 0 END;
  DEC(h);
  FOR i := 0 TO h DO
    str[i] := CHR(intout[i]);
  END;
  str[h + 1] := 0C;
  RETURN contrl[4];
END InputStringSM;


PROCEDURE SetMouseForm(handle: INTEGER; form: MouseArrayType);
BEGIN
  parameterBlock[1] := ADR(form);
  SetContrl(111, 0, 37, 0, handle);
  CallVDI();
  parameterBlock[1] := ADRintin;
END SetMouseForm;


PROCEDURE ExchangeTimerV(handle: INTEGER; newadr: ADDRESS; VAR old: ADDRESS; VAR conv: INTEGER);
BEGIN
  SetContrl(118, 0, 0, 0, handle);
  WITH w DO
    adr := newadr;
    contrl[7] := w[0];
    contrl[8] := w[1];
    CallVDI();
    conv := intout[0];
    w[0] := contrl[9];
    w[1] := contrl[10];
    old := adr;
  END;
END ExchangeTimerV;


PROCEDURE ShowCursor(handle: INTEGER; reset: INTEGER);
BEGIN
  intin[0] := reset;
  SetContrl(122, 0, 1, 0, handle);
  CallVDI();
END ShowCursor;


PROCEDURE HideCursor(handle: INTEGER);
BEGIN
  SetContrl(123, 0, 0, 0, handle);
  CallVDI();
END HideCursor;


PROCEDURE SampleMouseButton(handle: INTEGER; VAR status: INTEGER; VAR x, y: INTEGER);
BEGIN
  SetContrl(124, 0, 0, 0, handle);
  CallVDI();
  status := intout[0];
  x := ptsout[0];
  y := ptsout[1];
END SampleMouseButton;


PROCEDURE ExchangeButtonV(handle: INTEGER; newadr: ADDRESS; VAR old: ADDRESS);
BEGIN
  SetContrl(125, 0, 0, 0, handle);
  WITH w DO
    adr := newadr;
    contrl[7] := w[0];
    contrl[8] := w[1];
    CallVDI();
    w[0] := contrl[9];
    w[1] := contrl[10];
    old := adr;
  END;
END ExchangeButtonV;


PROCEDURE ExchangeMovementV(handle: INTEGER; newadr: ADDRESS; VAR old: ADDRESS);
BEGIN
  SetContrl(126, 0, 0, 0, handle);
  WITH w DO
    adr := newadr;
    contrl[7] := w[0];
    contrl[8] := w[1];
    CallVDI();
    w[0] := contrl[9];
    w[1] := contrl[10];
    old := adr;
  END;
END ExchangeMovementV;


PROCEDURE ExchangeCursorV(handle: INTEGER; newadr: ADDRESS; VAR old: ADDRESS);
BEGIN
  SetContrl(127, 0, 0, 0, handle);
  WITH w DO
    adr := newadr;
    contrl[7] := w[0];
    contrl[8] := w[1];
    CallVDI();
    w[0] := contrl[9];
    w[1] := contrl[10];
    old := adr;
  END;
END ExchangeCursorV;


PROCEDURE SampleKeyboard(handle: INTEGER; VAR status: INTEGER);
BEGIN
  SetContrl(128, 0, 0, 0, handle);
  CallVDI();
  status := intout[0];
END SampleKeyboard;


END VDIInputs.
