link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIOutputs, key =  2102H  CAE8H  783BH  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0006                MOVE.W  #0006H,-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        2A0C                     MOVE.L  A4,D5
    24H        23C5 0000 0438           MOVE.L  D5,00000438H
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0007                MOVE.W  #0007H,-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        2A0C                     MOVE.L  A4,D5
    24H        23C5 0000 0438           MOVE.L  D5,00000438H
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 150
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        33EE 000C 0000 0002      MOVE.W  000C(A6),00000002H
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
    5EH        3F3C 0008                MOVE.W  #0008H,-(A7)
    62H        3F3C 0001                MOVE.W  #0001H,-(A7)
    66H        3F39 0000 0000           MOVE.W  00000000H,-(A7)
    6CH        4267                     CLR.W   -(A7)
    6EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    72H        4EB9 0000 0000           JSR     00000000H
    78H        4FEF 000A                LEA     000A(A7),A7
    7CH        33EE 0010 0000 0118      MOVE.W  0010(A6),00000118H
    84H        33EE 000E 0000 011A      MOVE.W  000E(A6),0000011AH
    8CH        4EB9 0000 0000           JSR     00000000H
    92H        4E5E                     UNLK    A6
    94H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    68H  checksum: o.k.

ref ext proc call at    74H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    80H, modnum =  1  checksum: o.k.

ref ext data at    88H, modnum =  1  checksum: o.k.

ref ext proc call at    8EH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0009                MOVE.W  #0009H,-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        2A0C                     MOVE.L  A4,D5
    24H        23C5 0000 0438           MOVE.L  D5,00000438H
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 156
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        3A39 0000 0000           MOVE.W  00000000H,D5
    10H        286E 0016                MOVE.L  0016(A6),A4
    14H        DA45                     ADD.W   D5,D5
    16H        3839 0000 0000           MOVE.W  00000000H,D4
    1CH        D844                     ADD.W   D4,D4
    1EH        47F9 0000 0118           LEA     00000118H,A3
    24H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    2AH        5279 0000 0000           ADDQ.W  #1,00000000H
    30H        0C79 0004 0000 0000      CMPI.W  #0004H,00000000H
    38H        66D0                     BNE     [D0H] = 0000000AH
    3AH        3F3C 000A                MOVE.W  #000AH,-(A7)
    3EH        3F3C 0002                MOVE.W  #0002H,-(A7)
    42H        3A2E 0010                MOVE.W  0010(A6),D5
    46H        CBEE 0012                MULS    0012(A6),D5
    4AH        3F05                     MOVE.W  D5,-(A7)
    4CH        4267                     CLR.W   -(A7)
    4EH        3F2E 001A                MOVE.W  001A(A6),-(A7)
    52H        4EB9 0000 0000           JSR     00000000H
    58H        4FEF 000A                LEA     000A(A7),A7
    5CH        33EE 0014 0000 000E      MOVE.W  0014(A6),0000000EH
    64H        33EE 0012 0000 0010      MOVE.W  0012(A6),00000010H
    6CH        33EE 0010 0000 0012      MOVE.W  0010(A6),00000012H
    74H        33EE 000E 0000 0014      MOVE.W  000E(A6),00000014H
    7CH        286E 0008                MOVE.L  0008(A6),A4
    80H        2A0C                     MOVE.L  A4,D5
    82H        23C5 0000 0438           MOVE.L  D5,00000438H
    88H        4EB9 0000 0000           JSR     00000000H
    8EH        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    98H        4E5E                     UNLK    A6
    9AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref ext data at    20H, modnum =  1  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    54H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    60H, modnum =  1  checksum: o.k.

ref ext data at    68H, modnum =  1  checksum: o.k.

ref ext data at    70H, modnum =  1  checksum: o.k.

ref ext data at    78H, modnum =  1  checksum: o.k.

ref ext data at    84H, modnum =  1  checksum: o.k.

ref ext proc call at    8AH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    90H, modnum =  1  checksum: o.k.

