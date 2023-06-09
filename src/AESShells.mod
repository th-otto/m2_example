IMPLEMENTATION MODULE AESShells;

FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;
FROM GEMShare IMPORT our_cb, aes_if, testINTOUT0;
IMPORT GEMOps;
IMPORT MOSGlobals;

(*  Shell Manager  *)
(*  =============  *)


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;



PROCEDURE ShellRead(cmd: ADDRESS; tail: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := cmd;
  our_cb^.pubs.ADDRIN[1] := tail;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_READ, 0, 1, 2));
END ShellRead;


PROCEDURE ShellWrite(start: INTEGER; isGraf: INTEGER; iscr: INTEGER; cmd: ADDRESS; tail: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := cmd;
  our_cb^.pubs.ADDRIN[1] := tail;
  our_cb^.pubs.aINTIN[0] := start;
  our_cb^.pubs.aINTIN[1] := isGraf;
  our_cb^.pubs.aINTIN[2] := iscr;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_WRITE, 3, 1, 2));
  testINTOUT0();
END ShellWrite;


PROCEDURE ShellFind(name: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := name;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_FIND, 0, 1, 1));
  testINTOUT0();
END ShellFind;


PROCEDURE ShellEnvrn(value: ADDRESS; parm: ADDRESS);
BEGIN
  our_cb^.pubs.ADDRIN[0] := value;
  our_cb^.pubs.ADDRIN[1] := parm;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_ENVRN, 0, 1, 2));
  testINTOUT0();
END ShellEnvrn;


PROCEDURE ShellGet(buffer: ADDRESS; no: CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[0] := no;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_GET, 1, 1, 1));
  testINTOUT0();
END ShellGet;


PROCEDURE ShellPut(buffer: ADDRESS; no: CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[0] := no;
  our_cb^.pubs.ADDRIN[0] := buffer;
  aes_if(AES_CTRL_CODE(GEMOps.SHEL_PUT, 1, 1, 1));
END ShellPut;



BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESShells.
