MODULE hello;

FROM GEMDOS IMPORT ConWS;

BEGIN
   ConWS("hello TOS world" + CHR(13) + CHR(10));
END hello.
