(*
 * declnk: utility to decode TDI modula *.lnk files
 *
 * Reconstructed from original program by Thorsten Otto
 *)

MODULE declnk;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* quick calls *)


FROM SYSTEM IMPORT ADDRESS, ADR, BYTE;
FROM SYSTEM IMPORT SETREG, CODE;

IMPORT GEMDOS;
IMPORT GEMAESbase;
IMPORT AESGraphics;
IMPORT AESWindows;
IMPORT GEMVDIbase;
IMPORT VDIAttribs;
IMPORT VDIOutputs;
IMPORT VDIControls;
IMPORT VDIRasters;
IMPORT AppBase;
IMPORT AppWindow;
IMPORT AESApplications;
IMPORT AESForms;
IMPORT AESShells;
IMPORT Strings;
IMPORT Buffers;
IMPORT ExecUtil;
IMPORT AESEvents;
IMPORT M2Option;
IMPORT NewStreams;
IMPORT StrUtil;
IMPORT disasm;
IMPORT Filepool;
FROM MCLnkFileDefs IMPORT LnkFileSymbols;

CONST nop = 04E71H;

VAR crc: CARDINAL;
VAR outputFailed: BOOLEAN;
VAR printCrc: BOOLEAN;
VAR lnkFile: NewStreams.STREAM;
VAR decFile: NewStreams.STREAM;

CONST ParamErrStr = 'Decode parameter error.';


PROCEDURE ParameterError(VAR s: ARRAY OF CHAR);
BEGIN
  CODE(nop); (* XXX *)
  AppWindow.WriteString(s);
  AppWindow.WriteLn();
END ParameterError;


PROCEDURE OpenFiles();
VAR lnkfilename: ARRAY[0..49] OF CHAR; (* FIXME: too short *)
    decfilename: ARRAY[0..49] OF CHAR; (* FIXME: too short *)
    success: BOOLEAN;
    ok: BOOLEAN;
    info: NewStreams.OptionInfoRec;
    list: INTEGER;
    unused: INTEGER;
BEGIN
  NewStreams.FileLookup('Link file', '', ORD(AppBase.lnk), lnkFile, TRUE, FALSE, lnkfilename, success);
  IF success THEN
    list := Filepool.PoolAlloc('List');
    NewStreams.GetOptionInfo(info, ok);
    NewStreams.FileLookupOutput('Decode file', lnkfilename, ORD(AppBase.dec), decFile, FALSE, FALSE, decfilename, success);
  END;
  outputFailed := NOT success;
END OpenFiles;


PROCEDURE CloseFiles();
VAR success: BOOLEAN;
BEGIN
  NewStreams.Close(lnkFile, success);
  NewStreams.Close(decFile, success);
END CloseFiles;


PROCEDURE Read16Bit(VAR w: CARDINAL);
BEGIN
  NewStreams.Read16Bit(lnkFile, w);
  INC(crc, w);
END Read16Bit;


PROCEDURE Write(ch: CHAR);
BEGIN
  NewStreams.WriteChar(decFile, ch);
END Write;


PROCEDURE WriteLn();
BEGIN
  NewStreams.WriteChar(decFile, NewStreams.eolc);
END WriteLn;


PROCEDURE WriteString(VAR str: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(str)) AND (str[i] <> 0C) DO
    NewStreams.WriteChar(decFile, str[i]);
    INC(i);
  END;
END WriteString;


PROCEDURE WriteSpaces(n: INTEGER);
BEGIN
  WHILE n > 0 DO
    NewStreams.WriteChar(decFile, ' ');
    DEC(n);
  END;
END WriteSpaces;


PROCEDURE WriteHexCard(val: CARDINAL; len: CARDINAL);
VAR str: ARRAY[0..19] OF CHAR;
BEGIN
  StrUtil.FormatHexCard(val, len, str);
  WriteString(str);
END WriteHexCard;


PROCEDURE WriteHexZeroCard(val: CARDINAL);
VAR str: ARRAY[0..4] OF CHAR;
    i: CARDINAL;
BEGIN
  StrUtil.FormatHexCard(val, 5, str);
  str[HIGH(str)] := 0C;
  FOR i := 0 TO HIGH(str) - 1 DO
    IF str[i] = ' ' THEN
      str[i] := '0';
    END;
  END;
  WriteString(str);
