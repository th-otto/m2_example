IMPLEMENTATION MODULE GEMVDIbase;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT CODE, ADR, PUSH, REGISTER, SETREG, ADDRESS;

PROCEDURE CallVDI();
BEGIN
  SETREG(0, 115);
  SETREG(1, ADRParams);
  CODE(04E42H); (* trap #2 *)
END CallVDI;


PROCEDURE SetContrl(OpCode: INTEGER; nptsin: INTEGER; nintin: INTEGER; subcmd: INTEGER; handle: INTEGER);
BEGIN
  contrl[0] := OpCode;
  contrl[1] := nptsin;
  contrl[3] := nintin;
  contrl[5] := subcmd;
  contrl[6] := handle;
END SetContrl;


BEGIN (* GEMVDIbase *)
  ADRintin := ADR(intin);
  ADRptsin := ADR(ptsin);
  ADRintout := ADR(intout);
  ADRptsout := ADR(ptsout);
  parameterBlock[0] := ADR(contrl);
  parameterBlock[1] := ADRintin;
  parameterBlock[2] := ADRptsin;
  parameterBlock[3] := ADRintout;
  parameterBlock[4] := ADRptsout;
  ADRParams := ADR(parameterBlock);
END GEMVDIbase.
