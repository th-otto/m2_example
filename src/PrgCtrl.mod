IMPLEMENTATION MODULE PrgCtrl; (* V#053 *)

(*
  23.10.88: GetBasePageAddr holt sich BP-Ptr aus ProcessID des TOS und
              nicht mehr ueber GetPDB.
  15.01.89: Accessory nach 23.10.88 wieder korrekt.
  23.01.89: Accessory kommt auch mit residenten Prgs klar.
  17.01.94: TermProcess ruft nun Pterm aus MOSCtrl auf.
  02.06.23: Port to gm2
*)

FROM SYSTEM IMPORT ADR, ADDRESS, TSIZE;

FROM MOSGlobals IMPORT MemArea, IllegalCall;

IMPORT MOSCtrl;
FROM MOSCtrl IMPORT ProcessID, GetPDB, PtrPDB, TermEntry, EnvEntry, ModLevel, PDB,
      ExitCode, ActMOSProcess, EnvRoot, Pterm, TermList, EnvList;
FROM ErrBase IMPORT TRAP6, TRAP6_SELF, TRAP6_CONT;

(* ! Storage darf nicht importiert werden ! *)


PROCEDURE TermProcess ( exitCode: INTEGER );
BEGIN
  Pterm(exitCode);
END TermProcess;


PROCEDURE CatchProcessTerm ( VAR hdl: TermCarrier; call: PROC; wsp: MemArea );
VAR pdb: PtrPDB;
    dummy: ADDRESS;
    oldHdl: TermList;
BEGIN
  GetPDB(pdb, dummy);
  IF pdb = NIL THEN
    TRAP6(IllegalCall);
  ELSE
    oldHdl := pdb^.termProcs;
    pdb^.termProcs := ADR(hdl);
    hdl.next := oldHdl;
    hdl.call := call;
    hdl.wsp := wsp;
  END;
END CatchProcessTerm;


PROCEDURE SetEnvelope ( VAR hdl: EnvlpCarrier; call: EnvlpProc; wsp: MemArea );
VAR prev: EnvList;
BEGIN
  hdl.next := ADR(EnvRoot);
  prev := EnvRoot.prev;
  hdl.prev := prev;
  prev^.next := ADR(hdl);
  EnvRoot.prev := ADR(hdl);
  hdl.level := 0;
  hdl.call := call;
  hdl.wsp := wsp;
END SetEnvelope;


PROCEDURE SysSetEnvelope (VAR hdl: EnvlpCarrier; call: EnvlpProc; wsp: MemArea);
BEGIN
  SetEnvelope(hdl, call, wsp);
  DEC(hdl.level); (* level:= -1 *)
END SysSetEnvelope;


PROCEDURE RemoveEnvelope ( VAR hdl: EnvlpCarrier );
VAR next, prev: EnvList;
BEGIN
  next := hdl.next;
  prev := hdl.prev;
  next^.prev := prev;
  prev^.next := next;
END RemoveEnvelope;


PROCEDURE GetBasePageAddr ( VAR bpp: ADDRESS );
BEGIN
  bpp := ActMOSProcess;
END GetBasePageAddr;


PROCEDURE ActiveProcess (): ADDRESS;
BEGIN
  RETURN MOSCtrl.ProcessID^;
END ActiveProcess;


PROCEDURE BaseProcess (): ADDRESS;
BEGIN
  RETURN MOSCtrl.BaseProcess;
END BaseProcess;


PROCEDURE ProcessLinked (): BOOLEAN;
BEGIN
  RETURN ModLevel <= 1;
END ProcessLinked;


PROCEDURE Accessory (): BOOLEAN;
BEGIN
  RETURN (ActMOSProcess = NIL) OR (ActMOSProcess^.p_bbase = NIL);
END Accessory;


PROCEDURE ProcessState (): PState;
VAR pdb: PtrPDB;
    dummy: ADDRESS;
BEGIN
  GetPDB(pdb, dummy);
  RETURN PState(pdb^.processState);
END ProcessState;


PROCEDURE CurrentExitCode (): INTEGER;
BEGIN
  RETURN ExitCode;
END CurrentExitCode;


PROCEDURE SetNewExitCode ( i: INTEGER );
BEGIN
  ExitCode := i;
END SetNewExitCode;


END PrgCtrl.
