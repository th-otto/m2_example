IMPLEMENTATION MODULE AESGraphics;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESAddrIn;

PROCEDURE GrafRubberBox(x, y, w, h: INTEGER; VAR destx, desty: INTEGER);
BEGIN
  IntIn4(x, y, w, h);
  AESCallResult := GemCall(70, 4, 3, 0, 0);
  IntOut2(destx, desty);
END GrafRubberBox;


PROCEDURE GrafDragBox(startx, starty, startw, starth: INTEGER; boundx, boundy, boundw, boundh: INTEGER; VAR destx, desty: INTEGER);
BEGIN
  IntIn8(startx, starty, startw, starth, boundx, boundy, boundw, boundh);
  AESCallResult := GemCall(71, 8, 3, 0, 0);
  IntOut2(destx, desty);
END GrafDragBox;


PROCEDURE GrafMoveBox(w, h, x, y: INTEGER; destx, desty: INTEGER);
BEGIN
  IntIn4(w, h, x, y);
  AESIntIn[4] := destx;
  AESIntIn[5] := desty;
  AESCallResult := GemCall(72, 6, 1, 0, 0);
END GrafMoveBox;


PROCEDURE GrafGrowBox(startx, starty, startw, starth: INTEGER; destx, desty, destw, desth: INTEGER);
BEGIN
  IntIn8(startx, starty, startw, starth, destx, desty, destw, desth);
  AESCallResult := GemCall(73, 8, 1, 0, 0);
END GrafGrowBox;


PROCEDURE GrafShrinkBox(destx, desty, destw, desth: INTEGER; startx, starty, startw, starth: INTEGER);
BEGIN
  IntIn8(destx, desty, destw, desth, startx, starty, startw, starth);
  AESCallResult := GemCall(74, 8, 1, 0, 0);
END GrafShrinkBox;


PROCEDURE GrafWatchBox(tree: ADDRESS; index: INTEGER; inState, outState: INTEGER): INTEGER;
BEGIN
  IntIn4(0, index, inState, outState);
  AESAddrIn[0] := tree;
  RETURN GemCall(75, 4, 1, 1, 0);
END GrafWatchBox;


PROCEDURE GrafSlideBox(tree: ADDRESS; parent, child: INTEGER; dir: INTEGER): INTEGER;
BEGIN
  IntIn2(parent, child);
  AESIntIn[2] := dir;
  AESAddrIn[0] := tree;
  RETURN GemCall(76, 3, 1, 1, 0);
END GrafSlideBox;


PROCEDURE GrafHandle(VAR wchar, hchar, wbox, hbox: INTEGER): INTEGER;
VAR result: INTEGER;
BEGIN
  result := GemCall(77, 0, 5, 0, 0);
  IntOut4(wchar, hchar, wbox, hbox);
  RETURN result;
END GrafHandle;


PROCEDURE GrafMouse(form: INTEGER; mouseFormPtr: ADDRESS);
BEGIN
  AESIntIn[0] := form;
  AESAddrIn[0] := mouseFormPtr;
  AESCallResult := GemCall(78, 1, 1, 1, 0);
END GrafMouse;


PROCEDURE GrafMouseKeyboardState(VAR x, y, mouseButs, key: INTEGER);
BEGIN
  AESCallResult := GemCall(79, 0, 5, 0, 0);
  IntOut4(x, y, mouseButs, key);
END GrafMouseKeyboardState;
    
    
END AESGraphics.
