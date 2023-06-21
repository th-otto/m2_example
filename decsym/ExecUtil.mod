IMPLEMENTATION MODULE ExecUtil;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* short calls *)

IMPORT Buffers;
IMPORT AESGraphics;
IMPORT AESWindows;
IMPORT AESApplications;
IMPORT AESForms;
IMPORT AESShells;
IMPORT VDIControls;
IMPORT GEMDOS;
IMPORT Strings;
FROM SYSTEM IMPORT ADR, ADDRESS, REGISTER;
FROM AppBase IMPORT wdwHandle, vdiHandle, openStreams, StreamType, shellTail, x162ac, apId;
FROM GEMAESbase IMPORT Arrow, MouseOn, MouseOff, WorkXYWH, CurrXYWH;

CONST EDITOR = 'EDITOR.PRG';
CONST LINKER = 'LINKER.PRG';

VAR x167fc: LONGCARD;
VAR x16800: ADDRESS;
VAR x16804: CARDINAL;
VAR terminated: BOOLEAN;

PROCEDURE FreeBuffers();
BEGIN
  Buffers.FreeAll();
END FreeBuffers;


PROCEDURE Terminate();
VAR x, y, w, h: INTEGER;
BEGIN
  IF terminated THEN RETURN END;
  AESGraphics.GrafMouse(MouseOff, NIL);
  IF wdwHandle >= 0 THEN
    AESWindows.WindowGet(wdwHandle, CurrXYWH, x, y, w, h);
    AESGraphics.GrafShrinkBox(10, 25, 1, 1, x, y, w, h);
    AESWindows.WindowClose(wdwHandle);
    AESWindows.WindowDelete(wdwHandle);
  END;
  IF vdiHandle >= 0 THEN
    VDIControls.CloseVirtualWorkstation(vdiHandle);
  END;
  AESGraphics.GrafMouse(MouseOn, NIL);
  AESApplications.ApplExit();
  terminated := TRUE;
END Terminate;


PROCEDURE ReplaceExtension(VAR filename: ARRAY OF CHAR; VAR (* REF *) newExt: ARRAY OF CHAR);
VAR i, namePos: CARDINAL;
BEGIN
  i := 0;
  namePos := 0;
  WHILE (i <= HIGH(filename)) AND (filename[i] <> 0C) DO
    IF filename[i] = '\' THEN
      namePos := i + 1;
    END;
    INC(i);
  END;
  i := namePos;
  WHILE (i <= HIGH(filename)) AND (filename[i] <> 0C) AND (filename[i] <> '.') AND ((i - namePos) < 8) DO
    INC(i);
  END;
  IF HIGH(filename) - HIGH(newExt) - 2 < i THEN RETURN END;
  IF filename[i] <> '.' THEN
    filename[i] := '.';
  END;
  FOR namePos := 0 TO HIGH(newExt) DO
    INC(i);
    filename[i] := newExt[namePos];
  END;
  IF i < HIGH(filename) THEN
    filename[i + 1] := 0C;
  END;
END ReplaceExtension;


PROCEDURE RunCmd(VAR (* REF *) cmd: ARRAY OF CHAR; VAR (* REF *) tail: ARRAY OF CHAR);
BEGIN
  AESShells.ShellWrite(1, 1, 1, ADR(cmd), ADR(tail));
END RunCmd;


PROCEDURE OpenStream();
VAR where: CARDINAL;
    handle: INTEGER;
BEGIN
  IF (xrf IN openStreams) OR (erm IN openStreams) THEN
    RunCmd(EDITOR, shellTail);
  ELSE
    IF Strings.Pos(shellTail, '.MOD', 0, where) THEN
      ReplaceExtension(shellTail, 'DEF');
      GEMDOS.Open(shellTail, 0, handle);
      IF handle < 0 THEN
        ReplaceExtension(shellTail, 'LNK');
        RunCmd(LINKER, shellTail);
      ELSE
        IF GEMDOS.Close(handle) THEN END;
        RunCmd(EDITOR, '');
      END;
    ELSE
      ReplaceExtension(shellTail, 'MOD');
      RunCmd(EDITOR, shellTail);
    END;
  END;
END OpenStream;


PROCEDURE IOError(n: CARDINAL; error: BOOLEAN);
VAR button: INTEGER;
    which: ARRAY [0..79] OF CHAR;
    strbuf: ARRAY [0..79] OF CHAR;
TYPE frame = RECORD call: PROC; END;
     frameptr = POINTER TO frame;
 VAR p: frameptr;
    
  PROCEDURE RunProgram();
  BEGIN
    IF (ttp IN openStreams) AND (NOT error) THEN
      ReplaceExtension(shellTail, 'PRG');
      RunCmd('EXEC.PRG', shellTail);
    ELSE
      x162ac := FALSE;
    END;
  END RunProgram;

  PROCEDURE RunCompiler();
  BEGIN
    IF NOT error THEN
      RunCmd('MODULA.PRG', shellTail);
    ELSE
      x162ac := FALSE;
    END;
  END RunCompiler;
  
BEGIN
  FreeBuffers();
  AESGraphics.GrafMouse(Arrow, NIL);
  IF x162ac THEN
    CASE n OF
      0: OpenStream();
    | 1: RunProgram();
    | 3: RunCompiler();
    | ELSE RunCmd(EDITOR, '');
    END;
  END;
  IF error AND (NOT x162ac) THEN
    CASE n OF
      0: which := 'compilation';
    | 1: which := 'linking';
    | 2: which := 'debugging';
    | 3: which := 'editing';
    | 4: which := 'utility program';
    | ELSE which := 'Modula Product';
    END;
    Strings.Concat('[1][Error(s) occured during|', which, strbuf);
    Strings.Concat(strbuf, '][  OK  ]', which);
    button := AESForms.FormAlert(1, which);
  END;
  Terminate();
  
  (* WTF? *)
  p := REGISTER(13) - 40;
  p^.call();
END IOError;


BEGIN
  x16804 := 0;
  x167fc := 0;
  x16800 := NIL;
  apId := AESApplications.ApplInitialise();
  terminated := FALSE;
END ExecUtil.
