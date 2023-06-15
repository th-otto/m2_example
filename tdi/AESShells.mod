IMPLEMENTATION MODULE AESShells;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESAddrIn;

CONST NULL = ADDRESS(0);


PROCEDURE ShellRead(cmd: ADDRESS; tail: ADDRESS);
BEGIN
  AESAddrIn[0] := cmd;
  AESAddrIn[1] := tail;
  AESCallResult := GemCall(120, 0, 1, 2, 0);
END ShellRead;


PROCEDURE ShellWrite(start: INTEGER; isGraf: INTEGER; iscr: INTEGER; cmd: ADDRESS; tail: ADDRESS);
BEGIN
  IntIn2(start, isGraf);
  AESIntIn[2] := iscr;
  IF (* (NIL <> NULL) AND *) (cmd = NIL) THEN cmd := NULL; END;
  IF (* (NIL <> NULL) AND *) (tail = NIL) THEN tail := NULL; END;
  AESAddrIn[0] := cmd;
  AESAddrIn[1] := tail;
  AESCallResult := GemCall(121, 3, 1, 2, 0);
END ShellWrite;


PROCEDURE ShellFind(name: ADDRESS);
BEGIN
  AESAddrIn[0] := name;
  AESCallResult := GemCall(124, 0, 1, 1, 0);
END ShellFind;


PROCEDURE ShellEnvrn(value: ADDRESS; parm: ADDRESS);
BEGIN
  AESAddrIn[0] := value;
  AESAddrIn[1] := parm;
  AESCallResult := GemCall(125, 0, 1, 2, 0);
END ShellEnvrn;


PROCEDURE ShellGet(buffer: ADDRESS; no:CARDINAL);
BEGIN
  AESIntIn[0] := no;
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(122, 1, 1, 1, 0);
END ShellGet;


PROCEDURE ShellPut(buffer: ADDRESS; no:CARDINAL);
BEGIN
  AESIntIn[0] := no;
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(123, 1, 1, 1, 0);
END ShellPut;


END AESShells.
