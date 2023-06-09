IMPLEMENTATION MODULE AESApplications;

FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;
FROM GEMShare IMPORT our_cb, aes_if, testINTOUT0;
IMPORT GEMOps;
IMPORT MOSGlobals;

(*  Application Manager  *)
(*  ===================  *)

PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE ApplInitialise() : INTEGER;
BEGIN
  aes_if(AES_CTRL_CODE(GEMOps.APPL_INIT, 0, 1, 0));
  RETURN our_cb^.pubs.aINTOUT[0];
END ApplInitialise;


PROCEDURE ApplRead(id: INTEGER; noBytes: INTEGER; buffer: ADDRESS);
BEGIN
  our_cb^.pubs.aINTIN[0] := id;
  our_cb^.pubs.aINTIN[1] := noBytes;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.APPL_READ, 2, 1, 1));
  testINTOUT0();
END ApplRead;


PROCEDURE ApplWrite(id: INTEGER; noBytes: INTEGER; buffer: ADDRESS);
BEGIN
  our_cb^.pubs.aINTIN[0] := id;
  our_cb^.pubs.aINTIN[1] := noBytes;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.APPL_WRITE, 2, 1, 1));
  testINTOUT0();
END ApplWrite;


PROCEDURE ApplFind(VAR fname: ARRAY OF CHAR) : INTEGER;
BEGIN
  our_cb^.pubs.ADDRIN[0] := ADR(fname);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_FIND, 0, 1, 1));
  RETURN our_cb^.pubs.aINTOUT[0];
END ApplFind;


PROCEDURE ApplTPlayback(buffer: ADDRESS; no: INTEGER; scale: INTEGER);
BEGIN
  our_cb^.pubs.aINTIN[0] := no;
  our_cb^.pubs.aINTIN[1] := scale;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.APPL_TPLAY, 2, 1, 1));
END ApplTPlayback;


PROCEDURE ApplTRecord(buffer: ADDRESS; no: INTEGER) : [ INTEGER ];
BEGIN
  our_cb^.pubs.aINTIN[0] := no;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.APPL_TRECORD, 1, 1, 1));
  RETURN our_cb^.pubs.aINTOUT[0];
END ApplTRecord;


PROCEDURE ApplExit();
BEGIN
  aes_if(AES_CTRL_CODE(GEMOps.APPL_EXIT, 0, 1, 0));
END ApplExit;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESApplications.
