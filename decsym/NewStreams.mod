IMPLEMENTATION MODULE NewStreams;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* short calls *)

IMPORT AESGraphics;
IMPORT AESForms;
IMPORT AESShells;
IMPORT GEMDOS;
IMPORT Strings;
IMPORT ExecUtil;
IMPORT AppWindow;
FROM SYSTEM IMPORT ADR, NULL, BYTE, CODE;
FROM GEMX IMPORT BasePageAddress, BasePageType;
FROM AppBase IMPORT StreamType, xfer, doUpdateWindow, shellTail, openFiles, openStreams, StreamSet, FileSet;
FROM GEMAESbase IMPORT Arrow, HourGlass, AESIntOut, AESCallResult;
IMPORT M2Option;

CONST ENOENT = GEMDOS.EFilNF;

CONST nop = 04E71H;

TYPE OptionInfoType = (infoHeap, infoQuery, infoRef, infoList, infoStack, infoMap, infoDtable, infoOptimize, infoEnd);

VAR searchpaths: M2Option.SearchPathArray;
VAR needfile: BOOLEAN;
VAR mainfilename: FileNameBuf;
VAR outfilename: FileNameBuf;
VAR currInfoType: OptionInfoType;
VAR dump: BOOLEAN;
VAR queryfiles: BOOLEAN;
VAR reffiles: BOOLEAN;
VAR listing: BOOLEAN;
VAR linkmap: BOOLEAN;
VAR linkopt: BOOLEAN;
VAR debugtable: BOOLEAN;
VAR stacksize: LONGCARD;
VAR heapsize: CARDINAL;
VAR DtaPtr: POINTER TO ARRAY [0..39] OF CHAR;

CONST nl = 012C;
CONST cr = 015C;


PROCEDURE FileError(VAR (* REF *) filename: ARRAY OF CHAR; error: INTEGER): BOOLEAN;
VAR button: INTEGER;
    strbuf: ARRAY [0..199] OF CHAR;
    strbuf2: ARRAY [0..199] OF CHAR;
BEGIN
  AESGraphics.GrafMouse(Arrow, NIL);
  IF error = ENOENT THEN
    strbuf := '[1][The following file could|not be found:|';
    CODE(nop); (* XXX *)
    Strings.Concat(strbuf, filename, strbuf2);
    Strings.Concat(strbuf2, '][ENTER NAME|CONTINUE]', strbuf);
    button := AESForms.FormAlert(1, strbuf);
    RETURN button <> 1;
  ELSE
    (* BUG: error number must be converted to DOS number *)
    button := AESForms.FormError(error);
    RETURN TRUE;
  END;
END FileError;


PROCEDURE Error(writing: BOOLEAN);
VAR button: INTEGER;
    strbuf: ARRAY [0..199] OF CHAR;
    strbuf2: ARRAY [0..199] OF CHAR;
BEGIN
  AESGraphics.GrafMouse(Arrow, NIL);
  strbuf := '[3][An IO error has occured|whilst ';
  IF writing THEN
    Strings.Concat(strbuf, 'writing', strbuf2);
  ELSE
    Strings.Concat(strbuf, 'reading', strbuf2);
  END;
  Strings.Concat(strbuf2, ' the disk.][OK]', strbuf);
  button := AESForms.FormAlert(1, strbuf);
  ExecUtil.IOError(99, TRUE);
END Error;


PROCEDURE Enospace();
VAR button: INTEGER;
    strbuf: ARRAY [0..79] OF CHAR;
BEGIN
  AESGraphics.GrafMouse(Arrow, NIL);
  strbuf := '[3][The disk does not have|enough room to write|any more information.][OK] ';
  button := AESForms.FormAlert(1, strbuf);
  ExecUtil.IOError(99, TRUE);
END Enospace;


PROCEDURE Enomem();
VAR button: INTEGER;
    strbuf: ARRAY [0..79] OF CHAR;
BEGIN
  AESGraphics.GrafMouse(Arrow, NIL);
  strbuf := '[3][Heap overflow!|No memory to open file][OK]';
  button := AESForms.FormAlert(1, strbuf);
  ExecUtil.IOError(99, TRUE);
END Enomem;


