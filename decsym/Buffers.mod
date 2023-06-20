IMPLEMENTATION MODULE Buffers;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

(* seems to be unused *)

FROM SYSTEM IMPORT ADDRESS;
IMPORT GEMDOS;

VAR bufptr: ADDRESS;
VAR count: INTEGER;
VAR buffers: ARRAY[0..10] OF ADDRESS;


PROCEDURE FreeAll();
BEGIN
  WHILE count >= 0 DO
    IF buffers[count] <> NIL THEN
      IF GEMDOS.Free(buffers[count]) THEN
        buffers[count] := NIL;
      END;
    END;
    DEC(count);
  END;
  bufptr := NIL;
END FreeAll;


BEGIN
  count := -1;
END Buffers.
