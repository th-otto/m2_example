IMPLEMENTATION MODULE AESResources;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn, AESAddrOut;


PROCEDURE ResourceLoad(VAR pathname: ARRAY OF CHAR);
BEGIN
  AESAddrIn[0] := ADR(pathname);
  AESCallResult := GemCall(110, 0, 1, 1, 0);
END ResourceLoad;


PROCEDURE ResourceFree();
BEGIN
  AESCallResult := GemCall(111, 0, 1, 0, 0);
END ResourceFree;


PROCEDURE ResourceGetAddr(typ: INTEGER; index: INTEGER; VAR addr: ADDRESS);
BEGIN
  IntIn2(typ, index);
  AESCallResult := GemCall(112, 2, 1, 0, 1);
  addr := AESAddrOut[0];
END ResourceGetAddr;


PROCEDURE ResourceSetAddr(typ: INTEGER; index: INTEGER; objAddr: ADDRESS);
BEGIN
  IntIn2(typ, index);
  AESAddrIn[0] := objAddr;
  AESCallResult := GemCall(113, 2, 1, 1, 0);
END ResourceSetAddr;


PROCEDURE ResourceObjectFix(tree: ADDRESS; index: INTEGER);
BEGIN
  AESIntIn[0] := index;
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(114, 1, 1, 1, 0);
END ResourceObjectFix;
    

PROCEDURE ResourceFix(hdr: PtrRSHDR);
BEGIN
  AESAddrIn[0] := hdr;
  AESCallResult := GemCall(115, 0, 1, 1, 0);
END ResourceFix;


END AESResources.
