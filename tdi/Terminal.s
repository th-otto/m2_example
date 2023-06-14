link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Terminal, key =  2102H  F1D6H  424CH  checksum: o.k.

import TermBase, key =  2102H  F1DAH  5250H, modnum =  2  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 30
PROCEDURE Read(VAR ch: CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4854                     PEA     (A4)
     AH        6100 0000                BSR     Terminal.BusyRead
     EH        588F                     ADDQ.L  #4,A7
    10H        286E 0008                MOVE.L  0008(A6),A4
    14H        4A14                     TST.B   (A4)
    16H        6602                     BNE     [02H] = 0000001AH
    18H        60EA                     BRA     [EAH] = 00000004H
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 86
PROCEDURE BusyRead(VAR ch: CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A39 0000 0002           TST.B   00000002H
     AH        6714                     BEQ     [14H] = 00000020H
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        18B9 0000 0001           MOVE.B  00000001H,(A4)
    16H        4239 0000 0002           CLR.B   00000002H
    1CH        4EFA 0034                JMP     [0034H] = 00000052H
    20H        558F                     SUBQ.L  #2,A7
    22H        2879 0000 0008           MOVE.L  TermBase.DoStatus,A4
    28H        4E94                     JSR     (A4)
    2AH        4A1F                     TST.B   (A7)+
    2CH        6714                     BEQ     [14H] = 00000042H
    2EH        286E 0008                MOVE.L  0008(A6),A4
    32H        4854                     PEA     (A4)
    34H        2879 0000 0000           MOVE.L  TermBase.DoRead,A4
    3AH        4E94                     JSR     (A4)
    3CH        588F                     ADDQ.L  #4,A7
    3EH        4EFA 0008                JMP     [0008H] = 00000048H
    42H        286E 0008                MOVE.L  0008(A6),A4
    46H        4214                     CLR.B   (A4)
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        13D4 0000 0001           MOVE.B  (A4),00000001H
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref ext data at    24H, modnum =  2  checksum: o.k.

ref ext data at    36H, modnum =  2  checksum: o.k.

ref own data at    4EH  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 16
PROCEDURE ReadAgain();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        13FC 0001 0000 0002      MOVE.B  #01H,00000002H
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 22
PROCEDURE Write(ch: CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        1F2E 0008                MOVE.B  0008(A6),-(A7)
     8H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
     EH        4E94                     JSR     (A4)
    10H        548F                     ADDQ.L  #2,A7
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

ref ext data at     AH, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 36
PROCEDURE WriteLn();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        1F3C 000D                MOVE.B  #0DH,-(A7)
     8H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
     EH        4E94                     JSR     (A4)
    10H        548F                     ADDQ.L  #2,A7
    12H        1F3C 000A                MOVE.B  #0AH,-(A7)
    16H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    1CH        4E94                     JSR     (A4)
    1EH        548F                     ADDQ.L  #2,A7
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
  checksum: o.k.

ref ext data at     AH, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 60
PROCEDURE WriteString(VAR str: ARRAY OF CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        6226                     BHI     [26H] = 00000038H
    12H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4A34 5000                TST.B   00H(A4,D5.W)
    1EH        6718                     BEQ     [18H] = 00000038H
    20H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    24H        286E 0008                MOVE.L  0008(A6),A4
    28H        1F34 5000                MOVE.B  00H(A4,D5.W),-(A7)
    2CH        6100 0000                BSR     [0000H] = 0000002EH
    30H        548F                     ADDQ.L  #2,A7
    32H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    36H        60D0                     BRA     [D0H] = 00000008H
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    2EH, procnum =  4  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 232
PROCEDURE ReadString(VAR str: ARRAY OF CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        6202                     BHI     [02H] = 00000014H
    12H        6004                     BRA     [04H] = 00000018H
    14H        4EFA 00CE                JMP     [00CEH] = 000000E4H
    18H        4879 0000 0000           PEA     00000000H
    1EH        6100 0000                BSR     [0000H] = 00000020H
    22H        588F                     ADDQ.L  #4,A7
    24H        0C39 0020 0000 0000      CMPI.B  #20H,00000000H
    2CH        6606                     BNE     [06H] = 00000034H
    2EH        4A6E FFFE                TST.W   FFFE(A6)
    32H        6302                     BLS     [02H] = 00000036H
    34H        6004                     BRA     [04H] = 0000003AH
    36H        4EFA 00A8                JMP     [00A8H] = 000000E0H
    3AH        0C39 007F 0000 0000      CMPI.B  #7FH,00000000H
    42H        670A                     BEQ     [0AH] = 0000004EH
    44H        0C39 0008 0000 0000      CMPI.B  #08H,00000000H
    4CH        6654                     BNE     [54H] = 000000A2H
    4EH        4A6E FFFE                TST.W   FFFE(A6)
    52H        634A                     BLS     [4AH] = 0000009EH
    54H        1F3C 001B                MOVE.B  #1BH,-(A7)
    58H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    5EH        4E94                     JSR     (A4)
    60H        548F                     ADDQ.L  #2,A7
    62H        1F3C 0044                MOVE.B  #44H,-(A7)
    66H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    6CH        4E94                     JSR     (A4)
    6EH        548F                     ADDQ.L  #2,A7
    70H        1F3C 0020                MOVE.B  #20H,-(A7)
    74H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    7AH        4E94                     JSR     (A4)
    7CH        548F                     ADDQ.L  #2,A7
    7EH        1F3C 001B                MOVE.B  #1BH,-(A7)
    82H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    88H        4E94                     JSR     (A4)
    8AH        548F                     ADDQ.L  #2,A7
    8CH        1F3C 0044                MOVE.B  #44H,-(A7)
    90H        2879 0000 0004           MOVE.L  TermBase.DoWrite,A4
    96H        4E94                     JSR     (A4)
    98H        548F                     ADDQ.L  #2,A7
    9AH        536E FFFE                SUBQ.W  #1,FFFE(A6)
    9EH        4EFA 0040                JMP     [0040H] = 000000E0H
    A2H        0C39 0020 0000 0000      CMPI.B  #20H,00000000H
    AAH        6214                     BHI     [14H] = 000000C0H
    ACH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    B0H        286E 0008                MOVE.L  0008(A6),A4
    B4H        4234 5000                CLR.B   00H(A4,D5.W)
    B8H        4E5E                     UNLK    A6
    BAH        4E75                     RTS
    BCH        4EFA 0022                JMP     [0022H] = 000000E0H
    C0H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    C4H        286E 0008                MOVE.L  0008(A6),A4
    C8H        19B9 0000 0000 5000      MOVE.B  00000000H,00H(A4,D5.W)
    D0H        1F39 0000 0000           MOVE.B  00000000H,-(A7)
    D6H        6100 0000                BSR     [0000H] = 000000D8H
    DAH        548F                     ADDQ.L  #2,A7
    DCH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    E0H        6000 FF26                BRA     [FF26H] = 00000008H
    E4H        4E5E                     UNLK    A6
    E6H        4E75                     RTS
  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own quick call at    20H, procnum =  1  checksum: o.k.

ref own data at    28H  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref ext data at    5AH, modnum =  2  checksum: o.k.

ref ext data at    68H, modnum =  2  checksum: o.k.

ref ext data at    76H, modnum =  2  checksum: o.k.

ref ext data at    84H, modnum =  2  checksum: o.k.

ref ext data at    92H, modnum =  2  checksum: o.k.

ref own data at    A6H  checksum: o.k.

ref own data at    CAH  checksum: o.k.

ref own data at    D2H  checksum: o.k.

ref own quick call at    D8H, procnum =  4  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        4239 0000 0002           CLR.B   00000002H
    10H        4E5E                     UNLK    A6
    12H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref ext init call at    12H  checksum: o.k.

scmod end  checksum: o.k.
