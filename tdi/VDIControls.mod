IMPLEMENTATION MODULE VDIControls;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRptsin, VDIWorkInType, VDIWorkOutType;
FROM SYSTEM IMPORT CODE, PUSH, REGISTER, SETREG, ADDRESS;


PROCEDURE OpenWorkstation(VAR workin: VDIWorkInType; VAR handle: INTEGER; VAR workout: VDIWorkOutType);
VAR i: INTEGER;
BEGIN
  SetContrl(1, 0, 11, 0, 0);
  FOR i := 0 TO 10 DO
    intin[i] := workin[i];
  END;
  CallVDI();
  handle := contrl[6];
  FOR i := 0 TO 44 DO
    workout[i] := intout[i];
  END;
  FOR i := 45 TO 56 DO
    workout[i] := ptsout[i - 45];
  END;
END OpenWorkstation;


PROCEDURE CloseWorkstation(handle: INTEGER);
BEGIN
  SetContrl(2, 0, 0, 0, handle);
  CallVDI();
END CloseWorkstation;


PROCEDURE OpenVirtualWorkstation(VAR workin: VDIWorkInType; VAR handle: INTEGER; VAR workout: VDIWorkOutType);
VAR i: INTEGER;
BEGIN
  SetContrl(100, 0, 11, 0, handle);
  FOR i := 0 TO 10 DO
    intin[i] := workin[i];
  END;
  CallVDI();
  FOR i := 0 TO 44 DO
    workout[i] := intout[i];
  END;
  FOR i := 45 TO 56 DO
    workout[i] := ptsout[i - 45];
  END;
  handle := contrl[6];
END OpenVirtualWorkstation;


PROCEDURE CloseVirtualWorkstation(handle: INTEGER);
BEGIN
  SetContrl(101, 0, 0, 0, handle);
  CallVDI();
END CloseVirtualWorkstation;


PROCEDURE ClearWorkstation(handle: INTEGER);
BEGIN
  SetContrl(3, 0, 0, 0, handle);
  CallVDI();
END ClearWorkstation;


PROCEDURE UpdateWorkstation(handle: INTEGER);
BEGIN
  SetContrl(4, 0, 0, 0, handle);
  CallVDI();
END UpdateWorkstation;


PROCEDURE LoadFonts(handle: INTEGER; select: INTEGER): INTEGER;
BEGIN
  SetContrl(119, 0, 1, 0, handle);
  intin[0] := select; (* was missing *)
  CallVDI();
  RETURN intout[0];
END LoadFonts;


PROCEDURE UnloadFonts(handle: INTEGER; select: INTEGER);
BEGIN
  SetContrl(120, 0, 1, 0, handle);
  intin[0] := select;
  CallVDI();
END UnloadFonts;


PROCEDURE SetClipping(handle: INTEGER; on: INTEGER; VAR pxy: PxyArrayType);
VAR i: INTEGER;
BEGIN
  SetContrl(129, 2, 1, 0, handle);
  intin[0] := on;
  FOR i := 0 TO 3 DO
    ptsin[i] := pxy[i];
  END;
  CallVDI();
END SetClipping;


PROCEDURE GDOSAvailable(): BOOLEAN;
VAR r: INTEGER;
BEGIN
  SETREG(0, ADDRESS(LONGCARD(-2)));
  CODE(04E42H); (* trap #2 *)
  r := INTEGER(REGISTER(0));
  RETURN r = -2;
END GDOSAvailable;


PROCEDURE GDOSVersion(): LONGCARD;
VAR r: LONGINT;
BEGIN
  SETREG(0, ADDRESS(LONGCARD(-2)));
  CODE(04E42H); (* trap #2 *)
  r := LONGINT(REGISTER(0));
  IF INTEGER(r) = -2 THEN r := -2; END;
  RETURN r;
END GDOSVersion;


END VDIControls.
