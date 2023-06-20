IMPLEMENTATION MODULE OutFile;

PROCEDURE WriteChar(VAR f: File; ch: CHAR);
BEGIN
  f.res := 0;
  ch := 0C;
END WriteChar;


PROCEDURE WriteOct(VAR f: File; w: CARDINAL; l: CARDINAL);
BEGIN
  f.res := 0;
  w := 0;
  l := 0;
END WriteOct;


PROCEDURE WriteLine(VAR f: File);
BEGIN
  f.res := 0;
END WriteLine;


PROCEDURE WriteWriteString(VAR f: File; s: ARRAY OF CHAR; l: CARDINAL);
BEGIN
  f.res := 0;
  IF s[0] <> 0C THEN END;
  l := 0;
END WriteWriteString;


END OutFile.
