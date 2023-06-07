IMPLEMENTATION MODULE MOSSupport;

(*
  14.02.92 TT:  CallSuper, ToSuper, ToUser neu.
  06.06.23 THO: Port to gm2
*)

FROM GEMDOS IMPORT Super;



PROCEDURE ToSuper(): INTEGER32;
VAR oldsp: INTEGER32;
BEGIN
  oldsp := 0;
  IF Super(1) <> -1 THEN
    oldsp := Super(0);
  END;
  RETURN oldsp;
END ToSuper;


PROCEDURE ToUser(oldsp: INTEGER32);
BEGIN
  IF oldsp <> 0 THEN
    Super(oldsp);
  END;
END ToUser;


PROCEDURE CallSuper(p: SuperExecProc): [ INTEGER32 ];
VAR oldsp: INTEGER32;
r: INTEGER32;
BEGIN
  oldsp := ToSuper();
  r := p();
  ToUser(oldsp);
  RETURN r;
END CallSuper;

END MOSSupport.
