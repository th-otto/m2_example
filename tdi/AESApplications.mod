IMPLEMENTATION MODULE AESApplications;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESAddrIn;


PROCEDURE ApplInitialise(): INTEGER;
BEGIN
  RETURN GemCall(10, 0, 1, 0, 0);
END ApplInitialise;


PROCEDURE ApplRead(id: INTEGER; noBytes: INTEGER; buffer: ADDRESS);
BEGIN
  IntIn2(id, noBytes);
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(11, 2, 1, 1, 0);
END ApplRead;


PROCEDURE ApplWrite(id: INTEGER; noBytes: INTEGER; buffer: ADDRESS);
BEGIN
  IntIn2(id, noBytes);
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(12, 2, 1, 1, 0);
END ApplWrite;


PROCEDURE ApplFind(VAR fname: ARRAY OF CHAR): INTEGER;
BEGIN
  AESAddrIn[0] := ADR(fname);
  RETURN GemCall(13, 0, 1, 1, 0);
END ApplFind;


PROCEDURE ApplTPlayback(buffer: ADDRESS; no: INTEGER; scale: INTEGER);
BEGIN
  IntIn2(no, scale);
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(14, 2, 1, 1, 0);
END ApplTPlayback;


PROCEDURE ApplTRecord(buffer: ADDRESS; no: INTEGER);
BEGIN
  AESIntIn[0] := no;
  AESAddrIn[0] := buffer;
  AESCallResult := GemCall(15, 1, 1, 1, 0);
END ApplTRecord;


PROCEDURE ApplExit();
BEGIN
  AESCallResult := GemCall(19, 0, 1, 0, 0);
END ApplExit;


END AESApplications.
