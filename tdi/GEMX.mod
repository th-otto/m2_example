IMPLEMENTATION MODULE GEMX;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT ADDRESS, PROCESS, LONGWORD, CODE, SETREG, REGISTER, PUSH, ADR;

TYPE CodeStart = RECORD
  jmpinst: CARDINAL;
  main: ADDRESS;
  stacksize: LONGCARD;
END;

VAR CodeBase: POINTER TO CodeStart;
VAR PgmEnd: ADDRESS;
VAR oldvecs1: ARRAY[0..11] OF PROC;
VAR oldvecs2: ARRAY[0..15] OF PROC;


PROCEDURE PrintBanner();

  PROCEDURE PrintStr(VAR s: ARRAY OF CHAR);
  BEGIN
    (* does nothing *)
  END PrintStr;

BEGIN
  PrintStr('GEMX');
  PrintStr('Modula-2/ST (c) Copyright Modula 2 Software Ltd. 1985,1986,1987. ');
  PrintStr('(c) Copyright TDI Software Inc. 1985,1986,1987. ');
  PrintStr('The team : Chris Hall, Paul Curtis, and Phil Camp .');
END PrintBanner;


(* public procedure 1 *)
(*$P-*) (* no function entry code *)
PROCEDURE CASEX();
BEGIN
  (*   0 *) CODE(0205FH                      ); (* MOVE.L  (A7)+,A0 *)
  (*   2 *) CODE(09090H                      ); (* SUB.L   (A0),D0 *)
  (*   4 *) CODE(0B0A8H, 00004H              ); (* CMP.L   4(A0),D0 *)
  (*   8 *) CODE(0620CH                      ); (* BHI     00000016H *)
  (*   A *) CODE(0E380H                      ); (* ASL.L   #1,D0 *)
  (*   C *) CODE(0D0A8H, 00008H              ); (* ADD.L   8(A0),D0 *)
  (*  10 *) CODE(0D0F0H, 00800H              ); (* ADDA.W  0(A0,D0.L),A0 *)
  (*  14 *) CODE(04ED0H                      ); (* JMP     (A0) *)
  (*  16 *) CODE(0D1E8H, 00008H              ); (* ADDA.L  8(A0),A0 *)
  (*  1A *) CODE(05988H                      ); (* SUBQ.L  #4,A0 *)
  (*  1C *) CODE(04ED0H                      ); (* JMP     (A0) *)
END CASEX;


(* public procedure 2 *)
(*$P-*) (* no function entry code *)
PROCEDURE HALTX();
BEGIN
  (*   0 *) CODE(02200H                      ); (* MOVE.L  D0,D1 *)
  (*   2 *) CODE(07006H                      ); (* MOVEQ   #6,D0 *)
  (*   4 *) CODE(04E47H                      ); (* TRAP    #7 *)
  (*   6 *) CODE(04E75H                      ); (* RTS *)
END HALTX;


(* error code passed in D0 *)
PROCEDURE errorProc();
VAR ctxError: CARDINAL; (*  -2 *)
    pc: ADDRESS;        (*  -6 *)
    sr: CARDINAL;       (*  -8 *)
    a5: ADDRESS;        (* -12 *)
    a6: ADDRESS;        (* -16 *)
    usp: ADDRESS;       (* -20 *)
    sp: ADDRESS;        (* -24 *)
BEGIN
  ctxError := INTEGER(REGISTER(0) + 9);
  sp := REGISTER(14) + 8;
  CODE(040EEH, -8); (* SR -> sr *)
  CODE(02D4DH, -12); (* A5 -> a5 *)
  CODE(02D56H, -16); (* A6 -> a6 *)
  CODE(04E68H, 02D48H, -20); (* move usp,a0; move.l a0,usp(a6) *)
  IF (ctxError = ORD(AdrErrorTRAP)) OR (ctxError = ORD(BusErrorTRAP)) THEN
    CODE(02D6EH, 18, -6); (* move.l 18(a6),pc(a6) *)
    sp := sp + 8;
  ELSIF (ctxError = ORD(NewprocessWorkspace)) THEN
    CODE(04E68H, 02D68H, 8, -6); (* move usp,a0; move.l 8(a0),pc(a6) *)
  ELSIF (ctxError = ORD(ProcessTerminated)) THEN
    pc := 0;
    a6 := 0;
  ELSIF (ctxError >= ORD(ProgramHalt)) THEN
    CODE(04E68H, 02D50H, -6); (* move usp,a0; move.l (a0),pc(a6) *)
  ELSE
    CODE(02D6EH, 10, -6); (* move.l 10(a6),pc(a6) *)
  END;
  WITH ErrorContext DO
    Error := ctxError;
    CameFrom := XError;
    PC := pc;
    SR := sr;
    A5 := a5;
    A6 := a6;
    A7 := usp;
    LastMP := a6;
    DumpToDo := TRUE;
  END;
  SETREG(15, sp);
  SETREG(0, ErrorProcessor);
  CODE(02F40H, 2); (* move.l  d0,2(a7) *)
  CODE(03EBCH, 0); (* move.w  #0,(a7) *)
  CODE(02C56H);    (* move.l  (a6),a6 *)
  CODE(04E68H);    (* move    usp,a0 *)
  CODE(05988H);    (* subq.l  #4,a0 *)
  CODE(04E60H);    (* move    a0,usp *)
  CODE(04E73H);    (* rte *)
END errorProc;


PROCEDURE defaultErrorProcessor();
VAR alertbuf: ARRAY[0..101] OF CHAR;
VAR rest: ARRAY [0..11] OF CHAR;
VAR len: CARDINAL;
VAR i: CARDINAL;
VAR error: CARDINAL;

  PROCEDURE gemError();

  TYPE AESGlobalType = ARRAY[0..14] OF CARDINAL;
                
  TYPE AESControlType = RECORD
    opcode      : CARDINAL;
    sizeIntIn   : CARDINAL;
    sizeIntOut  : CARDINAL;
    sizeAddrIn  : CARDINAL;
    sizeAddrOut : CARDINAL;
  END;
                 
  TYPE AESIntInType = ARRAY [0..0] OF INTEGER;
  TYPE AESIntOutType = ARRAY [0..0] OF INTEGER;
  TYPE AESAddrInType = ARRAY [0..0] OF ADDRESS;
  TYPE AESAddrOutType = ARRAY [0..0] OF ADDRESS;

  TYPE AESParameterType = RECORD
     control : POINTER TO AESControlType;
     global  : POINTER TO AESGlobalType;
     intIn   : POINTER TO AESIntInType;
     intOut  : POINTER TO AESIntOutType;
     addrIn  : POINTER TO AESAddrInType;
     addrOut : POINTER TO AESAddrOutType;
  END;
  VAR global: AESGlobalType;
  VAR pb: AESParameterType;
  VAR control: AESControlType;
  VAR intin: AESIntInType;
  VAR intout: AESIntOutType;
  VAR addrin: AESAddrInType;
  VAR i: INTEGER;
  
  BEGIN
    FOR i := 0 TO HIGH(global) DO
      global[i] := 0;
    END;
    pb.control := ADR(control);
    pb.global := ADR(global);
    pb.intIn := ADR(intin);
    pb.intOut := ADR(intout);
    pb.addrIn := ADR(addrin);
    pb.addrOut := NIL;

    control.opcode := 10; (* appl_init *)
    control.sizeIntIn := 0;
    control.sizeIntOut := 1;
    control.sizeAddrIn := 0;
    control.sizeAddrOut := 0;
    SETREG(0, ADDRESS(200));
    SETREG(1, ADR(pb));
    CODE(04E42H); (* trap #2 *)

    control.opcode := 78; (* graf_mouse *)
    control.sizeIntIn := 1;
    control.sizeIntOut := 1;
    control.sizeAddrIn := 1;
    control.sizeAddrOut := 0;
    intin[0] := 257; (* MouseOn *)
    addrin[0] := NIL;
    SETREG(0, ADDRESS(200));
    SETREG(1, ADR(pb));
    CODE(04E42H); (* trap #2 *)

    control.opcode := 52; (* form_alert *)
    control.sizeIntIn := 1;
    control.sizeIntOut := 1;
    control.sizeAddrIn := 1;
    control.sizeAddrOut := 0;
    intin[0] := 1;
    addrin[0] := ADR(alertbuf);
    SETREG(0, ADDRESS(200));
    SETREG(1, ADR(pb));
    CODE(04E42H); (* trap #2 *)

    control.opcode := 19; (* appl_exit *)
    control.sizeIntIn := 0;
    control.sizeIntOut := 1;
    control.sizeAddrIn := 0;
    control.sizeAddrOut := 0;
    SETREG(0, ADDRESS(200));
    SETREG(1, ADR(pb));
    CODE(04E42H); (* trap #2 *)
    
    RestoreExceptions();
    
    SETREG(0, 76);
    CODE(03f00H); (* move.w d0,-(a7) *) (* BUG: pushes only opcode, returning random exit code *)
    SETREG(0, ErrorContext.Error); (* nonsense *)
    CODE(04E41H); (* trap #1 *)
  END gemError;

BEGIN
  alertbuf := '[3][Modula-2 Run Time Error : | |         #';
  len := 0;
  WHILE alertbuf[len] <> 0C DO
    INC(len);
  END;
  error := ErrorContext.Error;
  IF error < 10 THEN
    alertbuf[len] := '0';
  ELSE
    alertbuf[len] := CHR(((error DIV 10) MOD 10) + ORD('0'));
  END;
  INC(len);
  alertbuf[len] := CHR((error MOD 10) + ORD('0'));
  INC(len);
  rest := '][OK]';
  i := 0;
  REPEAT
    alertbuf[len + i] := rest[i];
    INC(i);
  UNTIL rest[i] = 0C;
  gemError();
END defaultErrorProcessor;


(* public procedure 3 *)
(*$P-*) (* no function entry code *)
PROCEDURE STACKTEST();
BEGIN
  (*   0 *) CODE(0204FH                      ); (* MOVE.L  A7,A0 *)
  (*   2 *) CODE(041E8H, 0FF80H              ); (* LEA     FF80(A0),A0 *)
  (*   6 *) CODE(091C0H                      ); (* SUBA.L  D0,A0 *)
  (*   8 *) CODE(0B1EDH, 00004H              ); (* CMPA.L  4(A5),A0 *)
  (*   C *) CODE(06206H                      ); (* BHI     [06H] = 00000014H *)
  (*   E *) CODE(07203H                      ); (* MOVEQ   #03H,D1 *)
  (*  10 *) CODE(07006H                      ); (* MOVEQ   #06H,D0 *)
  (*  12 *) CODE(04E47H                      ); (* TRAP    #7 *)
  (*  14 *) CODE(04E75H                      ); (* RTS *)
END STACKTEST;


(*$P-*) (* no function entry code *)
PROCEDURE processReturn();
BEGIN
  SETREG(1, ORD(ProcessTerminated)-9);
  SETREG(0, 6);
  CODE(04E47H); (* TRAP #7 *)
END processReturn;


(* public procedure 4 *)
PROCEDURE NEWPROCESS(p: PROC; stack: ADDRESS; stacksize: LONGCARD; VAR p1: PROCESS; irqlevel: LONGCARD);
VAR v1: LONGCARD;
    returnentry: PROC;
BEGIN
  returnentry := processReturn;
  (*   C *) CODE(02A2EH, 00014H              ); (* MOVE.L  20(A6),D5 *)
  (*  10 *) CODE(00205H, 00001H              ); (* ANDI.B  #1,D5 *)
  (*  14 *) CODE(04A05H                      ); (* TST.B   D5 *)
  (*  16 *) CODE(0660AH                      ); (* BNE     [0AH] = 00000022H *)
  (*  18 *) CODE(00CAEH, 00000H, 00100H, 16  ); (* CMPI.L  #256,16(A6) *)
  (*  20 *) CODE(06406H                      ); (* BCC     [06H] = 00000028H *)
  (*  22 *) CODE(07206H                      ); (* MOVEQ   #ORD(NewprocessWorkspace)-9,D1 *)
  (*  24 *) CODE(07006H                      ); (* MOVEQ   #6,D0 *)
  (*  26 *) CODE(04E47H                      ); (* TRAP    #7 *)
  (*  28 *) CODE(02D6EH, 0FFF8H, 0FFFCH      ); (* MOVE.L  -8(A6),-4(A6) *)
  (*  2E *) CODE(0206EH, 00014H              ); (* MOVE.L  20(A6),A0 *)
  (*  32 *) CODE(0D1EEH, 00010H              ); (* ADDA.L  16(A6),A0 *)
  (*  36 *) CODE(042A0H                      ); (* CLR.L   -(A0) *)
  (*  38 *) CODE(042A0H                      ); (* CLR.L   -(A0) *)
  (*  3A *) CODE(042A0H                      ); (* CLR.L   -(A0) *)
  (*  3C *) CODE(0212EH, 00014H              ); (* MOVE.L  20(A6),-(A0) *)
  (*  40 *) CODE(042A0H                      ); (* CLR.L   -(A0) *)
  (*  42 *) CODE(02248H                      ); (* MOVE.L  A0,A1 *)
  (*  44 *) CODE(090FCH, 00024H              ); (* SUBA.W  #36,A0 *)
  (*  48 *) CODE(0212EH, 0FFFCH              ); (* MOVE.L  -4(A6),-(A0) *)
  (*  4C *) CODE(0212EH, 00018H              ); (* MOVE.L  24(A6),-(A0) *)
  (*  50 *) CODE(040E0H                      ); (* MOVE    SR,-(A0) *)
  (*  52 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*  56 *) CODE(00250H, 0F8FFH              ); (* ANDI.W  #F8FFH,(A0) *)
  (*  5A *) CODE(08150H                      ); (* OR.W    D0,(A0) *)
  (*  5C *) CODE(042A0H                      ); (* CLR.L   -(A0) *)
  (*  5E *) CODE(02109H                      ); (* MOVE.L  A1,-(A0) *)
  (*  60 *) CODE(090FCH, 00034H              ); (* SUBA.W  #52,A0 *)
  (*  64 *) CODE(0226EH, 0000CH              ); (* MOVE.L  12(A6),A1 *)
  (*  68 *) CODE(02288H                      ); (* MOVE.L  A0,(A1) *)
END NEWPROCESS;


(* public procedure 5 *)
(*$P-*) (* no function entry code *)
PROCEDURE TRANSFER();
BEGIN
  CODE(04E46H                      ); (* TRAP    #6 *)
  CODE(04E75H                      ); (* RTS *)
END TRANSFER;


(*$P-*) (* no function entry code *)
PROCEDURE trap6();
BEGIN
  CODE(046FCH, 02700H             ); (* MOVE    #2700H,SR *)
  CODE(02F4EH, 0FFFCH             ); (* MOVE.L  A6,-4(A7) *)
  CODE(04E6EH                     ); (* MOVE    USP,A6 *)
  CODE(02D2FH, 00002H             ); (* MOVE.L  2(A7),-(A6) *)
  CODE(03D17H                     ); (* MOVE.W  (A7),-(A6) *)
  CODE(02D2FH, 0FFFCH             ); (* MOVE.L  -4(A7),-(A6) *)
  CODE(048E6H, 0FFFCH             ); (* MOVEM.L d0-d7/a0-a5,-(A6) *)
  CODE(02251H                     ); (* MOVE.L  (A1),A1 *)
  CODE(0208EH                     ); (* MOVE.L  A6,(A0) *)
  CODE(02C49H                     ); (* MOVE.L  A1,A6 *)
  CODE(04CDEH, 03FFFH             ); (* MOVEM.L (A6)+,d0-d7/a0-a5 *)
  CODE(02F5EH, 0FFFCH             ); (* MOVE.L  (A6)+,-4(A7) *)
  CODE(03E9EH                     ); (* MOVE.W  (A6)+,(A7) *)
  CODE(02F5EH, 00002H             ); (* MOVE.L  (A6)+,2(A7) *)
  CODE(04E66H                     ); (* MOVE    A6,USP *)
  CODE(02C6FH, 0FFFCH             ); (* MOVE.L  -4(A7),A6 *)
  CODE(04E73H                     ); (* RTE *)
END trap6;


(* public procedure 6 *)
(*$P-*) (* no function entry code *)
PROCEDURE IOTRANSFER();
BEGIN
  SETREG(0, 17);
  HALTX();
  CODE(04E45H                      ); (* TRAP    #5 *)
  CODE(04E75H                      ); (* RTS *)
END IOTRANSFER;


(*$P-*) (* no function entry code *)
PROCEDURE nop();
BEGIN
   CODE(04E71H);                      (* NOP *)
END nop;


(*$P-*) (* no function entry code *)
PROCEDURE syscallTrap();
BEGIN
  (*  0 *) CODE(046FCH, 02700H           );   (* MOVE    #2700H,SR *)
  (*  4 *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (*  6 *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (*  8 *) CODE(06608H                   );   (* BNE     [08H] = 00000012H *)
(* SYSCALL(0) *)
  (*  A *) CODE(00257H, 0F8FFH           );   (* ANDI.W  #F8FFH,(A7) *)
  (*  E *) CODE(08357H                   );   (* OR.W    D1,(A7) *)
  (* 10 *) CODE(04E73H                   );   (* RTE *)
  (* 12 *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (* 14 *) CODE(06604H                   );   (* BNE     [04H] = 0000001AH *)

(* SYSCALL(1) *)
  (* 16 *) CODE(03E81H                   );   (* MOVE.W  D1,(A7) *)
  (* 18 *) CODE(04E73H                   );   (* RTE *)
  (* 1A *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (* 1C *) CODE(06606H                   );   (* BNE     [06H] = 00000024H *)

(* SYSCALL(2) *)
  (* 1E *) CODE(046FCH, 02000H           );   (* MOVE    #2000H,SR *)
  (* 22 *) CODE(04E73H                   );   (* RTE *)
  (* 24 *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (* 26 *) CODE(06604H                   );   (* BNE     [04H] = 0000002CH *)

(* SYSCALL(3) *)
  (* 28 *) CODE(04E71H                   );   (* NOP *)
  (* 2A *) CODE(04E73H                   );   (* RTE *)
  (* 2C *) CODE(05300H                   );   (* SUBQ.B  #1,D0 *)
  (* 2E *) CODE(0660AH                   );   (* BNE     [0AH] = 0000003AH *)

(* SYSCALL(4) *)
  (* 30 *) CODE(02001H                   );   (* MOVE.L  D1,D0 *)
  (* 32 *) errorProc();
  (* 38 *) CODE(04E73H                   );   (* RTE *)

(* SYSCALL(n) *)
  (* 3A *) CODE(04E68H                   );   (* MOVE    USP,A0 *)
  (* 3C *) CODE(042A0H                   );   (* CLR.L   -(A0) *)
  (* 3E *) CODE(042A0H                   );   (* CLR.L   -(A0) *)
  (* 40 *) CODE(042A0H                   );   (* CLR.L   -(A0) *)
  (* 42 *) SETREG(0, PgmEnd);
  (* 48 *) CODE(02100H                   );   (* MOVE.L  D0,-(A0) *)
  (* 4A *) CODE(042A0H                   );   (* CLR.L   -(A0) *)
  (* 4C *) CODE(02A48H                   );   (* MOVE.L  A0,A5 *)
  (* 4E *) CODE(090FCH, 00024H           );   (* SUBA.W  #0024H,A0 *)
  (* 52 *) CODE(043FAH, 00006H           );   (* LEA     0000005A(pc),A1 *)
  (* 56 *) CODE(02109H                   );   (* MOVE.L  A1,-(A0) *)
  (* 58 *) CODE(06016H                   );   (* BRA     [16H] = 00000070H *)
  (* 5A *) RestoreExceptions();
  (* 60 *) CODE(0203CH, 0, 0004CH        );   (* MOVE.L  #0000004CH,D0 *)
  (* 66 *) CODE(03F00H                   );   (* MOVE.W  D0,-(A7) *)
  (* 68 *) CODE(0203CH, 0, 0             );   (* MOVE.L  #00000000H,D0 *)
  (* 6E *) CODE(04E41H                   );   (* TRAP    #1 *)
  (* 70 *) CODE(04E60H                   );   (* MOVE    A0,USP *)
  (* 72 *) CODE(09DCEH                   );   (* SUBA.L  A6,A6 *)
  (* 74 *) CODE(00257H, 0D8FFH           );   (* ANDI.W  #D8FFH,(A7) *)
  (* 78 *) CODE(04E73H                   );   (* RTE *)
END syscallTrap;


(* public procedure 7 *)
(*$P-*) (* no function entry code *)
PROCEDURE SYSCALL();
BEGIN
  IF REGISTER(0) <= 9 THEN
    CODE(02208H                      ); (* MOVE.L  A0,D1 *)
    CODE(05440H                      ); (* ADDQ.W  #2,D0 *)
    CODE(04E47H                      ); (* TRAP    #7 *)
    CODE(04E75H                      ); (* RTS *)
  ELSE
    IF REGISTER(0) = 10 THEN
      RestoreExceptions();
    END;
    CODE(04E75H                      ); (* RTS *)
  END;
END SYSCALL;


(* public procedure 8 *)
PROCEDURE MULU32(a, b: LONGCARD);
BEGIN
  (*   4 *) CODE(048E7H, 07C00H              ); (* MOVEM.L d1-d5,-(A7) *)
  (*   8 *) CODE(0222EH, 00008H              ); (* MOVE.L  8(A6),D1 *)
  (*   C *) CODE(0242EH, 0000CH              ); (* MOVE.L  12(A6),D2 *)
  (*  10 *) CODE(02601H                      ); (* MOVE.L  D1,D3 *)
  (*  12 *) CODE(02801H                      ); (* MOVE.L  D1,D4 *)
  (*  14 *) CODE(02A02H                      ); (* MOVE.L  D2,D5 *)
  (*  16 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  18 *) CODE(04845H                      ); (* SWAP    D5 *)
  (*  1A *) CODE(0C2C2H                      ); (* MULU    D2,D1 *)
  (*  1C *) CODE(0C4C4H                      ); (* MULU    D4,D2 *)
  (*  1E *) CODE(0C6C5H                      ); (* MULU    D5,D3 *)
  (*  20 *) CODE(0C8C5H                      ); (* MULU    D5,D4 *)
  (*  22 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  24 *) CODE(0D242H                      ); (* ADD.W   D2,D1 *)
  (*  26 *) CODE(04285H                      ); (* CLR.L   D5 *)
  (*  28 *) CODE(0D985H                      ); (* ADDX.L  D5,D4 *)
  (*  2A *) CODE(0D243H                      ); (* ADD.W   D3,D1 *)
  (*  2C *) CODE(0D985H                      ); (* ADDX.L  D5,D4 *)
  (*  2E *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  30 *) CODE(04242H                      ); (* CLR.W   D2 *)
  (*  32 *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  34 *) CODE(04842H                      ); (* SWAP    D2 *)
  (*  36 *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  38 *) CODE(0D483H                      ); (* ADD.L   D3,D2 *)
  (*  3A *) CODE(0D484H                      ); (* ADD.L   D4,D2 *)
  (*  3C *) CODE(02D41H, 0000CH              ); (* MOVE.L  D1,12(A6) *)
  (*  40 *) CODE(02D42H, 00008H              ); (* MOVE.L  D2,8(A6) *)
  (*  44 *) CODE(04CDFH, 0003EH              ); (* MOVEM.L (A7)+,d1-d5 *)
END MULU32;


(* public procedure 9 *)
PROCEDURE DIVU32(a, b: LONGCARD);
BEGIN
  (*   4 *) CODE(048E7H, 07800H              ); (* MOVEM.L d1-d4,-(A7) *)
  (*   8 *) CODE(0222EH, 0000CH              ); (* MOVE.L  12(A6),D1 *)
  (*   C *) CODE(0242EH, 00008H              ); (* MOVE.L  8(A6),D2 *)
  (*  10 *) CODE(0B4BCH, 00000H, 0FFFFH      ); (* CMP.L   #0000FFFFH,D2 *)
  (*  16 *) CODE(0621EH                      ); (* BHI     [1EH] = 00000036H *)
  (*  18 *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  1A *) CODE(082C2H                      ); (* DIVU    D2,D1 *)
  (*  1C *) CODE(0680EH                      ); (* BVC     [0EH] = 0000002CH *)
  (*  1E *) CODE(03801H                      ); (* MOVE.W  D1,D4 *)
  (*  20 *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  22 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  24 *) CODE(082C2H                      ); (* DIVU    D2,D1 *)
  (*  26 *) CODE(03601H                      ); (* MOVE.W  D1,D3 *)
  (*  28 *) CODE(03204H                      ); (* MOVE.W  D4,D1 *)
  (*  2A *) CODE(082C2H                      ); (* DIVU    D2,D1 *)
  (*  2C *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  2E *) CODE(03601H                      ); (* MOVE.W  D1,D3 *)
  (*  30 *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  32 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  34 *) CODE(0601EH                      ); (* BRA     [1EH] = 00000054H *)
  (*  36 *) CODE(04283H                      ); (* CLR.L   D3 *)
  (*  38 *) CODE(03601H                      ); (* MOVE.W  D1,D3 *)
  (*  3A *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  3C *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  3E *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  40 *) CODE(0383CH, 0000FH              ); (* MOVE.W  #000FH,D4 *)
  (*  44 *) CODE(0E38BH                      ); (* LSL.L   #1,D3 *)
  (*  46 *) CODE(0E391H                      ); (* ROXL.L  #1,D1 *)
  (*  48 *) CODE(0B282H                      ); (* CMP.L   D2,D1 *)
  (*  4A *) CODE(06504H                      ); (* BCS     [04H] = 00000050H *)
  (*  4C *) CODE(09282H                      ); (* SUB.L   D2,D1 *)
  (*  4E *) CODE(05243H                      ); (* ADDQ.W  #1,D3 *)
  (*  50 *) CODE(051CCH, 0FFF2H              ); (* DBRA    D4,[FFF2H] = 00000044H *)
  (*  54 *) CODE(02D43H, 0000CH              ); (* MOVE.L  D3,12(A6) *)
  (*  58 *) CODE(02D41H, 00008H              ); (* MOVE.L  D1,8(A6) *)
  (*  5C *) CODE(04CDFH, 0001EH              ); (* MOVEM.L (A7)+,d1-d4 *)
END DIVU32;


(* public procedure 10 *)
PROCEDURE MULS32(a, b: LONGINT);
BEGIN
  (*   4 *) CODE(048E7H, 0FF00H              ); (* MOVEM.L d0-d7,-(A7) *)
  (*   8 *) CODE(0222EH, 00008H              ); (* MOVE.L  8(A6),D1 *)
  (*   C *) CODE(0242EH, 0000CH              ); (* MOVE.L  12(A6),D2 *)
  (*  10 *) CODE(02601H                      ); (* MOVE.L  D1,D3 *)
  (*  12 *) CODE(02801H                      ); (* MOVE.L  D1,D4 *)
  (*  14 *) CODE(02A02H                      ); (* MOVE.L  D2,D5 *)
  (*  16 *) CODE(02C01H                      ); (* MOVE.L  D1,D6 *)
  (*  18 *) CODE(04287H                      ); (* CLR.L   D7 *)
  (*  1A *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  1C *) CODE(04845H                      ); (* SWAP    D5 *)
  (*  1E *) CODE(0C2C2H                      ); (* MULU    D2,D1 *)
  (*  20 *) CODE(0C4C4H                      ); (* MULU    D4,D2 *)
  (*  22 *) CODE(0C6C5H                      ); (* MULU    D5,D3 *)
  (*  24 *) CODE(0C8C5H                      ); (* MULU    D5,D4 *)
  (*  26 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  28 *) CODE(0D242H                      ); (* ADD.W   D2,D1 *)
  (*  2A *) CODE(0D987H                      ); (* ADDX.L  D7,D4 *)
  (*  2C *) CODE(0D243H                      ); (* ADD.W   D3,D1 *)
  (*  2E *) CODE(0D987H                      ); (* ADDX.L  D7,D4 *)
  (*  30 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  32 *) CODE(04242H                      ); (* CLR.W   D2 *)
  (*  34 *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  36 *) CODE(04842H                      ); (* SWAP    D2 *)
  (*  38 *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  3A *) CODE(0D483H                      ); (* ADD.L   D3,D2 *)
  (*  3C *) CODE(0D484H                      ); (* ADD.L   D4,D2 *)
  (*  3E *) CODE(04845H                      ); (* SWAP    D5 *)
  (*  40 *) CODE(04A86H                      ); (* TST.L   D6 *)
  (*  42 *) CODE(06A02H                      ); (* BPL     [02H] = 00000046H *)
  (*  44 *) CODE(09485H                      ); (* SUB.L   D5,D2 *)
  (*  46 *) CODE(04A85H                      ); (* TST.L   D5 *)
  (*  48 *) CODE(06A02H                      ); (* BPL     [02H] = 0000004CH *)
  (*  4A *) CODE(09486H                      ); (* SUB.L   D6,D2 *)
  (*  4C *) CODE(02D41H, 0000CH              ); (* MOVE.L  D1,12(A6) *)
  (*  50 *) CODE(02D42H, 00008H              ); (* MOVE.L  D2,8(A6) *)
  (*  54 *) CODE(04CDFH, 000FFH              ); (* MOVEM.L (A7)+,d0-d7 *)
END MULS32;


(* public procedure 11 *)
(*$P-*) (* no function entry code *)
PROCEDURE DIVS32(a, b: LONGINT);
BEGIN
  (*   0 *) CODE(0201FH                      ); (* MOVE.L  (A7)+,D0 *)
  (*   2 *) CODE(02E2FH, 00000H              ); (* MOVE.L  0(A7),D7 *)
  (*   6 *) CODE(02C2FH, 00004H              ); (* MOVE.L  4(A7),D6 *)
  (*   A *) CODE(0BF86H                      ); (* EOR.L   D7,D6 *)
  (*   C *) CODE(05BC6H                      ); (* SMI     D6 *)
  (*   E *) CODE(04AAFH, 00004H              ); (* TST.L   4(A7) *)
  (*  12 *) CODE(06A04H                      ); (* BPL     [04H] = 00000018H *)
  (*  14 *) CODE(044AFH, 00004H              ); (* NEG.L   4(A7) *)
  (*  18 *) CODE(04A87H                      ); (* TST.L   D7 *)
  (*  1A *) CODE(05BC7H                      ); (* SMI     D7 *)
  (*  1C *) CODE(06A04H                      ); (* BPL     [04H] = 00000022H *)
  (*  1E *) CODE(044AFH, 00000H              ); (* NEG.L   0(A7) *)
  (*  22 *) SETREG(8, DIVU32);
  (*  28 *) CODE(04E90H                      ); (* JSR     (A0) *)
  (*  2A *) CODE(04A07H                      ); (* TST.B   D7 *)
  (*  2C *) CODE(06704H                      ); (* BEQ     [04H] = 00000032H *)
  (*  2E *) CODE(044AFH, 00000H              ); (* NEG.L   0(A7) *)
  (*  32 *) CODE(04A06H                      ); (* TST.B   D6 *)
  (*  34 *) CODE(06704H                      ); (* BEQ     [04H] = 0000003AH *)
  (*  36 *) CODE(044AFH, 0004                ); (* NEG.L   4(A7) *)
  (*  3A *) CODE(02F00H                      ); (* MOVE.L  D0,-(A7) *)
  (*  3C *) CODE(04E75H                      ); (* RTS *)
END DIVS32;


(* public procedure 12 *)
PROCEDURE FADD(a, b: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 09F00H              ); (* MOVEM.L d0/d3-d7,-(A7) *)
  (*   8 *) CODE(0282EH, 0000CH              ); (* MOVE.L  12(A6),D4 *)
  (*   C *) CODE(02C2EH, 00008H              ); (* MOVE.L  8(A6),D6 *)
  (*  10 *) CODE(0E39CH                      ); (* ROL.L   #1,D4 *)
  (*  12 *) CODE(0E39EH                      ); (* ROL.L   #1,D6 *)
  (*  14 *) CODE(02004H                      ); (* MOVE.L  D4,D0 *)
  (*  16 *) CODE(09086H                      ); (* SUB.L   D6,D0 *)
  (*  18 *) CODE(06402H                      ); (* BCC     [02H] = 0000001CH *)
  (*  1A *) CODE(0C946H                      ); (* EXG     D4,D6 *)
  (*  1C *) CODE(01604H                      ); (* MOVE.B  D4,D3 *)
  (*  1E *) CODE(0C63CH, 00001H              ); (* AND.B   #01H,D3 *)
  (*  22 *) CODE(00800H, 00000H              ); (* BTST    #0,D0 *)
  (*  26 *) CODE(06704H                      ); (* BEQ     [04H] = 0000002CH *)
  (*  28 *) CODE(008C3H, 00001H              ); (* BSET    #0001H,D3 *)
  (*  2C *) CODE(0E19CH                      ); (* ROL.L   #8,D4 *)
  (*  2E *) CODE(04245H                      ); (* CLR.W   D5 *)
  (*  30 *) CODE(01A04H                      ); (* MOVE.B  D4,D5 *)
  (*  32 *) CODE(056C4H                      ); (* SNE     D4 *)
  (*  34 *) CODE(0E29CH                      ); (* ROR.L   #1,D4 *)
  (*  36 *) CODE(04204H                      ); (* CLR.B   D4 *)
  (*  38 *) CODE(0E19EH                      ); (* ROL.L   #8,D6 *)
  (*  3A *) CODE(04247H                      ); (* CLR.W   D7 *)
  (*  3C *) CODE(01E06H                      ); (* MOVE.B  D6,D7 *)
  (*  3E *) CODE(056C6H                      ); (* SNE     D6 *)
  (*  40 *) CODE(0E29EH                      ); (* ROR.L   #1,D6 *)
  (*  42 *) CODE(04206H                      ); (* CLR.B   D6 *)
  (*  44 *) CODE(03005H                      ); (* MOVE.W  D5,D0 *)
  (*  46 *) CODE(09047H                      ); (* SUB.W   D7,D0 *)
  (*  48 *) CODE(0B07CH, 00018H              ); (* CMP.W   #0018H,D0 *)
  (*  4C *) CODE(0622EH                      ); (* BHI     [2EH] = 0000007CH *)
  (*  4E *) CODE(0E0AEH                      ); (* LSR.L   D0,D6 *)
  (*  50 *) CODE(00803H, 00001H              ); (* BTST    #0001H,D3 *)
  (*  54 *) CODE(0660AH                      ); (* BNE     [0AH] = 00000060H *)
  (*  56 *) CODE(0D886H                      ); (* ADD.L   D6,D4 *)
  (*  58 *) CODE(06404H                      ); (* BCC     [04H] = 0000005EH *)
  (*  5A *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  5C *) CODE(05245H                      ); (* ADDQ.W  #1,D5 *)
  (*  5E *) CODE(0601CH                      ); (* BRA     [1CH] = 0000007CH *)
  (*  60 *) CODE(09886H                      ); (* SUB.L   D6,D4 *)
  (*  62 *) CODE(06B18H                      ); (* BMI     [18H] = 0000007CH *)
  (*  64 *) CODE(06716H                      ); (* BEQ     [16H] = 0000007CH *)
  (*  66 *) CODE(0B8BCH, 00000H, 0FFFFH      ); (* CMP.L   #0000FFFFH,D4 *)
  (*  6C *) CODE(06208H                      ); (* BHI     [08H] = 00000076H *)
  (*  6E *) CODE(09A7CH, 00010H              ); (* SUB.W   #0010H,D5 *)
  (*  72 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  74 *) CODE(06B06H                      ); (* BMI     [06H] = 0000007CH *)
  (*  76 *) CODE(05345H                      ); (* SUBQ.W  #1,D5 *)
  (*  78 *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  7A *) CODE(06AFAH                      ); (* BPL     [FAH] = 00000076H *)
  (*  7C *) CODE(0D8BCH, 00000H, 00080H      ); (* ADD.L   #00000080H,D4 *)
  (*  82 *) CODE(06404H                      ); (* BCC     [04H] = 00000088H *)
  (*  84 *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  86 *) CODE(05245H                      ); (* ADDQ.W  #1,D5 *)
  (*  88 *) CODE(04204H                      ); (* CLR.B   D4 *)
  (*  8A *) CODE(04A84H                      ); (* TST.L   D4 *)
  (*  8C *) CODE(06602H                      ); (* BNE     [02H] = 00000090H *)
  (*  8E *) CODE(04245H                      ); (* CLR.W   D5 *)
  (*  90 *) CODE(04A45H                      ); (* TST.W   D5 *)
  (*  92 *) CODE(06E04H                      ); (* BGT     [04H] = 00000098H *)
  (*  94 *) CODE(04284H                      ); (* CLR.L   D4 *)
  (*  96 *) CODE(06018H                      ); (* BRA     [18H] = 000000B0H *)
  (*  98 *) CODE(0BA7CH, 000FFH              ); (* CMP.W   #00FFH,D5 *)
  (*  9C *) CODE(06D08H                      ); (* BLT     [08H] = 000000A6H *)
  (*  9E *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  (*  A0 *) HALTX();
  (*  A6 *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  A8 *) CODE(01805H                      ); (* MOVE.B  D5,D4 *)
  (*  AA *) CODE(0E09CH                      ); (* ROR.L   #8,D4 *)
  (*  AC *) CODE(0E213H                      ); (* ROXR.B  #1,D3 *)
  (*  AE *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  B0 *) CODE(02D44H, 0000CH              ); (* MOVE.L  D4,12(A6) *) (* RETURN d4 *) 
  (*  B4 *) CODE(04CDFH, 000F9H              ); (* MOVEM.L (A7)+,d0/d3-d7 *)
END FADD;


(* public procedure 13 *)
(*$P-*) (* no function entry code *)
PROCEDURE FSUB(a, b: REAL);
BEGIN
  SETREG(8, FADD);
  CODE(0086FH, 7, 4           ); (* BCHG    #7,4(A7) *)
  CODE(04ED0H                 ); (* JMP     (A0) *)
END FSUB;


(* public procedure 14 *)
PROCEDURE FMUL(a, b: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 0CF00H              ); (* MOVEM.L d0-d1/d4-d7,-(A7) *)
  (*   8 *) CODE(0282EH, 0000CH              ); (* MOVE.L  12(A6),D4 *)
  (*   C *) CODE(02C2EH, 00008H              ); (* MOVE.L  8(A6),D6 *)
  (*  10 *) CODE(02E04H                      ); (* MOVE.L  D4,D7 *)
  (*  12 *) CODE(0BD87H                      ); (* EOR.L   D6,D7 *)
  (*  14 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  16 *) CODE(03A04H                      ); (* MOVE.W  D4,D5 *)
  (*  18 *) CODE(0CA7CH, 07F80H              ); (* AND.W   #7F80H,D5 *)
  (*  1C *) CODE(0676CH                      ); (* BEQ     [6CH] = 0000008AH *)
  (*  1E *) CODE(0EE4DH                      ); (* LSR.W   #7,D5 *)
  (*  20 *) CODE(0C87CH, 0007FH              ); (* AND.W   #007FH,D4 *)
  (*  24 *) CODE(0887CH, 00080H              ); (* OR.W    #0080H,D4 *)
  (*  28 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  2A *) CODE(03E06H                      ); (* MOVE.W  D6,D7 *)
  (*  2C *) CODE(0CE7CH, 07F80H              ); (* AND.W   #7F80H,D7 *)
  (*  30 *) CODE(06758H                      ); (* BEQ     [58H] = 0000008AH *)
  (*  32 *) CODE(0EE4FH                      ); (* LSR.W   #7,D7 *)
  (*  34 *) CODE(0CC7CH, 0007FH              ); (* AND.W   #007FH,D6 *)
  (*  38 *) CODE(08C7CH, 00080H              ); (* OR.W    #0080H,D6 *)
  (*  3C *) CODE(0DA47H                      ); (* ADD.W   D7,D5 *)
  (*  3E *) CODE(09A7CH, 0007EH              ); (* SUB.W   #007EH,D5 *)
  (*  42 *) CODE(06D46H                      ); (* BLT     [46H] = 0000008AH *)
  (*  44 *) CODE(02004H                      ); (* MOVE.L  D4,D0 *)
  (*  46 *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  48 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  4A *) CODE(0C0C6H                      ); (* MULU    D6,D0 *)
  (*  4C *) CODE(04240H                      ); (* CLR.W   D0 *)
  (*  4E *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  50 *) CODE(03204H                      ); (* MOVE.W  D4,D1 *)
  (*  52 *) CODE(0C2C6H                      ); (* MULU    D6,D1 *)
  (*  54 *) CODE(0D081H                      ); (* ADD.L   D1,D0 *)
  (*  56 *) CODE(02204H                      ); (* MOVE.L  D4,D1 *)
  (*  58 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  5A *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  5C *) CODE(0C2C6H                      ); (* MULU    D6,D1 *)
  (*  5E *) CODE(0D081H                      ); (* ADD.L   D1,D0 *)
  (*  60 *) CODE(0C8C6H                      ); (* MULU    D6,D4 *)
  (*  62 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  64 *) CODE(0D880H                      ); (* ADD.L   D0,D4 *)
  (*  66 *) CODE(06B04H                      ); (* BMI     [04H] = 0000006CH *)
  (*  68 *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  6A *) CODE(05345H                      ); (* SUBQ.W  #1,D5 *)
  (*  6C *) CODE(0D8BCH, 00000H, 00080H      ); (* ADD.L   #00000080H,D4 *)
  (*  72 *) CODE(06404H                      ); (* BCC     [04H] = 00000078H *)
  (*  74 *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  76 *) CODE(05245H                      ); (* ADDQ.W  #1,D5 *)
  (*  78 *) CODE(04A45H                      ); (* TST.W   D5 *)
  (*  7A *) CODE(06B0EH                      ); (* BMI     [0EH] = 0000008AH *)
  (*  7C *) CODE(0BA7CH, 000FFH              ); (* CMP.W   #00FFH,D5 *)
  (*  80 *) CODE(06D0CH                      ); (* BLT     [0CH] = 0000008EH *)
  (*  82 *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  (*  84 *) HALTX();
  (*  8A *) CODE(04284H                      ); (* CLR.L   D4 *)
  (*  8C *) CODE(0600AH                      ); (* BRA     [0AH] = 00000098H *)
  (*  8E *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  90 *) CODE(01805H                      ); (* MOVE.B  D5,D4 *)
  (*  92 *) CODE(0E09CH                      ); (* ROR.L   #8,D4 *)
  (*  94 *) CODE(0E397H                      ); (* ROXL.L  #1,D7 *)
  (*  96 *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  98 *) CODE(02D44H, 0000CH              ); (* MOVE.L  D4,12(A6) *)
  (*  9C *) CODE(04CDFH, 000F3H              ); (* MOVEM.L (A7)+,d0-d1/d4-d7 *)
END FMUL;


(* public procedure 15 *)
PROCEDURE FDIV(a, b: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 08F00H              ); (* MOVEM.L d0/d4-d7,-(A7) *)
  (*   8 *) CODE(0282EH, 0000CH              ); (* MOVE.L  12(A6),D4 *)
  (*   C *) CODE(02C2EH, 00008H              ); (* MOVE.L  8(A6),D6 *)
  (*  10 *) CODE(02E04H                      ); (* MOVE.L  D4,D7 *)
  (*  12 *) CODE(0BD87H                      ); (* EOR.L   D6,D7 *)
  (*  14 *) CODE(0E38EH                      ); (* LSL.L   #1,D6 *)
  (*  16 *) CODE(0E19EH                      ); (* ROL.L   #8,D6 *)
  (*  18 *) CODE(04247H                      ); (* CLR.W   D7 *)
  (*  1A *) CODE(01E06H                      ); (* MOVE.B  D6,D7 *)
  (*  1C *) CODE(0675EH                      ); (* BEQ     [5EH] = 0000007CH *)
  (*  1E *) CODE(01C3CH, 00001H              ); (* MOVE.B  #01H,D6 *)
  (*  22 *) CODE(0E29EH                      ); (* ROR.L   #1,D6 *)
  (*  24 *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  26 *) CODE(0E19CH                      ); (* ROL.L   #8,D4 *)
  (*  28 *) CODE(04245H                      ); (* CLR.W   D5 *)
  (*  2A *) CODE(01A04H                      ); (* MOVE.B  D4,D5 *)
  (*  2C *) CODE(06756H                      ); (* BEQ     [56H] = 00000084H *)
  (*  2E *) CODE(0183CH, 00001H              ); (* MOVE.B  #01H,D4 *)
  (*  32 *) CODE(0E29CH                      ); (* ROR.L   #1,D4 *)
  (*  34 *) CODE(09A47H                      ); (* SUB.W   D7,D5 *)
  (*  36 *) CODE(0DA7CH, 0007FH              ); (* ADD.W   #007FH,D5 *)
  (*  3A *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  3C *) CODE(0E28CH                      ); (* LSR.L   #1,D4 *)
  (*  3E *) CODE(088C6H                      ); (* DIVU    D6,D4 *)
  (*  40 *) CODE(03004H                      ); (* MOVE.W  D4,D0 *)
  (*  42 *) CODE(04244H                      ); (* CLR.W   D4 *)
  (*  44 *) CODE(088C6H                      ); (* DIVU    D6,D4 *)
  (*  46 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  48 *) CODE(03800H                      ); (* MOVE.W  D0,D4 *)
  (*  4A *) CODE(02006H                      ); (* MOVE.L  D6,D0 *)
  (*  4C *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  4E *) CODE(0C0C4H                      ); (* MULU    D4,D0 *)
  (*  50 *) CODE(0E288H                      ); (* LSR.L   #1,D0 *)
  (*  52 *) CODE(080C6H                      ); (* DIVU    D6,D0 *)
  (*  54 *) CODE(0C0BCH, 00000H, 0FFFFH      ); (* AND.L   #0000FFFFH,D0 *)
  (*  5A *) CODE(0E388H                      ); (* LSL.L   #1,D0 *)
  (*  5C *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  5E *) CODE(09880H                      ); (* SUB.L   D0,D4 *)
  (*  60 *) CODE(06B04H                      ); (* BMI     [04H] = 00000066H *)
  (*  62 *) CODE(0E38CH                      ); (* LSL.L   #1,D4 *)
  (*  64 *) CODE(05345H                      ); (* SUBQ.W  #1,D5 *)
  (*  66 *) CODE(0D8BCH, 00000H, 00080H      ); (* ADD.L   #00000080H,D4 *)
  (*  6C *) CODE(06404H                      ); (* BCC     [04H] = 00000072H *)
  (*  6E *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  70 *) CODE(05245H                      ); (* ADDQ.W  #1,D5 *)
  (*  72 *) CODE(04A45H                      ); (* TST.W   D5 *)
  (*  74 *) CODE(06B0EH                      ); (* BMI     [0EH] = 00000084H *)
  (*  76 *) CODE(0BA7CH, 000FFH              ); (* CMP.W   #00FFH,D5 *)
  (*  7A *) CODE(06D0CH                      ); (* BLT     [0CH] = 00000088H *)
  (*  7C *) SETREG(0, 5);
  (*  7E *) HALTX();
  (*  84 *) CODE(04284H                      ); (* CLR.L   D4 *)
  (*  86 *) CODE(0600AH                      ); (* BRA     [0AH] = 00000092H *)
  (*  88 *) CODE(0E39CH                      ); (* ROL.L   #1,D4 *)
  (*  8A *) CODE(01805H                      ); (* MOVE.B  D5,D4 *)
  (*  8C *) CODE(0E09CH                      ); (* ROR.L   #8,D4 *)
  (*  8E *) CODE(0E397H                      ); (* ROXL.L  #1,D7 *)
  (*  90 *) CODE(0E294H                      ); (* ROXR.L  #1,D4 *)
  (*  92 *) CODE(02D44H, 0000CH              ); (* MOVE.L  D4,12(A6) *)
  (*  96 *) CODE(04CDFH, 000F1H              ); (* MOVEM.L (A7)+,d0/d4-d7 *)
END FDIV;


(* public procedure 16 *)
PROCEDURE FCMP(a, b: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 0E000H              ); (* MOVEM.L d0-d2,-(A7) *)
  (*   8 *) CODE(0202EH, 0000CH              ); (* MOVE.L  12(A6),D0 *)
  (*   C *) CODE(02400H                      ); (* MOVE.L  D0,D2 *)
  (*   E *) CODE(06A06H                      ); (* BPL     [06H] = 00000016H *)
  (*  10 *) CODE(00A80H, 07FFFH, 0FFFFH      ); (* EORI.L  #7FFFFFFFH,D0 *)
  (*  16 *) CODE(0C4BCH, 07F80H, 0           ); (* AND.L   #7F800000H,D2 *)
  (*  1C *) CODE(06602H                      ); (* BNE     [02H] = 00000020H *)
  (*  1E *) CODE(04280H                      ); (* CLR.L   D0 *)
  (*  20 *) CODE(0222EH, 00008H              ); (* MOVE.L  8(A6),D1 *)
  (*  24 *) CODE(02401H                      ); (* MOVE.L  D1,D2 *)
  (*  26 *) CODE(06A06H                      ); (* BPL     [06H] = 0000002EH *)
  (*  28 *) CODE(00A81H, 07FFFH, 0FFFFH      ); (* EORI.L  #7FFFFFFFH,D1 *)
  (*  2E *) CODE(0C4BCH, 07F80H, 00000H      ); (* AND.L   #7F800000H,D2 *)
  (*  34 *) CODE(06602H                      ); (* BNE     [02H] = 00000038H *)
  (*  36 *) CODE(04281H                      ); (* CLR.L   D1 *)
  (*  38 *) CODE(0B081H                      ); (* CMP.L   D1,D0 *)
  (*  3A *) CODE(04CDFH, 00007H              ); (* MOVEM.L (A7)+,d0-d2 *)
END FCMP;


(* public procedure 17 *)
PROCEDURE FTST(a: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 0A000H              ); (* MOVEM.L d0/d2,-(A7) *)
  (*   8 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*   C *) CODE(02400H                      ); (* MOVE.L  D0,D2 *)
  (*   E *) CODE(0C4BCH, 07F80H, 00000H      ); (* AND.L   #7F800000H,D2 *)
  (*  14 *) CODE(06602H                      ); (* BNE     [02H] = 00000018H *)
  (*  16 *) CODE(04280H                      ); (* CLR.L   D0 *)
  (*  18 *) CODE(04A80H                      ); (* TST.L   D0 *)
  (*  1A *) CODE(04CDFH, 00005H              ); (* MOVEM.L (A7)+,d0/d2 *)
END FTST;


(* public procedure 18 *)
PROCEDURE FLOATX(a: LONGWORD);
BEGIN
  (*   4 *) CODE(048E7H, 0C000H              ); (* MOVEM.L d0-d1,-(A7) *)
  (*   8 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*   C *) CODE(0672AH                      ); (* BEQ     [2AH] = 00000038H *)
  (*   E *) CODE(0323CH, 0009EH              ); (* MOVE.W  #009EH,D1 *)
  (*  12 *) CODE(0B0BCH, 00000H, 0FFFFH      ); (* CMP.L   #0000FFFFH,D0 *)
  (*  18 *) CODE(06206H                      ); (* BHI     [06H] = 00000020H *)
  (*  1A *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  1C *) CODE(0927CH, 00010H              ); (* SUB.W   #0010H,D1 *)
  (*  20 *) CODE(0B0BCH, 000FFH, 0FFFFH      ); (* CMP.L   #00FFFFFFH,D0 *)
  (*  26 *) CODE(06204H                      ); (* BHI     [04H] = 0000002CH *)
  (*  28 *) CODE(0E188H                      ); (* LSL.L   #8,D0 *)
  (*  2A *) CODE(05141H                      ); (* SUBQ.W  #8,D1 *)
  (*  2C *) CODE(0E388H                      ); (* LSL.L   #1,D0 *)
  (*  2E *) CODE(055C9H, 0FFFCH              ); (* DBCS    D1,[FFFCH] = 0000002CH *)
  (*  32 *) CODE(01001H                      ); (* MOVE.B  D1,D0 *)
  (*  34 *) CODE(0E098H                      ); (* ROR.L   #8,D0 *)
  (*  36 *) CODE(0E288H                      ); (* LSR.L   #1,D0 *)
  (*  38 *) CODE(02D40H, 00008H              ); (* MOVE.L  D0,8(A6) *)
  (*  3C *) CODE(04CDFH, 00003H              ); (* MOVEM.L (A7)+,d0-d1 *)
END FLOATX;


(* public procedure 19 *)
PROCEDURE TRUNCX(a: REAL);
BEGIN
  (*   4 *) CODE(048E7H, 0C000H              ); (* MOVEM.L d0-d1,-(A7) *)
  (*   8 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*   C *) CODE(06A0AH                      ); (* BPL     [0AH] = 00000018H *)
  (*   E *) CODE(0C0BCH, 07F80H, 00000H      ); (* AND.L   #7F800000H,D0 *)
  (*  14 *) CODE(06716H                      ); (* BEQ     [16H] = 0000002CH *)
  (*  16 *) CODE(06020H                      ); (* BRA     [20H] = 00000038H *)
  (*  18 *) CODE(0E388H                      ); (* LSL.L   #1,D0 *)
  (*  1A *) CODE(0E198H                      ); (* ROL.L   #8,D0 *)
  (*  1C *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  1E *) CODE(01200H                      ); (* MOVE.B  D0,D1 *)
  (*  20 *) CODE(0103CH, 00001H              ); (* MOVE.B  #01H,D0 *)
  (*  24 *) CODE(0E298H                      ); (* ROR.L   #1,D0 *)
  (*  26 *) CODE(0927CH, 0007FH              ); (* SUB.W   #007FH,D1 *)
  (*  2A *) CODE(06C04H                      ); (* BGE     [04H] = 00000030H *)
  (*  2C *) CODE(04280H                      ); (* CLR.L   D0 *)
  (*  2E *) CODE(06012H                      ); (* BRA     [12H] = 00000042H *)
  (*  30 *) CODE(0927CH, 0001FH              ); (* SUB.W   #001FH,D1 *)
  (*  34 *) CODE(04441H                      ); (* NEG.W   D1 *)
  (*  36 *) CODE(06C08H                      ); (* BGE     [08H] = 00000040H *)
  (*  38 *) SETREG(0, 5);
  (*  3A *) HALTX();
  (*  40 *) CODE(0E2A8H                      ); (* LSR.L   D1,D0 *)
  (*  42 *) CODE(02D40H, 00008H              ); (* MOVE.L  D0,8(A6) *)
  (*  46 *) CODE(04CDFH, 00003H              ); (* MOVEM.L (A7)+,d0-d1 *)
END TRUNCX;


(* public procedure 20 *)
(*$P-*) (* no function entry code *)
PROCEDURE LFADD(a, b: LONGREAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0FF00H              ); (* MOVEM.L d0-d7,-(A7) *)
  (*   8 *) CODE(04CEEH, 000F0H, 00008H      ); (* MOVEM.L 8(A6),d4-d7 *)
  (*   E *) CODE(07400H                      ); (* MOVEQ   #00H,D2 *)
  (*  10 *) CODE(0DA85H                      ); (* ADD.L   D5,D5 *)
  (*  12 *) CODE(0D984H                      ); (* ADDX.L  D4,D4 *)
  (*  14 *) CODE(0DB82H                      ); (* ADDX.L  D2,D5 *)
  (*  16 *) CODE(0DE87H                      ); (* ADD.L   D7,D7 *)
  (*  18 *) CODE(0DD86H                      ); (* ADDX.L  D6,D6 *)
  (*  1A *) CODE(0DF82H                      ); (* ADDX.L  D2,D7 *)
  (*  1C *) CODE(02004H                      ); (* MOVE.L  D4,D0 *)
  (*  1E *) CODE(02205H                      ); (* MOVE.L  D5,D1 *)
  (*  20 *) CODE(09287H                      ); (* SUB.L   D7,D1 *)
  (*  22 *) CODE(09186H                      ); (* SUBX.L  D6,D0 *)
  (*  24 *) CODE(06404H                      ); (* BCC     [04H] = 0000002AH *)
  (*  26 *) CODE(0CB47H                      ); (* EXG     D5,D7 *)
  (*  28 *) CODE(0C946H                      ); (* EXG     D4,D6 *)
  (*  2A *) CODE(07600H                      ); (* MOVEQ   #00H,D3 *)
  (*  2C *) CODE(01605H                      ); (* MOVE.B  D5,D3 *)
  (*  2E *) CODE(0BF03H                      ); (* EOR.B   D7,D3 *)
  (*  30 *) CODE(00505H                      ); (* BTST    D2,D5 *)
  (*  32 *) CODE(06704H                      ); (* BEQ     [04H] = 00000038H *)
  (*  34 *) CODE(0700FH                      ); (* MOVEQ   #0FH,D0 *)
  (*  36 *) CODE(001C3H                      ); (* BSET    D0,D3 *)
  (*  38 *) CODE(0701FH                      ); (* MOVEQ   #1FH,D0 *)
  (*  3A *) CODE(0E28CH                      ); (* LSR.L   #1,D4 *)
  (*  3C *) CODE(0E295H                      ); (* ROXR.L  #1,D5 *)
  (*  3E *) CODE(06402H                      ); (* BCC     [02H] = 00000042H *)
  (*  40 *) CODE(001C4H                      ); (* BSET    D0,D4 *)
  (*  42 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  44 *) CODE(03204H                      ); (* MOVE.W  D4,D1 *)
  (*  46 *) CODE(0E28EH                      ); (* LSR.L   #1,D6 *)
  (*  48 *) CODE(0E297H                      ); (* ROXR.L  #1,D7 *)
  (*  4A *) CODE(06402H                      ); (* BCC     [02H] = 0000004EH *)
  (*  4C *) CODE(001C6H                      ); (* BSET    D0,D6 *)
  (*  4E *) CODE(00241H, 07FF0H              ); (* ANDI.W  #7FF0H,D1 *)
  (*  52 *) CODE(06612H                      ); (* BNE     [12H] = 00000066H *)
  (*  54 *) CODE(02806H                      ); (* MOVE.L  D6,D4 *)
  (*  56 *) CODE(02A07H                      ); (* MOVE.L  D7,D5 *)
  (*  58 *) CODE(048EEH, 00030H, 00010H      ); (* MOVEM.L d4-d5,0010(A6) *)
  (*  5E *) CODE(04CDFH, 000FFH              ); (* MOVEM.L (A7)+,d0-d7 *)
  (*  62 *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  64 *) CODE(04E75H                      ); (* RTS *)
  (*  66 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  68 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  6A *) CODE(03006H                      ); (* MOVE.W  D6,D0 *)
  (*  6C *) CODE(00240H, 07FF0H              ); (* ANDI.W  #7FF0H,D0 *)
  (*  70 *) CODE(067E6H                      ); (* BEQ     [E6H] = 00000058H *)
  (*  72 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  74 *) CODE(00244H, 0000FH              ); (* ANDI.W  #000FH,D4 *)
  (*  78 *) CODE(008C4H, 00004H              ); (* BSET    #0004H,D4 *)
  (*  7C *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  7E *) CODE(00246H, 0000FH              ); (* ANDI.W  #000FH,D6 *)
  (*  82 *) CODE(008C6H, 00004H              ); (* BSET    #0004H,D6 *)
  (*  86 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  88 *) CODE(03401H                      ); (* MOVE.W  D1,D2 *)
  (*  8A *) CODE(09240H                      ); (* SUB.W   D0,D1 *)
  (*  8C *) CODE(0673AH                      ); (* BEQ     [3AH] = 000000C8H *)
  (*  8E *) CODE(0E849H                      ); (* LSR.W   #4,D1 *)
  (*  90 *) CODE(00C41H, 00035H              ); (* CMPI.W  #0035H,D1 *)
  (*  94 *) CODE(0644CH                      ); (* BCC     [4CH] = 000000E2H *)
  (*  96 *) CODE(00C01H, 00020H              ); (* CMPI.B  #20H,D1 *)
  (*  9A *) CODE(06D0AH                      ); (* BLT     [0AH] = 000000A6H *)
  (*  9C *) CODE(02E06H                      ); (* MOVE.L  D6,D7 *)
  (*  9E *) CODE(07C00H                      ); (* MOVEQ   #00H,D6 *)
  (*  A0 *) CODE(00401H, 00020H              ); (* SUBI.B  #20H,D1 *)
  (*  A4 *) CODE(06722H                      ); (* BEQ     [22H] = 000000C8H *)
  (*  A6 *) CODE(00C01H, 00010H              ); (* CMPI.B  #10H,D1 *)
  (*  AA *) CODE(06D0EH                      ); (* BLT     [0EH] = 000000BAH *)
  (*  AC *) CODE(03E06H                      ); (* MOVE.W  D6,D7 *)
  (*  AE *) CODE(04246H                      ); (* CLR.W   D6 *)
  (*  B0 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  B2 *) CODE(04847H                      ); (* SWAP    D7 *)
  (*  B4 *) CODE(00401H, 00010H              ); (* SUBI.B  #10H,D1 *)
  (*  B8 *) CODE(0670EH                      ); (* BEQ     [0EH] = 000000C8H *)
  (*  BA *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  BC *) CODE(03006H                      ); (* MOVE.W  D6,D0 *)
  (*  BE *) CODE(0E2AEH                      ); (* LSR.L   D1,D6 *)
  (*  C0 *) CODE(0E2AFH                      ); (* LSR.L   D1,D7 *)
  (*  C2 *) CODE(0E2B8H                      ); (* ROR.L   D1,D0 *)
  (*  C4 *) CODE(04240H                      ); (* CLR.W   D0 *)
  (*  C6 *) CODE(08E80H                      ); (* OR.L    D0,D7 *)
  (*  C8 *) CODE(00803H, 00000H              ); (* BTST    #0000H,D3 *)
  (*  CC *) CODE(0662EH                      ); (* BNE     [2EH] = 000000FCH *)
  (*  CE *) CODE(0DA87H                      ); (* ADD.L   D7,D5 *)
  (*  D0 *) CODE(0D986H                      ); (* ADDX.L  D6,D4 *)
  (*  D2 *) CODE(07015H                      ); (* MOVEQ   #15H,D0 *)
  (*  D4 *) CODE(00104H                      ); (* BTST    D0,D4 *)
  (*  D6 *) CODE(0670AH                      ); (* BEQ     [0AH] = 000000E2H *)
  (*  D8 *) CODE(0E28CH                      ); (* LSR.L   #1,D4 *)
  (*  DA *) CODE(0E295H                      ); (* ROXR.L  #1,D5 *)
  (*  DC *) CODE(00642H, 00010H              ); (* ADDI.W  #0010H,D2 *)
  (*  E0 *) CODE(06B12H                      ); (* BMI     [12H] = 000000F4H *)
  (*  E2 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  E4 *) CODE(00244H, 0000FH              ); (* ANDI.W  #000FH,D4 *)
  (*  E8 *) CODE(08842H                      ); (* OR.W    D2,D4 *)
  (*  EA *) CODE(04203H                      ); (* CLR.B   D3 *)
  (*  EC *) CODE(08843H                      ); (* OR.W    D3,D4 *)
  (*  EE *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  F0 *) CODE(06000H, 0FF66H              ); (* BRA     [FF66H] = 00000058H *)
  (*  F4 *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  (*  F6 *) HALTX();
  (*  FC *) CODE(09A87H                      ); (* SUB.L   D7,D5 *)
  (*  FE *) CODE(09986H                      ); (* SUBX.L  D6,D4 *)
  (* 100 *) CODE(06612H                      ); (* BNE     [12H] = 00000114H *)
  (* 102 *) CODE(04A85H                      ); (* TST.L   D5 *)
  (* 104 *) CODE(06700H, 0FF52H              ); (* BEQ     [FF52H] = 00000058H *)
  (* 108 *) CODE(04845H                      ); (* SWAP    D5 *)
  (* 10A *) CODE(03805H                      ); (* MOVE.W  D5,D4 *)
  (* 10C *) CODE(04245H                      ); (* CLR.W   D5 *)
  (* 10E *) CODE(00442H, 00100H              ); (* SUBI.W  #0100H,D2 *)
  (* 112 *) CODE(06B28H                      ); (* BMI     [28H] = 0000013CH *)
  (* 114 *) CODE(00C84H, 00000H, 0000FH      ); (* CMPI.L  #0000000FH,D4 *)
  (* 11A *) CODE(0620EH                      ); (* BHI     [0EH] = 0000012AH *)
  (* 11C *) CODE(04844H                      ); (* SWAP    D4 *)
  (* 11E *) CODE(04845H                      ); (* SWAP    D5 *)
  (* 120 *) CODE(03805H                      ); (* MOVE.W  D5,D4 *)
  (* 122 *) CODE(04245H                      ); (* CLR.W   D5 *)
  (* 124 *) CODE(00442H, 00100H              ); (* SUBI.W  #0100H,D2 *)
  (* 128 *) CODE(06B12H                      ); (* BMI     [12H] = 0000013CH *)
  (* 12A *) CODE(07014H                      ); (* MOVEQ   #14H,D0 *)
  (* 12C *) CODE(00104H                      ); (* BTST    D0,D4 *)
  (* 12E *) CODE(066B2H                      ); (* BNE     [B2H] = 000000E2H *)
  (* 130 *) CODE(00442H, 00010H              ); (* SUBI.W  #0010H,D2 *)
  (* 134 *) CODE(06B06H                      ); (* BMI     [06H] = 0000013CH *)
  (* 136 *) CODE(0DA85H                      ); (* ADD.L   D5,D5 *)
  (* 138 *) CODE(0D984H                      ); (* ADDX.L  D4,D4 *)
  (* 13A *) CODE(060F0H                      ); (* BRA     [F0H] = 0000012CH *)
  (* 13C *) CODE(07800H                      ); (* MOVEQ   #00H,D4 *)
  (* 13E *) CODE(07A00H                      ); (* MOVEQ   #00H,D5 *)
  (* 140 *) CODE(06000H, 0FF16H              ); (* BRA     [FF16H] = 00000058H *)
  (* 144 *) CODE(06000H, 0FF16H              ); (* BRA     [FF16H] = 0000005CH *)
END LFADD;


(* public procedure 21 *)
(*$P-*) (* no function entry code *)
PROCEDURE LFSUB(a, b: LONGREAL);
BEGIN
  SETREG(8, LFADD);
  CODE(0086FH, 7, 4           ); (* BCHG    #7,4(A7) *)
  CODE(04ED0H                 ); (* JMP     (A0) *)
END LFSUB;


(* public procedure 22 *)
(*$P-*) (* no function entry code *)
PROCEDURE LFMUL(a, b: LONGREAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0FF00H              ); (* MOVEM.L d0-d7,-(A7) *)
  (*   8 *) CODE(04CEEH, 000F0H, 00008H      ); (* MOVEM.L 8(A6),d4-d7 *)
  (*   E *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  10 *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  12 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  14 *) CODE(0BD43H                      ); (* EOR.W   D6,D3 *)
  (*  16 *) CODE(05BE7H                      ); (* SMI     -(A7) *)
  (*  18 *) CODE(03404H                      ); (* MOVE.W  D4,D2 *)
  (*  1A *) CODE(0303CH, 07FF0H              ); (* MOVE.W  #7FF0H,D0 *)
  (*  1E *) CODE(0C440H                      ); (* AND.W   D0,D2 *)
  (*  20 *) CODE(06700H, 0010EH              ); (* BEQ     [010EH] = 00000130H *)
  (*  24 *) CODE(03606H                      ); (* MOVE.W  D6,D3 *)
  (*  26 *) CODE(0C640H                      ); (* AND.W   D0,D3 *)
  (*  28 *) CODE(06700H, 00106H              ); (* BEQ     [0106H] = 00000130H *)
  (*  2C *) CODE(0D642H                      ); (* ADD.W   D2,D3 *)
  (*  2E *) CODE(00443H, 03FF0H              ); (* SUBI.W  #3FF0H,D3 *)
  (*  32 *) CODE(06300H, 000FCH              ); (* BLS     [00FCH] = 00000130H *)
  (*  36 *) CODE(06B00H, 000FEH              ); (* BMI     [00FEH] = 00000136H *)
  (*  3A *) CODE(0700FH                      ); (* MOVEQ   #0FH,D0 *)
  (*  3C *) CODE(0C840H                      ); (* AND.W   D0,D4 *)
  (*  3E *) CODE(008C4H, 00004H              ); (* BSET    #0004H,D4 *)
  (*  42 *) CODE(0CC40H                      ); (* AND.W   D0,D6 *)
  (*  44 *) CODE(008C6H, 00004H              ); (* BSET    #0004H,D6 *)
  (*  48 *) CODE(07400H                      ); (* MOVEQ   #00H,D2 *)
  (*  4A *) CODE(03F03H                      ); (* MOVE.W  D3,-(A7) *)
  (*  4C *) CODE(03004H                      ); (* MOVE.W  D4,D0 *)
  (*  4E *) CODE(0C0C6H                      ); (* MULU    D6,D0 *)
  (*  50 *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  52 *) CODE(03204H                      ); (* MOVE.W  D4,D1 *)
  (*  54 *) CODE(0C2C7H                      ); (* MULU    D7,D1 *)
  (*  56 *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  58 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  5A *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  5C *) CODE(0D083H                      ); (* ADD.L   D3,D0 *)
  (*  5E *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  60 *) CODE(04847H                      ); (* SWAP    D7 *)
  (*  62 *) CODE(0C6C7H                      ); (* MULU    D7,D3 *)
  (*  64 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  66 *) CODE(0D243H                      ); (* ADD.W   D3,D1 *)
  (*  68 *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  6A *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  6C *) CODE(0D183H                      ); (* ADDX.L  D3,D0 *)
  (*  6E *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  70 *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  72 *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  74 *) CODE(0D243H                      ); (* ADD.W   D3,D1 *)
  (*  76 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  78 *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  7A *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  7C *) CODE(0D183H                      ); (* ADDX.L  D3,D0 *)
  (*  7E *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  80 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  82 *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  84 *) CODE(0D083H                      ); (* ADD.L   D3,D0 *)
  (*  86 *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  88 *) CODE(0C6C7H                      ); (* MULU    D7,D3 *)
  (*  8A *) CODE(0D283H                      ); (* ADD.L   D3,D1 *)
  (*  8C *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  8E *) CODE(03604H                      ); (* MOVE.W  D4,D3 *)
  (*  90 *) CODE(04847H                      ); (* SWAP    D7 *)
  (*  92 *) CODE(0C8C7H                      ); (* MULU    D7,D4 *)
  (*  94 *) CODE(04244H                      ); (* CLR.W   D4 *)
  (*  96 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  98 *) CODE(0D284H                      ); (* ADD.L   D4,D1 *)
  (*  9A *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  9C *) CODE(03605H                      ); (* MOVE.W  D5,D3 *)
  (*  9E *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  A0 *) CODE(0D283H                      ); (* ADD.L   D3,D1 *)
  (*  A2 *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  A4 *) CODE(03605H                      ); (* MOVE.W  D5,D3 *)
  (*  A6 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  A8 *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  AA *) CODE(04243H                      ); (* CLR.W   D3 *)
  (*  AC *) CODE(04843H                      ); (* SWAP    D3 *)
  (*  AE *) CODE(0D283H                      ); (* ADD.L   D3,D1 *)
  (*  B0 *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  B2 *) CODE(04845H                      ); (* SWAP    D5 *)
  (*  B4 *) CODE(03605H                      ); (* MOVE.W  D5,D3 *)
  (*  B6 *) CODE(0C6C6H                      ); (* MULU    D6,D3 *)
  (*  B8 *) CODE(0D283H                      ); (* ADD.L   D3,D1 *)
  (*  BA *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  BC *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  BE *) CODE(0CCC5H                      ); (* MULU    D5,D6 *)
  (*  C0 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  C2 *) CODE(0D246H                      ); (* ADD.W   D6,D1 *)
  (*  C4 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  C6 *) CODE(04246H                      ); (* CLR.W   D6 *)
  (*  C8 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  CA *) CODE(0D186H                      ); (* ADDX.L  D6,D0 *)
  (*  CC *) CODE(04847H                      ); (* SWAP    D7 *)
  (*  CE *) CODE(0CAC7H                      ); (* MULU    D7,D5 *)
  (*  D0 *) CODE(04245H                      ); (* CLR.W   D5 *)
  (*  D2 *) CODE(04845H                      ); (* SWAP    D5 *)
  (*  D4 *) CODE(0D285H                      ); (* ADD.L   D5,D1 *)
  (*  D6 *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  D8 *) CODE(05081H                      ); (* ADDQ.L  #8,D1 *)
  (*  DA *) CODE(0D182H                      ); (* ADDX.L  D2,D0 *)
  (*  DC *) CODE(0361FH                      ); (* MOVE.W  (A7)+,D3 *)
  (*  DE *) CODE(07804H                      ); (* MOVEQ   #04H,D4 *)
  (*  E0 *) CODE(07A19H                      ); (* MOVEQ   #19H,D5 *)
  (*  E2 *) CODE(00B00H                      ); (* BTST    D5,D0 *)
  (*  E4 *) CODE(06706H                      ); (* BEQ     [06H] = 000000ECH *)
  (*  E6 *) CODE(05244H                      ); (* ADDQ.W  #1,D4 *)
  (*  E8 *) CODE(00643H, 00010H              ); (* ADDI.W  #0010H,D3 *)
  (*  EC *) CODE(01400H                      ); (* MOVE.B  D0,D2 *)
  (*  EE *) CODE(0E8BAH                      ); (* ROR.L   D4,D2 *)
  (*  F0 *) CODE(04202H                      ); (* CLR.B   D2 *)
  (*  F2 *) CODE(0E8A8H                      ); (* LSR.L   D4,D0 *)
  (*  F4 *) CODE(0E8A9H                      ); (* LSR.L   D4,D1 *)
  (*  F6 *) CODE(08282H                      ); (* OR.L    D2,D1 *)
  (*  F8 *) CODE(05B05H                      ); (* SUBQ.B  #5,D5 *)
  (*  FA *) CODE(00B00H                      ); (* BTST    D5,D0 *)
  (*  FC *) CODE(0660CH                      ); (* BNE     [0CH] = 0000010AH *)
  (*  FE *) CODE(0D482H                      ); (* ADD.L   D2,D2 *)
  (* 100 *) CODE(0D381H                      ); (* ADDX.L  D1,D1 *)
  (* 102 *) CODE(0D180H                      ); (* ADDX.L  D0,D0 *)
  (* 104 *) CODE(00443H, 0000AH              ); (* SUBI.W  #000AH,D3 *)
  (* 108 *) CODE(06324H                      ); (* BLS     [24H] = 0000012EH *)
  (* 10A *) CODE(04A43H                      ); (* TST.W   D3 *)
  (* 10C *) CODE(06B28H                      ); (* BMI     [28H] = 00000136H *)
  (* 10E *) CODE(04840H                      ); (* SWAP    D0 *)
  (* 110 *) CODE(00240H, 0000FH              ); (* ANDI.W  #000FH,D0 *)
  (* 114 *) CODE(08043H                      ); (* OR.W    D3,D0 *)
  (* 116 *) CODE(04840H                      ); (* SWAP    D0 *)
  (* 118 *) CODE(04A1FH                      ); (* TST.B   (A7)+ *)
  (* 11A *) CODE(06704H                      ); (* BEQ     [04H] = 00000120H *)
  (* 11C *) CODE(0761FH                      ); (* MOVEQ   #1FH,D3 *)
  (* 11E *) CODE(007C0H                      ); (* BSET    D3,D0 *)
  (* 120 *) CODE(048EEH, 00003H, 00010H      ); (* MOVEM.L d0-d1,0010(A6) *)
  (* 126 *) CODE(04CDFH, 000FFH              ); (* MOVEM.L (A7)+,d0-d7 *)
  (* 12A *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (* 12C *) CODE(04E75H                      ); (* RTS *)
  (* 12E *) CODE(0544FH                      ); (* ADDQ.W  #2,A7 *)
  (* 130 *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (* 132 *) CODE(07200H                      ); (* MOVEQ   #00H,D1 *)
  (* 134 *) CODE(060EAH                      ); (* BRA     [EAH] = 00000120H *)
  (* 136 *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  HALTX();
END LFMUL;


(* public procedure 23 *)
(*$P-*) (* no function entry code *)
PROCEDURE LFDIV(a, b: LONGREAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0FF00H              ); (* MOVEM.L d0-d7,-(A7) *)
  (*   8 *) CODE(04CEEH, 000F0H, 00008H      ); (* MOVEM.L 8(A6),d4-d7 *)
  (*   E *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  10 *) CODE(03204H                      ); (* MOVE.W  D4,D1 *)
  (*  12 *) CODE(00241H, 07FF0H              ); (* ANDI.W  #7FF0H,D1 *)
  (*  16 *) CODE(06700H, 0008EH              ); (* BEQ     [008EH] = 000000A6H *)
  (*  1A *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  1C *) CODE(03006H                      ); (* MOVE.W  D6,D0 *)
  (*  1E *) CODE(00240H, 07FF0H              ); (* ANDI.W  #7FF0H,D0 *)
  (*  22 *) CODE(06700H, 00070H              ); (* BEQ     [0070H] = 00000094H *)
  (*  26 *) CODE(09041H                      ); (* SUB.W   D1,D0 *)
  (*  28 *) CODE(00640H, 03FF0H              ); (* ADDI.W  #3FF0H,D0 *)
  (*  2C *) CODE(06B00H, 00078H              ); (* BMI     [0078H] = 000000A6H *)
  (*  30 *) CODE(03206H                      ); (* MOVE.W  D6,D1 *)
  (*  32 *) CODE(0B941H                      ); (* EOR.W   D4,D1 *)
  (*  34 *) CODE(05BE7H                      ); (* SMI     -(A7) *)
  (*  36 *) CODE(00246H, 0000FH              ); (* ANDI.W  #000FH,D6 *)
  (*  3A *) CODE(008C6H, 00004H              ); (* BSET    #0004H,D6 *)
  (*  3E *) CODE(00244H, 0000FH              ); (* ANDI.W  #000FH,D4 *)
  (*  42 *) CODE(008C4H, 00004H              ); (* BSET    #0004H,D4 *)
  (*  46 *) CODE(04846H                      ); (* SWAP    D6 *)
  (*  48 *) CODE(04844H                      ); (* SWAP    D4 *)
  (*  4A *) CODE(0721EH                      ); (* MOVEQ   #1EH,D1 *)
  (*  4C *) CODE(07600H                      ); (* MOVEQ   #00H,D3 *)
  (*  4E *) CODE(06122H                      ); (* BSR     [22H] = 00000072H *)
  (*  50 *) CODE(02403H                      ); (* MOVE.L  D3,D2 *)
  (*  52 *) CODE(07217H                      ); (* MOVEQ   #17H,D1 *)
  (*  54 *) CODE(07600H                      ); (* MOVEQ   #00H,D3 *)
  (*  56 *) CODE(06116H                      ); (* BSR     [16H] = 0000006EH *)
  (*  58 *) CODE(07209H                      ); (* MOVEQ   #09H,D1 *)
  (*  5A *) CODE(0E3ABH                      ); (* LSL.L   D1,D3 *)
  (*  5C *) CODE(0D582H                      ); (* ADDX.L  D2,D2 *)
  (*  5E *) CODE(06B4EH                      ); (* BMI     [4EH] = 000000AEH *)
  (*  60 *) CODE(00440H, 00010H              ); (* SUBI.W  #0010H,D0 *)
  (*  64 *) CODE(06B00H, 0002CH              ); (* BMI     [002CH] = 00000092H *)
  (*  68 *) CODE(0D683H                      ); (* ADD.L   D3,D3 *)
  (*  6A *) CODE(0D582H                      ); (* ADDX.L  D2,D2 *)
  (*  6C *) CODE(06040H                      ); (* BRA     [40H] = 000000AEH *)
  (*  6E *) CODE(0DE87H                      ); (* ADD.L   D7,D7 *)
  (*  70 *) CODE(0DD86H                      ); (* ADDX.L  D6,D6 *)
  (*  72 *) CODE(0BC84H                      ); (* CMP.L   D4,D6 *)
  (*  74 *) CODE(05CC9H, 0FFF8H              ); (* DBGE    D1,[FFF8H] = 0000006EH *)
  (*  78 *) CODE(003C3H                      ); (* BSET    D1,D3 *)
  (*  7A *) CODE(09E85H                      ); (* SUB.L   D5,D7 *)
  (*  7C *) CODE(09D84H                      ); (* SUBX.L  D4,D6 *)
  (*  7E *) CODE(05BC9H, 0FFEEH              ); (* DBMI    D1,[FFEEH] = 0000006EH *)
  (*  82 *) CODE(06A0CH                      ); (* BPL     [0CH] = 00000090H *)
  (*  84 *) CODE(0DE85H                      ); (* ADD.L   D5,D7 *)
  (*  86 *) CODE(0DD84H                      ); (* ADDX.L  D4,D6 *)
  (*  88 *) CODE(00383H                      ); (* BCLR    D1,D3 *)
  (*  8A *) CODE(04A41H                      ); (* TST.W   D1 *)
  (*  8C *) CODE(05DC9H, 0FFE0H              ); (* DBLT    D1,[FFE0H] = 0000006EH *)
  (*  90 *) CODE(04E75H                      ); (* RTS *)
  (*  92 *) CODE(0548FH                      ); (* ADDQ.L  #2,A7 *)
  (*  94 *) CODE(07400H                      ); (* MOVEQ   #00H,D2 *)
  (*  96 *) CODE(07600H                      ); (* MOVEQ   #00H,D3 *)
  (*  98 *) CODE(048EEH, 0000CH, 00010H      ); (* MOVEM.L d2-d3,0010(A6) *)
  (*  9E *) CODE(04CDFH, 000FFH              ); (* MOVEM.L (A7)+,d0-d7 *)
  (*  A2 *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  A4 *) CODE(04E75H                      ); (* RTS *)
  (*  A6 *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  (*  A8 *) HALTX();
  (*  AE *) CODE(07C00H                      ); (* MOVEQ   #00H,D6 *)
  (*  B0 *) CODE(00683H, 00000H, 00800H      ); (* ADDI.L  #00000800H,D3 *)
  (*  B6 *) CODE(0D586H                      ); (* ADDX.L  D6,D2 *)
  (*  B8 *) CODE(0640AH                      ); (* BCC     [0AH] = 000000C4H *)
  (*  BA *) CODE(0E292H                      ); (* ROXR.L  #1,D2 *)
  (*  BC *) CODE(0E293H                      ); (* ROXR.L  #1,D3 *)
  (*  BE *) CODE(00640H, 00010H              ); (* ADDI.W  #0010H,D0 *)
  (*  C2 *) CODE(06BE2H                      ); (* BMI     [E2H] = 000000A6H *)
  (*  C4 *) CODE(07200H                      ); (* MOVEQ   #00H,D1 *)
  (*  C6 *) CODE(03202H                      ); (* MOVE.W  D2,D1 *)
  (*  C8 *) CODE(07E0BH                      ); (* MOVEQ   #0BH,D7 *)
  (*  CA *) CODE(0EEAAH                      ); (* LSR.L   D7,D2 *)
  (*  CC *) CODE(0EEABH                      ); (* LSR.L   D7,D3 *)
  (*  CE *) CODE(0EEB9H                      ); (* ROR.L   D7,D1 *)
  (*  D0 *) CODE(04201H                      ); (* CLR.B   D1 *)
  (*  D2 *) CODE(08681H                      ); (* OR.L    D1,D3 *)
  (*  D4 *) CODE(04842H                      ); (* SWAP    D2 *)
  (*  D6 *) CODE(00242H, 0000FH              ); (* ANDI.W  #000FH,D2 *)
  (*  DA *) CODE(08440H                      ); (* OR.W    D0,D2 *)
  (*  DC *) CODE(04842H                      ); (* SWAP    D2 *)
  (*  DE *) CODE(04A1FH                      ); (* TST.B   (A7)+ *)
  (*  E0 *) CODE(067B6H                      ); (* BEQ     [B6H] = 00000098H *)
  (*  E2 *) CODE(0701FH                      ); (* MOVEQ   #1FH,D0 *)
  (*  E4 *) CODE(001C2H                      ); (* BSET    D0,D2 *)
  (*  E6 *) CODE(060B0H                      ); (* BRA     [B0H] = 00000098H *)
END LFDIV;


(* public procedure 24 *)
PROCEDURE LFCMP(a, b: LONGREAL);
BEGIN
  (*   4 *) CODE(048E7H, 0F800H              ); (* MOVEM.L d0-d4,-(A7) *)
  (*   8 *) CODE(04CEEH, 0000FH, 00008H      ); (* MOVEM.L 8(A6),d0-d3 *)
  (*   E *) CODE(02800H                      ); (* MOVE.L  D0,D4 *)
  (*  10 *) CODE(06A08H                      ); (* BPL     [08H] = 0000001AH *)
  (*  12 *) CODE(00A80H, 07FFFH, 0FFFFH      ); (* EORI.L  #7FFFFFFFH,D0 *)
  (*  18 *) CODE(04681H                      ); (* NOT.L   D1 *)
  (*  1A *) CODE(00284H, 07FF0H, 00000H      ); (* ANDI.L  #7FF00000H,D4 *)
  (*  20 *) CODE(06604H                      ); (* BNE     [04H] = 00000026H *)
  (*  22 *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  24 *) CODE(07200H                      ); (* MOVEQ   #00H,D1 *)
  (*  26 *) CODE(02802H                      ); (* MOVE.L  D2,D4 *)
  (*  28 *) CODE(06A08H                      ); (* BPL     [08H] = 00000032H *)
  (*  2A *) CODE(00A82H, 07FFFH, 0FFFFH      ); (* EORI.L  #7FFFFFFFH,D2 *)
  (*  30 *) CODE(04683H                      ); (* NOT.L   D3 *)
  (*  32 *) CODE(00284H, 07FF0H, 00000H      ); (* ANDI.L  #7FF00000H,D4 *)
  (*  38 *) CODE(06604H                      ); (* BNE     [04H] = 0000003EH *)
  (*  3A *) CODE(07400H                      ); (* MOVEQ   #00H,D2 *)
  (*  3C *) CODE(07600H                      ); (* MOVEQ   #00H,D3 *)
  (*  3E *) CODE(0B480H                      ); (* CMP.L   D0,D2 *)
  (*  40 *) CODE(06602H                      ); (* BNE     [02H] = 00000044H *)
  (*  42 *) CODE(0B681H                      ); (* CMP.L   D1,D3 *)
  (*  44 *) CODE(04CDFH, 0001FH              ); (* MOVEM.L (A7)+,d0-d4 *)
END LFCMP;


(* public procedure 25 *)
PROCEDURE LFTST(a: LONGREAL);
BEGIN
  (*   4 *) CODE(048E7H, 0C000H              ); (* MOVEM.L d0-d1,-(A7) *)
  (*   8 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*   C *) CODE(02200H                      ); (* MOVE.L  D0,D1 *)
  (*   E *) CODE(00281H, 07FF0H, 00000H      ); (* ANDI.L  #7FF00000H,D1 *)
  (*  14 *) CODE(06602H                      ); (* BNE     [02H] = 00000018H *)
  (*  16 *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  18 *) CODE(04A80H                      ); (* TST.L   D0 *)
  (*  1A *) CODE(04CDFH, 00003H              ); (* MOVEM.L (A7)+,d0-d1 *)
END LFTST;


(* public procedure 26 *)
(*$P-*) (* no function entry code *)
PROCEDURE LFLOATX(a: LONGWORD);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0E000H              ); (* MOVEM.L d0-d2,-(A7) *)
  (*   8 *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*   A *) CODE(0222EH, 00008H              ); (* MOVE.L  8(A6),D1 *)
  (*   E *) CODE(06748H                      ); (* BEQ     [48H] = 00000058H *)
  (*  10 *) CODE(0343CH, 041E0H              ); (* MOVE.W  #41E0H,D2 *)
  (*  14 *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  16 *) CODE(03001H                      ); (* MOVE.W  D1,D0 *)
  (*  18 *) CODE(0660AH                      ); (* BNE     [0AH] = 00000024H *)
  (*  1A *) CODE(04841H                      ); (* SWAP    D1 *)
  (*  1C *) CODE(03001H                      ); (* MOVE.W  D1,D0 *)
  (*  1E *) CODE(07200H                      ); (* MOVEQ   #00H,D1 *)
  (*  20 *) CODE(00442H, 00100H              ); (* SUBI.W  #0100H,D2 *)
  (*  24 *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  26 *) CODE(00C40H, 000FFH              ); (* CMPI.W  #00FFH,D0 *)
  (*  2A *) CODE(0620CH                      ); (* BHI     [0CH] = 00000038H *)
  (*  2C *) CODE(0E188H                      ); (* LSL.L   #8,D0 *)
  (*  2E *) CODE(0E199H                      ); (* ROL.L   #8,D1 *)
  (*  30 *) CODE(08001H                      ); (* OR.B    D1,D0 *)
  (*  32 *) CODE(04201H                      ); (* CLR.B   D1 *)
  (*  34 *) CODE(00442H, 00080H              ); (* SUBI.W  #0080H,D2 *)
  (*  38 *) CODE(04A40H                      ); (* TST.W   D0 *)
  (*  3A *) CODE(06B0AH                      ); (* BMI     [0AH] = 00000046H *)
  (*  3C *) CODE(00442H, 00010H              ); (* SUBI.W  #0010H,D2 *)
  (*  40 *) CODE(0D281H                      ); (* ADD.L   D1,D1 *)
  (*  42 *) CODE(0D140H                      ); (* ADDX.W  D0,D0 *)
  (*  44 *) CODE(06AF6H                      ); (* BPL     [F6H] = 0000003CH *)
  (*  46 *) CODE(0EB88H                      ); (* LSL.L   #5,D0 *)
  (*  48 *) CODE(0EB99H                      ); (* ROL.L   #5,D1 *)
  (*  4A *) CODE(08001H                      ); (* OR.B    D1,D0 *)
  (*  4C *) CODE(04201H                      ); (* CLR.B   D1 *)
  (*  4E *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  50 *) CODE(00240H, 0000FH              ); (* ANDI.W  #000FH,D0 *)
  (*  54 *) CODE(08042H                      ); (* OR.W    D2,D0 *)
  (*  56 *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  58 *) CODE(048EEH, 00003H, 00008H      ); (* MOVEM.L d0-d1,8(A6) *)
  (*  5E *) CODE(04CDFH, 00007H              ); (* MOVEM.L (A7)+,d0-d2 *)
  (*  62 *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  64 *) CODE(04E75H                      ); (* RTS *)
  (*  66 *) CODE(04E75H                      ); (* RTS *)
END LFLOATX;


(* public procedure 27 *)
(*$P-*) (* no function entry code *)
PROCEDURE LTRUNCX(a: LONGREAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0E000H              ); (* MOVEM.L d0-d2,-(A7) *)
  (*   8 *) CODE(04CEEH, 00003H, 00008H      ); (* MOVEM.L 8(A6),d0-d1 *)
  (*   E *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  10 *) CODE(07400H                      ); (* MOVEQ   #00H,D2 *)
  (*  12 *) CODE(03400H                      ); (* MOVE.W  D0,D2 *)
  (*  14 *) CODE(06A0EH                      ); (* BPL     [0EH] = 00000024H *)
  (*  16 *) CODE(00242H, 07FF0H              ); (* ANDI.W  #7FF0H,D2 *)
  (*  1A *) CODE(06738H                      ); (* BEQ     [38H] = 00000054H *)
  (*  1C *) CODE(07005H                      ); (* MOVEQ   #05H,D0 *)
  (*  1E *) HALTX();
  (*  24 *) CODE(0E84AH                      ); (* LSR.W   #4,D2 *)
  (*  26 *) CODE(0672CH                      ); (* BEQ     [2CH] = 00000054H *)
  (*  28 *) CODE(00442H, 003FFH              ); (* SUBI.W  #03FFH,D2 *)
  (*  2C *) CODE(06D26H                      ); (* BLT     [26H] = 00000054H *)
  (*  2E *) CODE(00240H, 0000FH              ); (* ANDI.W  #000FH,D0 *)
  (*  32 *) CODE(008C0H, 00004H              ); (* BSET    #0004H,D0 *)
  (*  36 *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  38 *) CODE(00442H, 0001FH              ); (* SUBI.W  #001FH,D2 *)
  (*  3C *) CODE(04442H                      ); (* NEG.W   D2 *)
  (*  3E *) CODE(06DDCH                      ); (* BLT     [DCH] = 0000001CH *)
  (*  40 *) CODE(00442H, 0000BH              ); (* SUBI.W  #000BH,D2 *)
  (*  44 *) CODE(06D12H                      ); (* BLT     [12H] = 00000058H *)
  (*  46 *) CODE(0E4A8H                      ); (* LSR.L   D2,D0 *)
  (*  48 *) CODE(02D40H, 0000CH              ); (* MOVE.L  D0,12(A6) *)
  (*  4C *) CODE(04CDFH, 00007H              ); (* MOVEM.L (A7)+,d0-d2 *)
  (*  50 *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  52 *) CODE(04E75H                      ); (* RTS *)
  (*  54 *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  56 *) CODE(060F0H                      ); (* BRA     [F0H] = 00000048H *)
  (*  58 *) CODE(04442H                      ); (* NEG.W   D2 *)
  (*  5A *) CODE(0E5A8H                      ); (* LSL.L   D2,D0 *)
  (*  5C *) CODE(04241H                      ); (* CLR.W   D1 *)
  (*  5E *) CODE(0E5B9H                      ); (* ROL.L   D2,D1 *)
  (*  60 *) CODE(08041H                      ); (* OR.W    D1,D0 *)
  (*  62 *) CODE(060E4H                      ); (* BRA     [E4H] = 00000048H *)
END LTRUNCX;


(* public procedure 28 *)
(*$P-*) (* no function entry code *)
PROCEDURE LENGTHEN(a: REAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0E000H              ); (* MOVEM.L d0-d2,-(A7) *)
  (*   8 *) CODE(0202EH, 00008H              ); (* MOVE.L  8(A6),D0 *)
  (*   C *) CODE(0E398H                      ); (* ROL.L   #1,D0 *)
  (*   E *) CODE(02400H                      ); (* MOVE.L  D0,D2 *)
  (*  10 *) CODE(00280H, 000FFH, 0FFFFH      ); (* ANDI.L  #00FFFFFFH,D0 *)
  (*  16 *) CODE(00282H, 0FF00H, 00000H      ); (* ANDI.L  #FF000000H,D2 *)
  (*  1C *) CODE(06612H                      ); (* BNE     [12H] = 00000030H *)
  (*  1E *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  20 *) CODE(07200H                      ); (* MOVEQ   #00H,D1 *)
  (*  22 *) CODE(048EEH, 00003H, 00008H      ); (* MOVEM.L d0-d1,8(A6) *)
  (*  28 *) CODE(04CDFH, 00007H              ); (* MOVEM.L (A7)+,d0-d2 *)
  (*  2C *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  2E *) CODE(04E75H                      ); (* RTS *)
  (*  30 *) CODE(0E68AH                      ); (* LSR.L   #3,D2 *)
  (*  32 *) CODE(0E288H                      ); (* LSR.L   #1,D0 *)
  (*  34 *) CODE(0E292H                      ); (* ROXR.L  #1,D2 *)
  (*  36 *) CODE(00682H, 03800H, 00000H      ); (* ADDI.L  #38000000H,D2 *)
  (*  3C *) CODE(02200H                      ); (* MOVE.L  D0,D1 *)
  (*  3E *) CODE(0E688H                      ); (* LSR.L   #3,D0 *)
  (*  40 *) CODE(0E699H                      ); (* ROR.L   #3,D1 *)
  (*  42 *) CODE(00281H, 07000H, 00000       ); (* ANDI.L  #70000000H,D1 *)
  (*  48 *) CODE(08082H                      ); (* OR.L    D2,D0 *)
  (*  4A *) CODE(060D6H                      ); (* BRA     [D6H] = 00000022H *)
END LENGTHEN;


(* public procedure 29 *)
(*$P-*) (* no function entry code *)
PROCEDURE SHORTEN(a: LONGREAL);
BEGIN
  (*   0 *) CODE(04E56H, 00000H              ); (* LINK    A6,#0000H *)
  (*   4 *) CODE(048E7H, 0F000H              ); (* MOVEM.L d0-d3,-(A7) *)
  (*   8 *) CODE(04CEEH, 00003H, 0008H       ); (* MOVEM.L 8(A6),d0-d1 *)
  (*   E *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  10 *) CODE(03400H                      ); (* MOVE.W  D0,D2 *)
  (*  12 *) CODE(00242H, 07FF0H              ); (* ANDI.W  #7FF0H,D2 *)
  (*  16 *) CODE(06762H                      ); (* BEQ     [62H] = 0000007AH *)
  (*  18 *) CODE(00442H, 03800H              ); (* SUBI.W  #3800H,D2 *)
  (*  1C *) CODE(06B00H, 0005CH              ); (* BMI     [005CH] = 0000007AH *)
  (*  20 *) CODE(00C42H, 00FFFH              ); (* CMPI.W  #0FFFH,D2 *)
  (*  24 *) CODE(06E00H, 00058H              ); (* BGT     [0058H] = 0000007EH *)
  (*  28 *) CODE(0E94AH                      ); (* LSL.W   #4,D2 *)
  (*  2A *) CODE(0760FH                      ); (* MOVEQ   #0FH,D3 *)
  (*  2C *) CODE(00700H                      ); (* BTST    D3,D0 *)
  (*  2E *) CODE(06704H                      ); (* BEQ     [04H] = 00000034H *)
  (*  30 *) CODE(008C2H, 00000H              ); (* BSET    #0000H,D2 *)
  (*  34 *) CODE(00240H, 0000FH              ); (* ANDI.W  #000FH,D0 *)
  (*  38 *) CODE(008C0H, 00004H              ); (* BSET    #0004H,D0 *)
  (*  3C *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  3E *) CODE(00681H, 00010H, 0000        ); (* ADDI.L  #00100000H,D1 *)
  (*  44 *) CODE(06412H                      ); (* BCC     [12H] = 00000058H *)
  (*  46 *) CODE(05280H                      ); (* ADDQ.L  #1,D0 *)
  (*  48 *) CODE(07614H                      ); (* MOVEQ   #14H,D3 *)
  (*  4A *) CODE(00700H                      ); (* BTST    D3,D0 *)
  (*  4C *) CODE(0660AH                      ); (* BNE     [0AH] = 00000058H *)
  (*  4E *) CODE(0E288H                      ); (* LSR.L   #1,D0 *)
  (*  50 *) CODE(0E291H                      ); (* ROXR.L  #1,D1 *)
  (*  52 *) CODE(00642H, 00100H              ); (* ADDI.W  #0100H,D2 *)
  (*  56 *) CODE(06526H                      ); (* BCS     [26H] = 0000007EH *)
  (*  58 *) CODE(0E788H                      ); (* LSL.L   #3,D0 *)
  (*  5A *) CODE(0E799H                      ); (* ROL.L   #3,D1 *)
  (*  5C *) CODE(00201H, 00007H              ); (* ANDI.B  #07H,D1 *)
  (*  60 *) CODE(08001H                      ); (* OR.B    D1,D0 *)
  (*  62 *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  64 *) CODE(00880H, 00007H              ); (* BCLR    #0007H,D0 *)
  (*  68 *) CODE(0E25AH                      ); (* ROR.W   #1,D2 *)
  (*  6A *) CODE(08042H                      ); (* OR.W    D2,D0 *)
  (*  6C *) CODE(04840H                      ); (* SWAP    D0 *)
  (*  6E *) CODE(02D40H, 0000CH              ); (* MOVE.L  D0,12(A6) *)
  (*  72 *) CODE(04CDFH, 0000FH              ); (* MOVEM.L (A7)+,d0-d3 *)
  (*  76 *) CODE(04E5EH                      ); (* UNLK    A6 *)
  (*  78 *) CODE(04E75H                      ); (* RTS *)
  (*  7A *) CODE(07000H                      ); (* MOVEQ   #00H,D0 *)
  (*  7C *) CODE(060F0H                      ); (* BRA     [F0H] = 0000006EH *)
  (*  7E *) SETREG(0, 5);
  (*  80 *) HALTX();
END SHORTEN;


(*$P-*) (* no function entry code *)
PROCEDURE busErrorProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(BusErrorTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END busErrorProc;


(*$P-*) (* no function entry code *)
PROCEDURE adrErrorProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(AdrErrorTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END adrErrorProc;


(*$P-*) (* no function entry code *)
PROCEDURE illgInstrProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(IllegalInstrTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END illgInstrProc;


(*$P-*) (* no function entry code *)
PROCEDURE zeroDivideProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(ZeroDivideTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END zeroDivideProc;


(*$P-*) (* no function entry code *)
PROCEDURE chkProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(OutOfRangeTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END chkProc;


(*$P-*) (* no function entry code *)
PROCEDURE trapvProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(ArithOverflowTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END trapvProc;


(*$P-*) (* no function entry code *)
PROCEDURE privVioProc();
BEGIN
     CODE(046FCH, 02700H);             (* MOVE    #2700H,SR *)
     SETREG(0, ORD(PrivilegeViolationTRAP)-9);
     errorProc();
     CODE(04E73H);                     (* RTE *)
END privVioProc;


PROCEDURE SetException(p: PROC; vec: CARDINAL);
VAR prevproc: PROC;
BEGIN
  SETREG(0, p);
  CODE(02f00H); (* move.l     d0,-(a7) *)
  SETREG(1, vec);
  CODE(03f01H); (* move.w     d1,-(a7) *)
  PUSH(5);
  CODE(04E4DH); (* trap #13 *)
  prevproc := PROC(REGISTER(0));
  IF vec <= HIGH(oldvecs1) THEN
    oldvecs1[vec] := prevproc;
  ELSE
    oldvecs2[vec - 32] := prevproc;
  END;
END SetException;


PROCEDURE RestoreExceptions();
BEGIN
  SetException(oldvecs1[3], 3);
  SetException(oldvecs1[2], 2);
  SetException(oldvecs1[5], 5);
  SetException(oldvecs1[6], 6);
  SetException(oldvecs1[7], 7);
  SetException(oldvecs1[8], 8);
  SetException(oldvecs2[7], 32 + 7);
  SetException(oldvecs2[6], 32 + 6);
END RestoreExceptions;


(*$P-*) (* no function entry code *)
BEGIN
  CODE(0204FH                 );  (* move.l  a7,a0 *)
  CODE(02068H, 4              );  (* move.l  4(a0),a0 *)
  BasePageAddress := REGISTER(8);
  CodeBase := BasePageAddress^.CodeBase;
  CODE(02028H, 12             );  (* move.l  CodeLen(a0),d0 *)
  CODE(0D0A8H, 20             );  (* add.l   DataLen(a0),d0 *)
  CODE(0D0A8H, 28             );  (* add.l   BssLen(a0),d0 *)
  WITH CodeBase^ DO
  CODE(02A2CH, 6              );  (* MOVE.L  stacksize(a4),D5 *)
  END;
  CODE(0D085H                 );  (* ADD.L   D5,D0 *)
  CODE(00680H, 0, 00100H      );  (* ADDI.L  #256,D0 *)
  CODE(02E40H                 );  (* MOVE.L  D0,A7 *)
  CODE(0DFC8H                 );  (* ADDA.L  A0,A7 *)
  CODE(02F00H                 );  (* MOVE.L  D0,-(A7) *)
  CODE(02F08H                 );  (* MOVE.L  A0,-(A7) *)
  CODE(03F00H                 );  (* MOVE.W  D0,-(A7) *)
  CODE(03F3CH, 0004AH         );  (* MOVE.W  #004AH,-(A7) Mshrink *)
  CODE(04E41H                 );  (* TRAP    #1 *)
  CODE(0DFFCH, 0, 12          );  (* ADDA.L  #12,A7 *)
  WITH BasePageAddress^ DO
  PgmEnd := ADDRESS(LONGCARD(CodeBase) + CodeLen + DataLen + BssLen);
  END;
  SetException(adrErrorProc, 3);
  SetException(busErrorProc, 2);
  SetException(zeroDivideProc, 5);
  SetException(chkProc, 6);
  SetException(trapvProc, 7);
  SetException(privVioProc, 8);
  SetException(syscallTrap, 32 + 7);
  SetException(trap6, 32 + 6);
  ErrorProcessor := defaultErrorProcessor;
  CODE(07007H, 04E47H         );  (* moveq  #7,d0; trap #7 = SYSCALL(5); *)

END GEMX.
