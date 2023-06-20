IMPLEMENTATION MODULE Program;

PROCEDURE Call(s: ARRAY OF CHAR; f: BOOLEAN; VAR err: Status);
BEGIN
  IF s[0] <> 0C THEN END;
  IF f THEN END;
  err := 0;
END Call;

END Program.
