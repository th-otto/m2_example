IMPLEMENTATION MODULE AESScraps;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn, AESAddrOut;


PROCEDURE ScrapRead(dir: ADDRESS);
BEGIN
  AESAddrIn[0] := dir;
  AESCallResult := GemCall(80, 0, 1, 1, 0);
END ScrapRead;


PROCEDURE ScrapWrite(dir: ADDRESS);
BEGIN
  AESAddrIn[0] := dir;
  AESCallResult := GemCall(81, 0, 1, 1, 0);
END ScrapWrite;


END AESScraps.