PROCEDURE SetFileExtension(VAR filename: ARRAY OF CHAR; type: CARDINAL);
TYPE extension = ARRAY[0..2] OF CHAR;
  
  PROCEDURE setExtension(newExt: extension);
  VAR i, namePos: CARDINAL;
  BEGIN
    i := 0;
    namePos := 0;
    WHILE (i <= HIGH(filename)) AND (filename[i] <> 0C) DO
      IF filename[i] = '\' THEN
        namePos := i + 1;
      END;
      INC(i);
    END;
    i := namePos;
    WHILE (i <= HIGH(filename)) AND (filename[i] <> 0C) AND (filename[i] <> '.') AND ((i - namePos) < 8) DO
      INC(i);
    END;
    IF HIGH(filename) - HIGH(newExt) - 2 < i THEN RETURN END;
    IF filename[i] <> '.' THEN
      filename[i] := '.';
    END;
    FOR namePos := 0 TO HIGH(newExt) DO
      INC(i);
      filename[i] := newExt[namePos];
    END;
    IF i < HIGH(filename) THEN
      filename[i + 1] := 0C;
    END;
  END setExtension;
  
BEGIN
  CASE type OF
    ORD(none): 
  | ORD(tmp): setExtension('TMP');
  | ORD(mod): setExtension('MOD');
  | ORD(ref): setExtension('REF');
  | ORD(sym): setExtension('SYM');
  | ORD(lnk): setExtension('LNK');
  | ORD(lst): setExtension('LST');
  | ORD(ttp),ORD(prg): setExtension('PRG');
  | ORD(map): setExtension('MAP');
  | ORD(cor): setExtension('COR');
  | ORD(erd): setExtension('ERD');
  | ORD(erm): setExtension('ERM');
  | ORD(xrf): setExtension('XRF');
  | ORD(dec): setExtension('DEC');
  | ORD(prt): setExtension('PRT');
  | ORD(ind): setExtension('IND');
  | ORD(rsc): setExtension('RSC');
  | ELSE setExtension('   ');
  END;
END SetFileExtension;


PROCEDURE max(a, b: CARDINAL): CARDINAL;
BEGIN
  IF a > b THEN
     RETURN a;
  ELSE
     RETURN b;
  END;
END max;


