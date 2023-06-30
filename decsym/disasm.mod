IMPLEMENTATION MODULE disasm;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* quick calls *)

IMPORT StrUtil;

PROCEDURE disasm(addr: LONGCARD; pc: OpCodePtr; VAR numOpcodes: CARDINAL; VAR strbuf: ARRAY OF CHAR);

VAR opcode: CARDINAL;
VAR strpos: CARDINAL;
VAR opsize: CARDINAL;
VAR subcode: CARDINAL;
VAR disp: SignedWord;

  PROCEDURE addch(ch: CHAR);
  BEGIN
    strbuf[strpos] := ch;
    INC(strpos);
  END addch;
  
  PROCEDURE addstr(VAR s: ARRAY OF CHAR);
  VAR i: CARDINAL;
  BEGIN
    i := 0;
    WHILE (i <= HIGH(s)) AND (s[i] <> 0C) DO
      addch(s[i]);
      INC(i);
    END;
  END addstr;
  
  PROCEDURE addspaces();
  BEGIN
    WHILE (strpos MOD 8) <> 0 DO
      addch(' ');
    END;
  END addspaces;
  
  PROCEDURE printhexchar(v: CARDINAL);
  BEGIN
    IF v <= 9 THEN
      addch(CHR(v + ORD('0')))
    ELSIF v <= 15 THEN
      addch(CHR(v + ORD('A') - 10));
    ELSE
      HALT;
    END;
  END printhexchar;
  
  PROCEDURE printquickval(v: CARDINAL);
  BEGIN
    IF v = 0 THEN
      printhexchar(8);
    ELSE
      printhexchar(v);
    END;
  END printquickval;
  
  PROCEDURE printsize();
  BEGIN
    CASE ((opcode DIV 64) MOD 4) OF
      0:
      addstr('.B');
      opsize := 0;
    | 1:
      addstr('.W');
      opsize := 1;
    | 2:
      addstr('.L');
      opsize := 2;
    | ELSE
      addstr('.?');
      opsize := 1;
    END;
  END printsize;

  PROCEDURE printsize2(); (* unused *)
  BEGIN
    CASE ((opcode DIV 64) MOD 4) OF
      0:
      addstr('.W');
      opsize := 1;
    | 1:
      addstr('.L');
      opsize := 2;
    | ELSE
      addstr('.?');
      opsize := 1;
    END;
  END printsize2;

  PROCEDURE printhexbyte(v: CARDINAL);
  BEGIN
    printhexchar((v DIV 16) MOD 16);
    printhexchar(v MOD 16);
    addch('H');
  END printhexbyte;
  
  PROCEDURE printhexword(v: CARDINAL);
  BEGIN
    printhexchar((v DIV 4096) MOD 16);
    printhexchar((v DIV 256) MOD 16);
    printhexchar((v DIV 16) MOD 16);
    printhexchar(v MOD 16);
  END printhexword;
  
  PROCEDURE printword(v: CARDINAL);
  VAR s: ARRAY[0..9] OF CHAR;
  BEGIN
    StrUtil.FormatCard(v, 1, s);
    addstr(s);
  END printword;
  
  PROCEDURE printsignedword(v: INTEGER);
  VAR s: ARRAY[0..9] OF CHAR;
  BEGIN
    IF v < 0 THEN
      addch('-');
      v := -v;
    END;
    StrUtil.FormatCard(v, 1, s);
    addstr(s);
  END printsignedword;
  
  PROCEDURE incpc();
  BEGIN
    INC(pc, 2);
    INC(numOpcodes, 1);
  END incpc;

  PROCEDURE fetchword(format: CARDINAL);
  BEGIN
    disp := pc^;
    CASE format OF
      0: printhexword(disp); addch('H');
    | 1: printword(disp);
    | 2: printsignedword(disp);
    | 3: printhexword(disp);
    END;
    incpc();
  END fetchword;
  
  PROCEDURE printtarget(offset: CARDINAL);
  VAR dest: LONGCARD;
  BEGIN
    dest := addr - LONGCARD(offset) + LONGCARD(numOpcodes * 2) + LONGCARD(disp);
    printhexword(CARDINAL(dest DIV 65536));
    printhexword(CARDINAL(dest MOD 65536));
    addch('H');
  END printtarget;
  
  PROCEDURE printaddrreg(v: CARDINAL);
  BEGIN
    addch('A');
    printhexchar(v);
  END printaddrreg;
  
  PROCEDURE printdatareg(v: CARDINAL);
  BEGIN
    addch('D');
    printhexchar(v);
  END printdatareg;
  
  PROCEDURE printeamode(mode: CARDINAL; reg: CARDINAL);
  BEGIN
    CASE mode MOD 8 OF
      0: (* Dn *)
      printdatareg(reg);
    | 1: (* An *)
      printaddrreg(reg);
    | 2: (* (An) *)
      addch('(');
      printaddrreg(reg);
      addch(')');
    | 3: (* (An)+ *)
      addch('(');
      printaddrreg(reg);
      addstr(')+');
    | 4: (* -(An) *)
      addstr('-(');
      printaddrreg(reg);
      addch(')');
    | 5: (* d16(An) *)
      fetchword(2);
      addch('(');
      printaddrreg(reg);
      addch(')');
    | 6: (* d8(An,Xn.s) *)
      disp := pc^ MOD 256;
      IF disp >= 128 THEN
        DEC(disp, 256);
      END;
      printsignedword(disp);
      addch('(');
      printaddrreg(reg);
      addch(',');
      IF SignedWord(pc^) >= 0 THEN
        addch('D');
      ELSE
        addch('A');
      END;
      printhexchar((pc^ DIV 4096) MOD 8);
      addch('.');
      IF ((pc^ DIV 2048) MOD 2) = 0 THEN
        addch('W');
      ELSE
        addch('L');
      END;
      addch(')');
      incpc();
    | 7:
      CASE reg MOD 8 OF
        0: (* abs.w *)
        fetchword(0);
      | 1: (* abs.l *)
        fetchword(3);
        fetchword(3);
        addch('H');
      | 2: (* d16(pc) *)
        addch('[');
        fetchword(2);
        addstr('(PC)] = ');
        printtarget(2);
      | 3: (* d8(pc,Xn) *)
        addch('[');
        disp := pc^ MOD 256;
        IF disp >= 128 THEN
          DEC(disp, 256);
        END;
        printsignedword(disp);
        addstr('(PC)] = ');
        printtarget(2);
        addch('(');
        IF SignedWord(pc^) >= 0 THEN
          addch('D');
        ELSE
          addch('A');
        END;
        printhexchar((pc^ DIV 4096) MOD 8);
        addch('.');
        IF ((pc^ DIV 2048) MOD 2) = 0 THEN
          addch('W');
        ELSE
          addch('L');
        END;
        addch(')');
        incpc();
      | 4: (* #imm *)
        addch('#');
        CASE opsize OF
          0:
          printhexbyte(pc^ MOD 256);
          incpc();
        | 1:
          fetchword(2);
        | 2:
          fetchword(3);
          fetchword(3);
          addch('H');
        | ELSE
          addstr('???');
        END;
      | ELSE
        addstr('???');
      END;
    END;
  END printeamode;

  PROCEDURE printea();
  BEGIN
    printeamode((opcode DIV 8) MOD 8, opcode MOD 8);
  END printea;
  
  PROCEDURE printdataorpredec();
  BEGIN
    IF ((opcode DIV 8) MOD 2) = 0 THEN
      printdatareg(opcode MOD 8);
      addch(',');
      printdatareg((opcode DIV 512) MOD 8);
    ELSE
      addstr('-(');
      printaddrreg(opcode MOD 8);
      addstr('),-(');
      printaddrreg((opcode DIV 512) MOD 8);
      addch(')');
    END;
  END printdataorpredec;
  
  PROCEDURE printcc();
  BEGIN
    CASE ((opcode DIV 256) MOD 16) OF
      0:
      addch('T');
    | 1:
      addch('F');
    | 2:
      addstr('HI');
    | 3:
      addstr('LS');
    | 4:
      addstr('CC');
    | 5:
      addstr('CS');
    | 6:
      addstr('NE');
    | 7:
      addstr('EQ');
    | 8:
      addstr('VC');
    | 9:
      addstr('VS');
    | 10:
      addstr('PL');
    | 11:
      addstr('MI');
    | 12:
      addstr('GE');
    | 13:
      addstr('LT');
    | 14:
      addstr('GT');
    | 15:
      addstr('LE');
    END;
  END printcc;
  
  PROCEDURE printshiftinst(opc: OpCode);
  BEGIN
    CASE opc MOD 4 OF
     0:
      addstr('AS');
    | 1:
      addstr('LS');
    | 2:
      addstr('ROX');
    | 3:
      addstr('RO');
    END;
    IF ((opcode DIV 256) MOD 2) = 0 THEN
      addch('R');
    ELSE
      addch('L');
    END;
  END printshiftinst;
  
  PROCEDURE printimmedinst(VAR s: ARRAY OF CHAR);
  BEGIN
    addstr(s);
    IF (opcode MOD 64) = 60 THEN
      addspaces();
      addch('#');
      IF ((opcode DIV 64) MOD 2) = 0 THEN
        printhexbyte(pc^ MOD 256);
        incpc();
        addstr(',CCR');
      ELSE
        fetchword(0);
        addstr(',SR');
      END;
    ELSE
      printsize();
      addspaces();
      addch('#');
      CASE ((opcode DIV 64) MOD 4) OF
        0:
        printhexbyte(pc^ MOD 256);
        incpc();
      | 1:
        fetchword(0);
      | 2:
        fetchword(3);
        fetchword(3);
        addch('H');
      | ELSE
        addstr('???');
      END;
      addch(',');
      printea();
    END;
  END printimmedinst;
  
  PROCEDURE printmoveinst(VAR s: ARRAY OF CHAR);
  BEGIN
    addstr(s);
    addspaces();
    printeamode((opcode DIV 8) MOD 8, opcode MOD 8);
    addch(',');
    printeamode((opcode DIV 64) MOD 8, (opcode DIV 512) MOD 8);
  END printmoveinst;
  
  PROCEDURE printmonadicinst(VAR s: ARRAY OF CHAR);
  BEGIN
    addstr(s);
    printsize();
    addspaces();
    printea();
  END printmonadicinst;

  PROCEDURE printdyadicinst(VAR s: ARRAY OF CHAR);
  BEGIN
    addstr(s);
    IF ((opcode DIV 64) MOD 4) = 3 THEN
      addstr('A.');
      IF ((opcode DIV 256) MOD 2) = 0 THEN
        opsize := 1;
        addch('W');
      ELSE
        opsize := 2;
        addch('L');
      END;
      addspaces();
      printea();
      addch(',');
      printaddrreg((opcode DIV 512) MOD 8);
    ELSE
      printsize();
      addspaces();
      IF ((opcode DIV 256) MOD 2) = 0 THEN
        printea();
        addch(',');
        printdatareg((opcode DIV 512) MOD 8);
      ELSE
        printdatareg((opcode DIV 512) MOD 8);
        addch(',');
        printea();
      END;
    END;
  END printdyadicinst;

  PROCEDURE group0();
  BEGIN
    IF ((opcode DIV 8) MOD 8) = 1 THEN
      IF ((opcode DIV 64) MOD 2) = 0 THEN
        addstr('MOVEP.W');
        opsize := 1;
      ELSE
        addstr('MOVEP.L');
        opsize := 2;
      END;
      addspaces();
      IF ((opcode DIV 128) MOD 2) = 0 THEN
        fetchword(2);
        addstr('(');
        printaddrreg(opcode MOD 8);
        addstr('),');
        printdatareg((opcode DIV 512) MOD 8);
      ELSE
        printdatareg((opcode DIV 512) MOD 8);
        addch(',');
        fetchword(2);
        addstr('(');
        printaddrreg(opcode MOD 8);
        addch(')');
      END;
    ELSE
      CASE ((opcode DIV 256) MOD 16) OF
        0:
        printimmedinst('ORI');
      | 2:
        printimmedinst('ANDI');
      | 4:
        printimmedinst('SUBI');
      | 6:
        printimmedinst('ADDI');
      | 8:
        CASE (opcode DIV 64) MOD 4 OF
          0:
          addstr('BTST');
        | 1:
          addstr('BCHG');
        | 2:
          addstr('BCLR');
        | 3:
          addstr('BSET');
        END;
        addspaces();
        addch('#');
        fetchword(1);
        addstr(',');
        IF ((opcode DIV 8) MOD 8) = 0 THEN
          opsize := 0;
        ELSE
          opsize := 2;
        END;
        printea();
      | 10:
        printimmedinst('EORI');
      | 12:
        printimmedinst('CMPI');
      | ELSE
        IF ((opcode DIV 256) MOD 2) = 1 THEN
          CASE ((opcode DIV 64) MOD 4) OF
            0:
            addstr('BTST');
          | 1:
            addstr('BCHG');
          | 2:
            addstr('BCLR');
          | 3:
            addstr('BSET');
          END;
          addspaces();
          printdatareg((opcode DIV 512) MOD 8);
          addch(',');
          IF ((opcode DIV 8) MOD 8) = 0 THEN
            opsize := 0;
          ELSE
            opsize := 2;
          END;
          printea();
        END;
      END;
    END;
  END group0;
    
  PROCEDURE group4();
  VAR reglist: OpCode;
  BEGIN
    CASE (opcode DIV 256) MOD 16 OF
      0:
      IF ((opcode DIV 64) MOD 4) = 3 THEN
        addstr('MOVE');
        opsize := 1;
        addspaces();
        addstr('SR,');
        printea();
      ELSE
        printmonadicinst('NEGX');
      END;
    | 2:
      printmonadicinst('CLR');
    | 4:
      IF ((opcode DIV 64) MOD 4) = 3 THEN
        addstr('MOVE');
        opsize := 0;
        addspaces();
        printea();
        addstr(',CCR');
      ELSE
        printmonadicinst('NEG');
      END;
    | 6:
      IF ((opcode DIV 64) MOD 4) = 3 THEN
        addstr('MOVE');
        opsize := 1;
        addspaces();
        printea();
        addstr(',SR');
      ELSE
        printmonadicinst('NOT');
      END;
    | 8:
      subcode := (opcode DIV 8) MOD 32;
      IF subcode = 24 THEN
        addstr('EXT.L');
        addspaces();
        printdatareg(opcode MOD 8);
      ELSIF subcode = 16 THEN
        addstr('EXT.W');
        addspaces();
        printdatareg(opcode MOD 8);
      ELSIF subcode = 8 THEN
        addstr('SWAP');
        addspaces();
        printdatareg(opcode MOD 8);
      ELSE
        CASE ((opcode DIV 64) MOD 4) OF
          0:
          addstr('NBCD');
          opsize := 0;
          addspaces();
        | 1:
          addstr('PEA');
          opsize := 2;
          addspaces();
        | 2:
          addstr('MOVEM.W');
          opsize := 1;
          addspaces();
          (* FIXME: decode register list instead of writing constant *)
          addch('#');
          fetchword(0);
          addstr(',');
        | 3:
          addstr('MOVEM.L');
          opsize := 2;
          addspaces();
          (* FIXME: decode register list instead of writing constant *)
          addch('#');
          fetchword(0);
          addstr(',');
        END;
        printea();
      END;
    | 10:
      IF ((opcode DIV 64) MOD 4) = 3 THEN
        addstr('TAS');
        opsize := 0;
        addspaces();
        printea();
      ELSE
        addstr('TST');
        printsize();
        addspaces();
        printea();
      END;
    | 12:
      CASE ((opcode DIV 64) MOD 4) OF
        0, 1:
        addstr('ILLEGAL');
      | 2:
        addstr('MOVEM.W');
        opsize := 1;
        addspaces();
        reglist := pc^;
        incpc;
        printea();
        (* FIXME: decode register list instead of writing constant *)
        addstr(',#');
        printhexword(reglist);
        addch('H');
      | 3:
        addstr('MOVEM.L');
        opsize := 2;
        addspaces();
        reglist := pc^;
        incpc;
        printea();
        (* FIXME: decode register list instead of writing constant *)
        addstr(',#');
        printhexword(reglist);
        addch('H');
      END;
    | 14:
      subcode := opcode MOD 256;
      IF (subcode >= 64) AND (subcode <= 79) THEN
        addstr('TRAP');
        addspaces();
        addch('#');
        printword(opcode MOD 16);
      ELSIF (subcode >= 80) AND (subcode <= 87) THEN
        addstr('LINK');
        addspaces();
        printaddrreg(opcode MOD 8);
        addstr(',#');
        fetchword(2);
      ELSIF (subcode >= 88) AND (subcode <= 95) THEN
        addstr('UNLK');
        addspaces();
        printaddrreg(opcode MOD 8);
      ELSIF (subcode >= 96) AND (subcode <= 103) THEN
        addstr('MOVE');
        addspaces();
        printaddrreg(opcode MOD 8);
        addstr(',USP');
      ELSIF (subcode >= 104) AND (subcode <= 111) THEN
        addstr('MOVE');
        addspaces();
        addstr('USP,');
        printaddrreg(opcode MOD 8);
      ELSIF (subcode = 112) THEN
        addstr('RESET');
      ELSIF (subcode = 113) THEN
        addstr('NOP');
      ELSIF (subcode = 114) THEN
        addstr('STOP');
      ELSIF (subcode = 115) THEN
        addstr('RTE');
      ELSIF (subcode = 117) THEN
        addstr('RTS');
      ELSIF (subcode = 118) THEN
        addstr('TRAPV');
      ELSIF (subcode = 119) THEN
        addstr('RTR');
      ELSIF (subcode >= 128) AND (subcode <= 191) THEN
        addstr('JSR');
        addspaces();
        printea();
      ELSIF (subcode >= 192) AND (subcode <= 255) THEN
        addstr('JMP');
        addspaces();
        printea();
      ELSE
        addstr('ILLEGAL');
      END;
    | ELSE
      subcode := (opcode DIV 64) MOD 4;
      IF subcode = 2 THEN
        addstr('CHK');
        opsize := 1;
        addspaces();
        printea();
        addch(',');
        printdatareg((opcode DIV 512) MOD 8);
      ELSIF subcode = 3 THEN
        addstr('LEA');
        opsize := 2;
        addspaces();
        printea();
        addch(',');
        printaddrreg((opcode DIV 512) MOD 8);
      ELSE
        addstr('ILLEGAL');
      END;
    END;
  END group4;
  
BEGIN (* disasm *)
  strpos := 0;
  opcode := pc^;
  incpc();
  numOpcodes := 1;
  opsize := 4;
  CASE ((opcode DIV 4096) MOD 16) OF
    0:
    group0();
  
  | 1:
    opsize := 0;
    printmoveinst('MOVE.B');
  
  | 2:
    opsize := 2;
    printmoveinst('MOVE.L');
  
  | 3:
    opsize := 1;
    printmoveinst('MOVE.W');
  
  | 4:
    group4();
  
  | 5:
    CASE ((opcode DIV 64) MOD 8) OF
      0, 1, 2:
      addstr('ADDQ');
      printsize();
      addspaces();
      addch('#');
      printquickval((opcode DIV 512) MOD 8);
      addch(',');
      printea();
    | 3, 7:
      IF ((opcode DIV 8) MOD 8) = 1 THEN
        addstr('DB');
        IF ((opcode DIV 256) MOD 16) = 1 THEN
          addstr('RA');
        ELSE
          printcc();
        END;
        addspaces();
        printdatareg(opcode MOD 8);
        addch(',');
        addch('[');
        fetchword(0);
        addstr('] = ');
        printtarget(2);
      ELSE
        addch('S');
        opsize := 0;
        printcc();
        addspaces();
        printea();
      END;
    | 4, 5, 6:
      addstr('SUBQ');
      printsize();
      addspaces();
      addch('#');
      printquickval((opcode DIV 512) MOD 8);
      addch(',');
      printea();
    END;
  
  | 6:
    addch('B');
    IF ((opcode DIV 256) MOD 16) = 0 THEN
      addstr('RA')
    ELSIF ((opcode DIV 256) MOD 16) = 1 THEN
      addstr('SR')
    ELSE
      printcc();
    END;
    addspaces();
    IF (opcode MOD 256) <> 0 THEN
      addch('[');
      printhexbyte(opcode MOD 256);
      addstr('] = ');
      disp := opcode MOD 256;
      IF disp >= 128 THEN
        DEC(disp, 256);
      END;
      printtarget(0);
    ELSE
      addch('[');
      fetchword(0);
      addstr('] = ');
      printtarget(2);
    END;
  
  | 7:
    IF ((opcode DIV 256) MOD 2) = 1 THEN
      addstr('ILLEGAL');
    ELSE
      addstr('MOVEQ');
      addspaces();
      addch('#');
      printhexbyte(opcode MOD 256);
      addch(',');
      printdatareg((opcode DIV 512) MOD 8);
    END;
  
  | 8:
    IF ((opcode DIV 16) MOD 32) = 16 THEN
      addstr('SBCD'); (* BUG: was SBCB *)
      addspaces();
      printdataorpredec();
    ELSE
      CASE ((opcode DIV 64) MOD 8) OF
        0, 1, 2, 4, 5, 6:
        printdyadicinst('OR');
      | 3:
        addstr('DIVU');
        opsize := 1;
        addspaces();
        printea();
        addch(',');
        printdatareg((opcode DIV 512) MOD 8);
      | 7:
        addstr('DIVS');
        opsize := 1;
        addspaces();
        printea();
        addch(',');
        printdatareg((opcode DIV 512) MOD 8);
      END;
    END;
  
  | 9:
    IF (((opcode DIV 256) MOD 2) = 1) AND (((opcode DIV 16) MOD 4) = 0) AND (((opcode DIV 64) MOD 4) <> 3) THEN
      addstr('SUBX');
      printsize();
      addspaces();
      printdataorpredec();
    ELSE
      printdyadicinst('SUB');
    END;
  
  | 11:
    IF (((opcode DIV 256) MOD 2) = 1) AND (((opcode DIV 64) MOD 4) <> 3) THEN
      IF ((opcode DIV 8) MOD 8) = 1 THEN
        addstr('CMPM');
        printsize();
        addspaces();
        addch('(');
        printaddrreg(opcode MOD 8);
        addstr(')+,(');
        printaddrreg((opcode DIV 512) MOD 8);
        addstr(')+');
      ELSE
        printdyadicinst('EOR');
      END;
    ELSE
      printdyadicinst('CMP');
    END;
  
  | 12:
    subcode := (opcode DIV 8) MOD 64;
    IF subcode = 40 THEN
      addstr('EXG');
      addspaces();
      printdatareg((opcode DIV 512) MOD 8);
      addch(',');
      printdatareg(opcode MOD 8);
    ELSIF subcode = 41 THEN
      addstr('EXG');
      addspaces();
      printaddrreg((opcode DIV 512) MOD 8);
      addch(',');
      printaddrreg(opcode MOD 8);
    ELSIF subcode = 49 THEN
      addstr('EXG');
      addspaces();
      printdatareg((opcode DIV 512) MOD 8);
      addch(',');
      printaddrreg(opcode MOD 8);
    ELSIF (subcode DIV 2) = 16 THEN
      addstr('ABCD');
      addspaces();
      printdataorpredec
    ELSIF (subcode DIV 8) = 7 THEN
      addstr('MULS');
      opsize := 1;
      addspaces();
      printea();
      addch(',');
      printdatareg((opcode DIV 512) MOD 8);
    ELSIF (subcode DIV 8) = 3 THEN
      addstr('MULU');
      opsize := 1;
      addspaces();
      printea();
      addch(',');
      printdatareg((opcode DIV 512) MOD 8);
    ELSE
      printdyadicinst('AND');
    END;
  
  | 13:
    IF (((opcode DIV 256) MOD 2) = 1) AND (((opcode DIV 16) MOD 4) = 0) AND (((opcode DIV 64) MOD 4) <> 3) THEN
      addstr('ADDX');
      printsize();
      addspaces();
      printdataorpredec();
    ELSE
      printdyadicinst('ADD');
    END;
  
  | 14:
    IF ((opcode DIV 64) MOD 4) = 3 THEN
      printshiftinst((opcode DIV 512) MOD 4);
      addstr('.W');
      opsize := 1;
      addspaces();
      printea();
    ELSE
      printshiftinst((opcode DIV 8) MOD 4);
      printsize();
      addspaces();
      IF ((opcode DIV 32) MOD 2) = 0 THEN
        addch('#');
        printquickval((opcode DIV 512) MOD 8);
      ELSE
        printdatareg((opcode DIV 512) MOD 8);
      END;
      addch(',');
      printdatareg(opcode MOD 8);
    END;
  
  | ELSE
    addstr('ILLEGAL');
  END;
  
  addch(0C);
END disasm;


END disasm.
