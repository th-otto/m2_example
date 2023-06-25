IMPLEMENTATION MODULE AppWindow;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT CODE;
IMPORT AppBase;
IMPORT AESGraphics;
IMPORT AESWindows;
FROM SYSTEM IMPORT ADR, ADDRESS;
FROM GEMAESbase IMPORT MouseOff, MouseOn, HourGlass, Name, WorkXYWH, WindowName, White, BeginUpdate, EndUpdate;
FROM GEMVDIbase IMPORT VDIWorkInType, VDIWorkOutType, PxyArrayType, BigPxyArrayType;
IMPORT VDIControls;
IMPORT VDIAttribs;
IMPORT VDIOutputs;
IMPORT VDIRasters;

VAR wchar, hchar, wbox, hbox: INTEGER;
VAR workx, worky, workw, workh: INTEGER;
VAR cursorX, cursorY: INTEGER;
VAR winrows: INTEGER;

CONST MAXROWS = 24;
VAR screenBuffer: ARRAY[1..MAXROWS] OF ARRAY[16..65] OF CHAR; (* WTF? *)
VAR lineLength: ARRAY[1..MAXROWS] OF CARDINAL;
VAR windowtitle: ARRAY[0..39] OF CHAR;


CONST nop = 04E71H;


PROCEDURE mouseOn(on: BOOLEAN);
BEGIN
  IF on THEN
    AESGraphics.GrafMouse(MouseOn, NIL);
  ELSE
    AESGraphics.GrafMouse(MouseOff, NIL);
  END;
END mouseOn;


PROCEDURE WriteString(VAR text: ARRAY OF CHAR);
VAR unused: CARDINAL;
  i: CARDINAL;
BEGIN
  mouseOn(FALSE);
  CODE(nop); (* XXX *)
  VDIOutputs.GraphicText(AppBase.vdiHandle, cursorX * wchar + workx, cursorY * hchar + worky, text);
  i := 0;
  WHILE (i <= HIGH(text)) AND (text[i] <> 0C) DO
    IF CARDINAL(cursorX) + i >= 16 THEN
      screenBuffer[cursorY][CARDINAL(cursorX) + i] := text[i];
    END;
    INC(i);
  END;
  INC(cursorX, i);
  mouseOn(TRUE);
END WriteString;


PROCEDURE WriteLn();
VAR sourceMem: ADDRESS;
    destMem: ADDRESS;
    pxy: BigPxyArrayType;
    rect: PxyArrayType;
    i: CARDINAL;
    len: CARDINAL;
BEGIN
  lineLength[cursorY] := cursorX - 1;
  IF cursorY >= winrows THEN
    len := lineLength[1];
    FOR i := 2 TO winrows DO
      IF lineLength[i] > len THEN
        len := lineLength[i];
      END;
      lineLength[i - 1] := lineLength[i];
      screenBuffer[i - 1] := screenBuffer[i];
    END;
    sourceMem := ADDRESS(0);
    destMem := ADDRESS(0);
    pxy[0] := workx + wchar;
    pxy[1] := worky + hchar;
    pxy[2] := INTEGER(len + 1) * wchar + workx;
    pxy[3] := worky + workh;
    pxy[4] := workx + wchar;
    pxy[5] := worky;
    pxy[6] := pxy[2];
    pxy[7] := pxy[3] - hchar;
    mouseOn(FALSE);
    VDIRasters.CopyRasterOpaque(AppBase.vdiHandle, 3, pxy, ADR(sourceMem), ADR(destMem));
    rect[0] := workx + wchar;
    rect[1] := (winrows - 1) * hchar + worky + 1;
    rect[2] := INTEGER(lineLength[winrows] + 1) * wchar + workx; (* BUG: winrows maybe large than MAXROWS *)
    rect[3] := rect[1] + hchar - 1;
    VDIOutputs.FillRectangle(AppBase.vdiHandle, rect);
    mouseOn(TRUE);
    FOR i := 16 TO 65 DO
      screenBuffer[winrows][i] := 0C;
    END;
    lineLength[winrows] := 0;
  ELSE
    INC(cursorY);
  END;
  cursorX := 1;
END WriteLn;


PROCEDURE initWin();
VAR i: INTEGER;
    workin: VDIWorkInType;
    workout: VDIWorkOutType;
    w, h: INTEGER;
BEGIN
  AppBase.vdiHandle := AESGraphics.GrafHandle(wchar, hchar, wbox, hbox);
  FOR i := 0 TO 9 DO
    workin[i] := 1;
  END;
  workin[10] := 2;
  VDIControls.OpenVirtualWorkstation(workin, AppBase.vdiHandle, workout);
  mouseOn(FALSE);
  w := workout[0];
  h := workout[1];
  AppBase.wdwHandle := AESWindows.WindowCreate(Name, 10, 25, w - 20, h - 32);
  AESGraphics.GrafGrowBox(10, 25, 1, 1, 10, 25, w - 20, h - 32);
  AESWindows.WindowOpen(AppBase.wdwHandle, 10, 25, w - 20, h - 32);
  AESWindows.WindowGet(AppBase.wdwHandle, WorkXYWH, workx, worky, workw, workh);
  winrows := workh DIV hchar;
  windowtitle := ' Modula-2/ST     Release 3.00a ';
  AESWindows.WindowSet(AppBase.wdwHandle, WindowName, INTEGER(LONGCARD(ADR(windowtitle)) DIV 65536), INTEGER(LONGCARD(ADR(windowtitle)) MOD 65536), 0, 0);
  i := VDIAttribs.SetFillInteriorStyle(AppBase.vdiHandle, 1);
  i := VDIAttribs.SetFillColour(AppBase.vdiHandle, White);
  VDIAttribs.SetGraphicTextAlignment(AppBase.vdiHandle, 0, 3, i, i);
  Clear();
  WriteLn();
  mouseOn(TRUE);
END initWin;


PROCEDURE Clear();
VAR rect: PxyArrayType;
VAR x, y: INTEGER;
BEGIN
  rect[0] := workx;
  rect[1] := worky;
  rect[2] := workx + workw;
  rect[3] := worky + workh;
  VDIOutputs.FillRectangle(AppBase.vdiHandle, rect);
  FOR y := 1 TO MAXROWS DO
    lineLength[y] := 0;
    FOR x := 16 TO 65 DO
      screenBuffer[y][x] := 0C;
    END;
  END;
  cursorX := 1;
  cursorY := 1;
END Clear;


PROCEDURE updateWindow();
VAR x, y: INTEGER;
VAR rect: PxyArrayType;
BEGIN
  mouseOn(FALSE);
  AESWindows.WindowUpdate(BeginUpdate);
  rect[0] := wchar * 16 + workx; (* XXX patched *)
  rect[1] := worky;
  rect[2] := workx + workw;
  rect[3] := worky + workh;
  VDIOutputs.FillRectangle(AppBase.vdiHandle, rect);
  x := wchar * 16 + workx; (* XXX patched *)
  FOR y := 1 TO winrows DO
    VDIOutputs.GraphicText(AppBase.vdiHandle, x, y * hchar + worky, screenBuffer[y]);
  END;
  AESWindows.WindowUpdate(EndUpdate);
  mouseOn(TRUE);
END updateWindow;


BEGIN
  AESGraphics.GrafMouse(HourGlass, NIL);
  initWin();
  AppBase.doUpdateWindow := updateWindow;
END AppWindow.
