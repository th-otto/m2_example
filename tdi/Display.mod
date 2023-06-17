IMPLEMENTATION MODULE Display;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT CODE, PUSH, REGISTER;

CONST TRAP1 = 04E41H;


PROCEDURE Write(ch: CHAR);
BEGIN
  PUSH(ORD(ch));
  PUSH(2); (* Cconout *)
  CODE(TRAP1);
END Write;


END Display.
