MODULE ASMDemo;

(*
 *  Dieses Modul zeigt, wie man Systemfunktionen in Assembler
 *  aufruft:
 *
 *       1. GEMDOS function call   trap #1
 *       2. BIOS calls             trap #13
 *
 *  Geschrieben von Andreas Pauletti 24.05.1988,
 *  Verifikation von Thomas Tempelmann, 05.07.1988.
 *
 *  Literaturverweis: 'ATARI ST Profibuch' 2.Auflage Sybex-Verlag
 *)

IMPORT BIOS, GEMDOS;

CONST
  maxChar = 35;
TYPE
  String = ARRAY[0..maxChar] OF CHAR;
VAR
  c: CHAR;
  str0, str1: String;

(*
 * gibt einen einzelnen Buchstaben mittel BIOS Funktion #3 aus
 *)
PROCEDURE Conout (ch : CHAR);  (* BIOS routine *)
BEGIN
  BIOS.BConOut(BIOS.CON, ch);
END Conout;


(*
 * spricht fuer sich !
 *)
PROCEDURE WriteLn;
BEGIN
  Conout(CHR(13));
  Conout(CHR(10))
END WriteLn;


(*
 *  Gibt String str mittel GEMDOS Funktion Cconws (=#9) aus.
 *  Der String muss mit einem Null-Zeichen abgeschlossen sein!
 *)
PROCEDURE PrintLine (str: ARRAY OF CHAR);
BEGIN
  GEMDOS.ConWS(str);
END PrintLine;


(*
 * liest einen String von der Tastatur ein und zeigt die Eingabe auf
 * dem Bildschirm laufend an.
 * (verwendet GEMDOS-Funktion 10: 'conrs')
 *)
PROCEDURE ReadString (VAR s: ARRAY OF CHAR);
BEGIN
  (*
   * zuerst muss in s[0] die Anzahl der max. einzulesenden Zeichen
   * gespeichert werden. Dies sind die Anzahl der Zeichen des
   * uebergebenen Strings minus Zwei, bzw. der HIGH-Wert minus Eins:
   *)
  s[0] := HIGH(s) - 1;
  GEMDOS.ConRS(s);
END ReadString;


PROCEDURE WaitForKey (VAR ch : CHAR);
VAR str: ARRAY[0..79] OF CHAR;
    i: CARDINAL;
BEGIN
  FOR i:= 0 TO 9 DO
    WriteLn
  END;
  str:= '     [Space] Abbruch  ...   wiederholen beliebige Taste druecken';
  PrintLine(str);
  GEMDOS.NecIn(ch);
END WaitForKey;


(*
 * loescht den gesamten Bildschirm ueber ESC Sequenz
 *)
PROCEDURE ClrScr;
VAR t: String;
BEGIN
  t := CHR(27) + 'E' + CHR(13);
  GEMDOS.ConWS(t);
END ClrScr;


(*
 * Prozedur, die den Buchstaben 'c' k-mal auf den Bildschirm schreibt
 *)
PROCEDURE WriteLnChar (ch: CHAR; k: CARDINAL; newLine: BOOLEAN);
VAR
   i: CARDINAL;
BEGIN
  FOR i:= 1 TO k DO
    GEMDOS.ConOut(ch)
  END;
  IF newLine THEN
    WriteLn
  END
END WriteLnChar;


PROCEDURE DoTitle;
VAR t: String;
CONST
    text1 ='Demoprogramm zu MEGAMAX MODULA-2';
    text2 ='---------------------------------';
    text3 ='Eingabe und Ausgabe in Assembler';
    blanks = 23;
BEGIN
  WriteLn; WriteLn;
  WriteLnChar(' ', blanks, FALSE);
  t := text1;
  PrintLine(t); WriteLn;
  WriteLnChar(' ', blanks, FALSE);
  t := text2;
  PrintLine(t); WriteLn;
  WriteLn;
  WriteLnChar(' ', blanks, FALSE);
  t := text3;
  PrintLine(t); WriteLn; WriteLn
END DoTitle;


(*
 * Prozedur, die zur Umrechnung des Strings dient
 * InputString hat Format : s[1] enthaelt die Anzahl Buchstaben
 *                          die der String enthaelt
 *                          eigentliche Daten beginnen ab s[2]
 * OutputString normaler C-Konventions String mit null Byte am Schluss
 *)
PROCEDURE AdjustString (VAR s: ARRAY OF CHAR);
VAR
    i: CARDINAL;
    k: CARDINAL;
BEGIN
  i:= 2;
  k:= ORD(s[1]);
  WHILE k > 0 DO
    s[i-2]:= s[i];
    INC(i);
    DEC(k)
  END(* while *);
  s[i-2]:= CHR(0)
END AdjustString;


BEGIN
  REPEAT
    ClrScr;
    DoTitle;
    WriteLnChar(' ', 2, FALSE);
    WriteLnChar('-', 76, TRUE); WriteLn;
    str0 := '  Geben Sie einen String ein     : ';
    PrintLine(str0);
    ReadString(str1);
    WriteLn; WriteLn;
    WriteLnChar(' ', 2,FALSE);
    WriteLnChar('-', 76, TRUE); WriteLn;
    str0:= '  Der eingegebene String lautete : ';
    PrintLine(str0);
    AdjustString(str1);
    PrintLine(str1);
    WaitForKey(c)
  UNTIL c = ' '
END ASMDemo.
