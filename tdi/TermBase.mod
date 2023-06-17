IMPLEMENTATION MODULE TermBase;

FROM Keyboard IMPORT Read, Status;
FROM Display IMPORT Write;

BEGIN
  DoRead := Read;
  DoWrite := Write;
  DoStatus := Status;
END TermBase.
