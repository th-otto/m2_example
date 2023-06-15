IMPLEMENTATION MODULE XBIOS;
(*$S-*)
(*$T-*)

FROM SYSTEM IMPORT CODE, ADR, PUSH, REGISTER, BYTE, ADDRESS;

CONST TRAP14 = 04E4EH;


PROCEDURE InitMouse(mtyp: MouseType; VAR param: ParamBlk; serveproc: PROC);
BEGIN
  PUSH(serveproc);
  PUSH(ADR(param));
  PUSH(ORD(mtyp));
  PUSH(0);
  CODE(TRAP14);
END InitMouse;


PROCEDURE ScreenPhysicalBase(): ADDRESS;
BEGIN
  PUSH(2);
  CODE(TRAP14);
  RETURN REGISTER(0);
END ScreenPhysicalBase;


PROCEDURE ScreenLogicalBase(): ADDRESS;
BEGIN
  PUSH(3);
  CODE(TRAP14);
  RETURN REGISTER(0);
END ScreenLogicalBase;


PROCEDURE GetResolution(): INTEGER;
BEGIN
  PUSH(4);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END GetResolution;


PROCEDURE SetScreenBase(logLoc, physLoc: ADDRESS; rez: INTEGER);
BEGIN
  PUSH(rez);
  PUSH(physLoc); (* works also for NIL = -1 *)
  PUSH(logLoc); (* works also for NIL = -1 *)
  PUSH(5);
  CODE(TRAP14);
END SetScreenBase;


PROCEDURE SetPalette(VAR palette: Palette);
BEGIN
  PUSH(ADR(palette));
  PUSH(6);
  CODE(TRAP14);
END SetPalette;


PROCEDURE SetColour(colorNum, color: CARDINAL): CARDINAL;
BEGIN
  PUSH(color);
  PUSH(colorNum);
  PUSH(7);
  CODE(TRAP14);
  RETURN CARDINAL(REGISTER(0));
END SetColour;


PROCEDURE FloppyRead(buffer: ADDRESS; drive: CARDINAL; sector, track, side: CARDINAL; count: CARDINAL): INTEGER;
BEGIN
  PUSH(count);
  PUSH(side);
  PUSH(track);
  PUSH(sector);
  PUSH(drive);
  PUSH(LONGCARD(0)); (* filler *)
  PUSH(buffer);
  PUSH(8);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END FloppyRead;


PROCEDURE FloppyWrite(buffer: ADDRESS; drive: CARDINAL; sector, track, side: CARDINAL; count: CARDINAL): INTEGER;
BEGIN
  PUSH(count);
  PUSH(side);
  PUSH(track);
  PUSH(sector);
  PUSH(drive);
  PUSH(LONGCARD(0)); (* filler *)
  PUSH(buffer);
  PUSH(9);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END FloppyWrite;


PROCEDURE FloppyFormat(buffer: ADDRESS; drive: CARDINAL; spt, track, side: CARDINAL; interleave: CARDINAL; virgin: CARDINAL): INTEGER;
BEGIN
  PUSH(virgin);
  PUSH(LONGCARD(087654321H));
  PUSH(interleave);
  PUSH(side);
  PUSH(track);
  PUSH(spt);
  PUSH(drive);
  PUSH(LONGCARD(0)); (* filler *)
  PUSH(buffer);
  PUSH(10);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END FloppyFormat;


PROCEDURE MIDIWS(VAR str: ARRAY OF BYTE; len: CARDINAL);
BEGIN
  PUSH(ADR(str));
  PUSH(len);
  PUSH(12);
  CODE(TRAP14);
END MIDIWS;


PROCEDURE MFPint(intNo: CARDINAL; vector: PROC);
BEGIN
  PUSH(vector);
  PUSH(intNo);
  PUSH(13);
  CODE(TRAP14);
END MFPint;


PROCEDURE IORec(dev: SerialDevice): IORECPTR;
BEGIN
  PUSH(ORD(dev));
  PUSH(14);
  CODE(TRAP14);
  RETURN IORECPTR(REGISTER(0));
END IORec;


PROCEDURE ConfigureRS232(baud: SerialSpeed; handshake: FlowFlavor; ucr, rsr, tsr, scr: INTEGER);
BEGIN
  PUSH(scr);
  PUSH(tsr);
  PUSH(rsr);
  PUSH(ucr);
  PUSH(ORD(handshake));
  PUSH(ORD(baud));
  PUSH(15);
  CODE(TRAP14);
END ConfigureRS232;


PROCEDURE SetKeyTable(VAR unshift, shift, capslock: KeyTransPtr): KeyTablePtr;
BEGIN
  PUSH(capslock);
  PUSH(shift);
  PUSH(unshift);
  PUSH(16);
  CODE(TRAP14);
  RETURN KeyTablePtr(REGISTER(0));
END SetKeyTable;


PROCEDURE Random(): LONGCARD;
BEGIN
  PUSH(17);
  CODE(TRAP14);
  RETURN LONGCARD(REGISTER(0));
END Random;