ref ext data at    94H, modnum =  1  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 66
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0067                MOVE.W  #0067H,-(A7)
     8H        3F3C 0001                MOVE.W  #0001H,-(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
    28H        33EE 000C 0000 0118      MOVE.W  000C(A6),00000118H
    30H        33EE 000A 0000 011A      MOVE.W  000A(A6),0000011AH
    38H        4EB9 0000 0000           JSR     00000000H
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext proc call at    3AH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0072                MOVE.W  #0072H,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        2A0C                     MOVE.L  A4,D5
    24H        23C5 0000 0438           MOVE.L  D5,00000438H
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 64
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        2A0C                     MOVE.L  A4,D5
    26H        23C5 0000 0438           MOVE.L  D5,00000438H
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3CH        4E5E                     UNLK    A6
    3EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext data at    38H, modnum =  1  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 114
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0004                MOVE.W  #0004H,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        3F3C 0002                MOVE.W  #0002H,-(A7)
    14H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
    2AH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    32H        33EE 0010 0000 0118      MOVE.W  0010(A6),00000118H
    3AH        33EE 000E 0000 011A      MOVE.W  000E(A6),0000011AH
    42H        4279 0000 011C           CLR.W   0000011CH
    48H        4279 0000 011E           CLR.W   0000011EH
    4EH        4279 0000 0120           CLR.W   00000120H
    54H        4279 0000 0122           CLR.W   00000122H
    5AH        33EE 000C 0000 0124      MOVE.W  000C(A6),00000124H
    62H        4279 0000 0126           CLR.W   00000126H
    68H        4EB9 0000 0000           JSR     00000000H
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

ref ext data at    56H, modnum =  1  checksum: o.k.

ref ext data at    5EH, modnum =  1  checksum: o.k.

ref ext data at    64H, modnum =  1  checksum: o.k.

ref ext proc call at    6AH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 114
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0004                MOVE.W  #0004H,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        3F3C 0003                MOVE.W  #0003H,-(A7)
    14H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
    2AH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    32H        33EE 0010 0000 0118      MOVE.W  0010(A6),00000118H
    3AH        33EE 000E 0000 011A      MOVE.W  000E(A6),0000011AH
    42H        4279 0000 011C           CLR.W   0000011CH
    48H        4279 0000 011E           CLR.W   0000011EH
    4EH        4279 0000 0120           CLR.W   00000120H
    54H        4279 0000 0122           CLR.W   00000122H
    5AH        33EE 000C 0000 0124      MOVE.W  000C(A6),00000124H
    62H        4279 0000 0126           CLR.W   00000126H
    68H        4EB9 0000 0000           JSR     00000000H
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

ref ext data at    56H, modnum =  1  checksum: o.k.

ref ext data at    5EH, modnum =  1  checksum: o.k.

ref ext data at    64H, modnum =  1  checksum: o.k.

