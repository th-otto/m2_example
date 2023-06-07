IMPLEMENTATION MODULE Directory; (* V#144 *)
#define REF

(*
13.01.88: TT  DrivesOnline & FreeSpace korrigiert.
14.01.88: TT  SplitName korrekt, wenn sfx >3 Zeichen
14.04.88: TT  DirQuery vollendet immer Suche mit Snext, damit der interne
              Directory-Puffer vom GEMDOS wieder freigegeben wird.
26.08.88: TT  GetDirEntry neu - muss noch exportiert werden
09.12.88: TT  GetCurrentDir schliesst path immer mit '\' ab.
01.07.89: TT  SplitPath: LINK-Instr. entfernt, da mit $L+ compiliert
07.08.89: TT  GetDirEntry kann nun auch Ordner ermitteln
15.08.89: TT  Delete liefert endlich 'fNotDeleted', wenn File nicht exist.
05.09.89: TT  GetDirEntry mit INTEGER- statt BOOLEAN-Ergebnis
02.02.90: TT  StrToDrive liefert 'defaultDrv', wenn ungueltiger LW-Buchstabe;
              ForceMediaChange implementiert
06.05.90: TT  Auch die Split/Concat-Funktionen haben nun REF-Parameter und
              legen ggf. vom Parameter eine Kopie an, wenn er identisch
              mit einem Ausgabe-Parm ist.
27.05.90: TT  ConcatName/Path kommen nun auch mit gleichen Argumenten bei
              den REF-Parms klar.
04.07.90: TT  Aufspaltung nach 'FileNames'-Modul
20.07.90: TT  DrivesOnline: SETs verkehrt
20.09.90: TT  SearchFirst liefert -49 statt -33, wenn keine Files.
24.10.90: TT  $H+ bei DirQuery
31.01.91: TT  SetCurrentDir: Keine Aktion, wenn 'path' leer ist; MakeFullPath
              verwendet "fileUpper" statt Strings.Upper
04.06.23: THO Port to gm2
*)

FROM SYSTEM IMPORT ADDRESS, ADR, TSIZE, BYTE, INTEGER16, INTEGER32, SHIFT;
IMPORT Strings;
FROM NumberIO IMPORT IntToStr;
FROM Clock IMPORT Time, Date, UnpackTime, UnpackDate;
FROM MOSConfig IMPORT FileErrMsg, ConfigErrMsgPtr;
FROM FileNames IMPORT SplitPath, DriveToStr, StrToDrive;
IMPORT MOSGlobals;
IMPORT GEMDOS;
FROM XBIOS IMPORT SuperExec;
IMPORT BIOS;
FROM ErrBase IMPORT DoTRAP6, TRAP6_SELF, TRAP6_CONT;
FROM libc IMPORT memset;


VAR mydev: INTEGER16;
TYPE hdvVecs = RECORD
  bpb: PROC;
  rw: PROC;
  boot: PROC;
  mediach: PROC;
END;
hdvVecsPtr = POINTER TO hdvVecs;

VAR oldgetbpb: hdvVecs;
etv_merk: PROC;


CONST hdv_bpb      = 00472H;
      hdv_rw       = 00476H;
      hdv_boot     = 0047AH;
      hdv_mediach  = 0047EH;
      etv_critic   = 00404H; (* Hier der etv_critic-Handler fuer MB *)


PROCEDURE newgetbpb;
BEGIN
  (* FIXME: does not work with -fno-omit-framepointer *)
  ASM VOLATILE("move.l %1,%%a0; cmp.w 4(%%sp),%0; bne.s 1f; move.l %%a0,0x472; move.l %1+4,%%a1; move.l %%a1,0x0476; move.l %1+12,%%a1; move.l %%a1,0x047E; 1: jmp (%%a0)" : : "d"(mydev), "m"(oldgetbpb) : );
END newgetbpb;


PROCEDURE newrwabs;
BEGIN
  (* FIXME: does not work with -fno-omit-framepointer *)
  ASM VOLATILE("cmp.w 14(%%sp),%0; beq.s 1f; move.l %1,%%a0; jmp (%%a0); 1: moveq #-14,%%d0" : : "d"(mydev), "m"(oldgetbpb.rw) : );
END newrwabs;


PROCEDURE newmediach;
BEGIN
  (* FIXME: does not work with -fno-omit-framepointer *)
  ASM VOLATILE("cmp.w 4(%%sp),%0; beq.s 1f; move.l %1,%%a0; jmp (%%a0); 1: moveq #2,%%d0" : : "d"(mydev), "m"(oldgetbpb.mediach) : );
END newmediach;


PROCEDURE etv_ersetzt;
BEGIN
  (* FIXME: does not work with -fno-omit-framepointer *)
  ASM VOLATILE("cmp.w 6(%%sp),%0; beq.s 1f; move.l %1,%%a0; jmp (%%a0); 1: move.w 4(%%sp),%%d0" : : "d"(mydev), "m"(etv_merk) : );
END etv_ersetzt;


PROCEDURE install_vecs(): INTEGER32;
VAR hdv: hdvVecsPtr;
    etv: POINTER TO PROC;
BEGIN
  hdv := hdvVecsPtr(hdv_bpb);
  (* 4 Longs sichern *)
  (* Eines von den vier Longs ist ueberfluessig, das macht aber nichts, die *)
  (* Routine ist immer noch schneller als die von Atari ! *)
  oldgetbpb := hdv^;
  (* Jetzt muessten eigentlich XBRA-Verfahren benutzt werden, aber da die *)
  (* Verschiebung sowieso nur temporaer ist, sparen wir an Zeit und Platz! *)
  hdv^.bpb := newgetbpb;
  hdv^.rw := newrwabs;
  hdv^.mediach := newmediach;
  etv := ADDRESS(etv_critic);
  etv_merk := etv^;
  etv^ := etv_ersetzt;
  RETURN 0;
END install_vecs;


PROCEDURE restore_vecs(): INTEGER32;
VAR hdv: hdvVecsPtr;
    etv: POINTER TO PROC;
BEGIN
  hdv := hdvVecsPtr(hdv_bpb);
  IF hdv^.bpb = newgetbpb THEN
    hdv^ := oldgetbpb;
  END;
  etv := ADDRESS(etv_critic);
  etv^ := etv_merk;
  RETURN 0;
END restore_vecs;


PROCEDURE fmed_asm(driveNo: CARDINAL): INTEGER32;
VAR err: INTEGER;
    fspec: ARRAY [0..5] OF CHAR;
BEGIN
  mydev := driveNo;
  fspec := ' :\\X';
  fspec[0] := CHR(driveNo + ORD('A'));
  SuperExec(install_vecs);

  GEMDOS.Open(fspec, 0, err);
  IF err >= 0 THEN
    GEMDOS.Close(err);
  END;
  SuperExec(restore_vecs);
  RETURN err;
END fmed_asm;


PROCEDURE ForceMediaChange(driveNo: Drive);
VAR err: INTEGER32;
BEGIN
  IF driveNo = defaultDrv THEN
    driveNo := DefaultDrive()
  END;
  err := fmed_asm(ORD(driveNo) - 1);
  (*
  IF err = 0 THEN
    errCode := -1
  ELSIF err = -33 THEN
    IF driveNo IN DrivesOnline() THEN
      errCode := 0
    ELSE
      errCode := fInvalidDrive
    END
  ELSE
    errCode := err
  END
  *)
END ForceMediaChange;


PROCEDURE copyDirEntry(VAR dta: SearchRec; VAR entry: DirEntry );
VAR i: CARDINAL;
BEGIN
  FOR i := 0 TO 11 DO
    entry.name[i] := dta.name[i];
  END;
  entry.name[12] := 0C;
  entry.attr := VAL(FileAttrSet, dta.attr);
  entry.time := UnpackTime(dta.time);
  entry.date := UnpackDate(dta.date);
  entry.size := dta.size;
END copyDirEntry;


PROCEDURE GetDTAEntry( dta: DTA; VAR entry: DirEntry );
BEGIN
  copyDirEntry(dta^, entry);
END GetDTAEntry;


(* "Upper" fuer Dateinamen: beruecksichtigt nur die unteren 128 Zeichen *)
PROCEDURE fileUpper(VAR s: ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  FOR n:= 0 TO HIGH(s) DO
    IF s[n]='' THEN RETURN END;
    IF s[n]<CHR(128) THEN s[n]:=CAP(s[n]) END
  END
END fileUpper;


PROCEDURE MakeFullPath( VAR filename: ARRAY OF CHAR; VAR result: INTEGER );
VAR oldpath, path: MOSGlobals.PathStr; dummy: INTEGER; name: MOSGlobals.NameStr;
BEGIN
  fileUpper(filename);
  SplitPath(filename, path, name);
  GetDefaultPath(oldpath);
  SetDefaultPath(path, result);
  GetDefaultPath(path);
  SetDefaultPath(oldpath, dummy);
  IF result >= 0 THEN
    Strings.Concat(path, name, filename);
  END
END MakeFullPath;


PROCEDURE GetFileAttr(REF filename: ARRAY OF CHAR; VAR attr: FileAttrSet; VAR result: INTEGER);
VAR fattr: CARDINAL;
    r: INTEGER32;
BEGIN
  r := GEMDOS.Attrib(filename, GEMDOS.getTime, fattr);
  IF r >= 0 THEN
    attr := FileAttrSet{fattr};
    result := 0;
  ELSE
    result := r;
  END;
END GetFileAttr;


PROCEDURE SetFileAttr(REF filename: ARRAY OF CHAR; attr: FileAttrSet; VAR result: INTEGER);
VAR fattr: CARDINAL;
    r: INTEGER32;
BEGIN
  fattr := VAL(CARDINAL, attr);
  r := GEMDOS.Attrib(filename, GEMDOS.setTime, fattr);
  IF r >= 0 THEN
    result := 0;
  ELSE
    result := r;
  END;
END SetFileAttr;


PROCEDURE Rename(REF oldName, newName: ARRAY OF CHAR; VAR result: INTEGER);
VAR r: INTEGER32;
BEGIN
  r := GEMDOS.Rename(oldName, newName);
  IF r >= 0 THEN
    result := 0;
  ELSE
    result := r;
  END;
END Rename;


PROCEDURE Delete(REF name: ARRAY OF CHAR; VAR result: INTEGER);
VAR r: INTEGER32;
BEGIN
  r := GEMDOS.Delete(name);
  IF r >= 0 THEN
    result := 0;
  ELSE
    IF (r = GEMDOS.EFilNF) OR (r = GEMDOS.EPthNF) THEN
      result := MOSGlobals.fNotDeleted;
    ELSE
      result := r;
    END;
  END;
END Delete;


PROCEDURE DirQuery(REF wildcard: ARRAY OF CHAR; select: FileAttrSet; dirProc: DirQueryProc; VAR result: INTEGER);
VAR dta: SearchRec;
    olddta: DTA;
    err: INTEGER;
    path: MOSGlobals.PathStr;
    name: MOSGlobals.NameStr;
    entry: DirEntry;
BEGIN
  (* get old DTA *)
  GEMDOS.GetDTA(olddta);
  (* set new DTA *)
  GEMDOS.SetDTA(ADR(dta));

  GEMDOS.SFirst(wildcard, VAL(CARDINAL, select), err);
  IF err < 0 THEN
    (* wenn leeres Dir, dann 'fNoMatchingFiles' liefern. *)
    IF err = GEMDOS.EFilNF THEN
      err := MOSGlobals.fNoMatchingFiles;
    END;
  ELSE
    IF dirProc = DirQueryProc(0) THEN
      DoTRAP6(MOSGlobals.IllegalProcVar);
      err := -1;
    ELSE
      LOOP
        (* Pfadnamen (ohne Dateinamen) auf Eval-Stack *)
        SplitPath(wildcard, path, name);
        (* DirEntry auf Eval-Stack laden, DTA ist direkt auf dem Systemstack *)
        copyDirEntry(dta, entry);
        IF NOT(dirProc(path, entry)) THEN
          (* so lange wiederholen, bis Ende o. Fehler *)
          LOOP
            GEMDOS.SNext(err);
            IF err < 0 THEN EXIT END;
          END;
          err := 0;
          EXIT;
        END;
        GEMDOS.SNext(err);
        IF err < 0 THEN
          IF err = GEMDOS.ENMFil THEN err := 0; END;
          EXIT;
        END;
      END;
    END;
  END;    
  GEMDOS.SetDTA(olddta);
  result := err;
END DirQuery;


PROCEDURE SetDefaultDrive( driveNo: Drive );
VAR DriveMap: CARDINAL32;
BEGIN
  IF driveNo <> defaultDrv THEN
    GEMDOS.SetDrv(ORD(driveNo) - 1, DriveMap);
  END;
END SetDefaultDrive;


PROCEDURE DefaultDrive(): Drive;
VAR drive: CARDINAL;
BEGIN
  GEMDOS.GetDrv(drive);
  RETURN Drive(drive + 1); (* adjust for defaultDrv *)
END DefaultDrive;


PROCEDURE GetCurrentDir( driveNo: Drive; VAR path: ARRAY OF CHAR );
VAR len: INTEGER;
BEGIN
  driveNo := defaultDrv;
  IF NOT(GEMDOS.GetPath(path, ORD(driveNo))) THEN
    path[0] := 0C;
  ELSE
    len := Strings.Length(path);
    IF (len = 0) OR ((path[len - 1] <> '\') AND (path[len - 1] <> '/')) THEN
      path[len] := '\';
      path[len + 1] := 0C;
    END;
  END;
END GetCurrentDir;


PROCEDURE SetCurrentDir( driveNo: Drive; REF path: ARRAY OF CHAR; VAR result: INTEGER );
VAR oldDrive: Drive;
    r: INTEGER32;
BEGIN
  IF path[0] = 0C THEN
    result := 0;
  ELSE
    IF driveNo = defaultDrv THEN
      driveNo := StrToDrive(path);
    END;
    (* akt. Drive retten *)
    oldDrive := DefaultDrive();
    (* gewuenschtes Drive setzen *)
    SetDefaultDrive(driveNo);
    r := GEMDOS.SetPath(path);
    SetDefaultDrive(oldDrive);
    IF r < 0 THEN
      result := r;
    ELSE
      result := 0;
    END;
  END;
END SetCurrentDir;


PROCEDURE FreeSpace( driveNo: Drive ): CARDINAL32; (* Angabe in Bytes *)
VAR info: GEMDOS.DiskInfoBuffer;
BEGIN
  IF GEMDOS.DFree(info, ORD(driveNo)) < 0 THEN
    RETURN 0;
  END;
  RETURN info.sectorSize * info.clusterSize * info.freeSpace;
END FreeSpace;


PROCEDURE CreateDir( REF path: ARRAY OF CHAR; VAR result: INTEGER );
VAR r: INTEGER32;
BEGIN
  r := GEMDOS.DirCreate(path);
  IF r >= 0 THEN
    result := 0;
  ELSE
    result := r;
  END;
END CreateDir;


PROCEDURE DeleteDir( REF path: ARRAY OF CHAR; VAR result: INTEGER );
VAR r: INTEGER32;
BEGIN
  r := GEMDOS.DirDelete(path);
  IF r >= 0 THEN
    result := 0;
  ELSE
    result := r;
  END;
END DeleteDir;


PROCEDURE DrivesOnline(): MOSGlobals.DriveSet;
VAR drives: BIOS.DriveSet;
BEGIN
  drives := BIOS.DriveMap();
  (* adjust for defaultDrv *)
  drives := SHIFT(drives, 1);
  RETURN MOSGlobals.DriveSet(drives);
END DrivesOnline;


PROCEDURE GetDirEntry( REF fileName: ARRAY OF CHAR; VAR entry: DirEntry; VAR result: INTEGER );
VAR r: INTEGER;
    dta: DTA;
BEGIN
  GEMDOS.SFirst(fileName, VAL(CARDINAL, QueryAll), r);
  IF r < 0 THEN
    (* entry loeschen *)
    memset(ADR(entry), 0, SIZE(entry));
    result := r;
  ELSE
    GEMDOS.GetDTA(dta);
    copyDirEntry(dta^, entry);
    result := 0;
  END;
END GetDirEntry;


PROCEDURE FileExists( REF fileName: ARRAY OF CHAR ): BOOLEAN;
VAR r: INTEGER;
BEGIN
  IF fileName[0] = 0C THEN
    RETURN FALSE;
  ELSE
    GEMDOS.SFirst(fileName, VAL(CARDINAL, QueryFiles), r);
    RETURN r >= 0;
  END;
END FileExists;


(*
 * Hier kann nicht mit Fsfirst gearbeitet werden, weil bestimmte Pfadnamen
 * nicht als Root-Dir erkennbar waeren (z.B. "..\") und dort Fsfirst nicht
 * funktioniert.
 *)
PROCEDURE PathExists( REF path: ARRAY OF CHAR ): BOOLEAN;
VAR buf: MOSGlobals.PathStr;
    dir: MOSGlobals.PathStr;
    name: MOSGlobals.NameStr;
    r: INTEGER;
    dummy: INTEGER;
BEGIN
  GetDefaultPath(buf);
  SplitPath(path, dir, name);
  SetDefaultPath(dir, r);
  SetDefaultPath(buf, dummy);
  RETURN r >= 0;
END PathExists;


PROCEDURE SetDefaultPath( REF path: ARRAY OF CHAR; VAR result: INTEGER );
BEGIN
  SetDefaultDrive(StrToDrive(path));
  SetCurrentDir(StrToDrive(path), path, result);
END SetDefaultPath;


PROCEDURE DefaultPath(): MOSGlobals.PathStr;
VAR path: MOSGlobals.PathStr;
BEGIN
  GetDefaultPath(path);
  RETURN path
END DefaultPath;


PROCEDURE GetDefaultPath( VAR path: ARRAY OF CHAR );
BEGIN
  GetCurrentDir(defaultDrv, path);
  Strings.Insert(DriveToStr(DefaultDrive()), 0, path);
END GetDefaultPath;


PROCEDURE GetDTA( VAR dta: DTA );
BEGIN
  GEMDOS.GetDTA(dta);
END GetDTA;


PROCEDURE SetDTA( dta: DTA );
BEGIN
  GEMDOS.SetDTA(dta);
END SetDTA;


PROCEDURE SearchFirst(REF wildcard: ARRAY OF CHAR; select: FileAttrSet; VAR result: INTEGER);
VAR err: INTEGER;
BEGIN
  GEMDOS.SFirst(wildcard, VAL(CARDINAL, select), err);
  IF err = GEMDOS.EFilNF THEN
    err := GEMDOS.ENMFil;
  END;
  result := err;
END SearchFirst;
  

PROCEDURE SearchNext(VAR result: INTEGER);
BEGIN
  GEMDOS.SNext(result);
END SearchNext;


PROCEDURE getSt2(ad: ConfigErrMsgPtr; n: INTEGER16; VAR msg:ARRAY OF CHAR): [ BOOLEAN ];
BEGIN
  LOOP
    IF ad^.errNo = n THEN
      (* gefunden *)
      Strings.Assign(ad^.errMsg, msg);
      RETURN TRUE;
    END;
    (* Listenende ? *)
    IF ad^.errMsg[0] = 0C THEN EXIT END;
    INC(ad, SIZE(ad^));
  END;
  (* nicht gefunden *)
  RETURN FALSE;
END getSt2;


(*
   Index - returns the indice of the first occurance of, ch, in
           String, s. -1 is returned if, ch, does not exist.
           The search starts at position, o.
*)
(* FIXME: should be in Strings.Index? *)

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
END Index;


PROCEDURE GetErrMsg(number: INTEGER; VAR errMsg: ARRAY OF CHAR);
VAR p:INTEGER;
VAR a: ARRAY[0..31] OF CHAR;
BEGIN
  errMsg[0] := 0C;
  IF FileErrMsg = NIL THEN
    Strings.Assign('Unknown error #@', errMsg);
  ELSE
    IF ~getSt2(FileErrMsg, number, errMsg) THEN
      IF number < 0 THEN
        getSt2(FileErrMsg, -32768, errMsg)
      ELSE
        getSt2(FileErrMsg, 32767, errMsg)
      END
    END;
  END;
  p := Index(errMsg, '@', 0);
  IF p>=0 THEN
    Strings.Delete(errMsg, p, 1);
    IntToStr(number, 0, a);
    Strings.Insert(a, p, errMsg)
  END
END GetErrMsg;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END Directory.
