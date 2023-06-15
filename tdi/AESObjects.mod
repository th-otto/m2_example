IMPLEMENTATION MODULE AESObjects;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn;


PROCEDURE ObjectAdd(tree: ADDRESS; parent, child: INTEGER);
BEGIN
  IntIn2(parent, child);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(40, 2, 1, 1, 0);
END ObjectAdd;


PROCEDURE ObjectDelete(tree: ADDRESS; index: INTEGER);
BEGIN
  AESIntIn[0] := index;
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(41, 1, 1, 1, 0);
END ObjectDelete;


PROCEDURE ObjectDraw(tree: ADDRESS; start, depth: INTEGER; x, y, w, h: INTEGER);
BEGIN
  IntIn4(start, depth, x, y);
  AESIntIn[4] := w;
  AESIntIn[5] := h;
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(42, 6, 1, 1, 0);
END ObjectDraw;


PROCEDURE ObjectFind(tree: ADDRESS; start, depth: INTEGER; x, y: INTEGER): INTEGER;
BEGIN
  IntIn4(start, depth, x, y);
  AESAddrIn[0] := tree;
  RETURN GemCall(43, 4, 1, 1, 0);
END ObjectFind;


PROCEDURE ObjectOffset(tree: ADDRESS; index: INTEGER; VAR x, y: INTEGER);
BEGIN
  AESIntIn[0] := index;
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(44, 1, 3, 1, 0);
  x := AESIntOut[1];
  y := AESIntOut[2];
END ObjectOffset;


PROCEDURE ObjectOrder(tree: ADDRESS; index: INTEGER; newPos: INTEGER);
BEGIN
  IntIn2(index, newPos);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(45, 2, 1, 1, 0);
END ObjectOrder;


PROCEDURE ObjectEdit(tree: ADDRESS; index: INTEGER; ch: INTEGER; pos: INTEGER; kind: INTEGER; VAR newpos: INTEGER);
BEGIN
  IntIn4(index, ch, pos, kind);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(46, 4, 2, 1, 0);
  newpos := AESIntOut[1];
END ObjectEdit;


PROCEDURE ObjectChange(tree: ADDRESS; index, depth: INTEGER; x, y, w, h: INTEGER; newState: INTEGER; redraw: INTEGER);
BEGIN
  IntIn8(index, depth, x, y, w, h, newState, redraw);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(47, 8, 1, 1, 0);
END ObjectChange;


END AESObjects.