END WriteHexZeroCard;


PROCEDURE WriteCard(val: CARDINAL; len: CARDINAL);
VAR str: ARRAY[0..9] OF CHAR;
BEGIN
  StrUtil.FormatCard(val, len, str);
  WriteString(str);
END WriteCard;


PROCEDURE WriteLong(val: LONGCARD; len: CARDINAL);
VAR str: ARRAY[0..9] OF CHAR;
BEGIN
  StrUtil.FormatLong(val, len, str);
  WriteString(str);
END WriteLong;


PROCEDURE resetCrc();
BEGIN
  crc := 0;
END resetCrc;


PROCEDURE WriteRange(val: CARDINAL; offset: CARDINAL);
BEGIN
  WriteHexCard(val, 7);
  IF offset <> 0 THEN
    WriteHexCard(offset + val, 8);
  ELSE
    WriteSpaces(8);
  END;
END WriteRange;


PROCEDURE WriteData(VAR data: ARRAY OF CARDINAL; count: CARDINAL);
VAR i, n: CARDINAL;
BEGIN
  n := 5 - count;
  i := 0;
  WHILE count <> 0 DO
    WriteHexZeroCard(data[i]);
    Write(' ');
    INC(i);
    DEC(count);
  END;
  WHILE n <> 0 DO
    WriteSpaces(5);
    DEC(n);
  END;
END WriteData;


PROCEDURE DecodeData(offset: CARDINAL; size: LONGCARD);
VAR words: CARDINAL;
    w: CARDINAL;
    addr: LONGCARD;
BEGIN
  WriteLn();
  WriteString('NO DECODE -------- DATA');
  WriteLn();
  addr := 0;
  words := 5;
  WHILE addr < size DO
    IF words = 5 THEN
      words := 0;
      WriteLn();
      WriteRange(CARDINAL(addr), offset);
      Write(' ');
    END;
    Read16Bit(w);
    WriteHexZeroCard(w);
    WriteSpaces(5);
    INC(addr, 2);
    INC(words);
  END;
END DecodeData;


PROCEDURE DecodeInstructions(entry: CARDINAL; offset: CARDINAL; size: CARDINAL);
VAR i: CARDINAL;
    numOpcodes: CARDINAL;
    nread: CARDINAL;
    addr: CARDINAL; (* FIXME: should be LONGCARD *)
    w: CARDINAL;
    opcodes: ARRAY[0..4] OF CARDINAL;
    strbuf: ARRAY[0..90] OF CHAR;
BEGIN
  addr := 0;
  WriteLn();
  WriteString(' DECODE --------                        INSTRUCTION');
  WriteLn();
  IF ODD(entry) OR ODD(size) OR (entry > size) THEN
    ParameterError(ParamErrStr);
    WriteLn();
    WriteString(ParamErrStr);
  ELSE
    WHILE addr < entry DO
      WriteRange(addr, offset);
      WriteSpaces(5);
      Read16Bit(w);
      WriteHexCard(w, 10);
      WriteLn();
      INC(addr, 2);
    END;
    nread := 0;
    REPEAT
      WHILE (addr < size) AND (nread <= HIGH(opcodes)) DO
        Read16Bit(opcodes[nread]);
        INC(addr, 2);
        INC(nread);
      END;
      disasm.disasm(LONGCARD(addr - nread * 2), ADR(opcodes), numOpcodes, strbuf);
      WriteRange(addr - nread * 2, offset);
      WriteData(opcodes, numOpcodes);
      WriteString(strbuf);
      WriteLn();
      IF (numOpcodes < CARDINAL(nread)) AND (numOpcodes < HIGH(opcodes) + 1) AND (nread > 0) THEN
        FOR i := numOpcodes TO nread - 1 DO
          opcodes[i - numOpcodes] := opcodes[i];
        END;
      END;
      nread := nread - numOpcodes;
    UNTIL (addr >= size) AND (nread <= 0);
  END;
END DecodeInstructions;


