IMPLEMENTATION MODULE SysInfo;

(*
 * 17.10.90  FPU() veraendert FPU-Status nicht mehr -> keine Prot-Violation
 * 30.10.90  FPUModel() liefert korrekten Wert bei 68882 im TT
 * 10.11.90  68030-Erkennung korrigiert, aber nicht getestet
 * 17.12.90  68030-Erkennung nochmals korrigiert, aber nicht getestet
 *           Besser: Bei 68030 gibt's offenbar zusaetzliche Register TT0/TT1.
 *           Sie sollten abgefragt werden, allerdings habe ich keinen Code
 *           fuer sie!
 * 08.02.91  68030-Erkennung nochmals korrigiert und getestet.
 * 14.02.92  CallSuper/ToSuper statt Supexec wg. MinT
 * 28.02.92  GetTOSVersion korrigiert.
 * 11.04.95  68040-Erkennung f. CPU()
 * 06.06.23 THO: Port to gm2
 *)

FROM SYSTEM IMPORT SHIFT, INTEGER32;
IMPORT MOSGlobals;
IMPORT CookieJar;
FROM MOSSupport IMPORT CallSuper, ToSuper, ToUser;
FROM SysVars IMPORT _sysbase;
FROM XBIOS IMPORT SuperExec;
FROM SysTypes IMPORT PtrOSHeader;


PROCEDURE UnpackDate ( d: CARDINAL ): MOSGlobals.Date;
VAR pd: MOSGlobals.Date;
BEGIN
  pd.year := CARDINAL(SHIFT(BITSET(d), -9) * BITSET(127)) + 1980;
  pd.month := CARDINAL(SHIFT(BITSET(d), -5) * BITSET(15));
  pd.day := CARDINAL(BITSET(d) * BITSET(31));
  RETURN pd;
END UnpackDate;


PROCEDURE cpuTest(): INTEGER32;
VAR cpu: INTEGER32;
BEGIN
#ifdef __mcoldfire__
  cpu := 68040;
#else
  ASM VOLATILE("move.l  %%a7,%%d2" : : : "d2");
  ASM VOLATILE("lea     16,%%a1" : : : );           (* Illegal Instruction Exc-Vektor *)
  ASM VOLATILE("move.l  (%%a1),%%d1" : : : );
  ASM VOLATILE("lea     not020(%%pc),%%a0" : : : );
  ASM VOLATILE("move.l  %%a0,(%%a1)" : : : );
  ASM VOLATILE("move.l  #68000,%0" : "=d"(cpu) : : );
  ASM VOLATILE("dc.w    0x51fc" : : : );           (* TRAPF *)
  ASM VOLATILE("move.l  %%d1,(%%a1)" : : : );

  ASM VOLATILE("move.l  #68030,%0" : "=d"(cpu) : : );
  (* Erkennung der 68030 durch Aktivieren und Pruefen des Data-Cache *)
  ASM VOLATILE(".dc.w 0x4e7a,0x1002" : : : );
  ASM VOLATILE("move.l  %%d1,%%d2" : : : );
  ASM VOLATILE("ori.w   #0x1100,%%d2" : : : ); (* clear & enable data cache *)
  ASM VOLATILE(".dc.w 0x4e7b,0x2002" : : : );         (* enable data cache *)
  ASM VOLATILE(".dc.w 0x4e7a,0x2002" : : : );         (* read cache ctrl reg *)
  ASM VOLATILE("btst    #8,%%d2" : : : );           (* data cache enabled? *)
  ASM VOLATILE("bne.s   1f" : : : );
  ASM VOLATILE("bset    #15,%%d2" : : : );          (* enable 68040 instr. cache *)
  ASM VOLATILE(".dc.w 0x4e7b,0x2002" : : : );         (* write cache reg *)
  ASM VOLATILE(".dc.w 0x4e7a,0x2002" : : : );         (* read cache ctrl reg *)
  ASM VOLATILE("move.l  #68020,%0" : "=d"(cpu) : : );
  ASM VOLATILE("btst    #15,%%d2" : : : );
  ASM VOLATILE("beq     1f" : : : );
  ASM VOLATILE("move.l  #68040,%0" : "=d"(cpu) : : );
ASM VOLATILE("1:" : : : );
  ASM VOLATILE(".dc.w 0x4e7b,0x1002" : : : );
  ASM VOLATILE("bra.s 2f" : : : );
ASM VOLATILE("not020:" : : : );
  ASM VOLATILE("move.l  %%d2,%%a7" : : : );
  ASM VOLATILE("move.l  %%d1,(%%a1)" : : : );
