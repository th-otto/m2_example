IMPLEMENTATION MODULE PathEnv;
#define REF

FROM SYSTEM IMPORT ADDRESS;
FROM MOSGlobals IMPORT PathStr, FileStr;
IMPORT Strings;

PROCEDURE ReplaceHome ( VAR pathOrName: ARRAY OF CHAR );
VAR idx: CARDINAL;
BEGIN
  Strings.Capitalize (pathOrName);
  idx := ORD (pathOrName[0] = '?'); (* FSelSymbol *)
  IF pathOrName[idx] = HomeSymbol THEN
    Strings.Delete (pathOrName, idx, 1);
    IF pathOrName[idx] = '\' THEN
      (* um aus "*\DAT" nicht "D:\\DAT" zu machen *)
      Strings.Delete (pathOrName, idx, 1);
    END;
    Strings.Insert (HomePath, idx, pathOrName)
  END;
END ReplaceHome;


PROCEDURE HomeReplaced ( REF pathOrName: ARRAY OF CHAR ): FileStr;
VAR s: FileStr;
BEGIN
  Strings.Assign (s, pathOrName);
  ReplaceHome (s);
  RETURN s
END HomeReplaced;


(*
 * Diese Prozedur kann auf 'SelectFile' zugewiesen werden. Sie kehrt
 * immer sofort zurueck und setzt 'ok' auf FALSE, so dass praktisch "?"
 * in Pathlisten ignoriert werden.
 *)
PROCEDURE NoSelect (VAR label: ARRAY OF CHAR; VAR a,b:ARRAY OF CHAR; VAR c:BOOLEAN);
BEGIN
  IF label[0] = 0C THEN END;
  a[0] := 0C;
  b[0] := 0C;
  c := FALSE;
END NoSelect;


BEGIN
  IF ADDRESS(SelectFilePtr) = NIL THEN
    (* wenn nicht NIL, wurde Wert von GEMEnv-EnvelopeProc schon gesetzt *)
    SelectFilePtr := NoSelect
  END;
  HomePath := ''
END PathEnv.