PROCEDURE DecodeSymbol(sy: LnkFileSymbols);
BEGIN
  CASE sy OF
    scmodHeader: WriteString('scmod header');
  | import: WriteString('import');
  | dataSize: WriteString('data size');
  | filledData: WriteString('filled data');
  | procCode: WriteString('proc code');
  | initCode: WriteString('init code');
  | scmodInitCode: WriteString('scmod init code');
  | excpCode: WriteString('excp code');
  | refOwnData: WriteString('ref own data');
  | refExtData: WriteString('ref ext data');
  | refOwnCode: WriteString('ref own code');
  | refOwnProcCall: WriteString('ref own proc call');
  | refExtProcCall: WriteString('ref ext proc call');
  | refOwnProcAss: WriteString('ref own proc ass');
  | refExtProcAss: WriteString('ref ext proc ass');
  | refOwnExcp: WriteString('ref own excp');
  | refExtExcp: WriteString('ref ext excp');
  | refExtInitCall: WriteString('ref ext init call');
  | scmodEnd: WriteString('scmod end');
  | linkCodeVersion: WriteString('link code version:');
  | refAnyProcCall: WriteString('ref any proc call:');
  | refAnyProcAss: WriteString('ref any proc ass:');
  | stringData: WriteString('string data:');
  | boundData: WriteString('bound data:');
  | refOwnString: WriteString('ref own string:');
  | refOwnBound: WriteString('ref own bound:');
  | refUtil: WriteString('ref util:');
  | loadUtil: WriteString('load util:');
  | defAbsSymbol: WriteString('def abs symbol:');
  | refAbsSymbol: WriteString('ref abs symbol:');
  | refOwnQuickCall: WriteString('ref own quick call');
  | refExtQuickCall: WriteString('ref ext quick call');
  | refOwnQuickAss: WriteString('ref own quick ass');
  | refExtQuickAss: WriteString('ref ext quick ass');
  | ELSE WriteString('--- unknown Symbol ---');
  END;
END DecodeSymbol;


PROCEDURE DecodeLinkCodeVersion();
VAR w: CARDINAL;
BEGIN
  DecodeSymbol(linkCodeVersion);
  Read16Bit(w);
  Write(' ');
  WriteHexCard(w DIV 256, 3);
  Write(' ');
  WriteHexCard(w MOD 256, 3);
  WriteLn();
END DecodeLinkCodeVersion;


PROCEDURE DecodeModuleHeader();
VAR header: RECORD CASE :BOOLEAN OF
      FALSE: w: ARRAY [0..11] OF CARDINAL;
     | TRUE: s: ARRAY[0..23] OF CHAR;
    END; END;
    i: CARDINAL;
BEGIN
  Write(' ');
  FOR i := 0 TO HIGH(header.w) DO
    Read16Bit(header.w[i]);
  END;
  WriteString(header.s);
END DecodeModuleHeader;


PROCEDURE DecodeWord();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteHexCard(w, 7);
END DecodeWord;


PROCEDURE DecodeModuleKey();
BEGIN
  WriteString(', key =');
  DecodeWord();
  DecodeWord();
  DecodeWord();
END DecodeModuleKey;


PROCEDURE DecodeModnum();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteString(', modnum = ');
  WriteCard(w, 2);
END DecodeModnum;


PROCEDURE DecodeSize(): CARDINAL;
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteString(', number of bytes = ');
  WriteCard(w, 1);
  RETURN w;
END DecodeSize;


PROCEDURE DecodeLongSize(): LONGCARD;
VAR lo, hi: CARDINAL;
    v: LONGCARD;
BEGIN
  Read16Bit(hi);
  Read16Bit(lo);
  v := LONGCARD(hi) * 65536 + LONGCARD(lo);
  WriteString(', number of bytes = ');
  WriteLong(v, 1);
  RETURN v;
END DecodeLongSize;


PROCEDURE DecodeProcnum();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteString(', procnum = ');
  WriteCard(w, 2);
END DecodeProcnum;


PROCEDURE DecodeEntry(): CARDINAL;
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteString(', entrypoint =');
  WriteHexCard(w, 7);
  RETURN w;
END DecodeEntry;


PROCEDURE DecodeReference();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteString(' at');
  WriteHexCard(w, 7);
