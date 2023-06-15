IMPLEMENTATION MODULE AESWindows;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESAddrIn;

PROCEDURE WindowCreate(elems: INTEGER; maxx, maxy, maxw, maxh: INTEGER): INTEGER;
BEGIN
  IntIn4(elems, maxx, maxy, maxw);
  AESIntIn[4] := maxh;
  RETURN GemCall(100, 5, 1, 0, 0);
END WindowCreate;


PROCEDURE WindowOpen(handle: INTEGER; x, y, w, h: INTEGER);
BEGIN
  IntIn4(handle, x, y, w);
  AESIntIn[4] := h;
  AESCallResult := GemCall(101, 5, 1, 0, 0);
END WindowOpen;


PROCEDURE WindowClose(handle: INTEGER);
BEGIN
  AESIntIn[0] := handle;
  AESCallResult := GemCall(102, 1, 1, 0, 0);
END WindowClose;


PROCEDURE WindowDelete(handle: INTEGER);
BEGIN
  AESIntIn[0] := handle;
  AESCallResult := GemCall(103, 1, 1, 0, 0);
END WindowDelete;


PROCEDURE WindowGet(handle: INTEGER; kind: INTEGER; VAR w1, w2, w3, w4: INTEGER);
BEGIN
  IntIn2(handle, kind);
  AESCallResult := GemCall(104, 2, 5, 0, 0);
  IntOut4(w1, w2, w3, w4);
END WindowGet;


PROCEDURE WindowSet(handle: INTEGER; kind: INTEGER; w1, w2, w3, w4: INTEGER);
BEGIN
  IntIn4(handle, kind, w1, w2);
  AESIntIn[4] := w3;
  AESIntIn[5] := w4;
  AESCallResult := GemCall(105, 6, 1, 0, 0);
END WindowSet;


PROCEDURE WindowFind(x, y: INTEGER): INTEGER;
BEGIN
  IntIn2(x, y);
  RETURN GemCall(106, 2, 1, 0, 0);
END WindowFind;


PROCEDURE WindowUpdate(mode: INTEGER);
BEGIN
  AESIntIn[0] := mode;
  AESCallResult := GemCall(107, 1, 1, 0, 0);
END WindowUpdate;


PROCEDURE WindowCalc(typ: INTEGER; elems: INTEGER; x, y, w, h: INTEGER; VAR outx, outy, outw, outh: INTEGER);
BEGIN
  IntIn4(typ, elems, x, y);
  AESIntIn[4] := w;
  AESIntIn[5] := h;
  AESCallResult := GemCall(108, 6, 5, 0, 0);
  IntOut4(outx, outy, outw, outh);
END WindowCalc;


PROCEDURE WindowNew();
BEGIN
  AESCallResult := GemCall(109, 0, 0, 0, 0);
END WindowNew;


END AESWindows.