PROCEDURE PrototypeBootSector(buffer: ADDRESS; serialNo: LONGINT; disktype: INTEGER; execFlag: INTEGER);
BEGIN
  PUSH(execFlag);
  PUSH(disktype);
  PUSH(serialNo);
  PUSH(buffer);
  PUSH(18);
  CODE(TRAP14);
END PrototypeBootSector;


PROCEDURE FloppyVerify(buffer: ADDRESS; drive: CARDINAL; sector, track, side: CARDINAL; count: CARDINAL): INTEGER;
BEGIN
  PUSH(count);
  PUSH(side);
  PUSH(track);
  PUSH(sector);
  PUSH(drive);
  PUSH(LONGCARD(0)); (* filler *)
  PUSH(buffer);
  PUSH(19);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END FloppyVerify;


(* arguments swapped compared to Megamax Modula! *)
PROCEDURE ConfigureCursor(rate, mode: INTEGER): INTEGER;
BEGIN
  PUSH(rate);
  PUSH(mode);
  PUSH(21);
  CODE(TRAP14);
  RETURN INTEGER(REGISTER(0));
END ConfigureCursor;


PROCEDURE SetDateTime(datetime: LONGCARD);
BEGIN
  PUSH(datetime);
  PUSH(22);
  CODE(TRAP14);
END SetDateTime;


PROCEDURE GetDateTime(): LONGCARD;
BEGIN
  PUSH(23);
  CODE(TRAP14);
  RETURN LONGCARD(REGISTER(0));
END GetDateTime;


PROCEDURE KeyboardWS(VAR str: ARRAY OF BYTE; len: CARDINAL);
BEGIN
  PUSH(ADR(str));
  PUSH(len);
  PUSH(25);
  CODE(TRAP14);
END KeyboardWS;


PROCEDURE DisableInterrupt(intNo: CARDINAL);
BEGIN
  PUSH(intNo);
  PUSH(26);
  CODE(TRAP14);
END DisableInterrupt;


PROCEDURE EnableInterrupt(intNo: CARDINAL);
BEGIN
  PUSH(intNo);
  PUSH(27);
  CODE(TRAP14);
END EnableInterrupt;


PROCEDURE GIRead(regno: CARDINAL): CARDINAL;
BEGIN
  PUSH(regno);
  PUSH(0C);
  PUSH(28);
  CODE(TRAP14);
  RETURN CARDINAL(REGISTER(0));
END GIRead;


PROCEDURE GIWrite(regno: CARDINAL; data: CARDINAL);
BEGIN
  PUSH(INTEGER(BITSET(regno) + BITSET(080H)));
  PUSH(data);
  PUSH(28);
  CODE(TRAP14);
END GIWrite;


PROCEDURE GIOffBit(bitno: CARDINAL);
BEGIN
  PUSH(bitno);
  PUSH(29);
  CODE(TRAP14);
END GIOffBit;


PROCEDURE GIOnBit(bitno: CARDINAL);
BEGIN
  PUSH(bitno);
  PUSH(30);
  CODE(TRAP14);
END GIOnBit;


PROCEDURE SetTimerInterrupt(which: Timer; control, data: CARDINAL; vec: PROC);
BEGIN
  PUSH(vec);
  PUSH(data);
  PUSH(control);
  PUSH(ORD(which));
  PUSH(31);
  CODE(TRAP14);
END SetTimerInterrupt;


PROCEDURE DoSound(data: ADDRESS);
BEGIN
  PUSH(data);
  PUSH(32);
  CODE(TRAP14);
END DoSound;


PROCEDURE ConfigurePrinter(config: PrtConfigSet): PrtConfigSet;
BEGIN
  PUSH(CARDINAL(config));
  PUSH(33);
  CODE(TRAP14);
  RETURN PrtConfigSet(REGISTER(0));
END ConfigurePrinter;


PROCEDURE KeyboardVectors(): KBVectorPtr;
BEGIN
  PUSH(34);
  CODE(TRAP14);
  RETURN KBVectorPtr(REGISTER(0));
END KeyboardVectors;


PROCEDURE KeyboardRate(initial, repeat: INTEGER): CARDINAL;
BEGIN
  PUSH(repeat);
  PUSH(initial);
  PUSH(35);
  CODE(TRAP14);
  RETURN CARDINAL(REGISTER(0));
END KeyboardRate;


PROCEDURE BiosKeys();
BEGIN
  PUSH(24);
  CODE(TRAP14);
END BiosKeys;


PROCEDURE ScreenDump();
BEGIN
  PUSH(20);
  CODE(TRAP14);
END ScreenDump;


PROCEDURE VSync();
BEGIN
  PUSH(37);
  CODE(TRAP14);
END VSync;


PROCEDURE SuperExec(Code: PROC);
BEGIN
  PUSH(Code);
  PUSH(38);
  CODE(TRAP14);
END SuperExec;


PROCEDURE PuntAES();
BEGIN
  PUSH(39);
  CODE(TRAP14);
END PuntAES;


END XBIOS.
