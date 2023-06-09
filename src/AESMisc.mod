IMPLEMENTATION MODULE AESMisc;
#define REF

(*  MEGAMAX MODULA 2 GEM-Library :  Verschiedene AES Funktionen         *
 *                                                                      *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87            *
 *                                                                      *
 *  Version   2.2     V#0051                                            *)

(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  14.01.88    | Erweiterung um 'ShellGet' und 'ShellPut'
 *  26.07.88    | 'getNoElements' liefert jetzt 'HIGH (..) + 1', statt
 *              | 'HIGH (..)'
 *  20.08.89    | 'SelectFileExteded' def. + impl.
 *  08.09.89 TT | 'ShellFind' korrigiert; kein Ueberlauf bei ShellRead;
 *                ShellRead/Write konvertieren Laengenbyte bei TAIL (cmdline);
 *                ShellWrite hat nicht mehr den 3. Parameter f. Wahl, ob
 *                Prg als Sub-Prozess oder nach Prg-Ende gestartet werden soll.
 *  ???????? TT | REF-Parm.
 *  02.04.90    | Anpassung auf public arrays
 *  17.01.94 TT | FindApplication korrigiert (jetzt Null-Byte hinter Namen).
 *  30.05.23 THO| Port to gm2
 *)


FROM    SYSTEM  IMPORT BYTE, CARDINAL32, SHIFT, ADR;
FROM Strings IMPORT Delete, Insert;

IMPORT GEMOps;
FROM GEMShare IMPORT our_cb, stringIntoCFormat, stringFromCFormat, aes_if, testINTOUT0;
FROM GEMGlobals IMPORT MaxStr, PtrMaxStr;
IMPORT MOSGlobals;
FROM AESScraps IMPORT ScrapRead, ScrapWrite;
IMPORT AESShells;


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;



(*  getNoElements -- geg.: 'high'=HIGH(...) und 'userNo' Angabe ueber Anzahl  *
 *                         zu benutzender Elemente.                          *
 *                   ges.: 'D0=userNo', falls '(userNo<high) und (userNo#0)'
 *                         'D0=high + 1'  , sonst.
 *)

PROCEDURE getNoElements(high,userNo:CARDINAL): CARDINAL;
BEGIN
  INC(high);
  IF (userNo = 0) OR (high < userNo) THEN userNo := high; END;
  RETURN userNo;
END getNoElements;


(*  Application Manager  *)
(*  ===================  *)

PROCEDURE ReadFromAppl(id:CARDINAL;VAR buffer:ARRAY OF BYTE;noBytes:CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[1] := getNoElements(HIGH(buffer), noBytes);
  our_cb^.pubs.aINTIN[0] := id;
  our_cb^.pubs.ADDRIN[0] := ADR(buffer);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_READ, 2, 1, 1));
  testINTOUT0();
END ReadFromAppl;


PROCEDURE WriteToAppl(id:CARDINAL; REF message:ARRAY OF BYTE; noBytes: CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[1] := getNoElements(HIGH(message), noBytes);
  our_cb^.pubs.aINTIN[0] := id;
  our_cb^.pubs.ADDRIN[0] := ADR(message);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_WRITE, 2, 1, 1));
  testINTOUT0();
END WriteToAppl;


PROCEDURE FindApplication(REF fname:ARRAY OF CHAR;
                          VAR id:CARDINAL;VAR success:BOOLEAN);
VAR i, len: CARDINAL;
    name: ARRAY[0..8] OF CHAR;
BEGIN
  len := HIGH(fname);
  IF len > 7 THEN len := 7; END;
  i := 0;
  LOOP
    name[i] := fname[i];
    INC(i);
    IF len = 0 THEN EXIT END;
    DEC(len);
  END;
  LOOP
    IF i = 8 THEN EXIT END;
    name[i] := ' ';
    INC(i);
  END;
  name[8] := 0C;
  our_cb^.pubs.ADDRIN[0] := ADR(name);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_FIND, 0, 1, 1));
  id := our_cb^.pubs.aINTOUT[0];
  success := our_cb^.pubs.aINTOUT[0] >= 0;
END FindApplication;


PROCEDURE PlayEvents (REF buffer:ARRAY OF RecordedEvent; no:CARDINAL;
                      scale:CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[0] := getNoElements(HIGH(buffer), no);
  our_cb^.pubs.aINTIN[1] := scale;
  our_cb^.pubs.ADDRIN[0] := ADR(buffer);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_TPLAY, 2, 1, 1));
END PlayEvents;


PROCEDURE RecordEvents (VAR buffer:ARRAY OF RecordedEvent; no:CARDINAL;
                        VAR recorded: CARDINAL);
BEGIN
  our_cb^.pubs.aINTIN[0] := getNoElements(HIGH(buffer), no);
  aes_if(AES_CTRL_CODE(GEMOps.APPL_TRECORD, 1, 1, 1));
  recorded := our_cb^.pubs.aINTOUT[0];
END RecordEvents;


(*  Scrap Manager  *)
(*  =============  *)
PROCEDURE ReadScrapDir(VAR dir:ARRAY OF CHAR);
BEGIN
  ScrapRead(ADR(dir)); /* TDI name */
END ReadScrapDir;


PROCEDURE WriteScrapDir(REF dir:ARRAY OF CHAR);
VAR s: MaxStr;
BEGIN
  stringIntoCFormat(dir, s);
  ScrapWrite(ADR(s)); /* TDI name */
END WriteScrapDir;


(*  Shell Manager  *)
(*  =============  *)

PROCEDURE ShellRead(VAR cmd, tail: ARRAY OF CHAR);
VAR s, s2: MaxStr;
BEGIN
  AESShells.ShellRead(ADR(s), ADR(s2));
  stringFromCFormat(s, cmd);
  stringFromCFormat(s2, tail);
  Delete(tail, 0, 1);
END ShellRead;


PROCEDURE ShellWrite(start: BOOLEAN; isGraf:ProgramType; REF cmd,tail:ARRAY OF CHAR);
VAR s, s2: MaxStr;
BEGIN
  stringIntoCFormat(cmd, s);
  stringIntoCFormat(tail, s2);
  (* TAIL muss Laengenbyte am Anfang bekommen *)
  (* Insert('', 0, s2); *)
  AESShells.ShellWrite(ORD(start), ORD(isGraf), ORD(isGraf), ADR(s), ADR(s2));
END ShellWrite;


PROCEDURE ShellGet(VAR buffer:ARRAY OF BYTE; no:CARDINAL);
BEGIN
  AESShells.ShellGet(ADR(buffer), getNoElements(HIGH(buffer), no));
END ShellGet;


PROCEDURE ShellPut(REF buffer:ARRAY OF BYTE; no:CARDINAL);
BEGIN
  AESShells.ShellPut(ADR(buffer), getNoElements(HIGH(buffer), no));
END ShellPut;


PROCEDURE ShellFind(VAR name:ARRAY OF CHAR);
VAR s: MaxStr;
BEGIN
  stringIntoCFormat(name, s);
  AESShells.ShellFind(ADR(s));
  stringFromCFormat(s, name);
END ShellFind;


PROCEDURE ShellEnvironment(REF parm: ARRAY OF CHAR; VAR value:ARRAY OF CHAR);
VAR s: MaxStr;
    p: PtrMaxStr;
BEGIN
  stringIntoCFormat(parm, s);
  p := NIL;
  AESShells.ShellEnvrn(ADR(p), ADR(s));
  IF p <> NIL THEN stringFromCFormat(p^, value); ELSE value[0] := 0C; END;
END ShellEnvironment;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESMisc.
