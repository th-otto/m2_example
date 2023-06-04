IMPLEMENTATION MODULE ResCtrl;

FROM SYSTEM IMPORT ADDRESS, ADR, TSIZE, BYTE;

FROM MOSCtrl IMPORT RemovalRoot, RemovalEntry, RemovalList, GetPDB, PDB, PtrPDB;

FROM MOSGlobals IMPORT MemArea;


PROCEDURE CatchRemoval ( VAR hdl: RemovalCarrier; info: RemovalProc; wsp: MemArea );
VAR next, prev: RemovalList;
BEGIN
  hdl.next := NIL;
  hdl.call := info;
  hdl.wsp := wsp;
  next := ADR(RemovalRoot);
  prev := next^.prev;
  hdl.next := next;
  hdl.prev := prev;
  prev^.next := ADR(hdl);
  next^.prev := ADR(hdl);
END CatchRemoval;


PROCEDURE Resident (): BOOLEAN;
VAR pdb: PtrPDB;
    process: ADDRESS;
BEGIN
  GetPDB(pdb, process);
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

END ResCtrl.
