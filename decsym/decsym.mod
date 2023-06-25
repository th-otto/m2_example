MODULE decsym;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, ADR, BYTE, CODE;
IMPORT NewStreams;
FROM MCSymFileDefs IMPORT SymFileSymbols, symFileKey;
IMPORT AppBase;
IMPORT AppWindow;
IMPORT Filepool;
IMPORT ExecUtil;
IMPORT StrUtil;

CONST nop = 04E71H;

VAR outputFailed: BOOLEAN;
VAR printExports: BOOLEAN;
VAR symFile: NewStreams.STREAM;
VAR decFile: NewStreams.STREAM;
VAR lastByte: SymFileSymbols;
VAR outputX: CARDINAL;
VAR moduleident: ARRAY[0..23] OF CHAR;
VAR indentLevel: CARDINAL;

CONST INDENT = 2;

TYPE StrBuf = ARRAY[0..80] OF CHAR;


PROCEDURE OpenFiles();
VAR success: BOOLEAN;
    ok: BOOLEAN;
    list: INTEGER;
    unused: INTEGER;
    symfilename: ARRAY[0..49] OF CHAR; (* FIXME: too short *) (* 56 *)
    decfilename: ARRAY[0..49] OF CHAR; (* FIXME: too short *) (* 106 *)
    info: NewStreams.OptionInfoRec;
BEGIN
  NewStreams.FileLookup('Symbol file', '', ORD(AppBase.sym), symFile, TRUE, FALSE, symfilename, success);
  IF success THEN
    list := Filepool.PoolAlloc('List');
    NewStreams.GetOptionInfo(info, ok);
    NewStreams.FileLookupOutput('Decode file', symfilename, ORD(AppBase.dec), decFile, FALSE, FALSE, decfilename, success);
  END;
  outputFailed := NOT success;
END OpenFiles;


PROCEDURE CloseFiles();
VAR success: BOOLEAN;
BEGIN
  NewStreams.Close(symFile, success);
  NewStreams.Close(decFile, success);
END CloseFiles;


PROCEDURE Error(VAR str: ARRAY OF CHAR);
BEGIN
  CODE(nop); (* XXX *)
  AppWindow.WriteString(str);
  AppWindow.WriteLn();
  AppWindow.WriteString(' Error in SymbolFile');
  AppWindow.WriteLn();
  CloseFiles();
  ExecUtil.IOError(4, TRUE);
END Error;


PROCEDURE WriteLn();
BEGIN
  NewStreams.WriteChar(decFile, NewStreams.eolc);
  outputX := 0;
END WriteLn;


PROCEDURE Write(ch: CHAR);
BEGIN
  IF outputX > 75 THEN
    WriteLn();
  END;
  NewStreams.WriteChar(decFile, ch);
  INC(outputX);
END Write;


PROCEDURE WriteString(VAR str: ARRAY OF CHAR);
VAR i: CARDINAL;
BEGIN
  i := 0;
  WHILE (i <= HIGH(str)) AND (str[i] <> 0C) DO
    Write(str[i]);
    INC(i);
  END;
END WriteString;


PROCEDURE WriteCard(val: CARDINAL; len: CARDINAL);
VAR str: ARRAY[0..9] OF CHAR;
BEGIN
  StrUtil.FormatCard(val, len, str);
  WriteString(str);
END WriteCard;


PROCEDURE WriteHexCard(val: CARDINAL; len: CARDINAL);
VAR str: ARRAY[0..9] OF CHAR;
BEGIN
  StrUtil.FormatHexCard(val, len, str);
  WriteString(str);
END WriteHexCard;


PROCEDURE WriteLong(val: LONGCARD; len: CARDINAL);
VAR str: ARRAY[0..19] OF CHAR;
BEGIN
  StrUtil.FormatHexLong(val, len, str);
  WriteString(str);
END WriteLong;


PROCEDURE WriteSpaces(n: CARDINAL);
BEGIN
  WriteLn();
  WHILE n > 0 DO
    Write(' ');
    DEC(n);
  END;
END WriteSpaces;


PROCEDURE ReadByte();
VAR b: BYTE;
BEGIN
  NewStreams.ReadByte(symFile, b);
  lastByte := SymFileSymbols(LONGCARD(b)); (* XXX: useless cast *)
