IMPLEMENTATION MODULE Filepool;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* short calls *)

VAR fileid: INTEGER;
VAR names: ARRAY[0..9] OF Poolname;

PROCEDURE PoolAlloc(name: Poolname): INTEGER;
BEGIN
  INC(fileid);
  names[fileid] := name;
  RETURN fileid;
END PoolAlloc;

BEGIN
  fileid := 0;
END Filepool.
