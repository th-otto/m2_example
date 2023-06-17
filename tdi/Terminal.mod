IMPLEMENTATION MODULE Terminal;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)

FROM TermBase IMPORT DoStatus, DoRead, DoWrite;

VAR againCh: CHAR;
VAR again: BOOLEAN;

CONST BS  = 010C;
CONST LF  = 012C;
CONST CR  = 015C;
CONST ESC = 033C;
CONST DEL = 177C;


PROCEDURE Read(VAR ch: CHAR);
BEGIN
  REPEAT
    BusyRead(ch);
  UNTIL ch <> 0C;
END Read;


PROCEDURE BusyRead(VAR ch: CHAR);
BEGIN
  IF again THEN
    ch := againCh;
    again := FALSE;
  ELSE
    IF DoStatus() THEN
      DoRead(ch);
    ELSE
      ch := 0C;
    END;
    againCh := ch;
  END;
END BusyRead;


PROCEDURE ReadAgain();
BEGIN
  again := TRUE;
END ReadAgain;


PROCEDURE Write(ch: CHAR);
BEGIN
  DoWrite(ch);
END Write;


PROCEDURE WriteLn();
BEGIN
  DoWrite(CR);
  DoWrite(LF);
END WriteLn;


PROCEDURE WriteString(VAR str: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(str)) AND (str[i] <> 0C) DO
    Write(str[i]);
    INC(i);
  END;
END WriteString;


PROCEDURE ReadString(VAR str: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE i <= HIGH(str) DO
    Read(termCH);
    IF (termCH <> ' ') OR (i > 0) THEN
      IF (termCH = DEL) OR (termCH = BS) THEN
        IF i > 0 THEN
          DoWrite(ESC);
          DoWrite('D');
          DoWrite(' ');
          DoWrite(ESC);
          DoWrite('D');
          DEC(i);
        END;
      ELSE
        IF termCH <= ' ' THEN
          str[i] := 0C;
          RETURN;
        ELSE
          str[i] := termCH;
          Write(termCH);
          INC(i);
        END;
      END;
    END;
  END;
END ReadString;


BEGIN
  again := FALSE;
END Terminal.