END ReadByte;


PROCEDURE ReadString(VAR str: ARRAY OF CHAR);
VAR ch: CHAR;
    i: CARDINAL;
BEGIN
  i := 0;
  REPEAT
    NewStreams.ReadChar(symFile, ch);
    IF i <= HIGH(str) THEN
      str[i] := ch;
      INC(i);
    END;
  UNTIL ch = 0C;
END ReadString;


PROCEDURE Read16Bit(VAR w: CARDINAL);
BEGIN
  NewStreams.Read16Bit(symFile, w);
END Read16Bit;


PROCEDURE Read32Bit(VAR l: LONGCARD);
VAR hi, lo: CARDINAL;
BEGIN
  Read16Bit(hi);
  Read16Bit(lo);
  l := LONGCARD(hi) * 65536 + LONGCARD(lo);
END Read32Bit;


PROCEDURE Expect(b: SymFileSymbols);
BEGIN
  IF lastByte <> b THEN
    WriteString('incorrect symbol on symbol file');
    Error('');
  END;
END Expect;


PROCEDURE NextIf(b: SymFileSymbols);
BEGIN
  Expect(b);
  ReadByte();
END NextIf;


PROCEDURE IndentUp(VAR s: ARRAY OF CHAR);
BEGIN
  indentLevel := outputX + INDENT;
  CODE(nop); (* XXX *)
  WriteString(s);
END IndentUp;


PROCEDURE IndentDown(VAR s: ARRAY OF CHAR);
BEGIN
  DEC(indentLevel, INDENT);
  WriteSpaces(indentLevel);
  CODE(nop); (* XXX *)
  WriteString(s);
END IndentDown;


PROCEDURE DecodeShortConst(): CARDINAL;
VAR w: CARDINAL;
BEGIN
  Expect(shortconstSS);
  Read16Bit(w);
  ReadByte();
  RETURN w;
END DecodeShortConst;


PROCEDURE DecodeLongConst(): LONGCARD;
VAR l: LONGCARD;
BEGIN
  Expect(normalconstSS);
  Read32Bit(l);
  ReadByte();
  RETURN l;
END DecodeLongConst;


PROCEDURE DecodeIdent();
VAR s: StrBuf;
BEGIN
  Expect(identSS);
  ReadString(s);
  WriteString(s);
  ReadByte();
END DecodeIdent;


PROCEDURE SkipIdent();
VAR s: StrBuf;
BEGIN
  Expect(identSS);
  ReadString(s);
  ReadByte();
END SkipIdent;


PROCEDURE DecodeModuleKey();
BEGIN
  WriteLn();
  WriteSpaces(indentLevel);
  WriteString('(*module key = ');
  WriteHexCard(DecodeShortConst(), 5);
  WriteHexCard(DecodeShortConst(), 5);
  WriteHexCard(DecodeShortConst(), 5);
  WriteString('*)');
END DecodeModuleKey;


PROCEDURE DecodeFileKey();
VAR version: CARDINAL;
BEGIN
  version := DecodeShortConst();
  WriteString('(*syntax version = ');
  WriteHexCard(version, 5);
  WriteString('*)');
  IF version <> symFileKey THEN
    WriteString('error: SymFileSyntaxVersion must be ');
    WriteCard(symFileKey, 1);
    WriteLn();
    Error('');
  END;
END DecodeFileKey;


PROCEDURE DecodeModuleIdent();
BEGIN
  Expect(identSS);
  ReadString(moduleident);
  WriteLn();
  WriteString('DEFINITION MODULE ');
  WriteString(moduleident);
  Write(';');
  WriteLn();
  ReadByte();
END DecodeModuleIdent;


PROCEDURE DecodeModuleHeader();
BEGIN
  DecodeFileKey();
  DecodeModuleKey();
  DecodeModuleIdent();
END DecodeModuleHeader;


PROCEDURE DecodeSubModuleIdent(VAR moduleIdent: ARRAY OF CHAR);
BEGIN
  Expect(identSS);
  CODE(nop); (* XXX *)
  ReadString(moduleIdent);
  WriteSpaces(indentLevel);
  WriteString('MODULE ');
  CODE(nop); (* XXX *)
  WriteString(moduleIdent);
  Write(';');
  WriteLn();
  ReadByte();
