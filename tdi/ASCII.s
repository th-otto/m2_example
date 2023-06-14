link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  ASCII, key =  2102H  F1D7H  2718H  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 42
PROCEDURE CharIsPrintable(CHAR) : BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        0C2E 0020 0008           CMPI.B  #20H,0008(A6)
     AH        6516                     BCS     [16H] = 00000022H
     CH        0C2E 007E 0008           CMPI.B  #7EH,0008(A6)
    12H        620E                     BHI     [0EH] = 00000022H
    14H        1D7C 0001 000A           MOVE.B  #01H,000A(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
    1EH        4EFA 000A                JMP     [000AH] = 0000002AH
    22H        422E 000A                CLR.B   000A(A6)
    26H        4E5E                     UNLK    A6
    28H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 48
PROCEDURE CharIsControl(CHAR) : BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A2E 0008                TST.B   0008(A6)
     8H        6508                     BCS     [08H] = 00000012H
     AH        0C2E 001F 0008           CMPI.B  #1FH,0008(A6)
    10H        6308                     BLS     [08H] = 0000001AH
    12H        0C2E 007F 0008           CMPI.B  #7FH,0008(A6)
    18H        660E                     BNE     [0EH] = 00000028H
    1AH        1D7C 0001 000A           MOVE.B  #01H,000A(A6)
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
    24H        4EFA 000A                JMP     [000AH] = 00000030H
    28H        422E 000A                CLR.B   000A(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 58
PROCEDURE CharIsASCII(CHAR) : BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        558F                     SUBQ.L  #2,A7
     6H        1F2E 0008                MOVE.B  0008(A6),-(A7)
     AH        6100 0000                BSR     CharIsPrintable
     EH        548F                     ADDQ.L  #2,A7
    10H        4A1F                     TST.B   (A7)+
    12H        6610                     BNE     [10H] = 00000024H
    14H        558F                     SUBQ.L  #2,A7
    16H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    1AH        6100 0000                BSR     CharIsControl
    1EH        548F                     ADDQ.L  #2,A7
    20H        4A1F                     TST.B   (A7)+
    22H        670E                     BEQ     [0EH] = 00000032H
    24H        1D7C 0001 000A           MOVE.B  #01H,000A(A6)
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
    2EH        4EFA 000A                JMP     [000AH] = 0000003AH
    32H        422E 000A                CLR.B   000A(A6)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum =  1  checksum: o.k.

ref own quick call at    1CH, procnum =  2  checksum: o.k.

scmod end  checksum: o.k.
