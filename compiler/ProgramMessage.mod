IMPLEMENTATION MODULE ProgramMessage;

FROM Program IMPORT Status;

PROCEDURE WriteStatus(s: Status);
BEGIN
  IF s <> normal THEN END;
END WriteStatus;

END ProgramMessage.
