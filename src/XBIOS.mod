IMPLEMENTATION MODULE XBIOS;
(*$Z-,S-,N+,R-,L-*)
(*$Y+*)

(*
TT 20.07.90: ConfigurePrinter: MOVE.W statt MOVE.L, SET muesste nun stimmen
TT 21.08.90: BlitMode & FlopRate neu
TT 08.04.91: SetKeyTable funktioniert nun
TT 20.10.91: $M- entfernt.
THO 25.05.23: Port to gm2
*)

FROM SYSTEM IMPORT ADR, ADDRESS, CARDINAL8, INTEGER16, BYTE, WORD;
FROM SysTypes IMPORT PtrOSHeader;
FROM SysVars IMPORT _sysbase;


PROCEDURE trap_14_w(n: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %1,-(%%sp); trap #14; addq.l #2,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_w;


PROCEDURE trap_14_ww(n: INTEGER16; a: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; addq.l #4,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_ww;


PROCEDURE trap_14_www(n: INTEGER16; a: INTEGER16; b: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; addq.l #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_www;


PROCEDURE trap_14_wwwwwww(n: INTEGER16; a: INTEGER16; b: INTEGER16; c: INTEGER16; d: INTEGER16; e: INTEGER16; f: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %7,-(%%sp); move.w %6,-(%%sp); move.w %5,-(%%sp); move.w %4,-(%%sp); move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e), "r"(f)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wwwwwww;


PROCEDURE trap_14_wwl(n: INTEGER16; a: INTEGER16; b: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; addq.l #8,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wwl;


PROCEDURE trap_14_wlll(n: INTEGER16; a: INTEGER32; b: INTEGER32; c: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wlll;


PROCEDURE trap_14_wwwl(n: INTEGER16; a: INTEGER16; b: INTEGER16; c: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %4,-(%%sp); move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 10(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wwwl;


PROCEDURE trap_14_wwwwl(n: INTEGER16; a: INTEGER16; b: INTEGER16; c: INTEGER16; d: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %5,-(%%sp); move.w %4,-(%%sp); move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 12(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wwwwl;


PROCEDURE trap_14_wlwlw(n: INTEGER16; a: INTEGER32; b: INTEGER16; c: INTEGER32; d: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %5,-(%%sp); move.l %4,-(%%sp); move.w %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wlwlw;


PROCEDURE trap_14_wl(n: INTEGER16; a: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; addq.l #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wl;


PROCEDURE trap_14_wwll(n: INTEGER16; a: INTEGER16; b: INTEGER32; c: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %4,-(%%sp); move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 12(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wwll;


PROCEDURE trap_14_wllw(n: INTEGER16; a: INTEGER32; b: INTEGER32; c: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 12(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wllw;


PROCEDURE trap_14_wllww(n: INTEGER16; a: INTEGER32; b: INTEGER32; c: INTEGER16; d: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %5,-(%%sp); move.w %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wllww;


PROCEDURE trap_14_wllwwwww(n: INTEGER16; a: INTEGER32; b: INTEGER32; c: INTEGER16; d: INTEGER16; e: INTEGER16; f: INTEGER16; g: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %8,-(%%sp); move.w %7,-(%%sp); move.w %6,-(%%sp); move.w %5,-(%%sp); move.w %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 20(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e), "r"(f), "r"(g)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wllwwwww;


PROCEDURE trap_14_wllwwwwwlw(n: INTEGER16; a: INTEGER32; b: INTEGER32; c: INTEGER16; d: INTEGER16; e: INTEGER16; f: INTEGER16; g: INTEGER32; h: INTEGER32; i: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %10,-(%%sp); move.l %9,-(%%sp); move.w %8,-(%%sp); move.w %7,-(%%sp); move.w %6,-(%%sp); move.w %5,-(%%sp); move.w %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #14; lea 26(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e), "r"(f), "r"(g), "r"(h), "r"(i)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_14_wllwwwwwlw;


PROCEDURE InitMouse (mtyp: MouseType; VAR param: ParamBlk; serveproc: ADDRESS);
  BEGIN
    trap_14_wwll(0, INTEGER(mtyp), INTEGER32(ADR(param)), INTEGER32(serveproc))
  END InitMouse;


PROCEDURE Ssbrk(count: INTEGER16): ADDRESS;
VAR adr: ADDRESS;
  BEGIN
    adr := ADDRESS(trap_14_ww(1, count));
    RETURN adr
  END Ssbrk;


PROCEDURE ScreenPhysicalBase (): ADDRESS;
  BEGIN
    RETURN ADDRESS(trap_14_w(2))
  END ScreenPhysicalBase;


PROCEDURE ScreenLogicalBase (): ADDRESS;
  BEGIN
    RETURN ADDRESS(trap_14_w(3))
  END ScreenLogicalBase;


PROCEDURE GetResolution (): INTEGER16;
  BEGIN
    RETURN trap_14_w(4)
  END GetResolution;


PROCEDURE SetScreenBase (logLoc, physLoc: ADDRESS; rez: INTEGER16);
  BEGIN
    IF logLoc = NIL THEN logLoc := ADDRESS(-1); END;
    IF physLoc = NIL THEN physLoc := ADDRESS(-1); END;
    trap_14_wllw(5, INTEGER32(logLoc), INTEGER32(physLoc), rez);
  END SetScreenBase;


PROCEDURE SetPalette (VAR palette: Palette);
  BEGIN
    trap_14_wl(6, INTEGER32(ADR(palette)))
  END SetPalette;


PROCEDURE SetColour (colorNum, color: CARDINAL16): [ CARDINAL16 ];
  BEGIN
    RETURN trap_14_www(7, colorNum, color)
  END SetColour;


PROCEDURE FloppyRead (buffer: ADDRESS; drive, sector,
                      track, side, count: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wllwwwww(8, INTEGER32(buffer), 0, drive, sector, track, side, count)
  END FloppyRead;
  

PROCEDURE FloppyWrite (buffer: ADDRESS; drive, sector,
                       track, side, count: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wllwwwww(9, INTEGER32(buffer), 0, drive, sector, track, side, count)
  END FloppyWrite;
  

PROCEDURE FloppyFormat (buffer: ADDRESS; drive, spt, track,
                        side, interleave, virgin: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wllwwwwwlw(10, INTEGER32(buffer), 0, drive, spt, track, side, interleave, INTEGER32(087654321H), virgin)
  END FloppyFormat;
  

PROCEDURE MIDIWS (VAR str: ARRAY OF BYTE; len: CARDINAL16);
  BEGIN
    trap_14_wwl(12, len, INTEGER32(ADR(str)));
  END MIDIWS;
  

PROCEDURE MFPint (intNo: CARDINAL16; vector: PROC);
  BEGIN
    trap_14_wwl(13, intNo, INTEGER32(vector));
  END MFPint;


PROCEDURE IORec (dev: SerialDevice): IORECPTR;
  BEGIN
    RETURN IORECPTR(trap_14_ww(14, INTEGER(dev)));
  END IORec;


PROCEDURE ConfigureRS232 (baud: SerialSpeed; handshake: FlowFlavor;
                          ucr, rsr, tsr, scr: INTEGER16): [ CARDINAL32 ];
  BEGIN
    RETURN trap_14_wwwwwww(15, INTEGER(baud), INTEGER(handshake), ucr, rsr, tsr, scr);
  END ConfigureRS232;


PROCEDURE SetKeyTable (unshift, shift, capslock: KeyTransPtr): KeyTablePtr;
  BEGIN
    RETURN KeyTablePtr(trap_14_wlll(16, INTEGER32(unshift), INTEGER32(shift), INTEGER32(capslock)))
  END SetKeyTable;


PROCEDURE Random (): CARDINAL32;
  BEGIN
    RETURN trap_14_w(17)
  END Random;


PROCEDURE PrototypeBootSector (buffer: ADDRESS; serialNo: INTEGER32;
                               disktype, execFlag: INTEGER16);
  BEGIN
    trap_14_wllww(18, INTEGER32(buffer), serialNo, disktype, execFlag);
  END PrototypeBootSector;


PROCEDURE FloppyVerify (buffer: ADDRESS; drive, sector,
                        track, side, count: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wllwwwww(19, INTEGER32(buffer), 0, drive, sector, track, side, count)
  END FloppyVerify;
  

PROCEDURE ScreenDump ();
  BEGIN
    trap_14_w(20)
  END ScreenDump;


PROCEDURE ConfigureCursor (mode: INTEGER16; rate: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_www(21, mode, rate);
  END ConfigureCursor;


PROCEDURE SetDateTime (datetime: CARDINAL32);
  BEGIN
    trap_14_wl(22, datetime)
  END SetDateTime;


PROCEDURE GetDateTime (): CARDINAL32;
  BEGIN
    RETURN trap_14_w(23)
  END GetDateTime;


PROCEDURE BiosKeys ();
  BEGIN
    trap_14_w(24)
  END BiosKeys;


PROCEDURE KeyboardWS (VAR str: ARRAY OF BYTE; len: CARDINAL16);
  BEGIN
    trap_14_wwl(25, len, INTEGER32(ADR(str)));
  END KeyboardWS;
  

PROCEDURE DisableInterrupt (intNo: CARDINAL16);
  BEGIN
    trap_14_ww(26, intNo);
  END DisableInterrupt;


PROCEDURE EnableInterrupt (intNo: CARDINAL16);
  BEGIN
    trap_14_ww(27, intNo);
  END EnableInterrupt;


PROCEDURE GIRead (regno: CARDINAL16): CARDINAL16;
VAR r: INTEGER;
  BEGIN
    r := SHORTINT(regno);
    RETURN trap_14_www(28, 0, INTEGER(BITSET(r) * BITSET(07FH)))
  END GIRead;
  

PROCEDURE GIWrite (regno: CARDINAL16; data: CARDINAL16);
VAR r: INTEGER;
  BEGIN
    r := SHORTINT(regno);
    trap_14_www(28, data, INTEGER(BITSET(r) + BITSET(080H)))
  END GIWrite;
  

PROCEDURE GIOffBit (bitno: CARDINAL16);
  BEGIN
    trap_14_ww(29, bitno)
  END GIOffBit;


PROCEDURE GIOnBit (bitno: CARDINAL16);
  BEGIN
    trap_14_ww(30, bitno)
  END GIOnBit;


PROCEDURE SetTimerInterrupt (which: Timer; control, data: CARDINAL16; vec: PROC);
  BEGIN
    trap_14_wwwwl(31, INTEGER(which), control, data, INTEGER32(vec));
  END SetTimerInterrupt;


PROCEDURE DoSound (data: ADDRESS): [ ADDRESS ];
  BEGIN
    RETURN ADDRESS(trap_14_wl(32, INTEGER32(data)))
  END DoSound;


PROCEDURE ConfigurePrinter (config: PrtConfigSet): [ PrtConfigSet ];
  BEGIN
    RETURN PrtConfigSet(trap_14_ww(33, INTEGER(config)));
  END ConfigurePrinter;


PROCEDURE KeyboardVectors (): KBVectorPtr;
  BEGIN
    RETURN KBVectorPtr(trap_14_w(34))
  END KeyboardVectors;


PROCEDURE KeyboardRate (initial, repeat: INTEGER16): [ CARDINAL16 ];
  BEGIN
    RETURN trap_14_www(35, initial, repeat)
  END KeyboardRate;


(*
PROCEDURE Prtblk(VAR par: PBDEF);
BEGIN
    trap_14_wl(36, ADR(par));
END Prtblk;
*)


PROCEDURE VSync ();
  BEGIN
    trap_14_w(37)
  END VSync;


PROCEDURE SuperExec (Code: SuperExecProc): [ INTEGER32 ];
  BEGIN
    RETURN trap_14_wl(38, INTEGER32(Code));
  END SuperExec;


PROCEDURE PuntAES ();
  BEGIN
    trap_14_w(39)
  END PuntAES;


PROCEDURE tv(): INTEGER32;
TYPE PPtrOSHeader = POINTER TO PtrOSHeader;
VAR sysbase : PPtrOSHeader;
BEGIN
   sysbase := PPtrOSHeader(_sysbase);
   RETURN sysbase^^.version;
END tv;


PROCEDURE FlopRate (drive: CARDINAL16; rate: INTEGER16): [ INTEGER16 ];
VAR tosver: INTEGER16;
TYPE PBYTE = POINTER TO CARDINAL8;
VAR ptr: PBYTE;
  BEGIN
    (* zuerst TOS-Version ermitteln *)
    tosver := SuperExec(tv);
    
    IF tosver = 0100H THEN
        ptr := PBYTE(0A09H)
    ELSIF tosver = 0102H THEN
        ptr := PBYTE(0A4FH)
    ELSE
        RETURN trap_14_www(41, drive, rate)
    END;
    IF drive <> 0 THEN ptr := PBYTE(CARDINAL32(ptr) + 4) END; (* drive B *)
    IF rate >= 0 THEN ptr^ := rate; END;
    RETURN ptr^;
  END FlopRate;


PROCEDURE BlitMode (flag: INTEGER16): [ BITSET ];
  BEGIN
    RETURN BITSET(trap_14_ww(64, flag))
  END BlitMode;


(* TT-Funktionen: *)

PROCEDURE DMAread (sector: CARDINAL32; count: CARDINAL16; buffer: ADDRESS;
                   devNo: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wlwlw(42, sector, count, INTEGER32(buffer), devNo)
  END DMAread;


PROCEDURE DMAwrite (sector: CARDINAL32; count: CARDINAL16; buffer: ADDRESS;
                   devNo: CARDINAL16): INTEGER16;
  BEGIN
    RETURN trap_14_wlwlw(43, sector, count, INTEGER32(buffer), devNo)
  END DMAwrite;


PROCEDURE Bconmap (devNo: INTEGER16): [ INTEGER32 ];
  BEGIN
    RETURN trap_14_ww(44, devNo)
  END Bconmap;


PROCEDURE NVMaccess (op, start, count: CARDINAL16; buffer: ADDRESS): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_wwwwl(46, op, start, count, INTEGER32(buffer))
  END NVMaccess;


PROCEDURE Waketime(date, time: CARDINAL16);
  BEGIN
    trap_14_www(47, date, time)
  END Waketime;


PROCEDURE EsetShift (shftMode: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_ww(80, shftMode);
  END EsetShift;


PROCEDURE EgetShift (): INTEGER16;
  BEGIN
    RETURN trap_14_w(81);
  END EgetShift;


PROCEDURE EsetBank (bankNum: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_ww(82, bankNum);
  END EsetBank;


PROCEDURE EsetColor (colorNum, color: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_www(83, colorNum, color);
  END EsetColor;


PROCEDURE EsetPalette (colorNum, count: INTEGER16; palettePtr: ADDRESS);
  BEGIN
    trap_14_wwwl(84, colorNum, count, INTEGER32(palettePtr));
  END EsetPalette;


PROCEDURE EgetPalette (colorNum, count: INTEGER16; palettePtr: ADDRESS);
  BEGIN
    trap_14_wwwl(85, colorNum, count, INTEGER32(palettePtr));
  END EgetPalette;


PROCEDURE EsetGray (swtch: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_ww(86, swtch);
  END EsetGray;


PROCEDURE EsetSmear (swtch: INTEGER16): [ INTEGER16 ];
  BEGIN
    RETURN trap_14_ww(87, swtch);
  END EsetSmear;


PROCEDURE CacheCtrl(opcode, param: INTEGER16): [ INTEGER32 ];
  BEGIN
    RETURN trap_14_www(160, opcode, param);
  END CacheCtrl;


PROCEDURE WdgCtrl(opcode: INTEGER16): [ INTEGER32 ];
  BEGIN
    RETURN trap_14_ww(161, opcode);
  END WdgCtrl;


PROCEDURE ExtRsConf(command, device: INTEGER16; param: INTEGER32): [ INTEGER32 ];
  BEGIN
    RETURN trap_14_wwwl(162, command, device, param);
  END ExtRsConf;


END XBIOS.
