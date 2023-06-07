IMPLEMENTATION MODULE ResCtrl;

FROM SYSTEM IMPORT ADDRESS, ADR, TSIZE, BYTE;

IMPORT MOSCtrl;

IMPORT MOSGlobals;


PROCEDURE Resident (): BOOLEAN;
VAR pdb: MOSCtrl.PtrPDB;
    process: ADDRESS;
BEGIN
  MOSCtrl.GetPDB(pdb, process);
  IF pdb <> NIL THEN
    RETURN pdb^.resident;
  END;
  RETURN FALSE;
END Resident;


PROCEDURE Private ( n: CARDINAL; VAR d: ARRAY OF BYTE );
BEGIN
  n := 0;
  IF d[0] <> 0 THEN END;
END Private;

BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END ResCtrl.
