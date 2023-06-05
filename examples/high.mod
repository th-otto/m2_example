MODULE hello;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM IOChan IMPORT Flush;
FROM StdChans IMPORT StdOutChan;
FROM NumberIO IMPORT WriteCard;

TYPE
  String = ARRAY[0..127] OF CHAR;
  String2 = ARRAY[0..60] OF CHAR;

PROCEDURE test(s: ARRAY OF CHAR);
BEGIN
  WriteString("len: "); WriteCard(HIGH(s), 5); WriteString(" "); WriteString(s); WriteLn;
END test;

BEGIN
  test('');
  test('h');
  test('he');
  test('hel');
  test('hell');
  test('hello');
  WriteString('hello world');
  WriteLn;
  Flush(StdOutChan());
END hello.
