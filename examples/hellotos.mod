MODULE hello;

FROM GEMDOS IMPORT ConWS;

TYPE
  String = ARRAY[0..127] OF CHAR;

VAR t: String;

BEGIN
  t := "hello, world" + CHR(13) + CHR(10);
  ConWS(t);
END hello.
