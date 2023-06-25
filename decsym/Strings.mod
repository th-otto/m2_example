IMPLEMENTATION MODULE Strings;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)

FROM SYSTEM IMPORT ADR, CODE;

VAR terminator: CHAR;

CONST nop = 04E71H;


PROCEDURE InitStringModule();
BEGIN
  terminator := 0C;
END InitStringModule;


PROCEDURE Assign(VAR Dest: ARRAY OF CHAR; VAR Source: ARRAY OF CHAR);
VAR len: CARDINAL;
    i: INTEGER;
BEGIN
  CODE(nop); (* XXX *)
  len := Length(Source);
  IF len > HIGH(Dest) + 1 THEN
    len := HIGH(Dest) + 1;
  END;
  FOR i := 0 TO len - 1 DO
    Dest[i] := Source[i];
  END;
  IF len <= HIGH(Dest) THEN
    Dest[len] := terminator;
  END;
END Assign;


PROCEDURE Insert(VAR SubStr: ARRAY OF CHAR; VAR Str: ARRAY OF CHAR; Index: CARDINAL);
VAR sublen: CARDINAL;
    destlen: CARDINAL;
    pos: CARDINAL;
BEGIN
  CODE(nop); (* XXX *)
  sublen := Length(SubStr);
  CODE(nop); (* XXX *)
  destlen := Length(Str);
  IF (destlen + sublen < HIGH(Str)) AND (Index < destlen) THEN
    FOR pos := destlen + sublen TO Index + sublen BY -1 DO
      Str[pos] := Str[pos - sublen];
    END;
    FOR pos := 0 TO sublen - 1 DO
      Str[pos + Index] := SubStr[pos];
    END;
  END;
END Insert;


PROCEDURE Delete(VAR Str: ARRAY OF CHAR; Index: CARDINAL; Len: CARDINAL);
VAR destlen, i: CARDINAL;
BEGIN
  destlen := Length(Str);
  IF (Len = 0) OR (Index >= destlen) THEN
    RETURN;
  END;
  i := Index;
  WHILE destlen - Len > i DO
    Str[i] := Str[i + Len];
    INC(i);
  END;
  Str[i] := terminator;
END Delete;


PROCEDURE Copy(VAR Str: ARRAY OF CHAR; Index: CARDINAL; Len: CARDINAL; VAR Result: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i < Len) AND (Length(Str) - Index > i) AND (i <= HIGH(Result)) DO
    Result[i] := Str[i + Index];
    INC(i);
  END;
  IF i <= HIGH(Result) THEN
    Result[i] := terminator;
  END;
END Copy;


PROCEDURE Concat(VAR S1: ARRAY OF CHAR; VAR S2: ARRAY OF CHAR; VAR Result: ARRAY OF CHAR);
VAR s1len: CARDINAL;
    s2len: CARDINAL;
    dest: CARDINAL;
BEGIN
  CODE(nop); (* XXX *)
  s1len := Length(S1);
  CODE(nop); (* XXX *)
  s2len := Length(S2);
  IF s1len + s2len = 0 THEN
    Result[0] := terminator;
  ELSE
    IF s1len + s2len < HIGH(Result) + 2 THEN
      CODE(nop); (* XXX *)
      CODE(nop); (* XXX *)
      Assign(Result, S1);
      FOR dest := s1len TO s1len + s2len - 1 DO
        Result[dest] := S2[dest - s1len];
      END;
      Result[s1len + s2len] := terminator;
    END;
  END;
END Concat;


PROCEDURE Length(VAR Str: ARRAY OF CHAR): CARDINAL;
VAR i: CARDINAL;
BEGIN
  FOR i := 0 TO HIGH(Str) DO
    IF Str[i] = terminator THEN
      RETURN i;
    END;
  END;
  RETURN HIGH(Str) + 1;
END Length;


PROCEDURE Compare(VAR s1: ARRAY OF CHAR; VAR s2: ARRAY OF CHAR): CompareResults;
VAR i: CARDINAL;
  c1, c2: CHAR;
BEGIN
  i := 0;
  LOOP
    c1 := s1[i];
    c2 := s2[i];
    IF c1 = c2 THEN
      IF c1 = terminator THEN
        RETURN Equal;
      END;
      INC(i);
      IF i > HIGH(s1) THEN
        IF (i > HIGH(s2)) OR (s2[i] = terminator) THEN
          RETURN Equal;
        ELSE
          RETURN Less;
        END;
      ELSE
        IF i > HIGH(s2) THEN
          IF s1[i] = terminator THEN
            RETURN Equal;
          ELSE
            RETURN Greater;
          END;
        END;
      END;
    ELSE
      IF c1 > c2 THEN
        RETURN Greater;
      ELSE
        RETURN Less;
      END;
    END;
  END;
END Compare;


PROCEDURE Pos(VAR Source: ARRAY OF CHAR; VAR Match: ARRAY OF CHAR; Start: CARDINAL; VAR Where: CARDINAL): BOOLEAN;
VAR len: CARDINAL;
    patlen: CARDINAL;
    i: CARDINAL;
    end: CARDINAL;
BEGIN
  CODE(nop); (* XXX *)
  len := Length(Source);
  CODE(nop); (* XXX *)
  patlen := Length(Match);
  IF (len = 0) OR (patlen = 0) OR (Start + patlen > len) THEN
    Where := len;
    RETURN FALSE;
  END;
  end := len - patlen;
  LOOP
    i := 0;
    LOOP
      IF Match[i] <> Source[Start + i] THEN EXIT END;
      INC(i);
      IF i = patlen THEN
        Where := Start;
        RETURN TRUE;
      END;
    END;
    INC(Start);
    IF Start > end THEN
      Where := len;
      RETURN FALSE;
    END;
  END;
END Pos;


PROCEDURE SetTerminator(Ch: CHAR);
BEGIN
  terminator := Ch;
END SetTerminator;


PROCEDURE GetTerminator(): CHAR;
BEGIN
  RETURN terminator;
END GetTerminator;


BEGIN
  InitStringModule();
END Strings.
