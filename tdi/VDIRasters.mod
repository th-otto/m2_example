IMPLEMENTATION MODULE VDIRasters;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR, ADDRESS;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRptsin, VDIWorkInType, VDIWorkOutType;
FROM GEMVDIbase IMPORT BigPxyArrayType, SmallArrayType;

TYPE words = RECORD CASE : BOOLEAN OF
  FALSE: adr: ADDRESS; |
  TRUE: w: ARRAY[0..1] OF CARDINAL;
  END;
END;

VAR dummy: LONGCARD;
    w: words;

PROCEDURE CopyRasterOpaque(handle: INTEGER; mode: INTEGER; VAR pxy: BigPxyArrayType; sourceMem: ADDRESS; destMem: ADDRESS);
BEGIN
  intin[0] := mode;
  parameterBlock[2] := ADR(pxy);
  SetContrl(109, 4, 1, 0, handle);
  WITH w DO
    adr := sourceMem;
    contrl[7] := w[0];
    contrl[8] := w[1];
    adr := destMem;
    contrl[9] := w[0];
    contrl[10] := w[1];
  END;
  CallVDI();
  parameterBlock[2] := ADRptsin;
END CopyRasterOpaque;


PROCEDURE CopyRasterTransparent(handle: INTEGER; mode: INTEGER; VAR pxy: BigPxyArrayType; VAR sourceMem: ADDRESS; VAR destMem: ADDRESS; VAR setCol: SmallArrayType);
BEGIN
  intin[0] := mode;
  parameterBlock[2] := ADR(pxy);
  SetContrl(121, 4, 3, 0, handle);
  WITH w DO
    adr := sourceMem;
    contrl[7] := w[0];
    contrl[8] := w[1];
    adr := destMem;
    contrl[9] := w[0];
    contrl[10] := w[1];
  END;
  intin[1] := setCol[0];
  intin[2] := setCol[1];
  CallVDI();
  parameterBlock[2] := ADRptsin;
END CopyRasterTransparent;


PROCEDURE TransformForm(handle: INTEGER; sourceMem: ADDRESS; destMem: ADDRESS);
BEGIN
  SetContrl(110, 0, 0, 0, handle);
  WITH w DO
    adr := sourceMem;
    contrl[7] := w[0];
    contrl[8] := w[1];
    adr := destMem;
    contrl[9] := w[0];
    contrl[10] := w[1];
  END;
  CallVDI();
END TransformForm;


PROCEDURE GetPixel(handle: INTEGER; x, y: INTEGER; VAR pel: INTEGER; VAR color: INTEGER);
BEGIN
  ptsin[0] := x;
  ptsin[1] := y;
  SetContrl(105, 1, 0, 0, handle);
  CallVDI();
  pel := intout[0];
  color := intout[1];
END GetPixel;


END VDIRasters.
