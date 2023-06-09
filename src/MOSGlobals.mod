IMPLEMENTATION MODULE MOSGlobals;
#define REF

FROM SYSTEM IMPORT LOC, ADR, INTEGER32;


PROCEDURE MEM (VAR data: ARRAY OF LOC): MemArea;
VAR mem: MemArea;
BEGIN
  mem.bottom := ADR(data);
  mem.length := HIGH(data) + 1;
  RETURN mem;
END MEM;


PROCEDURE trap_1_wl(n: INTEGER16; a: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.l #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wl;

TYPE strtmp = ARRAY [0..256] OF CHAR;

PROCEDURE str0(VAR dst: strtmp; REF src: ARRAY OF CHAR);
VAR i, len: CARDINAL;
BEGIN
  len := HIGH(dst);
  i := 0;
  LOOP
    IF len = 0 THEN EXIT END;
    IF src[i] = 0C THEN EXIT END;
    dst[i] := src[i];
    INC(i);
    DEC(len);
  END;
  dst[i] := 0C;
END str0;


PROCEDURE Cconws(REF str: ARRAY OF CHAR);
VAR s: strtmp;
BEGIN
  str0(s, str);
  trap_1_wl(9, INTEGER32(ADR(s)));
END Cconws;


PROCEDURE traceInit(REF file: ARRAY OF CHAR);
BEGIN
  IF TraceInit THEN
    Cconws("Init: ");
    Cconws(file);
    Cconws(CHR(13) + CHR(10));
  END;
END traceInit;

BEGIN
  IF TraceInit THEN traceInit(__FILE__); END;
END MOSGlobals.
