IMPLEMENTATION MODULE BIOS;
(*$Z-,Y+,S-,N+,R-,L-*)

(*
   TT 21.07.89  BConOut loescht High-Byte der auszugebenden Zeichen, weil
                sonst abscheinend Busfehler bei ESC-Sequenzen auftreten
                koennen.
   TT 20.07.90  DriveMap: SETs verkehrt
  THO 25.05.23: Port to gm2
*)

FROM SYSTEM IMPORT ADDRESS, ADR, INTEGER16, INTEGER32;

PROCEDURE trap_13_w(n: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %1,-(%%sp); trap #13; addq.l #2,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_w;


PROCEDURE trap_13_ww(n: INTEGER16; a: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %2,-(%%sp); move.w %1,-(%%sp); trap #13; addq.l #4,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_ww;


PROCEDURE trap_13_www(n: INTEGER16; a: INTEGER16; b: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #13; addq.l #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_www;


PROCEDURE trap_13_wwl(n: INTEGER16; a: INTEGER16; b: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #13; addq.l #8,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_wwl;


PROCEDURE trap_13_wl(n: INTEGER16; a: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %2,-(%%sp); move.w %1,-(%%sp); trap #13; addq.l #6,%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_wl;


PROCEDURE trap_13_wwlwww(n: INTEGER16; a: INTEGER16; b: INTEGER32; c: INTEGER16; d: INTEGER16; e: INTEGER16): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.w %6,-(%%sp); move.w %5,-(%%sp); move.w %4,-(%%sp); move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #13; lea 14(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_wwlwww;


PROCEDURE trap_13_wwlwwwl(n: INTEGER16; a: INTEGER16; b: INTEGER32; c: INTEGER16; d: INTEGER16; e: INTEGER16; f: INTEGER32): [ INTEGER32 ];
VAR
    retvalue: INTEGER32;
BEGIN
    ASM VOLATILE("move.l %7,-(%%sp); move.w %6,-(%%sp); move.w %5,-(%%sp); move.w %4,-(%%sp); move.l %3,-(%%sp); move.w %2,-(%%sp); move.w %1,-(%%sp); trap #13; lea 18(%%sp),%%sp; move.l %%d0,%0"
       : "=r"(retvalue)
       : "g"(n), "r"(a), "r"(b), "r"(c), "r"(d), "r"(e), "r"(f)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
    RETURN retvalue
END trap_13_wwlwwwl;


PROCEDURE Getmpb(VAR mpb: MPB);
  BEGIN
    trap_13_wl(0, INTEGER32(ADR(mpb)));
  END Getmpb;


PROCEDURE BConStat (dev: Device): BOOLEAN;
  BEGIN
    RETURN trap_13_ww(1, INTEGER(dev)) <> 0;
  END BConStat;


PROCEDURE BConIn (dev: Device): CARDINAL32;
  BEGIN
    RETURN trap_13_ww(2, INTEGER(dev));
  END BConIn;


PROCEDURE BConOut (dev: Device; ch: CHAR): [ INTEGER32 ];
  BEGIN
    RETURN trap_13_www(3, INTEGER(dev), ORD(ch));
  END BConOut;


PROCEDURE RWAbs (mode: RW; buffer: ADDRESS;
                 count, recno, dev: CARDINAL): INTEGER32;
  BEGIN
    RETURN trap_13_wwlwww(4, INTEGER(mode), INTEGER32(buffer), count, recno, dev);
  END RWAbs;


PROCEDURE LRWAbs(mode: RW; buffer: ADDRESS; count, dev: CARDINAL; lrecno: INTEGER32): INTEGER32;
  BEGIN
    RETURN trap_13_wwlwwwl(4, INTEGER(mode), INTEGER32(buffer), count, -1, dev, lrecno);
  END LRWAbs;


PROCEDURE SetException (excno: CARDINAL; vec: ADDRESS): [ ADDRESS ];
  BEGIN
    RETURN ADDRESS(trap_13_wwl(5, excno, INTEGER32(vec)));
  END SetException;


PROCEDURE GetException (excno: CARDINAL): ADDRESS;
  BEGIN
    RETURN ADDRESS(trap_13_wwl(5, excno, -1));
  END GetException;


PROCEDURE TimerCalibration (): CARDINAL32;
  BEGIN
    RETURN trap_13_w(6);
  END TimerCalibration;


PROCEDURE GetBPB (dev: CARDINAL): BPBPtr;
  BEGIN
    RETURN BPBPtr(trap_13_ww(7, dev));
  END GetBPB;


PROCEDURE BCosStat (dev: Device): BOOLEAN;
  BEGIN
    RETURN trap_13_ww(8, INTEGER(dev)) <> 0;
  END BCosStat;


PROCEDURE MediaChange (dev: CARDINAL): MCState;
  BEGIN
    RETURN MCState(trap_13_ww(9, dev));
  END MediaChange;


PROCEDURE DriveMap (): DriveSet;
  BEGIN
    RETURN DriveSet(trap_13_w(10));
  END DriveMap;


PROCEDURE SetKBShift (keys: KBShifts);
  BEGIN
    trap_13_ww(11, INTEGER(keys));
  END SetKBShift;


PROCEDURE GetKBShift (): KBShifts;
  BEGIN
    RETURN KBShifts(trap_13_ww(11, -1));
  END GetKBShift;


END BIOS.