ref ext proc call at    6AH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 84
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0003                MOVE.W  #0003H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0004                MOVE.W  #0004H,-(A7)
    12H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 000C 0000 0118      MOVE.W  000C(A6),00000118H
    28H        33EE 000A 0000 011A      MOVE.W  000A(A6),0000011AH
    30H        4279 0000 011C           CLR.W   0000011CH
    36H        4279 0000 011E           CLR.W   0000011EH
    3CH        33EE 0008 0000 0120      MOVE.W  0008(A6),00000120H
    44H        4279 0000 0122           CLR.W   00000122H
    4AH        4EB9 0000 0000           JSR     00000000H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    38H, modnum =  1  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext proc call at    4CH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 92
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        3F3C 0006                MOVE.W  #0006H,-(A7)
    14H        3F2E 0014                MOVE.W  0014(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
    2AH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    32H        33EE 0012 0000 0118      MOVE.W  0012(A6),00000118H
    3AH        33EE 0010 0000 011A      MOVE.W  0010(A6),0000011AH
    42H        33EE 000E 0000 011C      MOVE.W  000E(A6),0000011CH
    4AH        33EE 000C 0000 011E      MOVE.W  000C(A6),0000011EH
    52H        4EB9 0000 0000           JSR     00000000H
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref ext proc call at    54H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 92
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        3F3C 0007                MOVE.W  #0007H,-(A7)
    14H        3F2E 0014                MOVE.W  0014(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
    2AH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    32H        33EE 0012 0000 0118      MOVE.W  0012(A6),00000118H
    3AH        33EE 0010 0000 011A      MOVE.W  0010(A6),0000011AH
    42H        33EE 000E 0000 011C      MOVE.W  000E(A6),0000011CH
    4AH        33EE 000C 0000 011E      MOVE.W  000C(A6),0000011EH
    52H        4EB9 0000 0000           JSR     00000000H
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref ext proc call at    54H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 74
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0005                MOVE.W  #0005H,-(A7)
    12H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 000E 0000 0118      MOVE.W  000E(A6),00000118H
    28H        33EE 000C 0000 011A      MOVE.W  000C(A6),0000011AH
    30H        33EE 000A 0000 011C      MOVE.W  000A(A6),0000011CH
    38H        33EE 0008 0000 011E      MOVE.W  0008(A6),0000011EH
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 64
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0008                MOVE.W  #0008H,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        2A0C                     MOVE.L  A4,D5
    26H        23C5 0000 0438           MOVE.L  D5,00000438H
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3CH        4E5E                     UNLK    A6
    3EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext data at    38H, modnum =  1  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 64
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F3C 0009                MOVE.W  #0009H,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        2A0C                     MOVE.L  A4,D5
    26H        23C5 0000 0438           MOVE.L  D5,00000438H
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    3CH        4E5E                     UNLK    A6
    3EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

ref ext data at    38H, modnum =  1  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 188
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
     CH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    14H        33EE 0016 0000 0118      MOVE.W  0016(A6),00000118H
    1CH        33EE 0014 0000 011A      MOVE.W  0014(A6),0000011AH
    24H        33EE 000C 0000 011C      MOVE.W  000C(A6),0000011CH
    2CH        4279 0000 011E           CLR.W   0000011EH
    32H        4279 0000 0000           CLR.W   00000000H
    38H        33EE 0012 0000 0002      MOVE.W  0012(A6),00000002H
    40H        3A39 0000 0000           MOVE.W  00000000H,D5
    46H        BA79 0000 0002           CMP.W   00000002H,D5
    4CH        6E10                     BGT     [10H] = 0000005EH
    4EH        3A39 0000 0000           MOVE.W  00000000H,D5
    54H        286E 000E                MOVE.L  000E(A6),A4
    58H        4A34 5000                TST.B   00H(A4,D5.W)
    5CH        6604                     BNE     [04H] = 00000062H
    5EH        4EFA 002E                JMP     [002EH] = 0000008EH
    62H        3A39 0000 0000           MOVE.W  00000000H,D5
    68H        286E 000E                MOVE.L  000E(A6),A4
    6CH        7800                     MOVEQ   #00H,D4
    6EH        1834 5000                MOVE.B  00H(A4,D5.W),D4
    72H        3A39 0000 0000           MOVE.W  00000000H,D5
    78H        5445                     ADDQ.W  #2,D5
    7AH        DA45                     ADD.W   D5,D5
    7CH        49F9 0000 0018           LEA     00000018H,A4
    82H        3984 5000                MOVE.W  D4,00H(A4,D5.W)
    86H        5279 0000 0000           ADDQ.W  #1,00000000H
    8CH        60B2                     BRA     [B2H] = 00000040H
    8EH        3F3C 000B                MOVE.W  #000BH,-(A7)
    92H        3F3C 0002                MOVE.W  #0002H,-(A7)
    96H        3A39 0000 0000           MOVE.W  00000000H,D5
    9CH        5445                     ADDQ.W  #2,D5
    9EH        3F05                     MOVE.W  D5,-(A7)
    A0H        3F3C 000A                MOVE.W  #000AH,-(A7)
    A4H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    A8H        4EB9 0000 0000           JSR     00000000H
    AEH        4FEF 000A                LEA     000A(A7),A7
    B2H        4EB9 0000 0000           JSR     00000000H
    B8H        4E5E                     UNLK    A6
    BAH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext data at    18H, modnum =  1  checksum: o.k.

ref ext data at    20H, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref own data at    64H  checksum: o.k.

ref own data at    74H  checksum: o.k.

ref ext data at    7EH, modnum =  1  checksum: o.k.

ref own data at    88H  checksum: o.k.

ref own data at    98H  checksum: o.k.

ref ext proc call at    AAH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    B4H, procnum =  1, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
