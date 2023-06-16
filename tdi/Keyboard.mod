IMPLEMENTATION MODULE Keyboard;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT CODE, PUSH, REGISTER;

CONST TRAP1 = 04E41H;

(*
   KeyPressed - returns TRUE if a character can be read from StdIn
                without blocking the caller.
*)
PROCEDURE Status(): BOOLEAN;
BEGIN
  PUSH(11); (* Cconis *)
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0)) <> 0;
END Status;

    
(*
   Read - reads a character from StdIn. If necessary it will wait
          for a key to become present on StdIn.
*)
PROCEDURE Read(VAR ch: CHAR);
BEGIN
  PUSH(8); (* Cnecin *)
  CODE(TRAP1);
  ch := CHR(INTEGER(LONGCARD(REGISTER(0))));
END Read;


END Keyboard.
