IMPLEMENTATION MODULE Strings;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)

FROM SYSTEM IMPORT ADR;

VAR terminator: CHAR;


PROCEDURE InitStringModule();
BEGIN
  terminator := 0C;
END InitStringModule;


PROCEDURE Length(VAR Str: ARRAY OF CHAR): CARDINAL;
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(Str)) AND (Str[i] <> terminator) DO
    INC(i);
  END;
  RETURN i;
END Length;


PROCEDURE Assign(VAR Dest: ARRAY OF CHAR; VAR Source: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(Source)) AND (i <= HIGH(Dest)) AND (Source[i] <> terminator) DO
    Dest[i] := Source[i];
    INC(i);
  END;
  IF i <= HIGH(Dest) THEN
    Dest[i] := terminator;
  END;
END Assign;


PROCEDURE Insert(VAR SubStr: ARRAY OF CHAR; VAR Str: ARRAY OF CHAR; Index: CARDINAL);
VAR destlen: CARDINAL;
    sublen: CARDINAL;
    pos: CARDINAL;
BEGIN
  sublen := Length(SubStr);
  destlen := Length(Str);
  IF (sublen = 0) OR (Index > destlen) THEN
    RETURN;
  END;
  pos := destlen + sublen;
  IF pos > HIGH(Str) THEN
    DEC(pos);
    IF pos > HIGH(Str) THEN
      RETURN;
    END;
  END;
  WHILE Index + sublen <= pos DO
    Str[pos] := Str[pos - sublen];
    DEC(pos);
  END;
  FOR pos := 0 TO sublen - 1 DO
    Str[pos + Index] := SubStr[pos];
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
    src: CARDINAL;
BEGIN
  dest := 0;
  s1len := Length(S1);
  s2len := Length(S2);
  IF ADR(S2) = ADR(Result) THEN
    Insert(S1, S2, 0);
    RETURN;
  END;
  WHILE (dest < s1len) AND (dest <= HIGH(Result)) DO
    Result[dest] := S1[dest];
    INC(dest);
  END;
  src := 0;
  WHILE (dest <= HIGH(Result)) AND (src < s2len) DO
    Result[dest] := S2[src];
    INC(dest);
    INC(src);
  END;
  IF dest <= HIGH(Result) THEN
    Result[dest] := terminator;
  END;
END Concat;


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
VAR i, len: CARDINAL;
BEGIN
  len := Length(Source);
  Where := Start;
  WHILE Where < len DO
    i := 0;
    LOOP
      IF (i > HIGH(Match)) OR (Match[i] = terminator) THEN
        RETURN TRUE;
      ELSE
        IF (i + Where < len) AND (Source[i + Where] = Match[i]) THEN
          INC(i);
        ELSE
          EXIT;
        END;
      END;
    END;
    INC(Where);
  END;
  RETURN FALSE;
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
