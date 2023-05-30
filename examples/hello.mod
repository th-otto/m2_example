MODULE hello;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM IOChan IMPORT Flush;
FROM StdChans IMPORT StdOutChan;
FROM NumberIO IMPORT WriteCard;

TYPE
  String = ARRAY[0..127] OF CHAR;
  String2 = ARRAY[0..60] OF CHAR;

PROCEDURE test(VAR s: ARRAY OF CHAR);
BEGIN
  WriteString("len: "); WriteCard(HIGH(s), 5); WriteString(" "); WriteString(s); WriteLn;
END test;

VAR t: String;
VAR t2: String2;

BEGIN
  t := '';
  test(t);
  t := 'h';
  test(t);
  t := 'he';
  test(t);
  t := 'hel';
  test(t);
  t := 'hell';
  test(t);
  t2 := 'hello';
  test(t2);
  WriteString('hello world');
  WriteLn;
  Flush(StdOutChan());
END hello.
