IMPLEMENTATION MODULE FileNames;
#define REF

(*
  03.12.90  Fehler bei SplitName behoben, so dass nun kein Fehler mehr mit
            68020 passieren duerfte. (D0 war bei CopyA0OnStack-Aufruf um
            eins zu hoch, was ggf. ein Byte zuviel kopierte und damit den
            Stack ueberschrieb).
  31.01.91  ValidatePath verwendet "fileUpper" statt Strings.Upper
  29.03.93  StrToDrv erlaubt nun Drives v. A-Z (bisher A-P)
  03.06.23: Port to gm2
*)

FROM SYSTEM IMPORT ADDRESS, ADR, TSIZE, BYTE;
IMPORT Strings;
FROM MOSGlobals IMPORT FileStr, PathStr, DriveStr, NameStr, SfxStr, PfxStr,
                       OutOfStack, StringOverflow, fNotDeleted, fPathNotFound, fFileNotFound,
                       Drive, DriveSet;
FROM ErrBase IMPORT DoTRAP6, TRAP6_SELF, TRAP6_CONT;

CONST drvZ = 26;


(* "Upper" fuer Dateinamen: beruecksichtigt nur die unteren 128 Zeichen *)
PROCEDURE fileUpper(VAR s: ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  FOR n:= 0 TO HIGH(s) DO
    IF s[n]='' THEN RETURN END;
    IF s[n]<CHR(128) THEN s[n]:=CAP(s[n]) END
  END
END fileUpper;


(*
   Index - returns the indice of the first occurance of, ch, in
           String, s. -1 is returned if, ch, does not exist.
           The search starts at position, o.
*)

PROCEDURE Index(REF s: ARRAY OF CHAR; ch: CHAR; o: CARDINAL) : INTEGER ;
VAR
   i, len: CARDINAL;
BEGIN
   len := Strings.Length(s);
   i := o;
   WHILE i < len DO
     IF s[i] = ch THEN
       RETURN i
     END;
     INC(i)
   END;
   RETURN -1;
END Index ;


PROCEDURE RIndex(REF s: ARRAY OF CHAR; ch: CHAR) : INTEGER ;
VAR
   i, len: CARDINAL;
   pos: INTEGER;
BEGIN
   len := Strings.Length(s);
   pos := -1;
   WHILE i < len DO
     IF s[i] = ch THEN
       pos := i;
     END;
     INC(i);
   END;
   RETURN pos;
END RIndex;


PROCEDURE ConcatName(REF prefix, suffix: ARRAY OF CHAR; VAR name: ARRAY OF CHAR);
VAR s1, s2: SfxStr; n1: NameStr; app: BOOLEAN;
BEGIN
  (* aufpassen, da 'prefix'/'suffix' mit 'name' identisch sein koennen! *)
  app := suffix[0] <> 0C;
  IF app THEN
    Strings.Extract(suffix, Index(suffix, '.', 0) + 1, 3, s1);
  END;
  SplitPath(prefix, name, n1);
  SplitName(n1, n1, s2);
  Strings.Append(n1, name);
  IF app THEN
    Strings.Append('.', name);
    Strings.Append(s1, name);
  END;
END ConcatName;


PROCEDURE ConcatPath(REF path, name: ARRAY OF CHAR; VAR fullname: ARRAY OF CHAR);
VAR p1: PathStr; n2, n1: NameStr;
BEGIN
  (* aufpassen, da 'path'/'name' mit 'fullName' identisch sein koennen! *)
  SplitPath(name, p1, n1);
  SplitPath(path, fullname, n2);
  Strings.Append(n1, fullname);
END ConcatPath;


PROCEDURE NameConc( REF prefix, suffix: ARRAY OF CHAR ): FileStr;
VAR n1: FileStr;
BEGIN
  ConcatName(prefix, suffix, n1);
  RETURN n1
END NameConc;


PROCEDURE PathConc( REF path, name: ARRAY OF CHAR ): FileStr;
VAR p1: FileStr;
BEGIN
  ConcatPath(path, name, p1);
  RETURN p1
END PathConc;


PROCEDURE SplitName( VAR (* REF *) filename: ARRAY OF CHAR; VAR prfx, sfx: ARRAY OF CHAR );
VAR lenp, lens: CARDINAL;
    dot: INTEGER;
    VAR buf: FileStr;
BEGIN
  (* Fehler melden, wenn 'prfx' zu klein *)
  lenp := HIGH(prfx);
  INC(lenp);
  IF lenp < 8 THEN
    DoTRAP6(StringOverflow - TRAP6_SELF);
  END;

  (* Fehler melden, wenn 'sfx' zu klein *)
  lens := HIGH(sfx);
  INC(lens);
  IF lens < 3 THEN
    DoTRAP6(StringOverflow - TRAP6_SELF);
  END;

  Strings.Assign(filename, buf);
  dot := Index(buf, '.', 0);
  IF dot >= 0 THEN
    Strings.Extract(buf, 0, dot, prfx);
    Strings.Extract(buf, dot + 1, lens, sfx);
  ELSE
    Strings.Assign(buf, prfx);
    sfx[0] := 0C;
  END;
END SplitName;

  
PROCEDURE SplitPath( REF fullname: ARRAY OF CHAR; VAR path, name: ARRAY OF CHAR );
VAR dot: INTEGER;
VAR buf: FileStr;
VAR lens: CARDINAL;
BEGIN
  path[0] := 0C;
  name[0] := 0C;
  fullname[0] := 0C;
  Strings.Assign(fullname, buf);
  dot := Index(buf, ':', 0);
  IF dot < 0 THEN dot := RIndex(buf, '\'); END;
  IF dot < 0 THEN dot := RIndex(buf, '/'); END;
  lens := HIGH(name);
  INC(lens);
  IF dot >= 0 THEN
    Strings.Extract(buf, 0, dot, path);
    Strings.Extract(buf, dot + 1, lens, name);
  ELSE
    path[0] := 0C;
    Strings.Assign(buf, name);
  END;
END SplitPath;


PROCEDURE FileName  ( REF filename: ARRAY OF CHAR ): NameStr;
VAR path: PathStr; name: NameStr;
BEGIN
  SplitPath(filename, path, name);
  RETURN name
END FileName;


PROCEDURE FilePath  ( REF filename: ARRAY OF CHAR ): PathStr;
VAR path: PathStr; name: NameStr;
BEGIN
  SplitPath(filename, path, name);
  RETURN path
END FilePath;


PROCEDURE FilePrefix( REF filename: ARRAY OF CHAR ): PfxStr;
VAR path: PathStr; name: NameStr; pfx: PfxStr; sfx: SfxStr;
BEGIN
  SplitPath(filename, path, name);
  SplitName(name, pfx, sfx);
  RETURN pfx
END FilePrefix;


PROCEDURE FileSuffix( REF filename: ARRAY OF CHAR ): SfxStr;
VAR path: PathStr; name: NameStr; pfx: PfxStr; sfx: SfxStr;
BEGIN
  SplitPath(filename, path, name);
  SplitName(name, pfx, sfx);
  RETURN sfx
END FileSuffix;


PROCEDURE DriveToStr( driveNo: Drive ): DriveStr;
VAR drive: DriveStr;
BEGIN
  IF driveNo = defaultDrv THEN
    drive := '';
  ELSE
    drive[0] := CHR(driveNo + ORD('A'));
    drive[1] := ':';
    drive[2] := 0C;
  END;
  RETURN drive;
END DriveToStr;


PROCEDURE StrToDrive( REF driveStr: ARRAY OF CHAR ): Drive;
VAR drive: Drive;
    ch: CHAR;
BEGIN
  drive := defaultDrv;
  ch := driveStr[0];
  IF (ch <> 0C) AND (driveStr[1] = ':') THEN
    IF (ch >= 'a') AND (ch <= 'z') THEN
      ch := CHR(ORD(ch) - 32);
    END;
    IF (ch >= 'A') AND (ch <= 'Z') THEN
      drive := Drive(ORD(ch) - ORD('A') + 1);
    END;
  END;
  RETURN drive;
END StrToDrive;


PROCEDURE ValidatePath( VAR path: ARRAY OF CHAR );
VAR len: CARDINAL;
BEGIN
  fileUpper(path);
  len := Strings.Length(path);
  IF (len > 0) AND (path[len - 1] <> ':') AND (path[len - 1] <> '\') AND (path[len - 1] <> '/') THEN
    Strings.Append('\', path);
  END;
END ValidatePath;


PROCEDURE PathValidated( REF path: ARRAY OF CHAR ): PathStr;
VAR newpath: PathStr;
BEGIN
  Strings.Assign(path, newpath);
  ValidatePath(newpath);
  RETURN newpath;
END PathValidated;


PROCEDURE NameUnique( REF fileName: ARRAY OF CHAR ): BOOLEAN;
VAR i: CARDINAL;
BEGIN
  i := 0;
  LOOP
    IF fileName[i] = 0C THEN EXIT END;
    IF fileName[i] = '?' THEN RETURN FALSE END;
    IF fileName[i] = '*' THEN RETURN FALSE END;
    IF i = HIGH(fileName) THEN EXIT END;
    INC(i);
  END;
  RETURN TRUE;
END NameUnique;


PROCEDURE NameMatching( REF fileName, wildcard: ARRAY OF CHAR ): BOOLEAN;
VAR filenamePfx, wildcardPfx: NameStr;
VAR filenameSfx, wildcardSfx: SfxStr;
VAR i, j: CARDINAL;
VAR ch, ch2: CHAR;
BEGIN
  fileUpper(fileName);
  fileUpper(wildcard);
  (* leerer filename ergibt FALSE *)
  IF fileName[0] = 0C THEN RETURN FALSE END;
  SplitName(fileName, filenamePfx, filenameSfx);
  SplitName(wildcard, wildcardPfx, wildcardSfx);
  i := 0;
  j := 0;
  LOOP
    ch := wildcardPfx[i];
    INC(i);
    IF ch = 0C THEN
      IF filenamePfx[j] <> 0C THEN RETURN FALSE END;
      EXIT;
    END;
    IF ch = '*' THEN EXIT END;
    ch2 := filenamePfx[j];
    INC(j);
    IF (ch <> '?') AND (ch <> ch2) THEN RETURN FALSE END;
  END;

  i := 0;
  j := 0;
  LOOP
    ch := wildcardSfx[i];
    INC(i);
    IF ch = 0C THEN
      IF filenameSfx[j] <> 0C THEN RETURN FALSE END;
      EXIT;
    END;
    IF ch = '*' THEN EXIT END;
    ch2 := filenameSfx[j];
    INC(j);
    IF (ch <> '?') AND (ch <> ch2) THEN RETURN FALSE END;
  END;
  RETURN TRUE;
END NameMatching;


END FileNames.
