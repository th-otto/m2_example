IMPLEMENTATION MODULE AESScraps;

FROM    SYSTEM  IMPORT BYTE, CARDINAL32, SHIFT, ADR;
FROM GEMShare IMPORT our_cb, aes_if, testINTOUT0;
IMPORT GEMOps;
IMPORT MOSGlobals;

(*  Scrap Manager  *)
(*  =============  *)

PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;



PROCEDURE ScrapRead(dir: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := ADR(dir);
  aes_if(AES_CTRL_CODE(GEMOps.SCRP_READ, 0, 1, 1));
  testINTOUT0();
END ScrapRead;


PROCEDURE ScrapWrite(dir: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := dir;
  aes_if(AES_CTRL_CODE(GEMOps.SCRP_WRITE, 0, 1, 1));
END ScrapWrite;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESScraps.
