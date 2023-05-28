MODULE hello;

FROM StrIO IMPORT WriteString, WriteLn ;
FROM IOChan IMPORT Flush;
FROM StdChans IMPORT StdOutChan;

BEGIN
   WriteString ('hello world');
   WriteLn;
   Flush(StdOutChan());
END hello.
