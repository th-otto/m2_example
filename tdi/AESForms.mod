IMPLEMENTATION MODULE AESForms;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn;


PROCEDURE FormDo(tree: ADDRESS; first: INTEGER): INTEGER;
BEGIN
  AESIntIn[0] := first;
  AESAddrIn[0] := tree;
  RETURN GemCall(50, 1, 1, 1, 0);
END FormDo;


PROCEDURE FormDialogue(flag: INTEGER; littlex, littley, littlew, littleh: INTEGER; bigx, bigy, bigw, bigh: INTEGER);
BEGIN
  IntIn8(flag, littlex, littley, littlew, littleh, bigx, bigy, bigw);
  AESIntIn[8] := bigh;
  AESCallResult := GemCall(51, 9, 1, 0, 0);
END FormDialogue;


PROCEDURE FormAlert(defBut: INTEGER; VAR str: ARRAY OF CHAR): INTEGER;
BEGIN
  AESIntIn[0] := defBut;
  AESAddrIn[0] := ADR(str);
  RETURN GemCall(52, 1, 1, 1, 0);
END FormAlert;


PROCEDURE FormError(errNo: INTEGER): INTEGER;
BEGIN
  AESIntIn[0] := errNo; (* was: 1 *)
  RETURN GemCall(53, 1, 1, 0, 0);
END FormError;


PROCEDURE FormCenter(tree: ADDRESS; VAR x, y, w, h: INTEGER);
BEGIN
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(54, 0, 5, 1, 0);
  IntOut4(x, y, w, h);
END FormCenter;


PROCEDURE FormKeyboard(tree: ADDRESS; index: CARDINAL; VAR nextObj: CARDINAL; VAR ch: INTEGER; VAR cont: BOOLEAN);
BEGIN
  AESAddrIn[0] := tree;
  AESIntIn[0] := index;
  AESIntIn[1] := ch;
  AESIntIn[2] := nextObj;
  AESCallResult := GemCall(55, 3, 3, 1, 0);
  nextObj := AESIntOut[1];
  ch := AESIntOut[2];
  cont := AESCallResult <> 0;
END FormKeyboard;


PROCEDURE FormButton(tree: ADDRESS; index: CARDINAL; clicks: CARDINAL; VAR nextObj: CARDINAL; VAR cont: BOOLEAN);
BEGIN
  AESAddrIn[0] := tree;
  AESIntIn[0] := index;
  AESIntIn[1] := clicks;
  AESCallResult := GemCall(56, 2, 2, 1, 0);
  nextObj := AESIntOut[1];
  cont := AESCallResult <> 0;
END FormButton;


PROCEDURE FileSelectorInput(path: ADDRESS; name: ADDRESS; VAR button: INTEGER);
BEGIN
  AESAddrIn[0] := path;
  AESAddrIn[1] := name;
  AESCallResult := GemCall(90, 0, 2, 2, 0);
  button := AESIntOut[1];
END FileSelectorInput;


PROCEDURE FileSelectorExInput(path: ADDRESS; name: ADDRESS; VAR button: INTEGER; title: ADDRESS);
BEGIN
  AESAddrIn[0] := path;
  AESAddrIn[1] := name;
  AESAddrIn[2] := title;
  AESCallResult := GemCall(91, 0, 2, 3, 0);
  button := AESIntOut[1];
END FileSelectorExInput;


END AESForms.
