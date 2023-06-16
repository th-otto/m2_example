IMPLEMENTATION MODULE ASCII;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)


PROCEDURE CharIsPrintable(ch: CHAR): BOOLEAN;
BEGIN
  IF (ch >= 040C) AND (ch <= 0176C) THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END;
END CharIsPrintable;


PROCEDURE CharIsControl(ch: CHAR): BOOLEAN;
BEGIN
  IF ((ch >= 0C) AND (ch <= 037C)) OR (ch = DEL) THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END;
END CharIsControl;


PROCEDURE CharIsASCII(ch: CHAR): BOOLEAN;
BEGIN
  IF CharIsPrintable(ch) OR CharIsControl(ch) THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END;
END CharIsASCII;


END ASCII.
