IMPLEMENTATION MODULE GEMDOS;
#define REF VAR

(*
TT  20.10.91: $M- entfernt.
THO 25.05.23: Port to gm2
*)

FROM SYSTEM IMPORT BYTE, ADDRESS, ADR, INTEGER16, INTEGER32, CARDINAL32, SHIFT;

CONST nul = CHR(0);


TYPE strtmp = ARRAY [0..256] OF CHAR;

PROCEDURE str0(VAR dst: strtmp; REF src: ARRAY OF CHAR);
VAR i, len: CARDINAL;
BEGIN
  len := HIGH(dst);
  i := 0;
  LOOP
    IF len = 0 THEN EXIT END;
    IF src[i] = nul THEN EXIT END;
    dst[i] := src[i];
    INC(i);
    DEC(len);
  END;
  dst[i] := nul;
END str0;


PROCEDURE trap_1_w(n: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %1,-(%%sp); trap #1; addq.w #2,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_w;


PROCEDURE trap_1_ww(n: INTEGER16; a: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.w #4,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_ww;


PROCEDURE trap_1_www(n: INTEGER16; a: INTEGER16; b: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.w #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_www;


PROCEDURE trap_1_wl(n: INTEGER16; a: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.w #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wl;


PROCEDURE trap_1_wlw(n: INTEGER16; a: INTEGER32; b: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.w #8,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wlw;


PROCEDURE trap_1_wwl(n: INTEGER16; a: INTEGER16; b: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; addq.w #8,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wwl;


PROCEDURE trap_1_wwll(n: INTEGER16; a: INTEGER16; b: INTEGER32; c: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %4,-(%%sp); move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 12(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wwll;



PROCEDURE trap_1_wwlll(n: INTEGER16; a: INTEGER16; b: INTEGER32; c: INTEGER32; d: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %5,-(%%sp); move.l %4,-(%%sp); move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 16(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wwlll;


PROCEDURE trap_1_wll(n: INTEGER16; a: INTEGER32; b: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 10(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wll;


PROCEDURE trap_1_wlww(n: INTEGER16; a: INTEGER32; b: INTEGER16; c: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %4,-(%%sp); move.w %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 10(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wlww;


PROCEDURE trap_1_wlwww(n: INTEGER16; a: INTEGER32; b: INTEGER16; c: INTEGER16; d: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %5,-(%%sp); move.w %4,-(%%sp); move.w %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 12(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wlwww;


PROCEDURE trap_1_wlllll(n: INTEGER16; a: INTEGER32; b: INTEGER16; c: INTEGER32; d: INTEGER32; e: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %6,-(%%sp); move.l %5,-(%%sp); move.l %4,-(%%sp); move.l %3,-(%%sp); move.l %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 22(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wlllll;


PROCEDURE trap_1_wwwll(n: INTEGER16; a: INTEGER16; b: INTEGER16; c: INTEGER32; d: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %5,-(%%sp); move.l %4,-(%%sp); move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #1; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_1_wwwll;




PROCEDURE OldTerm ();
BEGIN
  trap_1_w(0);
END OldTerm;


PROCEDURE ConIn (VAR ch: CHAR);
BEGIN
  ch := trap_1_w(1);
END ConIn;


PROCEDURE ConScanIn (VAR ch: CHAR; VAR scan: CHAR);
VAR c: CARDINAL32;
BEGIN
  c := trap_1_w(1);
  ch := c;
  scan := SHIFT(BITSET(c), -16);
END ConScanIn;


PROCEDURE ConOut (ch: CHAR);
BEGIN
  trap_1_ww(2, ORD(ch));
END ConOut;


PROCEDURE AuxIn (VAR ch: CHAR);
BEGIN
  ch := trap_1_w(3);
END AuxIn;


PROCEDURE AuxOut (ch: CHAR);
BEGIN
  trap_1_ww(4, ORD(ch));
END AuxOut;


PROCEDURE PrnOut (ch: CHAR);
BEGIN
  trap_1_ww(5, ORD(ch));
END PrnOut;


PROCEDURE RawIO (VAR ch: CHAR; rw: IOMode);
BEGIN
  IF rw <> read THEN
    trap_1_ww(6, ORD(ch))
  ELSE
    ch := CHR(trap_1_ww(6, 255));
  END;
END RawIO;


PROCEDURE RawIn (VAR ch: CHAR);
BEGIN
  ch := trap_1_w(7);
END RawIn;


PROCEDURE RawScanIn (VAR ch: CHAR; VAR scan: CHAR);
VAR c: CARDINAL32;
BEGIN
  c := trap_1_w(7);
  ch := c;
  scan := SHIFT(BITSET(c), -16);
END RawScanIn;


PROCEDURE NecIn (VAR ch: CHAR);
BEGIN
  ch := trap_1_w(8);
END NecIn;


PROCEDURE ConWS (REF str: ARRAY OF CHAR);
VAR s: strtmp;
BEGIN
  str0(s, str);
  trap_1_wl(9, INTEGER32(ADR(s)));
END ConWS;


PROCEDURE ConRS (VAR str: ARRAY OF BYTE);
BEGIN
  trap_1_wl(10, INTEGER32(ADR(str)));
END ConRS;


PROCEDURE ConIS (): BOOLEAN;
BEGIN
  RETURN trap_1_w(11) <> 0;
END ConIS;


PROCEDURE SetDrv (drive: CARDINAL; VAR DriveMap: CARDINAL32);
BEGIN
  DriveMap := trap_1_w(drive);
END SetDrv;


PROCEDURE ConOS (): BOOLEAN;
BEGIN
  RETURN trap_1_w(16) <> 0;
END ConOS;


PROCEDURE PrnOS (): BOOLEAN;
BEGIN
  RETURN trap_1_w(17) <> 0;
END PrnOS;


PROCEDURE AuxIS (): BOOLEAN;
BEGIN
  RETURN trap_1_w(18) <> 0;
END AuxIS;


PROCEDURE AuxOS (): BOOLEAN;
BEGIN
  RETURN trap_1_w(19) <> 0;
END AuxOS;


PROCEDURE Maddalt ( start: ADDRESS; size: INTEGER32 ) : [ INTEGER32 ];
BEGIN
  RETURN trap_1_wll(20, INTEGER32(start), size);
END Maddalt;


PROCEDURE Srealloc ( size: INTEGER32 ) : [ INTEGER32 ];
BEGIN
  RETURN trap_1_wl(21, size);
END Srealloc;


PROCEDURE Slbopen(REF name: ARRAY OF CHAR; REF path: ARRAY OF CHAR; min_ver: INTEGER32; VAR sl: SHARED_LIB; VAR fn: SLB_EXEC): INTEGER32;
VAR s, s2: strtmp;
BEGIN
  str0(s, name);
  str0(s2, path);
  RETURN trap_1_wlllll(22, INTEGER32(ADR(s)), INTEGER32(ADR(s2)), min_ver, INTEGER32(ADR(sl)), INTEGER32(ADR(fn)));
END Slbopen;


PROCEDURE Slbclose(sl: SHARED_LIB) : [ INTEGER32 ];
BEGIN
  RETURN trap_1_wl(23, INTEGER32(sl));
END Slbclose;


PROCEDURE GetDrv (VAR drive: CARDINAL);
BEGIN
  drive := trap_1_w(25);
END GetDrv;


PROCEDURE SetDTA (addr: ADDRESS);
BEGIN
  trap_1_wl(26, INTEGER32(addr))
END SetDTA;


PROCEDURE Super (stack: INTEGER32): INTEGER32;
BEGIN
  RETURN trap_1_wl(32, stack);
END Super;


PROCEDURE GetDate (VAR packeddate: CARDINAL16);
BEGIN
  packeddate := trap_1_w(42);
END GetDate;


PROCEDURE SetDate (packeddate: CARDINAL16);
BEGIN
  trap_1_ww(43, packeddate);
END SetDate;


PROCEDURE GetTime (VAR packedtime: CARDINAL16);
BEGIN
  packedtime := trap_1_w(44);
END GetTime;


PROCEDURE SetTime (packedtime: CARDINAL16);
BEGIN
  trap_1_ww(45, packedtime);
END SetTime;


PROCEDURE GetDTA (VAR addr: ADDRESS);
BEGIN
  addr := ADDRESS(trap_1_w(47));
END GetDTA;


PROCEDURE Version (VAR versionNo: CARDINAL);
BEGIN
  versionNo := trap_1_w(48);
END Version;


PROCEDURE TermRes (keepAmount: CARDINAL32; exitcode: INTEGER);
BEGIN
  trap_1_wlw(49, keepAmount, exitcode);
END TermRes;


PROCEDURE Sconfig(mode: INTEGER16; flags: INTEGER32) : [ INTEGER32 ];
BEGIN
  RETURN trap_1_wwl(51, mode, flags);
END Sconfig;


PROCEDURE DFree (VAR infoblock: DiskInfoBuffer; drive: CARDINAL) : [ INTEGER32 ];
BEGIN
  RETURN trap_1_wlw(54, INTEGER32(ADR(infoblock)), drive);
END DFree;


PROCEDURE DirCreate (REF path: ARRAY OF CHAR): BOOLEAN;
VAR s: strtmp;
BEGIN
  str0(s, path);
  RETURN trap_1_wl(57, INTEGER32(ADR(s))) >= 0;
END DirCreate;


PROCEDURE DirDelete (REF path: ARRAY OF CHAR): BOOLEAN;
VAR s: strtmp;
BEGIN
  str0(s, path);
  RETURN trap_1_wl(58, INTEGER32(ADR(s))) >= 0;
END DirDelete;


PROCEDURE SetPath (REF path: ARRAY OF CHAR): BOOLEAN;
VAR s: strtmp;
BEGIN
  str0(s, path);
  RETURN trap_1_wl(59, INTEGER32(ADR(s))) >= 0;
END SetPath;


PROCEDURE Create (REF fname: ARRAY OF CHAR; attr: CARDINAL; VAR handle: INTEGER);
VAR s: strtmp;
BEGIN
  str0(s, fname);
  handle := trap_1_wlw(60, INTEGER32(ADR(s)), attr);
END Create;


PROCEDURE Open (REF fname: ARRAY OF CHAR; mode: CARDINAL; VAR handle: INTEGER);
VAR s: strtmp;
BEGIN
  str0(s, fname);
  handle := trap_1_wlw(61, INTEGER32(ADR(s)), mode);
END Open;


PROCEDURE Close (handle: INTEGER): BOOLEAN;
BEGIN
  RETURN trap_1_ww(62, handle) >= 0;
END Close;


PROCEDURE Read (handle: INTEGER; VAR count: CARDINAL32; buffer: ADDRESS);
VAR nread: INTEGER32;
BEGIN
  nread := trap_1_wwll(63, handle, count, INTEGER32(buffer));
  IF nread >= 0 THEN
    count := nread
  ELSE
    count := 0
  END;
END Read;


PROCEDURE Write (handle: INTEGER; VAR count: CARDINAL32; buffer: ADDRESS);
VAR nwritten: INTEGER32;
BEGIN
  nwritten := trap_1_wwll(64, handle, count, INTEGER32(buffer));
  IF nwritten >= 0 THEN
    count := nwritten
  ELSE
    count := 0
  END;
END Write;


PROCEDURE Delete (REF fname: ARRAY OF CHAR): BOOLEAN;
VAR s: strtmp;
BEGIN
  str0(s, fname);
  RETURN trap_1_wl(65, INTEGER32(ADR(s))) >= 0;
END Delete;


PROCEDURE Seek (offset: INTEGER32; handle: INTEGER; mode: SeekMode; VAR newPosFromBeginning: INTEGER32);
BEGIN
  newPosFromBeginning := trap_1_wlww(66, offset, handle, INTEGER(mode));
END Seek;


PROCEDURE Attrib (REF fname: ARRAY OF CHAR; getOrSet: TimeAccessMode; VAR attr: CARDINAL) : [ BOOLEAN ];
VAR r: INTEGER32;
VAR s: strtmp;
BEGIN
  str0(s, fname);
  r := trap_1_wlww(67, INTEGER32(ADR(s)), INTEGER(getOrSet), attr);
  IF getOrSet = getTime THEN attr := r; END;
  RETURN r >= 0;
END Attrib;


PROCEDURE Xalloc ( Bytes: INTEGER32; mode: CARDINAL; VAR Addr: ADDRESS );
BEGIN
  Addr := ADDRESS(trap_1_wlw(68, Bytes, mode));
END Xalloc;


PROCEDURE Dup ( stdHandle: INTEGER; VAR newHandle: INTEGER );
BEGIN
  newHandle := trap_1_ww(69, stdHandle);
END Dup;


PROCEDURE Force ( stdHandle, newHandle: INTEGER ): BOOLEAN;
BEGIN
  RETURN trap_1_www(70, stdHandle, newHandle) = 0;
END Force;


PROCEDURE GetPath (VAR path: ARRAY OF CHAR; driveno: CARDINAL) : [ BOOLEAN ];
BEGIN
  RETURN trap_1_wlw(71, INTEGER32(ADR(path)), driveno) = 0;
END GetPath;


PROCEDURE Alloc (amount: INTEGER32; VAR Addr: ADDRESS);
BEGIN
  Addr := trap_1_wl(72, amount);
END Alloc;


PROCEDURE Free (Addr: ADDRESS): [ BOOLEAN ];
BEGIN
  RETURN trap_1_wl(73, INTEGER32(Addr)) >= 0;
END Free;


PROCEDURE Shrink (Addr: ADDRESS; NewSize: CARDINAL32): [ BOOLEAN ];
BEGIN
  RETURN trap_1_wwll(74, 0, INTEGER32(Addr), NewSize) >= 0;
END Shrink;


PROCEDURE Pexec ( Mode: CARDINAL; Name, Arguments, Environment: ADDRESS; VAR Result: INTEGER32 );
BEGIN
  Result := trap_1_wwlll(75, Mode, INTEGER32(Name), INTEGER32(Arguments), INTEGER32(Environment));
END Pexec;


PROCEDURE Term (exitcode: INTEGER);
BEGIN
  trap_1_ww(76, exitcode);
END Term;


PROCEDURE SFirst (REF fname: ARRAY OF CHAR; Attr: CARDINAL; VAR Result: INTEGER);
VAR s: strtmp;
BEGIN
  str0(s, fname);
  Result := trap_1_wlw(78, INTEGER32(ADR(s)), Attr);
END SFirst;


PROCEDURE SNext (VAR Result: INTEGER);
BEGIN
  Result := trap_1_w(79);
END SNext;


PROCEDURE Rename (REF oldname, newname: ARRAY OF CHAR);
VAR s, s2: strtmp;
BEGIN
  str0(s, oldname);
  str0(s2, newname);
  RETURN trap_1_wwll(86, 0, INTEGER32(ADR(s)), INTEGER32(ADR(s2))) >= 0;
END Rename;


PROCEDURE DaTime (handle: INTEGER; Buffer: ADDRESS; getOrSet: TimeAccessMode) : [ BOOLEAN ];
BEGIN
  RETURN trap_1_wlww(87, INTEGER32(Buffer), handle, INTEGER(getOrSet)) >= 0;
END DaTime;


END GEMDOS.
