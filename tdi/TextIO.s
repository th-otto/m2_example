link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  TextIO, key =  2102H  F1DEH  6CD9H  checksum: o.k.

import Streams, key =  2102H  F1DBH  1317H, modnum =  1  checksum: o.k.

import M2Conversions, key =  2102H  F1E8H  393EH, modnum =  3  checksum: o.k.

import Strings, key =  2102H  F1D3H  5C23H, modnum =  4  checksum: o.k.

data size, number of bytes = 130  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 38
PROCEDURE WRite(Stream; CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        5C8F                     ADDQ.L  #6,A7
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1CH, procnum =  3, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 26
PROCEDURE Write(CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        1F2E 0008                MOVE.B  0008(A6),-(A7)
     EH        4EB9 0000 0000           JSR     00000000H
    14H        5C8F                     ADDQ.L  #6,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref ext proc call at    10H, procnum =  3, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 50
PROCEDURE WRiteLn(Stream);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        1F3C 000D                MOVE.B  #0DH,-(A7)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        5C8F                     ADDQ.L  #6,A7
    20H        486E FFF6                PEA     FFF6(A6)
    24H        1F3C 000A                MOVE.B  #0AH,-(A7)
    28H        6100 0000                BSR     [0000H] = 0000002AH
    2CH        5C8F                     ADDQ.L  #6,A7
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum =  1  checksum: o.k.

ref own quick call at    2AH, procnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 20
PROCEDURE WriteLn();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        588F                     ADDQ.L  #4,A7
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at     CH, procnum =  3  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 104
PROCEDURE WRiteString(Stream; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        426E FFF4                CLR.W   FFF4(A6)
    16H        3A2E 000C                MOVE.W  000C(A6),D5
    1AH        3F05                     MOVE.W  D5,-(A7)
    1CH        302E FFF4                MOVE.W  FFF4(A6),D0
    20H        B057                     CMP.W   (A7),D0
    22H        6304                     BLS     [04H] = 00000028H
    24H        4EFA 003C                JMP     [003CH] = 00000062H
    28H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        4A34 5000                TST.B   00H(A4,D5.W)
    34H        6608                     BNE     [08H] = 0000003EH
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
    3AH        4EFA 0018                JMP     [0018H] = 00000054H
    3EH        486E FFF6                PEA     FFF6(A6)
    42H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    46H        286E 0008                MOVE.L  0008(A6),A4
    4AH        1F34 5000                MOVE.B  00H(A4,D5.W),-(A7)
    4EH        6100 0000                BSR     [0000H] = 00000050H
    52H        5C8F                     ADDQ.L  #6,A7
    54H        302E FFF4                MOVE.W  FFF4(A6),D0
    58H        B057                     CMP.W   (A7),D0
    5AH        6406                     BCC     [06H] = 00000062H
    5CH        526E FFF4                ADDQ.W  #1,FFF4(A6)
    60H        60C6                     BRA     [C6H] = 00000028H
    62H        548F                     ADDQ.L  #2,A7
    64H        4E5E                     UNLK    A6
    66H        4E75                     RTS
  checksum: o.k.

ref own quick call at    50H, procnum =  1  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 32
PROCEDURE WriteString(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
     EH        286E 0008                MOVE.L  0008(A6),A4
    12H        4854                     PEA     (A4)
    14H        6100 0000                BSR     [0000H] = 00000016H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    16H, procnum =  5  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteCard(Stream; CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  1, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 28
PROCEDURE WriteCard(CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum =  7  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteInt(Stream; INTEGER; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 28
PROCEDURE WriteInt(INTEGER; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum =  9  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 76
PROCEDURE WRiteReal(Stream; REAL; CARDINAL; INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 0010                MOVE.L  0010(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    16H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1AH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1EH        3F3C 0064                MOVE.W  #0064H,-(A7)
    22H        4879 0000 0018           PEA     00000018H
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000E                LEA     000E(A7),A7
    32H        486E FFF6                PEA     FFF6(A6)
    36H        3F3C 0064                MOVE.W  #0064H,-(A7)
    3AH        4879 0000 0018           PEA     00000018H
    40H        6100 0000                BSR     [0000H] = 00000042H
    44H        4FEF 000A                LEA     000A(A7),A7
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext proc call at    2AH, procnum =  3, modnum =  3  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own quick call at    42H, procnum =  5  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 34
PROCEDURE WriteReal(REAL; CARDINAL; INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        2F2E 000C                MOVE.L  000C(A6),-(A7)
     EH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    12H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        4FEF 000C                LEA     000C(A7),A7
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    18H, procnum = 11  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteOct(Stream; CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  4, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 28
PROCEDURE WriteOct(CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum = 13  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteHex(Stream; CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 28
PROCEDURE WriteHex(CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum = 15  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteAdr(Stream; ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000C                LEA     000C(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  6, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 30
PROCEDURE WriteAdr(ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        2F2E 000A                MOVE.L  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        4FEF 000A                LEA     000A(A7),A7
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum = 17  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteOctAdr(Stream; ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000C                LEA     000C(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  7, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 30
PROCEDURE WriteOctAdr(ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        2F2E 000A                MOVE.L  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        4FEF 000A                LEA     000A(A7),A7
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum = 19  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 72
PROCEDURE WRiteHexAdr(Stream; ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    16H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    1AH        3F3C 0064                MOVE.W  #0064H,-(A7)
    1EH        4879 0000 0018           PEA     00000018H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000C                LEA     000C(A7),A7
    2EH        486E FFF6                PEA     FFF6(A6)
    32H        3F3C 0064                MOVE.W  #0064H,-(A7)
    36H        4879 0000 0018           PEA     00000018H
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    26H, procnum =  8, modnum =  3  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own quick call at    3EH, procnum =  5  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 30
PROCEDURE WriteHexAdr(ADDRESS; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 000A           PEA     0000000AH
     AH        2F2E 000A                MOVE.L  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        4FEF 000A                LEA     000A(A7),A7
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    14H, procnum = 21  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 152
PROCEDURE REad(Stream; VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        4A2E FFF7                TST.B   FFF7(A6)
    16H        6710                     BEQ     [10H] = 00000028H
    18H        286E 0008                MOVE.L  0008(A6),A4
    1CH        18AE FFF6                MOVE.B  FFF6(A6),(A4)
    20H        422E FFF7                CLR.B   FFF7(A6)
    24H        4EFA 006E                JMP     [006EH] = 00000094H
    28H        558F                     SUBQ.L  #2,A7
    2AH        486E FFF6                PEA     FFF6(A6)
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        588F                     ADDQ.L  #4,A7
    36H        4A1F                     TST.B   (A7)+
    38H        670A                     BEQ     [0AH] = 00000044H
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        4214                     CLR.B   (A4)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
    44H        486E FFF6                PEA     FFF6(A6)
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        4854                     PEA     (A4)
    4EH        4EB9 0000 0000           JSR     00000000H
    54H        508F                     ADDQ.L  #8,A7
    56H        4A79 0000 0016           TST.W   00000016H
    5CH        662E                     BNE     [2EH] = 0000008CH
    5EH        286E 0008                MOVE.L  0008(A6),A4
    62H        4A14                     TST.B   (A4)
    64H        6626                     BNE     [26H] = 0000008CH
    66H        558F                     SUBQ.L  #2,A7
    68H        486E FFF6                PEA     FFF6(A6)
    6CH        4EB9 0000 0000           JSR     00000000H
    72H        588F                     ADDQ.L  #4,A7
    74H        4A1F                     TST.B   (A7)+
    76H        6614                     BNE     [14H] = 0000008CH
    78H        486E FFF6                PEA     FFF6(A6)
    7CH        286E 0008                MOVE.L  0008(A6),A4
    80H        4854                     PEA     (A4)
    82H        4EB9 0000 0000           JSR     00000000H
    88H        508F                     ADDQ.L  #8,A7
    8AH        60D2                     BRA     [D2H] = 0000005EH
    8CH        286E 0008                MOVE.L  0008(A6),A4
    90H        1D54 FFF6                MOVE.B  (A4),FFF6(A6)
    94H        4E5E                     UNLK    A6
    96H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    30H, procnum = 17, modnum =  1  checksum: o.k.

ref ext proc call at    50H, procnum =  9, modnum =  1  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref ext proc call at    6EH, procnum = 17, modnum =  1  checksum: o.k.

ref ext proc call at    84H, procnum =  9, modnum =  1  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 26
PROCEDURE Read(VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 23  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 66
PROCEDURE REadCap(Stream; VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4854                     PEA     (A4)
    1CH        6100 0000                BSR     [0000H] = 0000001EH
    20H        508F                     ADDQ.L  #8,A7
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        1A14                     MOVE.B  (A4),D5
    28H        0C05 0061                CMPI.B  #61H,D5
    2CH        650A                     BCS     [0AH] = 00000038H
    2EH        0C05 007A                CMPI.B  #7AH,D5
    32H        6204                     BHI     [04H] = 00000038H
    34H        0205 005F                ANDI.B  #5FH,D5
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        1885                     MOVE.B  D5,(A4)
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1EH, procnum = 23  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadCap(VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 25  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 28
PROCEDURE REadAgain(Stream);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        1D7C 0001 FFF7           MOVE.B  #01H,FFF7(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 16
PROCEDURE ReadAgain();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        13FC 0001 0000 0001      MOVE.B  #01H,00000001H
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 46
PROCEDURE REadLn(Stream);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        486E FFF5                PEA     FFF5(A6)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        508F                     ADDQ.L  #8,A7
    20H        0C2E 000D FFF5           CMPI.B  #0DH,FFF5(A6)
    26H        6702                     BEQ     [02H] = 0000002AH
    28H        60E8                     BRA     [E8H] = 00000012H
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum = 23  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 20
PROCEDURE ReadLn();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        588F                     ADDQ.L  #4,A7
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at     CH, procnum = 29  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 158
PROCEDURE REadString(Stream; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        426E FFF4                CLR.W   FFF4(A6)
    16H        3A2E 000C                MOVE.W  000C(A6),D5
    1AH        3F05                     MOVE.W  D5,-(A7)
    1CH        302E FFF4                MOVE.W  FFF4(A6),D0
    20H        B057                     CMP.W   (A7),D0
    22H        6304                     BLS     [04H] = 00000028H
    24H        4EFA 0072                JMP     [0072H] = 00000098H
    28H        486E FFF6                PEA     FFF6(A6)
    2CH        486E FFF3                PEA     FFF3(A6)
    30H        6100 0000                BSR     [0000H] = 00000032H
    34H        508F                     ADDQ.L  #8,A7
    36H        0C2E 000D FFF3           CMPI.B  #0DH,FFF3(A6)
    3CH        663E                     BNE     [3EH] = 0000007CH
    3EH        3A2E FFF4                MOVE.W  FFF4(A6),D5
    42H        286E 0008                MOVE.L  0008(A6),A4
    46H        4234 5000                CLR.B   00H(A4,D5.W)
    4AH        4A2E FFFE                TST.B   FFFE(A6)
    4EH        6604                     BNE     [04H] = 00000054H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
    54H        486E FFF6                PEA     FFF6(A6)
    58H        486E FFF3                PEA     FFF3(A6)
    5CH        6100 0000                BSR     [0000H] = 0000005EH
    60H        508F                     ADDQ.L  #8,A7
    62H        0C2E 000A FFF3           CMPI.B  #0AH,FFF3(A6)
    68H        670A                     BEQ     [0AH] = 00000074H
    6AH        486E FFF6                PEA     FFF6(A6)
    6EH        6100 0000                BSR     [0000H] = 00000070H
    72H        588F                     ADDQ.L  #4,A7
    74H        4E5E                     UNLK    A6
    76H        4E75                     RTS
    78H        4EFA 0010                JMP     [0010H] = 0000008AH
    7CH        3A2E FFF4                MOVE.W  FFF4(A6),D5
    80H        286E 0008                MOVE.L  0008(A6),A4
    84H        19AE FFF3 5000           MOVE.B  FFF3(A6),00H(A4,D5.W)
    8AH        302E FFF4                MOVE.W  FFF4(A6),D0
    8EH        B057                     CMP.W   (A7),D0
    90H        6406                     BCC     [06H] = 00000098H
    92H        526E FFF4                ADDQ.W  #1,FFF4(A6)
    96H        6090                     BRA     [90H] = 00000028H
    98H        548F                     ADDQ.L  #2,A7
    9AH        4E5E                     UNLK    A6
    9CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    32H, procnum = 23  checksum: o.k.

ref own quick call at    5EH, procnum = 23  checksum: o.k.

ref own quick call at    70H, procnum = 27  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 32
PROCEDURE ReadString(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
     EH        286E 0008                MOVE.L  0008(A6),A4
    12H        4854                     PEA     (A4)
    14H        6100 0000                BSR     [0000H] = 00000016H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    16H, procnum = 31  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 116
PROCEDURE REadCard(Stream; VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 0007                MOVE.W  #0007H,-(A7)
    58H        4879 0000 0000           PEA     00000000H
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum =  9, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 34, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadCard(VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 33  checksum: o.k.

proc code, procnum = 35, entrypoint =     0H, number of bytes = 116
PROCEDURE REadInt(Stream; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 000A                MOVE.W  #000AH,-(A7)
    58H        4879 0000 000A           PEA     0000000AH
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum = 10, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 36, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadInt(VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 35  checksum: o.k.

proc code, procnum = 37, entrypoint =     0H, number of bytes = 116
PROCEDURE REadReal(Stream; VAR REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 0007                MOVE.W  #0007H,-(A7)
    58H        4879 0000 0016           PEA     00000016H
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum = 11, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 38, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadReal(VAR REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 37  checksum: o.k.

proc code, procnum = 39, entrypoint =     0H, number of bytes = 116
PROCEDURE REadOct(Stream; VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 0006                MOVE.W  #0006H,-(A7)
    58H        4879 0000 0020           PEA     00000020H
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum = 12, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 40, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadOct(VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 39  checksum: o.k.

proc code, procnum = 41, entrypoint =     0H, number of bytes = 116
PROCEDURE REadHex(Stream; VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 0006                MOVE.W  #0006H,-(A7)
    58H        4879 0000 0028           PEA     00000028H
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum = 13, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 42, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadHex(VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 41  checksum: o.k.

proc code, procnum = 43, entrypoint =     0H, number of bytes = 122
PROCEDURE REadWord(Stream; VAR WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        486E FFF4                PEA     FFF4(A6)
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        4FEF 000E                LEA     000E(A7),A7
    46H        4A39 0000 007D           TST.B   0000007DH
    4CH        6616                     BNE     [16H] = 00000064H
    4EH        486E FFF6                PEA     FFF6(A6)
    52H        3F3C 0007                MOVE.W  #0007H,-(A7)
    56H        4879 0000 0030           PEA     00000030H
    5CH        6100 0000                BSR     [0000H] = 0000005EH
    60H        4FEF 000A                LEA     000A(A7),A7
    64H        4A39 0000 007D           TST.B   0000007DH
    6AH        6602                     BNE     [02H] = 0000006EH
    6CH        60A4                     BRA     [A4H] = 00000012H
    6EH        286E 0008                MOVE.L  0008(A6),A4
    72H        38AE FFF4                MOVE.W  FFF4(A6),(A4)
    76H        4E5E                     UNLK    A6
    78H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    3EH, procnum = 10, modnum =  3  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref own string: at    58H  checksum: o.k.

ref own quick call at    5EH, procnum = 49  checksum: o.k.

ref own data at    66H  checksum: o.k.

proc code, procnum = 44, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadWord(VAR WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 43  checksum: o.k.

proc code, procnum = 45, entrypoint =     0H, number of bytes = 116
PROCEDURE REadAdr(Stream; VAR ADDRESS);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0064                MOVE.W  #0064H,-(A7)
    1AH        4879 0000 0018           PEA     00000018H
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2CH        4879 0000 0018           PEA     00000018H
    32H        4879 0000 007D           PEA     0000007DH
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000E                LEA     000E(A7),A7
    48H        4A39 0000 007D           TST.B   0000007DH
    4EH        6616                     BNE     [16H] = 00000066H
    50H        486E FFF6                PEA     FFF6(A6)
    54H        3F3C 0006                MOVE.W  #0006H,-(A7)
    58H        4879 0000 003A           PEA     0000003AH
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4A39 0000 007D           TST.B   0000007DH
    6CH        6602                     BNE     [02H] = 00000070H
    6EH        60A2                     BRA     [A2H] = 00000012H
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    22H, procnum = 31  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    40H, procnum = 14, modnum =  3  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum = 49  checksum: o.k.

ref own data at    68H  checksum: o.k.

proc code, procnum = 46, entrypoint =     0H, number of bytes = 26
PROCEDURE ReadAdr(VAR ADDRESS);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4879 0000 0000           PEA     00000000H
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        508F                     ADDQ.L  #8,A7
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own quick call at    12H, procnum = 45  checksum: o.k.

proc code, procnum = 47, entrypoint =     0H, number of bytes = 16
PROCEDURE SetTextMode(CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0016      MOVE.W  0008(A6),00000016H
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

proc code, procnum = 48, entrypoint =     0H, number of bytes = 148
PROCEDURE SetDefaultIO(VAR ARRAY CHAR; StreamKinds; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        486E FFF6                PEA     FFF6(A6)
     8H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     CH        286E 000E                MOVE.L  000E(A6),A4
    10H        4854                     PEA     (A4)
    12H        1F2E 000C                MOVE.B  000C(A6),-(A7)
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4854                     PEA     (A4)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 0010                LEA     0010(A7),A7
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4A54                     TST.W   (A4)
    2CH        6D62                     BLT     [62H] = 00000090H
    2EH        4A2E 000C                TST.B   000C(A6)
    32H        6630                     BNE     [30H] = 00000064H
    34H        4879 0000 0000           PEA     00000000H
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        4854                     PEA     (A4)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        508F                     ADDQ.L  #8,A7
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        4A54                     TST.W   (A4)
    4EH        6D10                     BLT     [10H] = 00000060H
    50H        49EE FFF6                LEA     FFF6(A6),A4
    54H        47F9 0000 0000           LEA     00000000H,A3
    5AH        26DC                     MOVE.L  (A4)+,(A3)+
    5CH        26DC                     MOVE.L  (A4)+,(A3)+
    5EH        36DC                     MOVE.W  (A4)+,(A3)+
    60H        4EFA 002E                JMP     [002EH] = 00000090H
    64H        4879 0000 000A           PEA     0000000AH
    6AH        286E 0008                MOVE.L  0008(A6),A4
    6EH        4854                     PEA     (A4)
    70H        4EB9 0000 0000           JSR     00000000H
    76H        508F                     ADDQ.L  #8,A7
    78H        286E 0008                MOVE.L  0008(A6),A4
    7CH        4A54                     TST.W   (A4)
    7EH        6D10                     BLT     [10H] = 00000090H
    80H        49EE FFF6                LEA     FFF6(A6),A4
    84H        47F9 0000 000A           LEA     0000000AH,A3
    8AH        26DC                     MOVE.L  (A4)+,(A3)+
    8CH        26DC                     MOVE.L  (A4)+,(A3)+
    8EH        36DC                     MOVE.W  (A4)+,(A3)+
    90H        4E5E                     UNLK    A6
    92H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref ext proc call at    42H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref own data at    66H  checksum: o.k.

ref ext proc call at    72H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    86H  checksum: o.k.

proc code, procnum = 49, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7000                     MOVEQ   #00H,D0
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref util: at    16H, procnum =  2  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 116
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        49F9 0000 0042           LEA     00000042H,A4
    10H        47F9 0000 007E           LEA     0000007EH,A3
    16H        7A03                     MOVEQ   #03H,D5
    18H        16DC                     MOVE.B  (A4)+,(A3)+
    1AH        57CD FFFC                DBEQ    D5,[FFFCH] = 00000018H
    1EH        4879 0000 0000           PEA     00000000H
    24H        3F3C 0003                MOVE.W  #0003H,-(A7)
    28H        4879 0000 007E           PEA     0000007EH
    2EH        4227                     CLR.B   -(A7)
    30H        4879 0000 0014           PEA     00000014H
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 0010                LEA     0010(A7),A7
    40H        4879 0000 000A           PEA     0000000AH
    46H        3F3C 0003                MOVE.W  #0003H,-(A7)
    4AH        4879 0000 007E           PEA     0000007EH
    50H        1F3C 0001                MOVE.B  #01H,-(A7)
    54H        4879 0000 0014           PEA     00000014H
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        4FEF 0010                LEA     0010(A7),A7
    64H        4267                     CLR.W   -(A7)
    66H        6100 0000                BSR     [0000H] = 00000068H
    6AH        548F                     ADDQ.L  #2,A7
    6CH        4E5E                     UNLK    A6
    6EH        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own string: at     CH  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    4CH  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref ext proc call at    5CH, procnum =  1, modnum =  1  checksum: o.k.

ref own quick call at    68H, procnum = 47  checksum: o.k.

ref ext init call at    6EH  checksum: o.k.

string data:, number of bytes = 72
NO DECODE -------- DATA

     0H         5265     6164     4361     7264     0000     
     AH         5265     6164     496E     7465     6765     
    14H         7200     5265     6164     5265     616C     
    1EH         0000     5265     6164     4F63     7400     
    28H         5265     6164     4865     7800     5265     
    32H         6164     576F     7264     0000     5265     
    3CH         6164     4164     7200     636F     6E3A     
    46H         0000       checksum: o.k.

scmod end  checksum: o.k.
