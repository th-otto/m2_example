IMPLEMENTATION MODULE MOSGlobals;
#define REF

FROM SYSTEM IMPORT LOC, ADR;
IMPORT StrIO, StdIO, NumberIO;
FROM IOChan IMPORT Flush;
FROM StdChans IMPORT StdOutChan;


PROCEDURE MEM (VAR data: ARRAY OF LOC): MemArea;
VAR mem: MemArea;
BEGIN
  mem.bottom := ADR(data);
  mem.length := HIGH(data) + 1;
  RETURN mem;
END MEM;


PROCEDURE traceInit(REF file: ARRAY OF CHAR);
BEGIN
  IF TraceInit THEN
    StrIO.WriteString("Init: ");
    StrIO.WriteString(file);
    StrIO.WriteString(CHR(13) + CHR(10));
    Flush(StdOutChan());
  END;
END traceInit;

BEGIN
  IF TraceInit THEN traceInit(__FILE__); END;
END MOSGlobals.
