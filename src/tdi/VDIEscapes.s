link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIEscapes, key =  2102H  CAF6H   A10H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 60
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        286E 000C                MOVE.L  000C(A6),A4
    28H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2EH        286E 0008                MOVE.L  0008(A6),A4
    32H        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2AH, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0003                MOVE.W  #0003H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0004                MOVE.W  #0004H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0006                MOVE.W  #0006H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0007                MOVE.W  #0007H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0008                MOVE.W  #0008H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0009                MOVE.W  #0009H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 000A                MOVE.W  #000AH,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 58
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        3F3C 0002                MOVE.W  #0002H,-(A7)
     EH        3F3C 000B                MOVE.W  #000BH,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
    28H        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 146
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0002      MOVE.W  000C(A6),00000002H
     CH        4279 0000 0000           CLR.W   00000000H
    12H        3A39 0000 0000           MOVE.W  00000000H,D5
    18H        BA79 0000 0002           CMP.W   00000002H,D5
    1EH        6E10                     BGT     [10H] = 00000030H
    20H        3A39 0000 0000           MOVE.W  00000000H,D5
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4A34 5000                TST.B   00H(A4,D5.W)
    2EH        6604                     BNE     [04H] = 00000034H
    30H        4EFA 002C                JMP     [002CH] = 0000005EH
    34H        3A39 0000 0000           MOVE.W  00000000H,D5
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        7800                     MOVEQ   #00H,D4
    40H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    44H        3A39 0000 0000           MOVE.W  00000000H,D5
    4AH        DA45                     ADD.W   D5,D5
    4CH        49F9 0000 0018           LEA     00000018H,A4
    52H        3984 5000                MOVE.W  D4,00H(A4,D5.W)
    56H        5279 0000 0000           ADDQ.W  #1,00000000H
    5CH        60B4                     BRA     [B4H] = 00000012H
    5EH        4A79 0000 0000           TST.W   00000000H
    64H        6604                     BNE     [04H] = 0000006AH
    66H        4E5E                     UNLK    A6
    68H        4E75                     RTS
    6AH        3F3C 0005                MOVE.W  #0005H,-(A7)
    6EH        4267                     CLR.W   -(A7)
    70H        3F39 0000 0000           MOVE.W  00000000H,-(A7)
    76H        3F3C 000C                MOVE.W  #000CH,-(A7)
    7AH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    7EH        4EB9 0000 0000           JSR     00000000H
    84H        4FEF 000A                LEA     000A(A7),A7
    88H        4EB9 0000 0000           JSR     00000000H
    8EH        4E5E                     UNLK    A6
    90H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref ext proc call at    80H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    8AH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 000D                MOVE.W  #000DH,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 000E                MOVE.W  #000EH,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 60
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 000F                MOVE.W  #000FH,-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        286E 000C                MOVE.L  000C(A6),A4
    28H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2EH        286E 0008                MOVE.L  0008(A6),A4
    32H        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2AH, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0010                MOVE.W  #0010H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        3D79 0000 0218 000A      MOVE.W  00000218H,000A(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0011                MOVE.W  #0011H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 58
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        3F3C 0001                MOVE.W  #0001H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0012                MOVE.W  #0012H,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 000A 0000 0118      MOVE.W  000A(A6),00000118H
    28H        33EE 0008 0000 011A      MOVE.W  0008(A6),0000011AH
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0013                MOVE.W  #0013H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0014                MOVE.W  #0014H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 108
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF8                LEA     FFF8(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        4279 0000 0000           CLR.W   00000000H
    16H        3A39 0000 0000           MOVE.W  00000000H,D5
    1CH        DA45                     ADD.W   D5,D5
    1EH        49EE FFF8                LEA     FFF8(A6),A4
    22H        3839 0000 0000           MOVE.W  00000000H,D4
    28H        D844                     ADD.W   D4,D4
    2AH        47F9 0000 0118           LEA     00000118H,A3
    30H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    36H        5279 0000 0000           ADDQ.W  #1,00000000H
    3CH        0C79 0004 0000 0000      CMPI.W  #0004H,00000000H
    44H        66D0                     BNE     [D0H] = 00000016H
    46H        3F3C 0005                MOVE.W  #0005H,-(A7)
    4AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    4EH        4267                     CLR.W   -(A7)
    50H        3F3C 0015                MOVE.W  #0015H,-(A7)
    54H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    58H        4EB9 0000 0000           JSR     00000000H
    5EH        4FEF 000A                LEA     000A(A7),A7
    62H        4EB9 0000 0000           JSR     00000000H
    68H        4E5E                     UNLK    A6
    6AH        4E75                     RTS
  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref ext proc call at    5AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    64H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0016                MOVE.W  #0016H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 190
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0010 0000 0018      MOVE.W  0010(A6),00000018H
     CH        33EE 000E 0000 001A      MOVE.W  000E(A6),0000001AH
    14H        33EE 0016 0000 0002      MOVE.W  0016(A6),00000002H
    1CH        4279 0000 0000           CLR.W   00000000H
    22H        3A39 0000 0000           MOVE.W  00000000H,D5
    28H        BA79 0000 0002           CMP.W   00000002H,D5
    2EH        6E10                     BGT     [10H] = 00000040H
    30H        3A39 0000 0000           MOVE.W  00000000H,D5
    36H        286E 0012                MOVE.L  0012(A6),A4
    3AH        4A34 5000                TST.B   00H(A4,D5.W)
    3EH        6604                     BNE     [04H] = 00000044H
    40H        4EFA 002E                JMP     [002EH] = 00000070H
    44H        3A39 0000 0000           MOVE.W  00000000H,D5
    4AH        286E 0012                MOVE.L  0012(A6),A4
    4EH        7800                     MOVEQ   #00H,D4
    50H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    54H        3A39 0000 0000           MOVE.W  00000000H,D5
    5AH        5445                     ADDQ.W  #2,D5
    5CH        DA45                     ADD.W   D5,D5
    5EH        49F9 0000 0018           LEA     00000018H,A4
    64H        3984 5000                MOVE.W  D4,00H(A4,D5.W)
    68H        5279 0000 0000           ADDQ.W  #1,00000000H
    6EH        60B2                     BRA     [B2H] = 00000022H
    70H        4A79 0000 0000           TST.W   00000000H
    76H        6604                     BNE     [04H] = 0000007CH
    78H        4E5E                     UNLK    A6
    7AH        4E75                     RTS
    7CH        3A39 0000 0000           MOVE.W  00000000H,D5
    82H        5445                     ADDQ.W  #2,D5
    84H        DA45                     ADD.W   D5,D5
    86H        49F9 0000 0018           LEA     00000018H,A4
    8CH        4274 5000                CLR.W   00H(A4,D5.W)
    90H        3F3C 0005                MOVE.W  #0005H,-(A7)
    94H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    98H        3A39 0000 0000           MOVE.W  00000000H,D5
    9EH        5645                     ADDQ.W  #3,D5
    A0H        3F05                     MOVE.W  D5,-(A7)
    A2H        3F3C 0017                MOVE.W  #0017H,-(A7)
    A6H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    AAH        4EB9 0000 0000           JSR     00000000H
    B0H        4FEF 000A                LEA     000A(A7),A7
    B4H        4EB9 0000 0000           JSR     00000000H
    BAH        4E5E                     UNLK    A6
    BCH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref ext data at    60H, modnum =  1  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own data at    7EH  checksum: o.k.

ref ext data at    88H, modnum =  1  checksum: o.k.

ref own data at    9AH  checksum: o.k.

ref ext proc call at    ACH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    B6H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 58
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        3F3C 003C                MOVE.W  #003CH,-(A7)
    1AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 94
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 005B                MOVE.W  #005BH,-(A7)
    10H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4279 0000 0000           CLR.W   00000000H
    2AH        3A39 0000 0000           MOVE.W  00000000H,D5
    30H        DA45                     ADD.W   D5,D5
    32H        49F9 0000 0218           LEA     00000218H,A4
    38H        3834 5000                MOVE.W  00H(A4,D5.W),D4
    3CH        3A39 0000 0000           MOVE.W  00000000H,D5
    42H        286E 0008                MOVE.L  0008(A6),A4
    46H        1984 5000                MOVE.B  D4,00H(A4,D5.W)
    4AH        5279 0000 0000           ADDQ.W  #1,00000000H
    50H        0C79 007D 0000 0000      CMPI.W  #007DH,00000000H
    58H        66D0                     BNE     [D0H] = 0000002AH
    5AH        4E5E                     UNLK    A6
    5CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    4CH  checksum: o.k.

ref own data at    54H  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 176
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 005C                MOVE.W  #005CH,-(A7)
    10H        3F2E 0020                MOVE.W  0020(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        286E 001C                MOVE.L  001C(A6),A4
    28H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2EH        286E 0018                MOVE.L  0018(A6),A4
    32H        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    38H        286E 0014                MOVE.L  0014(A6),A4
    3CH        38B9 0000 021C           MOVE.W  0000021CH,(A4)
    42H        286E 0010                MOVE.L  0010(A6),A4
    46H        38B9 0000 021E           MOVE.W  0000021EH,(A4)
    4CH        286E 000C                MOVE.L  000C(A6),A4
    50H        38B9 0000 0220           MOVE.W  00000220H,(A4)
    56H        33FC 0005 0000 0000      MOVE.W  #0005H,00000000H
    5EH        3A39 0000 0000           MOVE.W  00000000H,D5
    64H        DA45                     ADD.W   D5,D5
    66H        49F9 0000 0218           LEA     00000218H,A4
    6CH        3839 0000 0000           MOVE.W  00000000H,D4
    72H        5B44                     SUBQ.W  #5,D4
    74H        48C4                     EXT.L   D4
    76H        89FC 0008                DIVS    #0008H,D4
    7AH        4844                     SWAP    D4
    7CH        266E 0008                MOVE.L  0008(A6),A3
    80H        E544                     ASL.W   #2,D4
    82H        3639 0000 0000           MOVE.W  00000000H,D3
    88H        5B43                     SUBQ.W  #5,D3
    8AH        48C3                     EXT.L   D3
    8CH        87FC 0008                DIVS    #0008H,D3
    90H        D643                     ADD.W   D3,D3
    92H        47F3 4000                LEA     00H(A3,D4.W),A3
    96H        37B4 5000 3000           MOVE.W  00H(A4,D5.W),00H(A3,D3.W)
    9CH        5279 0000 0000           ADDQ.W  #1,00000000H
    A2H        0C79 0015 0000 0000      CMPI.W  #0015H,00000000H
    AAH        66B2                     BNE     [B2H] = 0000005EH
    ACH        4E5E                     UNLK    A6
    AEH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2AH, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    48H, modnum =  1  checksum: o.k.

ref ext data at    52H, modnum =  1  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref ext data at    68H, modnum =  1  checksum: o.k.

ref own data at    6EH  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref own data at    9EH  checksum: o.k.

ref own data at    A6H  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 164
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0014 0000 0018      MOVE.W  0014(A6),00000018H
     CH        33EE 0012 0000 001A      MOVE.W  0012(A6),0000001AH
    14H        33EE 0010 0000 001C      MOVE.W  0010(A6),0000001CH
    1CH        33EE 000E 0000 001E      MOVE.W  000E(A6),0000001EH
    24H        33EE 000C 0000 0020      MOVE.W  000C(A6),00000020H
    2CH        4279 0000 0000           CLR.W   00000000H
    32H        3A39 0000 0000           MOVE.W  00000000H,D5
    38H        48C5                     EXT.L   D5
    3AH        8BFC 0008                DIVS    #0008H,D5
    3EH        4845                     SWAP    D5
    40H        286E 0008                MOVE.L  0008(A6),A4
    44H        E545                     ASL.W   #2,D5
    46H        3839 0000 0000           MOVE.W  00000000H,D4
    4CH        48C4                     EXT.L   D4
    4EH        89FC 0008                DIVS    #0008H,D4
    52H        D844                     ADD.W   D4,D4
    54H        49F4 5000                LEA     00H(A4,D5.W),A4
    58H        3A39 0000 0000           MOVE.W  00000000H,D5
    5EH        5A45                     ADDQ.W  #5,D5
    60H        DA45                     ADD.W   D5,D5
    62H        47F9 0000 0018           LEA     00000018H,A3
    68H        37B4 4000 5000           MOVE.W  00H(A4,D4.W),00H(A3,D5.W)
    6EH        5279 0000 0000           ADDQ.W  #1,00000000H
    74H        0C79 0010 0000 0000      CMPI.W  #0010H,00000000H
    7CH        66B4                     BNE     [B4H] = 00000032H
    7EH        3F3C 0005                MOVE.W  #0005H,-(A7)
    82H        4267                     CLR.W   -(A7)
    84H        3F3C 0014                MOVE.W  #0014H,-(A7)
    88H        3F3C 005D                MOVE.W  #005DH,-(A7)
    8CH        3F2E 0016                MOVE.W  0016(A6),-(A7)
    90H        4EB9 0000 0000           JSR     00000000H
    96H        4FEF 000A                LEA     000A(A7),A7
    9AH        4EB9 0000 0000           JSR     00000000H
    A0H        4E5E                     UNLK    A6
    A2H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext data at    18H, modnum =  1  checksum: o.k.

ref ext data at    20H, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref ext data at    64H, modnum =  1  checksum: o.k.

ref own data at    70H  checksum: o.k.

ref own data at    78H  checksum: o.k.

ref ext proc call at    92H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    9CH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 005E                MOVE.W  #005EH,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 40
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 005F                MOVE.W  #005FH,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0005                MOVE.W  #0005H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0060                MOVE.W  #0060H,-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        3D79 0000 0218 000A      MOVE.W  00000218H,000A(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 74
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000E 0000 0118      MOVE.W  000E(A6),00000118H
     CH        33EE 000C 0000 011A      MOVE.W  000C(A6),0000011AH
    14H        33EE 000A 0000 011A      MOVE.W  000A(A6),0000011AH
    1CH        33EE 0008 0000 011E      MOVE.W  0008(A6),0000011EH
    24H        3F3C 0005                MOVE.W  #0005H,-(A7)
    28H        3F3C 0002                MOVE.W  #0002H,-(A7)
    2CH        4267                     CLR.W   -(A7)
    2EH        3F3C 0062                MOVE.W  #0062H,-(A7)
    32H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 000A                LEA     000A(A7),A7
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext data at    18H, modnum =  1  checksum: o.k.

ref ext data at    20H, modnum =  1  checksum: o.k.

ref ext proc call at    38H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 88
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0010                MOVE.L  0010(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        23C5 0000 0434           MOVE.L  D5,00000434H
    10H        286E 0008                MOVE.L  0008(A6),A4
    14H        2A0C                     MOVE.L  A4,D5
    16H        23C5 0000 0438           MOVE.L  D5,00000438H
    1CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    20H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    24H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    28H        3F3C 0063                MOVE.W  #0063H,-(A7)
    2CH        3F2E 0018                MOVE.W  0018(A6),-(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        23F9 0000 041C 0000 0434 MOVE.L  0000041CH,00000434H
    4AH        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    54H        4E5E                     UNLK    A6
    56H        4E75                     RTS
  checksum: o.k.

ref ext data at     CH, modnum =  1  checksum: o.k.

ref ext data at    18H, modnum =  1  checksum: o.k.

ref ext proc call at    32H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    3CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    42H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext data at    4CH, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 164
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0002      MOVE.W  000C(A6),00000002H
     CH        4279 0000 0000           CLR.W   00000000H
    12H        3A39 0000 0000           MOVE.W  00000000H,D5
    18H        BA79 0000 0002           CMP.W   00000002H,D5
    1EH        6E10                     BGT     [10H] = 00000030H
    20H        3A39 0000 0000           MOVE.W  00000000H,D5
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4A34 5000                TST.B   00H(A4,D5.W)
    2EH        6604                     BNE     [04H] = 00000034H
    30H        4EFA 002C                JMP     [002CH] = 0000005EH
    34H        3A39 0000 0000           MOVE.W  00000000H,D5
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        7800                     MOVEQ   #00H,D4
    40H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    44H        3A39 0000 0000           MOVE.W  00000000H,D5
    4AH        DA45                     ADD.W   D5,D5
    4CH        49F9 0000 0018           LEA     00000018H,A4
    52H        3984 5000                MOVE.W  D4,00H(A4,D5.W)
    56H        5279 0000 0000           ADDQ.W  #1,00000000H
    5CH        60B4                     BRA     [B4H] = 00000012H
    5EH        4A79 0000 0000           TST.W   00000000H
    64H        6604                     BNE     [04H] = 0000006AH
    66H        4E5E                     UNLK    A6
    68H        4E75                     RTS
    6AH        3A39 0000 0000           MOVE.W  00000000H,D5
    70H        DA45                     ADD.W   D5,D5
    72H        49F9 0000 0018           LEA     00000018H,A4
    78H        4274 5000                CLR.W   00H(A4,D5.W)
    7CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    80H        4267                     CLR.W   -(A7)
    82H        3F39 0000 0000           MOVE.W  00000000H,-(A7)
    88H        3F3C 0064                MOVE.W  #0064H,-(A7)
    8CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    90H        4EB9 0000 0000           JSR     00000000H
    96H        4FEF 000A                LEA     000A(A7),A7
    9AH        4EB9 0000 0000           JSR     00000000H
    A0H        4E5E                     UNLK    A6
    A2H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref own data at    6CH  checksum: o.k.

ref ext data at    74H, modnum =  1  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref ext proc call at    92H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    9CH, procnum =  1, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
