IMPLEMENTATION MODULE AESEvents;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn;

CONST NULL = ADDRESS(0);


PROCEDURE EventKeyboard(): INTEGER;
BEGIN
  RETURN GemCall(20, 0, 1, 0, 0);
END EventKeyboard;


PROCEDURE EventButton(clicks, mask, state: INTEGER; VAR mox, moy, buttons, keyState: INTEGER): INTEGER;
VAR result: INTEGER;
BEGIN
  IntIn3(clicks, mask, state);
  result := GemCall(21, 3, 5, 0, 0);
  IntOut4(mox, moy, buttons, keyState);
  RETURN result;
END EventButton;


PROCEDURE EventMouse(direction: INTEGER; x, y, w, h: INTEGER; VAR buttons, keyState, mox, moy: INTEGER);
BEGIN
  IntIn4(direction, x, y, w);
  AESIntIn[4] := h;
  AESCallResult := GemCall(22, 5, 5, 0, 0);
  IntOut4(buttons, keyState, mox, moy);
END EventMouse;


PROCEDURE EventMessage(msg: ADDRESS);
BEGIN
  AESAddrIn[0] := msg;
  AESCallResult := GemCall(23, 0, 1, 1, 0);
END EventMessage;


PROCEDURE EventTimer(lo, hi: INTEGER);
BEGIN
  IntIn2(lo, hi);
  AESCallResult := GemCall(24, 2, 1, 0, 0);
END EventTimer;


PROCEDURE EventMultiple(events: INTEGER; noclicks, butMask, butState: INTEGER;
      moveDirect1, move1x, move1y, move1w, move1h: INTEGER;
      moveDirect2, move2x, move2y, move2w, move2h: INTEGER;
      msg: ADDRESS;
      timelo, timehi: INTEGER;
      VAR mox, moy, buttons, keyState, key, doneClicks: INTEGER): INTEGER;
VAR result: INTEGER;
BEGIN
  AESIntIn[0] := events;
  AESIntIn[1] := noclicks;
  AESIntIn[2] := butMask;
  AESIntIn[3] := butState;
  AESIntIn[4] := moveDirect1;
  AESIntIn[5] := move1x;
  AESIntIn[6] := move1y;
  AESIntIn[7] := move1w;
  AESIntIn[8] := move1h;
  AESIntIn[9] := moveDirect2;
  AESIntIn[10] := move2x;
  AESIntIn[11] := move2y;
  AESIntIn[12] := move2w;
  AESIntIn[13] := move2h;
  AESIntIn[14] := timelo;
  AESIntIn[15] := timehi;
  IF msg = NIL THEN msg := NULL; END;
  AESAddrIn[0] := msg;
  result := GemCall(25, 16, 7, 1, 0);
  IntOut4(mox, moy, buttons, keyState);
  key := AESIntOut[5];
  doneClicks := AESIntOut[6];
  RETURN result;
END EventMultiple;


PROCEDURE EventDoubleClick(val: INTEGER; setorget: INTEGER): INTEGER;
BEGIN
  IntIn2(val, setorget);
  RETURN GemCall(26, 2, 1, 0, 0);
END EventDoubleClick;
    

END AESEvents.