PROCEDURE allocfile(VAR s: STREAM; VAR (* REF *) fileName: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  GEMDOS.Alloc(SIZE(s.f^), s.f);
  IF s.f = NULL THEN
    Enomem();
  END;
  WITH s.f^ DO
    handle := -1;
    i := 0;
    WHILE (i <= HIGH(filename)) AND (i <= HIGH(fileName)) AND (fileName[i] <> 0C) DO
      filename[i] := fileName[i];
      INC(i);
    END;
    IF i <= HIGH(filename) THEN
      filename[i] := 0C;
    ELSE
      filename[HIGH(filename)] := 0C;
    END;
    filesize := 0;
    buffoffset := LONGCARD(-1);
    bufffill := 0;
    filepos := 0;
    dirty := FALSE;
  END;
END allocfile;


PROCEDURE flush(VAR f: FilePointer);
VAR count: LONGCARD;
BEGIN
  WITH f^ DO
    IF dirty THEN
      count := LONGCARD(bufffill);
      IF count <> 0 THEN
        GEMDOS.Write(handle, count, ADR(buffer));
        IF count < 0 THEN (* BUG: unsigned can never be < 0 *)
          Error(TRUE);
        ELSE
          IF LONGCARD(bufffill) <> count THEN
           Enospace();
          END;
        END;
        IF filepos > filesize THEN
          filesize := filepos;
        END;
      END;
    END;
    buffoffset := LONGCARD(-1);
    bufffill := 0;
    dirty := FALSE;
  END;
END flush;


PROCEDURE readbyte(f: FilePointer; VAR ch: CHAR);
VAR offset: LONGCARD;
    count: LONGCARD;
BEGIN
  WITH f^ DO
    IF (filepos DIV BUFSIZE) * BUFSIZE <> buffoffset THEN
      flush(f);
      buffoffset := (filepos DIV BUFSIZE) * BUFSIZE;
      offset := buffoffset;
      GEMDOS.Seek(offset, f^.handle, GEMDOS.beginning, offset);
      count := BUFSIZE;
      GEMDOS.Read(f^.handle, count, ADR(buffer));
      IF count < 0 THEN (* BUG: unsigned can never be < 0 *)
        Error(FALSE);
      END;
    END;
    bufffill := max(CARDINAL(filepos MOD BUFSIZE) + 1, bufffill);
    ch := buffer[CARDINAL(filepos MOD BUFSIZE)];
    INC(filepos);
  END;
END readbyte;


PROCEDURE read16bit(f: FilePointer; VAR w: CARDINAL);
VAR hi, lo: CHAR;
BEGIN
  readbyte(f, hi);
  readbyte(f, lo);
  w := ORD(hi) * 256 + ORD(lo);
END read16bit;


PROCEDURE writebyte(f: FilePointer; ch: CHAR; updating: BOOLEAN);
VAR offset: LONGCARD;
    count: LONGCARD;
BEGIN
  WITH f^ DO
    IF (filepos DIV BUFSIZE) * BUFSIZE <> buffoffset THEN
      flush(f);
      buffoffset := (filepos DIV BUFSIZE) * BUFSIZE;
      offset := buffoffset;
      GEMDOS.Seek(offset, f^.handle, GEMDOS.beginning, offset);
      count := BUFSIZE;
      GEMDOS.Read(f^.handle, count, ADR(buffer));
      offset := buffoffset;
      GEMDOS.Seek(offset, f^.handle, GEMDOS.beginning, offset);
    END;
    bufffill := max(CARDINAL(filepos MOD BUFSIZE) + 1, bufffill);
    buffer[CARDINAL(filepos MOD BUFSIZE)] := ch;
    dirty := TRUE;
    INC(filepos);
    IF NOT updating THEN
      filesize := filepos;
    END;
    IF (filepos MOD BUFSIZE) = 0 THEN
      flush(f);
      buffoffset := filepos;
    END;
  END;
END writebyte;


PROCEDURE strupr(VAR str: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(str)) AND (str[i] <> 0C) DO
    str[i] := CAP(str[i]);
    INC(i);
  END;
END strupr;


PROCEDURE FileLookup(
  VAR (* REF *) title: ARRAY OF CHAR;
  VAR (* REF *) defaultname: ARRAY OF CHAR;
  type: CARDINAL;
  VAR s: STREAM;
  query: BOOLEAN;
  acceptdefault: BOOLEAN; (* unused *)
  VAR acceptedfilename: ARRAY OF CHAR;
  VAR goodfile: BOOLEAN
  );
VAR aesret: INTEGER;
    button: INTEGER;
    path: ARRAY[0..60] OF CHAR;
    name: ARRAY[0..60] OF CHAR;
    filename: ARRAY[0..60] OF CHAR;
    i: CARDINAL;
    slash: CARDINAL;
    len: CARDINAL;
    unused: LONGCARD;
    verbose: BOOLEAN;
    searchindex: CARDINAL;
    searching: BOOLEAN;
    unused2: ARRAY[0..35] OF CHAR;
BEGIN
  searching := FALSE;
  IF needfile THEN
    IF mainfilename[0] = 0C THEN
      searching := outfilename[0] <> 0C;
      IF searching THEN
        i := 1;
        WHILE (i <= HIGH(outfilename)) AND (outfilename[i] <> eolc) AND (outfilename[i] <> 0C) DO
          filename[i - 1] := outfilename[i];
          INC(i);
        END;
        filename[i - 1] := 0C;
        xfer := FALSE;
      END;
    ELSE
      Strings.Assign(filename, mainfilename);
      searching := TRUE;
    END;
  END;
  
  verbose := (title[0] <> 0C) AND (query OR ((type <> ORD(tmp)) AND (type <> ORD(none))));
  IF verbose THEN
    CODE(nop); (* XXX *)
    AppWindow.WriteString(title);
    AppWindow.WriteString(' : ');
  END;

  searchindex := 0;
  LOOP
    IF (NOT searching) AND query THEN
      AESGraphics.GrafMouse(Arrow, NIL);
      Strings.Assign(path, searchpaths[0]);
      len := Strings.Length(path);
      path[len] := '*';
      path[len + 1] := 0C;
      SetFileExtension(path, type);
      CODE(nop); (* XXX *)
      Strings.Assign(name, defaultname);
      IF name[0] <> 0C THEN
        SetFileExtension(name, type);
      END;
      strupr(name);
      AESForms.FileSelectorInput(ADR(path), ADR(name), button);
      AESGraphics.GrafMouse(HourGlass, NIL);
      aesret := AESCallResult; (* nonsense; was clobbered by GrafMouse Call *)
      doUpdateWindow();
      IF (aesret = 0) OR (button = 0) THEN
        (* canceled *)
        IF verbose THEN
          AppWindow.WriteLn();
        END;
        goodfile := FALSE;
        RETURN;
      END;
      i := 0;
      WHILE (i <= HIGH(path)) AND (path[i] <> 0C) DO
        IF path[i] = '\' THEN
          slash := i; (* BUG: was uninitalized *)
        END;
        INC(i);
      END;
      INC(slash);
      IF slash <= HIGH(path) THEN path[slash] := 0C; END;
      Strings.Concat(path, name, filename);
    ELSE
      (* 136d6 *)
      IF (NOT searching) THEN
        IF type <> ORD(none) THEN
          CODE(nop); (* XXX *)
          Strings.Concat(searchpaths[searchindex], defaultname, filename);
          IF NOT Strings.Pos(filename, '.', 0, i) THEN
            SetFileExtension(filename, type);
          END;
        ELSE
          CODE(nop); (* XXX *)
          Strings.Assign(filename, defaultname);
        END;
      END;
    END;
    (* 13776 *)
    strupr(filename);
    CODE(nop); (* XXX *)
    Strings.Assign(acceptedfilename, filename);
    allocfile(s, filename);
    GEMDOS.Open(filename, 0, s.f^.handle);
    IF s.f^.handle < 0 THEN
      IF GEMDOS.Free(s.f) THEN
        s.f := NIL;
      END;
      IF (NOT query) AND (searchindex < M2Option.MaxPaths) THEN
        INC(searchindex);
      ELSE
        goodfile := FALSE;
        IF (type = ORD(none)) OR (type = ORD(erm)) OR (type = ORD(erd)) OR FileError(filename, ENOENT) THEN
          IF verbose THEN
            AppWindow.WriteLn();
          END;
          EXIT;
        END;
        query := TRUE;
        searching := FALSE;
      END;
    ELSE
      (* 13868 *)
      goodfile := TRUE;
      WITH s.f^ DO
        GEMDOS.Seek(filesize, handle, GEMDOS.end, filesize);
        GEMDOS.Seek(filepos, handle, GEMDOS.beginning, filepos);
      END;
      IF verbose THEN
        AppWindow.WriteString(filename);
        AppWindow.WriteLn();
      END;
      EXIT;
    END;
  END;
  
  IF needfile THEN
    Strings.Assign(shellTail, filename);
  END;
  needfile := FALSE;
  INCL(openFiles, type);
END FileLookup;


PROCEDURE FileLookupOutput(
  VAR (* REF *) title: ARRAY OF CHAR;
  VAR (* REF *) defaultname: ARRAY OF CHAR;
  type: CARDINAL;
  VAR s: STREAM;
  query: BOOLEAN;
  acceptdefault: BOOLEAN; (* unused *)
  VAR acceptedfilename: ARRAY OF CHAR;
  VAR goodfile: BOOLEAN
  );
VAR aesret: INTEGER;
    button: INTEGER;
    i: CARDINAL;
    slash: CARDINAL;
    filename: ARRAY[0..60] OF CHAR; (* 70 *)
    name: ARRAY[0..60] OF CHAR; (* 132 *)
    path: ARRAY[0..60] OF CHAR; (* 194 *)
BEGIN
  CODE(nop); (* XXX *)
  Strings.Assign(filename, defaultname);
  SetFileExtension(filename, type);
  strupr(filename);
  IF query THEN
    AESGraphics.GrafMouse(Arrow, NIL);
    Strings.Assign(path, searchpaths[0]);
    SetFileExtension(path, type);
    Strings.Assign(name, filename);
    AESForms.FileSelectorInput(ADR(path), ADR(name), button);
    AESGraphics.GrafMouse(HourGlass, NIL);
    aesret := AESCallResult; (* nonsense; was clobbered by GrafMouse Call *)
    doUpdateWindow();
    IF (aesret = 0) OR (button = 0) THEN
      (* canceled *)
      goodfile := FALSE;
      RETURN;
    END;
    i := 0;
    WHILE (i <= HIGH(path)) AND (path[i] <> 0C) DO
      IF path[i] = '\' THEN
        slash := i; (* BUG: was uninitalized *)
      END;
      INC(i);
    END;
    INC(slash);
    IF slash <= HIGH(path) THEN path[slash] := 0C; END;
    Strings.Concat(path, name, filename);
  END;
  (* 13a74 *)
  i := 0;
  CODE(nop); (* XXX *)
  Strings.Assign(acceptedfilename, filename);
  allocfile(s, filename);
  GEMDOS.Create(filename, 0, s.f^.handle);
  IF s.f^.handle < 0 THEN
    IF GEMDOS.Free(s.f) THEN
      s.f := NIL;
    END;
    goodfile := FALSE;
  ELSE
    IF title[0] <> 0C THEN
      IF query OR ((type <> ORD(tmp)) AND (type <> ORD(none))) THEN
        CODE(nop); (* XXX *)
        AppWindow.WriteString(title);
        AppWindow.WriteString(' : ');
        AppWindow.WriteString(filename);
        AppWindow.WriteLn();
      END;
    END;
    goodfile := TRUE;
    INCL(openStreams, type);
  END;
END FileLookupOutput;



PROCEDURE GetOptionInfo(VAR info: OptionInfoRec; VAR success: BOOLEAN);

  PROCEDURE formatLong(v: LONGCARD);
  VAR max: LONGCARD;
      val: CARDINAL;
      i: CARDINAL;
  BEGIN
    max := 010000000H;
    i := 0;
    WHILE max > 0 DO
      val := CARDINAL(v DIV max);
      IF val < 10 THEN
        (* XXX:
         info.info[i] := CHR(val + ORD('0')); *)
        CODE(07A30H, 0DA6EH, 0FFFAH, 0286DH, 0FFFCH, 0286CH, 0000CH, 0382EH, 0FFF8H, 049ECH, 00050H, 01985H, 04000H);
      ELSE
        info.info[i] := CHR(val - 10 + ORD('A'));
      END;
      v := v MOD max;
      max := max DIV LONGCARD(16);
      INC(i);
    END;
    info.info[i] := 'H';
    info.info[i + 1] := 0C;
  END formatLong;
  
BEGIN
  WITH info DO
    success := TRUE;
    info := '';
    LOOP
      CASE currInfoType OF
        infoHeap:
        IF heapsize <> 0 THEN
          type := 'HEAP';
          formatLong(LONGCARD(heapsize));
          EXIT;
        END;
      | infoQuery:
        IF queryfiles THEN
          type := 'QUERY';
          EXIT;
        END;
      | infoRef:
        IF reffiles THEN
          type := 'REF';
          EXIT;
        END;
      | infoList:
        IF listing THEN
          type := 'LIST';
          EXIT;
        END;
      | infoStack:
        IF stacksize <> 0 THEN
          type := 'STACK';
          formatLong(stacksize);
          EXIT;
        END;
      | infoMap:
        IF linkmap THEN
          type := 'MAP';
          EXIT;
        END;
      | infoDtable:
        IF debugtable THEN
          type := 'DTABLE';
          EXIT;
        END;
      | infoOptimize:
        IF linkopt THEN
          type := 'OPTIMISE';
          EXIT;
        END;
      | infoEnd:
        success := FALSE;
        RETURN;
      END;
      INC(currInfoType);
    END;
  END;
  INC(currInfoType);
END GetOptionInfo;


PROCEDURE Close(VAR s: STREAM; VAR success: BOOLEAN);
VAR unused: INTEGER;
BEGIN
  IF s.f <> NIL THEN
    flush(s.f);
    success := GEMDOS.Close(s.f^.handle);
    IF GEMDOS.Free(s.f) THEN
      s.f := NIL;
    END;
  ELSE
    success := TRUE;
  END;
END Close;


PROCEDURE ReadChar(VAR s: STREAM; VAR ch: CHAR);
BEGIN
  REPEAT
    readbyte(s.f, ch);
  UNTIL ch <> cr;
  IF ch = nl THEN
    ch := eolc;
  END;
END ReadChar;


PROCEDURE ReadByte(VAR s: STREAM; VAR b: BYTE);
VAR ch: CHAR;
BEGIN
  readbyte(s.f, ch);
  b := BYTE(ch);
END ReadByte;


PROCEDURE WriteChar(VAR s: STREAM; ch: CHAR);
BEGIN
  IF ch = eolc THEN
    ch := cr;
    writebyte(s.f, ch, FALSE);
    ch := nl;
  END;
  writebyte(s.f, ch, FALSE);
END WriteChar;


PROCEDURE Read16Bit(VAR s: STREAM; VAR w: CARDINAL);
BEGIN
  read16bit(s.f, w);
END Read16Bit;


PROCEDURE initfilenames();
VAR cmd: ARRAY[0..127] OF CHAR;
VAR tail: ARRAY[0..127] OF CHAR;
BEGIN
  mainfilename[0] := 0C;
  cmd[0] := 0C;
  tail[0] := 0C;
  AESShells.ShellRead(ADR(cmd), ADR(tail));
  IF tail[0] = CHR(127) THEN
    Strings.Delete(tail, 0, 1);
  END;
  Strings.Assign(mainfilename, tail);
END initfilenames;


BEGIN (* NewStreams *)
  openStreams := StreamSet{};
  openFiles := FileSet{};
  M2Option.GetSystemOptions(dump, queryfiles, xfer, searchpaths);
  M2Option.GetCompilerOptions(reffiles, listing, heapsize);
  M2Option.GetLinkerOptions(linkmap, linkopt, debugtable, stacksize);
  needfile := TRUE;
  currInfoType := MIN(OptionInfoType);
  initfilenames();
  DtaPtr := BasePageAddress^.DtaPtr;
  Strings.Assign(outfilename, DtaPtr^); (* WTF? *)
END NewStreams.