ASM VOLATILE("2:" : : : );
#endif
  RETURN cpu;
END cpuTest;


PROCEDURE CPU (): CARDINAL32;
BEGIN
  RETURN CallSuper(cpuTest);
END CPU;


PROCEDURE Has020 (): BOOLEAN;
BEGIN
  RETURN CPU() >= 68020;
END Has020;


PROCEDURE FPU(): FPUType;
VAR oldsp: INTEGER32;
  cpu: INTEGER32;
  fpu: FPUType;
BEGIN
  oldsp := ToSuper();
  cpu := cpuTest();
  fpu := noFPU;
  IF cpu >= 68020 THEN
    (* bei 68020 Line F-Test machen *)
    ASM VOLATILE("move.l %%a7,%%d2; move.l 44,%%d1; lea 12(%%pc),%%a0; move.l %%a0,44; .dc.w 0xf280,0; moveq %2,%0; move.l %%d1,44; move.l %%d2,%%a7"
    : "=d"(fpu)
    : "0"(fpu), "i"(internalFPU)
    : "a0", "d1", "d2", "cc", "memory");
    IF fpu <> noFPU THEN
      RETURN fpu;
    END;
  END;
  ASM VOLATILE("move.l %%a7,%%d2; move.l 8,%%d1; lea 12(%%pc),%%a0; move.l %%a0,8; tst.w 0xFFFFFA40; moveq %2,%0; move.l %%d2,%%a7; move.l %%d1,8"
    : "=d"(fpu)
    : "0"(fpu), "i"(externalFPU)
    : "a0", "d1", "d2", "cc", "memory");
  ToUser(oldsp);
  RETURN fpu;
END FPU;


PROCEDURE getTOSHdr(): INTEGER32;
TYPE PPtrOSHeader = POINTER TO PtrOSHeader;
VAR sysbase : PPtrOSHeader;
BEGIN
   sysbase := PPtrOSHeader(_sysbase);
   RETURN INTEGER32(sysbase^^.beg); (* wg. altem AHDI *)
END getTOSHdr;


PROCEDURE GetTOSVersion (VAR version, revision: CARDINAL; VAR date: MOSGlobals.Date);
VAR TOSHdr: PtrOSHeader;
BEGIN
  TOSHdr := SuperExec(getTOSHdr);

  version := CARDINAL(SHIFT(VAL(BITSET, TOSHdr^.version), -8));
  revision := CARDINAL(VAL(BITSET, TOSHdr^.version) * BITSET(255));
  date := UnpackDate(TOSHdr^.dosdate);
END GetTOSVersion;


PROCEDURE getExcFrameSize(): INTEGER32;
VAR frameSize: INTEGER32;
BEGIN
  ASM VOLATILE("move.l %%a7,%0; move.l 16,%%d1; lea 8(%%pc),%%a0; move.l %%a0,16; .dc.w 0x4afc; move.l %%d1,16; move.l %%a7,%%d1; move.l %0,%%a7; sub.l %%d1,%0" : "=d"(frameSize) : : "a0", "d1");
  RETURN frameSize;
END getExcFrameSize;


PROCEDURE UseStackFrame (): BOOLEAN;
BEGIN
  RETURN SuperExec(getExcFrameSize) <> 6;
END UseStackFrame;


PROCEDURE Machine (): CARDINAL;
VAR value: CARDINAL32;
BEGIN
  CookieJar.GetCookie(CookieJar.Machine, value);
  RETURN CARDINAL(SHIFT(VAL(BITSET, value), -16));
END Machine;


PROCEDURE FPUModel (): CARDINAL;
VAR fpuTYPE: FPUType;
    oldsp: INTEGER32;
    model: CARDINAL;
BEGIN
  fpuTYPE := FPU();
  (* internal? *)
  IF fpuTYPE <> internalFPU THEN
    (* nein - dann immer 1 bei externer FPU liefern *)
    RETURN ORD(fpuTYPE);
  END;
  oldsp := ToSuper();
#ifdef __mcoldfire__
  model := 2;
#else
  ASM VOLATILE("moveq #0,%0; move.l %%a7,%%a0; .dc.w 0xf327; cmpi.b #24,1(%%a7); move.l %%a0,%%a7; seq %0; addq.b #2,%0"
    : "=d"(model)
    :
    : "a0", "cc", "memory");
#endif
  ToUser(oldsp);
  RETURN model;
END FPUModel;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END SysInfo.