END DecodeSubModuleIdent;


PROCEDURE DecodeMember();
BEGIN
  DecodeIdent();
  WHILE lastByte = periodSS DO
    ReadByte();
    Write('.');
    DecodeIdent();
  END;
END DecodeMember;


PROCEDURE DecodeRealHi();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteHexCard(w, 4);
END DecodeRealHi;


PROCEDURE DecodeRealLo();
VAR w: CARDINAL;
BEGIN
  Read16Bit(w);
  WriteHexCard(w, 4);
END DecodeRealLo;


PROCEDURE DecodeReal();
BEGIN
  DecodeRealHi();
  DecodeRealLo();
  WriteString('(*Real-not yet implemented*)');
END DecodeReal;


PROCEDURE DecodeString();
VAR str: StrBuf;
BEGIN
  ReadString(str);
  Write('"'); (* FIXME: check if string contains '"' *)
  WriteString(str);
  Write('"');
  ReadByte();
END DecodeString;


PROCEDURE DecodeConst();
BEGIN
  CASE lastByte OF
  shortconstSS:
    WriteCard(DecodeShortConst(), 1);
    WriteString('(*');
    DecodeMember();
    WriteString('*)'); |
  normalconstSS:
    WriteLong(DecodeLongConst(), 1);
    WriteString('(*');
    DecodeMember();
    WriteString('*)'); |
  realconstSS:
    DecodeReal(); |
  stringconstSS:
    DecodeString(); |
  ELSE
    WriteString(' illegal symbol in CONST-Declaration ');
  END
END DecodeConst;


PROCEDURE DecodeList();
VAR oldindentLevel: CARDINAL;
BEGIN
  NextIf(lparentSS);
  Write('(');
  oldindentLevel := indentLevel;
  WHILE lastByte = identSS DO
    DecodeIdent();
    WriteString('(*');
    WriteCard(DecodeShortConst(), 1);
    WriteString('*)');
    IF lastByte = identSS THEN
      Write(',');
      WriteSpaces(oldindentLevel);
    END;
  END;
  NextIf(rparentSS);
  Write(')');
END DecodeList;


PROCEDURE DecodeRange();
BEGIN
  NextIf(lbracketSS);
  Write('[');
  DecodeConst();
  NextIf(rangeSS);
  WriteString('..');
  DecodeConst();
  NextIf(rbracketSS);
  Write(']');
END DecodeRange;


PROCEDURE DecodeSimpleType();
BEGIN
  CASE lastByte OF
  identSS:
    DecodeMember(); |
  lparentSS:
    DecodeList(); |
  lbracketSS:
    DecodeRange(); |
  ELSE
    Error(' illegal symbol in Simple Type ');
  END;
END DecodeSimpleType;


PROCEDURE DecodeArrayType();
BEGIN
  NextIf(arraytypSS);
  WriteString('ARRAY ');
  DecodeSimpleType();
  NextIf(ofSS);
  WriteString(' OF ');
  DecodeType();
END DecodeArrayType;


PROCEDURE DecodeSize();
BEGIN
  WriteString('(*size: ');
  WriteLong(DecodeLongConst(), 1);
  WriteString('*)');
END DecodeSize;


PROCEDURE DecodeOffset();
BEGIN
  WriteString('(*offset: ');
  WriteLong(DecodeLongConst(), 1);
  WriteString('*) ');
END DecodeOffset;


PROCEDURE DecodeRecordIdent();
BEGIN
  WriteSpaces(indentLevel);
  DecodeIdent();
  DecodeOffset();
  NextIf(colonSS);
  WriteString(' : ');
  DecodeType();
  Write(';');
END DecodeRecordIdent;


PROCEDURE DecodeVariantVal();
BEGIN
  WriteCard(DecodeShortConst(), 2);
END DecodeVariantVal;


