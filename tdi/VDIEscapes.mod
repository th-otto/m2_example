IMPLEMENTATION MODULE VDIEscapes;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADR, ADDRESS;
FROM GEMVDIbase IMPORT PxyArrayType, CallVDI, SetContrl, contrl, intin, intout, ptsin, ptsout, parameterBlock, ADRintin, ADRintout, ADRptsin, ADRptsout, VDIWorkInType, VDIWorkOutType;
FROM GEMVDIbase IMPORT FilmNameType, FilmIndexType;

VAR i, h: INTEGER;


PROCEDURE InquireCharCells(handle: INTEGER; VAR rows, columns: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 1, handle);
  CallVDI();
  rows := intout[0];
  columns := intout[1];
END InquireCharCells;


PROCEDURE ExitAlphaMode(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 2, handle);
  CallVDI();
END ExitAlphaMode;


PROCEDURE EnterAlphaMode(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 3, handle);
  CallVDI();
END EnterAlphaMode;


PROCEDURE CursorUp(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 4, handle);
  CallVDI();
END CursorUp;


PROCEDURE CursorDown(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 5, handle);
  CallVDI();
END CursorDown;


PROCEDURE CursorRight(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 6, handle);
  CallVDI();
END CursorRight;


PROCEDURE CursorLeft(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 7, handle);
  CallVDI();
END CursorLeft;


PROCEDURE CursorHome(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 8, handle);
  CallVDI();
END CursorHome;


PROCEDURE EraseToEOS(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 9, handle);
  CallVDI();
END EraseToEOS;


PROCEDURE EraseToEOL(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 10, handle);
  CallVDI();
END EraseToEOL;


PROCEDURE CursorAddress(handle: INTEGER; row, column: INTEGER);
BEGIN
  SetContrl(5, 0, 2, 11, handle);
  intin[0] := row;
  intin[1] := column;
  CallVDI();
END CursorAddress;


PROCEDURE OutputText(handle: INTEGER; VAR str: ARRAY OF CHAR);
BEGIN
  h := HIGH(str);
  i := 0;
  LOOP
    IF (i > h) OR (str[i] = 0C) THEN EXIT END;
    intin[i] := ORD(str[i]);
    INC(i);
  END;
  IF i = 0 THEN RETURN END;
  SetContrl(5, 0, i, 12, handle);
  CallVDI();
END OutputText;


PROCEDURE ReverseVideoOn(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 13, handle);
  CallVDI();
END ReverseVideoOn;


PROCEDURE ReverseVideoOff(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 14, handle);
  CallVDI();
END ReverseVideoOff;


PROCEDURE InquireCursorAddress(handle: INTEGER; VAR row, column: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 15, handle);
  CallVDI();
  row := intout[0];
  column := intout[1];
END InquireCursorAddress;


PROCEDURE InquireTabletStatus(handle: INTEGER): INTEGER;
BEGIN
  SetContrl(5, 0, 0, 16, handle);
  CallVDI();
  RETURN intout[0];
END InquireTabletStatus;


PROCEDURE HardCopy(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 17, handle);
  CallVDI();
END HardCopy;


PROCEDURE DisplayCursor(handle: INTEGER; row, column: INTEGER);
BEGIN
  SetContrl(5, 1, 0, 18, handle);
  ptsin[0] := row;
  ptsin[1] := column;
  CallVDI();
END DisplayCursor;


PROCEDURE RemoveCursor(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 19, handle);
  CallVDI();
END RemoveCursor;


PROCEDURE FormAdvance(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 20, handle);
  CallVDI();
END FormAdvance;


PROCEDURE OutputWindow(handle: INTEGER; pxy: PxyArrayType);
BEGIN
  FOR i := 0 TO 3 DO
    ptsin[i] := pxy[i];
  END;
  SetContrl(5, 2, 0, 21, handle);
  CallVDI();
END OutputWindow;


PROCEDURE ClearDisplayList(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 22, handle);
  CallVDI();
END ClearDisplayList;


PROCEDURE OutputBitImageFile(
      handle:INTEGER;
      VAR fname: ARRAY OF CHAR;
      aspect: INTEGER;
      scaling: INTEGER;
      numPts: INTEGER;
      VAR frame: PxyArrayType);