END DecodeReference;


PROCEDURE DecodeCrc();
VAR w: CARDINAL;
    calculatedcrc: CARDINAL;
BEGIN
  calculatedcrc := crc;
  Read16Bit(w);
  crc := calculatedcrc;
  IF crc = w THEN
    WriteString('  checksum:');
    IF printCrc THEN
      WriteHexCard(w, 7);
    END;
    WriteString(' o.k.');
  ELSE
    WriteString('  ---- checksum error: ');
    WriteHexCard(w, 7);
    WriteString(' should be ');
    WriteHexCard(crc, 7);
  END;
  WriteLn();
END DecodeCrc;


PROCEDURE PrintDirective(VAR s: ARRAY OF CHAR; sy: CARDINAL);
BEGIN
  CODE(nop); (* XXX *)
  AppWindow.WriteString(s);
  AppWindow.WriteLn();
END PrintDirective;


PROCEDURE DecodeModule();
VAR sy: LnkFileSymbols;
    entry: CARDINAL;
    size: CARDINAL;
    w: CARDINAL;
    datasize: LONGCARD;
BEGIN
  Read16Bit(w);
  IF w = ORD(linkCodeVersion) THEN
    DecodeLinkCodeVersion();
    DecodeCrc();
    REPEAT
      WriteLn();
      Read16Bit(w);
      IF w <= ORD(MAX(LnkFileSymbols)) THEN
        (* sy := LnkFileSymbols(w); *)
        CODE(03A2EH, 0FFF8H, 01D45H, 0FFFFH); (* XXX *)
        DecodeSymbol(sy);
        CASE sy OF
          scmodHeader:
          WriteString(': MODULE ');
          DecodeModuleHeader();
          DecodeModuleKey();
        | import:
          DecodeModuleHeader();
          DecodeModuleKey();
          DecodeModnum();
        | dataSize:
          datasize := DecodeLongSize();
        | filledData:
          WriteString(', rel. start addr. =');
          DecodeWord();
          datasize := DecodeLongSize();
          DecodeData(0, datasize);
        | stringData, boundData:
          datasize := DecodeLongSize();
          DecodeData(0, datasize);
        | procCode, initCode, scmodInitCode:
          DecodeProcnum();
          entry := DecodeEntry();
          size := DecodeSize();
          DecodeInstructions(entry, 0, size);
        | excpCode, refOwnExcp:
          (* NYI? *)
        | refOwnData, refOwnCode, refExtInitCall, refOwnString, refOwnBound:
          DecodeReference();
        | refOwnProcCall, refOwnProcAss, refUtil, refOwnQuickCall, refOwnQuickAss:
          DecodeReference();
          DecodeProcnum();
        | refExtData:
          DecodeReference();
          DecodeModnum();
        | refExtProcCall, refExtProcAss, refExtExcp, refExtQuickCall, refExtQuickAss:
          DecodeReference();
          DecodeProcnum();
          DecodeModnum();
        | loadUtil:
          DecodeProcnum();
        | scmodEnd:
          (* nothing to do *)
        | ELSE (* linkCodeVersion, refAnyProcCall, refAnyProcAss, defAbsSymbol, refAbsSymbol *)
          PrintDirective(' ---- illegal Directive', ORD(sy));
          sy := scmodEnd;
        END;
        DecodeCrc();
      ELSE
        PrintDirective(' ---- unknown directive number', w);
        sy := scmodEnd;
      END;
    UNTIL sy = scmodEnd;
  ELSE
    AppWindow.WriteString(' ---- no LinkCodeVersion found - halt ');
    AppWindow.WriteLn();
  END;
END DecodeModule;



BEGIN
  resetCrc();
  AppWindow.WriteString('Link file decoder   Version  2.00a');
  AppWindow.WriteLn();
  AppWindow.WriteLn();

  outputFailed := FALSE;
  printCrc := FALSE;  
  OpenFiles();
  IF NOT outputFailed THEN
    DecodeModule();
    CloseFiles();
  END;
  AppWindow.WriteLn();
  AppWindow.WriteString('End of decode');
  AppWindow.WriteLn();
  
  ExecUtil.IOError(0, FALSE);
END declnk.