PROCEDURE DecodeVariant();
BEGIN
  WriteSpaces(indentLevel);
  NextIf(caseSS);
  IndentUp('CASE');
  NextIf(colonSS);
  WriteString(' : ');
  DecodeMember();
  WriteString(' OF ');
  WriteSpaces(indentLevel);
  WHILE lastByte = ofSS DO
    ReadByte();
    WHILE lastByte = shortconstSS DO
      DecodeVariantVal();
      IF lastByte = shortconstSS THEN
        WriteString(', ');
      END;
    END;
    NextIf(colonSS);
    WriteString(' : ');
    IF lastByte = caseSS THEN
      DecodeVariant();
    END;
    DecodeSize();
    IF lastByte = ofSS THEN
      WriteSpaces(indentLevel - INDENT);
      WriteString('| ');
    END;
  END;
  IF lastByte = elseSS THEN
    NextIf(elseSS);
    WriteSpaces(indentLevel);
    WriteString('ELSE ');
    IF lastByte = caseSS THEN
      DecodeVariant();
      DecodeSize();
    END;
  END;
  NextIf(endSS);
  IndentDown('END;');
END DecodeVariant;


PROCEDURE DecodeRecordType();
BEGIN
  NextIf(recordtypSS);
  IndentUp('RECORD');
  WHILE lastByte = identSS DO
    DecodeRecordIdent();
  END;
  IF lastByte = caseSS THEN
    DecodeVariant();
  END;
  NextIf(endSS);
  IndentDown('END;');
  DecodeSize();
END DecodeRecordType;


PROCEDURE DecodeSetType();
BEGIN
  NextIf(settypSS);
  WriteString('SET OF ');
  DecodeSimpleType();
END DecodeSetType;


PROCEDURE DecodePointerType();
BEGIN
  NextIf(pointertypSS);
  WriteString('POINTER TO ');
  DecodeType();
END DecodePointerType;


PROCEDURE DecodeProcedureType();
BEGIN
  NextIf(procSS);
  WriteString('PROCEDURE ');
  NextIf(lparentSS);
  Write('(');
  WHILE (lastByte = varSS) OR (lastByte = arraytypSS) OR (lastByte = identSS) DO
    IF lastByte = varSS THEN
      WriteString('VAR ');
      ReadByte();
    END;
    IF lastByte = arraytypSS THEN
      WriteString('ARRAY '); (* BUG: missing OF *);
      ReadByte();
    END;
    DecodeMember();
    IF lastByte <> rparentSS THEN
      WriteString('; ');
    END;
  END;
  NextIf(rparentSS);
  Write(')');
  IF lastByte = colonSS THEN
    WriteString(' : ');
    DecodeMember();
  END;
END DecodeProcedureType;


PROCEDURE DecodeType();
BEGIN
  CASE lastByte OF
  identSS, lparentSS, lbracketSS:
    DecodeSimpleType(); |
  hiddentypSS:
    ReadByte();
    WriteString(' (*hidden type*) '); |
  arraytypSS:
    DecodeArrayType(); |
  recordtypSS:
    DecodeRecordType(); |
  settypSS:
    DecodeSetType(); |
  pointertypSS:
    DecodePointerType(); |
  procSS:
    DecodeProcedureType(); |
  ELSE
    Error(' illegal symbol in TYPE-Declaration ');
  END;
END DecodeType;


PROCEDURE DecodeConstDecl();
BEGIN
  WriteSpaces(indentLevel);
  DecodeIdent();
  WriteString(' = ');
  DecodeConst();
  Write(';');
END DecodeConstDecl;


PROCEDURE DecodeTypeDecl();
BEGIN
  WriteSpaces(indentLevel);
  DecodeIdent();
  WriteString(' = ');
  DecodeType();
  Write(';');
END DecodeTypeDecl;


PROCEDURE DecodeProcnum();
BEGIN
  WriteString('(* ProcNum:');
  WriteCard(DecodeShortConst(), 1);
  WriteString(' *)');
END DecodeProcnum;


PROCEDURE DecodeProcParams();
BEGIN
  NextIf(procSS);
  NextIf(lparentSS);
  Write('(');
  WHILE (lastByte = varSS) OR (lastByte = arraytypSS) OR (lastByte = identSS) DO
    IF lastByte = varSS THEN
      WriteString('VAR ');
      ReadByte();
    END;
    IF lastByte = arraytypSS THEN
      WriteString('ARRAY '); (* BUG: missing OF *);
      ReadByte();
    END;
    DecodeMember();
    IF lastByte <> rparentSS THEN
      WriteString('; ');
    END;
  END;
  NextIf(rparentSS);
  Write(')');
  IF lastByte = colonSS THEN
    ReadByte();
    WriteString(' : ');
    DecodeMember();
  END;
