IMPLEMENTATION MODULE M2Option;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$U+*) (* allow underscores *)

FROM SYSTEM IMPORT ADR, CODE;
IMPORT AESEvents;
IMPORT AESApplications;
IMPORT Strings;
IMPORT GEMDOS;
FROM AppBase IMPORT apId;

CONST TDI_Question = 70;
      TDI_Answer = 71;

CONST OptSearchPathLen = 38;
TYPE OptSearchPath = ARRAY[0..OptSearchPathLen-1] OF CHAR;
TYPE Options = RECORD
  (* Note: ACC fill will only 0..MaxPaths-1 *)
  paths: ARRAY[0..(MaxPaths + 1) * OptSearchPathLen - 1] OF CHAR;
  (* FIXME: should be ARRAY[0..MaxPaths] OF OptSearchPath; *)
END;

VAR accId: INTEGER;
VAR msgbuf: ARRAY [0..15] OF INTEGER;
VAR replybuf: ARRAY [0..15] OF INTEGER;
VAR options: Options;
VAR unused: INTEGER;
(*
VAR searchpaths: SearchPathArray;
VAR dump: BOOLEAN;
VAR query: BOOLEAN;
VAR reffiles: BOOLEAN;
VAR listing: BOOLEAN;
VAR linkmap: BOOLEAN;
VAR linkopt: BOOLEAN;
VAR debugtable: BOOLEAN;
VAR stacksize: LONGCARD;
VAR heapsize: LONGCARD;
*)



PROCEDURE SendMsg(type: INTEGER);
BEGIN
  msgbuf[0] := TDI_Question;
  msgbuf[1] := apId;
  msgbuf[2] := 0;
  msgbuf[3] := type;
  AESApplications.ApplWrite(accId, 16, ADR(msgbuf));
  REPEAT
    AESEvents.EventMessage(ADR(replybuf));
  UNTIL replybuf[0] = TDI_Answer;
END SendMsg;


PROCEDURE GetSystemOptions(VAR dump: BOOLEAN; VAR query: BOOLEAN; VAR xfer: BOOLEAN; VAR paths: SearchPathArray);
VAR i, j: CARDINAL;
    drv: CARDINAL;
    root: ARRAY[0..0] OF CHAR;
BEGIN
  IF accId >= 0 THEN
    (* FIXME: does not work with MP *)
    msgbuf[4] := INTEGER(LONGCARD(ADR(options)) DIV 65536);
    msgbuf[5] := INTEGER(ADR(options));
    SendMsg(5);
    dump := BOOLEAN(replybuf[3]);
    query := BOOLEAN(replybuf[4]);
    xfer := BOOLEAN(replybuf[5]);
    FOR i := 0 TO MaxPaths DO
      FOR j := 0 TO OptSearchPathLen - 1 DO
        paths[i][j] := options.paths[i * OptSearchPathLen + j];
      END;
    END;
  ELSE
    dump := TRUE;
    query := FALSE;
    FOR i := 0 TO MaxPaths DO
      paths[i][0] := 0C;
    END;
  END;
  root[0] := '\';
  FOR i := 0 TO MaxPaths DO
    IF paths[i][0] = 0C THEN
      GEMDOS.GetPath(paths[i], 0);
      IF paths[i][0] = 0C THEN
        paths[i] := 'A:\';
        GEMDOS.GetDrv(drv);
        (* XXX:
        paths[i][0] := CHR(ORD('A') + drv); *)
        CODE(07A41H, 0DA6EH, 0FFFAH, 0382EH, 0FFFEH, 0286EH, 00008H, 0C8FCH, 00032H, 01985H, 04000H);
      END;
    END;
    IF paths[i][1] <> ':' THEN
      Strings.Insert("A:", paths[i], 0);
      GEMDOS.GetDrv(drv);
      (* XXX:
      paths[i][0] := CHR(ORD('A') + drv); *)
      CODE(07A41H, 0DA6EH, 0FFFAH, 0382EH, 0FFFEH, 0286EH, 00008H, 0C8FCH, 00032H, 01985H, 04000H);
    END;
    j := Strings.Length(paths[i]);
    IF (j <= 2) OR (paths[i][j - 1] <> '\') THEN
      paths[i][j] := '\';
      paths[i][j + 1] := 0C;
    END;
    IF paths[i][2] <> '\' THEN
      Strings.Insert(root, paths[i], 2);
    END;
  END;
END GetSystemOptions;


PROCEDURE GetCompilerOptions(VAR reffiles: BOOLEAN; VAR listing: BOOLEAN; VAR heapsize: CARDINAL);
BEGIN
  IF accId >= 0 THEN
    SendMsg(3);
    reffiles := BOOLEAN(replybuf[3]);
    listing := BOOLEAN(replybuf[4]);
    heapsize := replybuf[5];
  ELSE
    reffiles := FALSE;
    listing := FALSE;
    heapsize := 0;
  END;
END GetCompilerOptions;


PROCEDURE GetLinkerOptions(VAR linkmap: BOOLEAN; VAR linkopt: BOOLEAN; VAR debugtable: BOOLEAN; VAR stacksize: LONGCARD);
BEGIN
  IF accId >= 0 THEN
    SendMsg(2);
    debugtable := BOOLEAN(replybuf[3]);
    linkopt := BOOLEAN(replybuf[4]);
    linkmap := BOOLEAN(replybuf[5]);
    stacksize := LONGCARD(CARDINAL(replybuf[6])) * 65536 + LONGCARD(CARDINAL(replybuf[7]));
  ELSE
    debugtable := FALSE;
    linkmap := FALSE;
    linkopt := FALSE;
    stacksize := 0;
  END;
END GetLinkerOptions;


BEGIN
  accId := AESApplications.ApplFind('M2OPTION');
END M2Option.
