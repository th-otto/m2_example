IMPLEMENTATION MODULE AESMenus;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM GEMAESbase IMPORT GemCall, IntIn2, IntIn3, IntIn4, IntIn8, IntOut2, IntOut4, AESCallResult, AESIntIn, AESIntOut, AESAddrIn;


PROCEDURE MenuBar(tree: ADDRESS; show: INTEGER);
BEGIN
  AESIntIn[0] := show;
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(30, 1, 1, 1, 0);
END MenuBar;


PROCEDURE MenuItemCheck(tree: ADDRESS; item: INTEGER; check: INTEGER);
BEGIN
  IntIn2(item, check);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(31, 2, 1, 1, 0);
END MenuItemCheck;


PROCEDURE MenuItemEnable(tree: ADDRESS; item:  INTEGER; enable: INTEGER);
BEGIN
  IntIn2(item, enable);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(32, 2, 1, 1, 0);
END MenuItemEnable;


PROCEDURE MenuTitleNormal(tree: ADDRESS; title: INTEGER; normal: INTEGER);
BEGIN
  IntIn2(title, normal);
  AESAddrIn[0] := tree;
  AESCallResult := GemCall(33, 2, 1, 1, 0);
END MenuTitleNormal;


PROCEDURE MenuText(tree: ADDRESS; item: INTEGER; text: ADDRESS);
BEGIN
  AESIntIn[0] := item;
  AESAddrIn[0] := tree;
  AESAddrIn[1] := text;
  AESCallResult := GemCall(34, 1, 1, 2, 0);
END MenuText;


PROCEDURE MenuRegister(id:INTEGER; VAR title: ARRAY OF CHAR): INTEGER;
BEGIN
  AESIntIn[0] := id;
  AESAddrIn[0] := ADR(title);
  RETURN GemCall(35, 1, 1, 1, 0);
END MenuRegister;


END AESMenus.
