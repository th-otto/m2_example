IMPLEMENTATION MODULE AESFile;
#define REF

(*  File Selector Manager  *)
(*  =====================  *)

FROM SYSTEM IMPORT ADDRESS, ADR, INTEGER16, CARDINAL16, CARDINAL32, SHIFT;
FROM GEMShare IMPORT our_cb, stringIntoCFormat, stringFromCFormat, aes_if, testINTOUT0;
FROM GEMGlobals IMPORT MaxStr;
FROM ErrBase IMPORT DoTRAP6;
IMPORT MOSGlobals;

IMPORT GEMOps;


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE selectFile0 (VAR path, name: ARRAY OF CHAR;
                       VAR ok        : BOOLEAN;
                           opcode    : CARDINAL32);
VAR s, s2: MaxStr;
BEGIN
  IF HIGH(name) < 11 THEN DoTRAP6(MOSGlobals.StringOverflow) END;
  IF HIGH(path) < 31 THEN DoTRAP6(MOSGlobals.StringOverflow) END;
  stringIntoCFormat(name, s);
  our_cb^.pubs.ADDRIN[0] := ADR(s);
  stringIntoCFormat(path, s2);
  our_cb^.pubs.ADDRIN[1] := ADR(s2);
  aes_if(opcode);
  stringFromCFormat(s, name);
  stringFromCFormat(s2, path);
  ok := our_cb^.pubs.aINTOUT[1] <> 0;
  testINTOUT0();
END selectFile0;


PROCEDURE SelectFile (VAR path, name: ARRAY OF CHAR; VAR ok: BOOLEAN);
BEGIN
  selectFile0(path, name, ok, AES_CTRL_CODE(GEMOps.FSEL_INPUT, 0, 2, 2));
END SelectFile;


PROCEDURE SelectFileExtended (REF label     : ARRAY OF CHAR;
                            VAR path, name: ARRAY OF CHAR;
                            VAR ok        : BOOLEAN);
BEGIN
(*
  stringIntoCFormat(label, s);
*)
  our_cb^.pubs.ADDRIN[2] := ADR(label);
  selectFile0(path, name, ok, AES_CTRL_CODE(GEMOps.FSEL_EX_INPUT, 0, 2, 3));
END SelectFileExtended;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESFile.
