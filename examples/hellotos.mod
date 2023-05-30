MODULE hello;

FROM GEMDOS IMPORT ConWS;

TYPE
  String = ARRAY[0..127] OF CHAR;

BEGIN
  ConWS("hello, world" + CHR(13) + CHR(10));
END hello.