BEGIN
  intin[0] := aspect;
  intin[1] := scaling;
  h := HIGH(fname);
  i := 0;
  LOOP
    IF (i > h) OR (fname[i] = 0C) THEN EXIT END;
    intin[i + 2] := ORD(fname[i]);
    INC(i);
  END;
  IF i = 0 THEN RETURN END;
  intin[i + 2] := 0;
  SetContrl(5, numPts, i + 3, 23, handle);
  CallVDI();
END OutputBitImageFile;


PROCEDURE SelectPalette(handle: INTEGER; palette: INTEGER): INTEGER;
BEGIN
  intin[0] := palette;
  SetContrl(5, 0, 1, 60, handle);
  CallVDI();
  RETURN intout[0];
END SelectPalette;


PROCEDURE InquirePaletteFilms(handle: INTEGER; VAR films: FilmNameType);
BEGIN
  SetContrl(5, 0, 0, 91, handle);
  CallVDI();
  FOR i := 0 TO HIGH(films) DO
    films[i] := CHR(intout[i]);
  END;
END InquirePaletteFilms;


PROCEDURE InquirePaletteState(handle: INTEGER; VAR port: INTEGER; VAR film: INTEGER; VAR lightness: INTEGER; VAR interlace: INTEGER; VAR planes: INTEGER; VAR indexes: FilmIndexType);
BEGIN
  SetContrl(5, 0, 0, 92, handle);
  CallVDI();
  port := intout[0];
  film := intout[1];
  lightness := intout[2];
  interlace := intout[3];
  planes := intout[4];
  FOR i := 5 TO 20 DO
    indexes[(i - 5) MOD 8][(i - 5) DIV 8] := intout[i];
  END;
END InquirePaletteState;


PROCEDURE SetPaletteState(handle: INTEGER; port: INTEGER; film: INTEGER; lightness: INTEGER; interlace: INTEGER; planes: INTEGER; VAR indexes: FilmIndexType);
BEGIN
  intin[0] := port;
  intin[1] := film;
  intin[2] := lightness;
  intin[3] := interlace;
  intin[4] := planes;
  FOR i := 0 TO 15 DO
    intin[i + 5] := indexes[i MOD 8][i DIV 8];
  END;
  SetContrl(5, 0, 21, 93, handle);
  CallVDI();
END SetPaletteState;


PROCEDURE SavePaletteState(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 94, handle);
  CallVDI();
END SavePaletteState;


PROCEDURE SuppressPaletteMessages(handle: INTEGER);
BEGIN
  SetContrl(5, 0, 0, 95, handle);
  CallVDI();
END SuppressPaletteMessages;


PROCEDURE PaletteErrorInquire(handle: INTEGER): INTEGER;
BEGIN
  SetContrl(5, 0, 0, 96, handle);
  CallVDI();
  RETURN intout[0];
END PaletteErrorInquire;


PROCEDURE UpdateMetafileExtents(handle: INTEGER; minx, miny, maxx, maxy: INTEGER);
BEGIN
  ptsin[0] := minx;
  ptsin[1] := miny;
  ptsin[2] := maxx; (* was: [1] *)
  ptsin[3] := maxy;
  SetContrl(5, 2, 0, 98, handle);
  CallVDI();
END UpdateMetafileExtents;


PROCEDURE WriteMetafile(handle: INTEGER; numIntin: INTEGER; VAR intin: ARRAY OF INTEGER; numPtsin: INTEGER; VAR ptsin: ARRAY OF INTEGER);
BEGIN
  parameterBlock[1] := ADR(intin);
  parameterBlock[2] := ADR(ptsin);
  SetContrl(5, numPtsin, numIntin, 99, handle);
  CallVDI();
  parameterBlock[1] := ADRintin;
  parameterBlock[2] := ADRptsin;
END WriteMetafile;


PROCEDURE ChangeFileName(handle: INTEGER; VAR fname: ARRAY OF CHAR);
BEGIN
  h := HIGH(fname);
  i := 0;
  LOOP
    IF (i > h) OR (fname[i] = 0C) THEN EXIT END;
    intin[i] := ORD(fname[i]);
    INC(i);
  END;
  IF i = 0 THEN RETURN END;
  intin[i] := 0;
  SetContrl(5, 0, i, 100, handle);
  CallVDI();
END ChangeFileName;


END VDIEscapes.
