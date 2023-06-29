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

CONST nop = 04E71H;

VAR crc: CARDINAL;
VAR outputFailed: BOOLEAN;
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


PROCEDURE WriteRange(val: CARDINAL; size: CARDINAL);
BEGIN
  WriteHexCard(val, 7);
  IF size <> 0 THEN
    WriteHexCard(size + val, 8);
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


VAR b: BYTE;
VAR w: CARDINAL;
VAR pc: disasm.OpCodePtr;
VAR addr: LONGCARD;
VAR numOpcodes: CARDINAL;
VAR strbuf: ARRAY [0..79] OF CHAR;
VAR arr: ARRAY[0..0] OF CARDINAL;

BEGIN
  AppWindow.WriteString('Link file decoder   Version  2.00a');
  AppWindow.WriteLn();
  AppWindow.WriteLn();
  
  disasm.disasm(addr, pc, numOpcodes, strbuf);
  
  StrUtil.FormatCard(0, 0, strbuf);
  StrUtil.FormatHexCard(0, 0, strbuf);
  StrUtil.FormatLong(0, 0, strbuf);
  
  OpenFiles();
  CloseFiles();
  
  NewStreams.WriteChar(decFile, NewStreams.eolc);
  Read16Bit(w);
  ParameterError('');
  WriteLn();
  Write(' ');
  WriteString('');
  WriteSpaces(0);
  WriteHexCard(0, 0);
  WriteHexZeroCard(0);
  WriteCard(0, 0);
  WriteLong(0, 0);
  resetCrc();
  WriteData(arr, 0);
  DecodeData(0, 0);
  DecodeInstructions(0, 0, 0);
  
  ExecUtil.IOError(0, FALSE);
END declnk.
