IMPLEMENTATION MODULE ErrBase;
#define REF

(* V#119 *)
(* kein N+ einfuegen! Runtime muss vor ErrBase importiert und init. werden,
 * damit Runtime u.U. in MOSConfig "CaughtExceptions" f.die FPU-Exc
 * erweitern kann! *)

(*
  01.12.88 TT  SysInstalExc verw.
  16.01.90 TT  CHK fuehrt zu 'OutOfRange'
  23.02.90 TT  Install/Remove exportiert, um Exc-Handler bei Accessories
               von Aussen zu installieren;
               Wenn kein Handler installiert, wird SystemError bemueht
  01.03.90 TT  Bei nicht installiertem Error-Handler wird kein normaler
               Pterm sondern die entspr. Exception ausgeloest.
  01.05.90 TT  'ExcInstalled' wird bei 'RemoveExc' wieder auf FALSE gesetzt
  03.07.90 TT  'raising'-Abfrage entfernt: RaiseError sollte wieder gehen
  29.07.90 TT  Korrektur in catchUser: RaiseError geht endlich wieder
  25.11.90 TT  Wenn Handler nicht installiert, wird nur 'ExcInstalled' auf
               FALSE gesetzt -> Aufrufer muss die Var pruefen;
               Die FPU-Exceptions werden nun erkannt und die entspr. Laufzeit-
               fehlernummern an den Err-Handler uebergeben, zudem wird das
               Bit 27 im BIU der FPU immer gesetzt, damit die FPU ggf. bei
               "continue" weiterlaufen kann; $S-.
  18.12.90 TT  FPU-Operand-Error fuehrt zu 'OutOfRange'
  08.04.91 TT  Alle CaughtExceptions werden nun in MOSConfig gesetzt.
  04.06.23 THO Port to gm2
*)

FROM SYSTEM IMPORT ADR,ADDRESS,BYTE,TSIZE, CARDINAL16, CARDINAL32, BITSET16;

FROM Excepts IMPORT RaiseExc, SysInstallPreExc, DeInstallExc;

FROM SysTypes IMPORT ExcDesc, ExcDescPtr, ZeroDivide, CHKExc, TRAPVExc, ExcSet,
        BSUnExc, FPZeroDivide, OpError, FPOverflow, NANExc, TRAP6;

FROM MOSConfig IMPORT CaughtExceptions, IgnoreExceptions;

FROM ResCtrl IMPORT RemovalCarrier, CatchRemoval;

IMPORT MOSGlobals;

CONST NoErrHdl = ErrHdlProc(0);

VAR hdl2, hdl1:ADDRESS;
    gl_no: INTEGER;
    gl_cont: RtnCond;
    gl_resp: ErrResp;
    gl_msg: TRAP6Msg;


PROCEDURE DoTRAP6(no: INTEGER; [REF msg: TRAP6Msg = '' ] );
VAR cont: RtnCond;
    resp: ErrResp;
    info: ExcDesc;
BEGIN
  IF (ErrHdl = NoErrHdl) OR (TRAP6 IN IgnoreExceptions) THEN
    RETURN;
  END;
  cont := mayContinue;
  resp := selfCaused;
  IF (BITSET(no) * BITSET(TRAP6_SELF)) = {} THEN
    resp := callerCaused;
  END;
  IF (BITSET(no) * BITSET(TRAP6_CONT)) = {} THEN
    cont := mustAbort;
  END;
  (* populate bit 11 to sign bit *)
  IF 11 IN BITSET(no) THEN
    no := INTEGER(BITSET(no) + BITSET(0FFFFF000H));
  END;
  info.excNo := TRAP6;
  ErrHdl(no, msg, resp, cont, ADR(info));
END DoTRAP6;


PROCEDURE catchSys (info: ExcDescPtr): BOOLEAN;
VAR no:INTEGER;
    msg: TRAP6Msg;
    cont: RtnCond;
    resp: ErrResp;
TYPE CharPtr = POINTER TO CHAR;
VAR i: CARDINAL;
    ptr: CharPtr;
BEGIN
  msg := '';
  cont := mayContinue;
  resp := selfCaused;
  IF (ErrHdl = NoErrHdl) OR (info^.excNo IN IgnoreExceptions) THEN
    RETURN TRUE
  ELSIF info^.excNo=2 THEN
    cont := mustAbort;
    no := MOSGlobals.BusFault
  ELSIF info^.excNo=3 THEN
    cont := mustAbort;
    no := MOSGlobals.OddBusAddr
  ELSIF info^.excNo=4 THEN
    IF info^.regPC^ = 04AFCH THEN
      RETURN TRUE (* Break zum Monitor immer durchlassen *)
    END;
    cont := mustAbort;
    no := MOSGlobals.IllegalInstr
  ELSIF (info^.excNo=NANExc) OR (info^.excNo=BSUnExc) THEN
    no := MOSGlobals.GenFPErr
  ELSIF (info^.excNo=ZeroDivide) OR (info^.excNo=FPZeroDivide) THEN
    no := MOSGlobals.DivByZero
  ELSIF (info^.excNo=FPOverflow) OR (info^.excNo=TRAPVExc) THEN
    no := MOSGlobals.Overflow
  ELSIF (info^.excNo=OpError) OR (info^.excNo=CHKExc) THEN
    no := MOSGlobals.OutOfRange
  ELSIF info^.excNo=TRAP6 THEN
    no := info^.regPC^;
    ptr := CharPtr(info^.regPC);
    INC(ptr, 2);
    IF no >= 0 THEN
      (* error txt follows *)
      i := 0;
      LOOP
        IF ptr^ = 0C THEN EXIT END;
        msg[i] := ptr^;
        INC(ptr);
        INC(i);
        IF i = 32 THEN
          LOOP
            IF ptr^ = 0C THEN EXIT END;
            INC(ptr);
          END;
          INC(ptr);
        END;
      END;
      IF ODD(CARDINAL32(ptr)) THEN
        INC(ptr);
      END;
    END;
    info^.regPC := ADDRESS(ptr);
    IF (BITSET(no) * BITSET(TRAP6_SELF)) = {} THEN
      resp := callerCaused;
    END;
    IF (BITSET(no) * BITSET(TRAP6_CONT)) = {} THEN
      cont := mustAbort;
    END;
    (* populate bit 11 to sign bit *)
    IF 11 IN BITSET(no) THEN
      no := INTEGER(BITSET(no) + BITSET(0FFFFF000H));
    END;
  ELSE
    no := MOSGlobals.Exception
  END;
  (* bei FPU-Exceptions (48-54) diese bei der FPU bestaetigen *)
  IF (info^.excNo >= BSUnExc) AND (info^.excNo <= NANExc) THEN
    (* Set Bit 27 in BIU *)
#ifdef __mcoldfire__
    ASM VOLATILE(".dc.w 0xf327; tst.b (%%a7); beq.s 1f; clr.l %%d0; move.b 1(%%sp),%%d0; lea 0(%%a7,%%d0.l),%%a0; bset #3,(%%a0);1: .dc.w 0xf35f"
      :
      :
      : "d0", "a0");
#else
    ASM VOLATILE(".dc.w 0xf327; tst.b (%%a7); beq.s 1f; clr.w %%d0; move.b 1(%%sp),%%d0; bset #3,0(%%a7,%%d0.w);1: .dc.w 0xf35f"
      :
      :
      : "d0");
#endif
  END;
  ErrHdl(no, msg, resp, cont, info);
  RETURN FALSE;
END catchSys;


PROCEDURE catchUser (info:ExcDescPtr): BOOLEAN;
BEGIN
  IF ErrHdl <> NoErrHdl THEN
     ErrHdl(gl_no, gl_msg, gl_resp, gl_cont, info);
     RETURN FALSE;
  END;
  RETURN TRUE;
END catchUser;


PROCEDURE RaiseError ( no    : INTEGER;
                       REF msg   : TRAP6Msg;
                       causer: ErrResp;
                       cont  : RtnCond );
BEGIN
  gl_no := no;
  gl_msg := msg;
  gl_resp := causer;
  gl_cont := cont;
  RaiseExc(224);
END RaiseError;


PROCEDURE RemoveExc;
BEGIN
  IF ExcInstalled THEN
    DeInstallExc (hdl1);
    DeInstallExc (hdl2);
    ExcInstalled := FALSE;
  END
END RemoveExc;


VAR stk: ARRAY [1..1000] OF BYTE;
    wsp: MOSGlobals.MemArea;
    rHdl: RemovalCarrier;

PROCEDURE InstallExc;
BEGIN
  IF NOT ExcInstalled THEN
    SysInstallPreExc (CaughtExceptions, catchSys, TRUE, wsp, hdl2 );
    IF hdl2 <> NIL THEN
      SysInstallPreExc (ExcSet{224}, catchUser, TRUE, wsp, hdl1); (* reservierte Exc-Nr.*)
      IF hdl1 <> NIL THEN
        ExcInstalled := TRUE
      ELSE
        DeInstallExc(hdl2)
      END
    END
  END;
END InstallExc;


BEGIN
  ExcInstalled := FALSE;
  ErrHdl := ErrHdlProc(0);
  CatchRemoval(rHdl, RemoveExc, wsp);
  wsp.bottom := ADR(stk);
  wsp.length := SIZE(stk);
  gl_no := 0;
  gl_resp := selfCaused;
  gl_cont := mayContinue;
  gl_msg := '';
END ErrBase.