END DecodeProcParams;


PROCEDURE DecodeProcDecl();
BEGIN
  DecodeIdent();
  DecodeProcnum();
  DecodeProcParams();
  Write(';');
END DecodeProcDecl;


PROCEDURE DecodeVarAddr();
BEGIN
  WriteString(' (* ');
  IF lastByte = lbracketSS THEN
    WriteString('absaddr: ');
    NextIf(lbracketSS);
    WriteLong(DecodeLongConst(), 1);
    NextIf(rbracketSS);
  ELSE
    WriteString('reladdr: ');
    WriteLong(DecodeLongConst(), 1);
  END;
  WriteString('*) ');
END DecodeVarAddr;


PROCEDURE DecodeVarDecl();
BEGIN
  WriteSpaces(indentLevel);
  DecodeIdent();
  DecodeVarAddr();
  NextIf(colonSS);
  WriteString(' : ');
  DecodeType();
  Write(';');
END DecodeVarDecl;


PROCEDURE DecodeDecl();
BEGIN
  indentLevel := 2 * INDENT;
  WriteSpaces(indentLevel);
  CASE lastByte OF
  constSS:
    IndentUp('CONST');
    ReadByte();
    WHILE lastByte = identSS DO
      DecodeConstDecl();
    END; |
  typSS:
    IndentUp('TYPE');
    ReadByte();
    WHILE lastByte = identSS DO
      DecodeTypeDecl();
    END; |
  procSS:
    IndentUp('PROCEDURE ');
    ReadByte();
    DecodeProcDecl(); |
  varSS:
    IndentUp('VAR');
    ReadByte();
    WHILE lastByte = identSS DO
      DecodeVarDecl();
    END; |
  ELSE
    Error(' illegal SymFileSymbol ');
  END;
  IndentDown('');
END DecodeDecl;


PROCEDURE DecodeUnit();
VAR unitIdent: StrBuf;
BEGIN
  NextIf(unitSS);
  indentLevel := INDENT;
  DecodeModuleKey();
  DecodeSubModuleIdent(unitIdent);
  IF lastByte = importSS THEN
    ReadByte();
    WriteSpaces(2 * INDENT);
    WriteString('IMPORT ');
    WHILE lastByte = identSS DO
      DecodeIdent();
      IF lastByte = identSS THEN
        WriteString(', ');
      ELSE
        Write(';');
        WriteLn();
      END;
    END;
  END;
  IF lastByte = exportSS THEN
    ReadByte();
    IF printExports THEN
      WriteSpaces(2 * INDENT);
      WriteString('EXPORT QUALIFIED ');
      WHILE lastByte = identSS DO
        DecodeIdent();
        IF lastByte = identSS THEN
          WriteString(', ');
        ELSE
          Write(';');
          WriteLn();
        END;
      END;
    ELSE
      WHILE lastByte = identSS DO
        SkipIdent();
      END;
    END;
  END;
  WHILE (lastByte = constSS) OR (lastByte = typSS) OR (lastByte = procSS) OR (lastByte = varSS) DO
    DecodeDecl();
  END;
  NextIf(endunitSS);
  WriteSpaces(INDENT);
  WriteString('END ');
  WriteString(unitIdent);
  Write(';');
END DecodeUnit;


PROCEDURE Decode();
BEGIN
  DecodeModuleHeader();
  WHILE lastByte = unitSS DO
    DecodeUnit();
  END;
  Expect(endfileSS);
  WriteLn();
  WriteLn();
  WriteString('END ');
  WriteString(moduleident);
  Write('.');
  WriteLn();
  WriteLn();
END Decode;


BEGIN
  AppWindow.WriteString('Symbol file decoder   Version  3.00a');
  AppWindow.WriteLn();
  AppWindow.WriteLn();
  outputFailed := FALSE;
  OpenFiles();
  IF NOT outputFailed THEN
    indentLevel := 0;
    ReadByte();
    Decode();
    CloseFiles();
  END;
  AppWindow.WriteLn();
  AppWindow.WriteString('End of decode');
  AppWindow.WriteLn();
  ExecUtil.IOError(0, FALSE);
END decsym.
