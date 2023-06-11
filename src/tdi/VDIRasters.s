link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIRasters, key =  2102H  CAE5H   E12H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 8  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 114
CopyRasterOpaque
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0014 0000 0018      MOVE.W  0014(A6),00000018H
     CH        286E 0010                MOVE.L  0010(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        23C5 0000 0438           MOVE.L  D5,00000438H
    18H        3F3C 006D                MOVE.W  #006DH,-(A7)
    1CH        3F3C 0004                MOVE.W  #0004H,-(A7)
    20H        3F3C 0001                MOVE.W  #0001H,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        4FEF 000A                LEA     000A(A7),A7
    34H        49F9 0000 0004           LEA     00000004H,A4
    3AH        28AE 000C                MOVE.L  000C(A6),(A4)
    3EH        33D4 0000 000E           MOVE.W  (A4),0000000EH
    44H        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    4CH        28AE 0008                MOVE.L  0008(A6),(A4)
    50H        33D4 0000 0012           MOVE.W  (A4),00000012H
    56H        33EC 0002 0000 0014      MOVE.W  0002(A4),00000014H
    5EH        4EB9 0000 0000           JSR     00000000H
    64H        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    14H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    48H, modnum =  1  checksum: o.k.

ref ext data at    52H, modnum =  1  checksum: o.k.

ref ext data at    5AH, modnum =  1  checksum: o.k.

ref ext proc call at    60H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    66H, modnum =  1  checksum: o.k.

ref ext data at    6AH, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 140
CopyRasterTransparent
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0018 0000 0018      MOVE.W  0018(A6),00000018H
     CH        286E 0014                MOVE.L  0014(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        23C5 0000 0438           MOVE.L  D5,00000438H
    18H        3F3C 0079                MOVE.W  #0079H,-(A7)
    1CH        3F3C 0004                MOVE.W  #0004H,-(A7)
    20H        3F3C 0003                MOVE.W  #0003H,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        3F2E 001A                MOVE.W  001A(A6),-(A7)
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        4FEF 000A                LEA     000A(A7),A7
    34H        49F9 0000 0004           LEA     00000004H,A4
    3AH        266E 0010                MOVE.L  0010(A6),A3
    3EH        2893                     MOVE.L  (A3),(A4)
    40H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    46H        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    4EH        266E 000C                MOVE.L  000C(A6),A3
    52H        2893                     MOVE.L  (A3),(A4)
    54H        33D4 0000 0012           MOVE.W  (A4),00000012H
    5AH        33EC 0002 0000 0014      MOVE.W  0002(A4),00000014H
    62H        286E 0008                MOVE.L  0008(A6),A4
    66H        33D4 0000 001A           MOVE.W  (A4),0000001AH
    6CH        286E 0008                MOVE.L  0008(A6),A4
    70H        33EC 0002 0000 001C      MOVE.W  0002(A4),0000001CH
    78H        4EB9 0000 0000           JSR     00000000H
    7EH        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H
    88H        4E5E                     UNLK    A6
    8AH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    14H, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref ext data at    42H, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref ext data at    56H, modnum =  1  checksum: o.k.

ref ext data at    5EH, modnum =  1  checksum: o.k.

ref ext data at    68H, modnum =  1  checksum: o.k.

ref ext data at    74H, modnum =  1  checksum: o.k.

ref ext proc call at    7AH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    80H, modnum =  1  checksum: o.k.

ref ext data at    84H, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 80
TransformForm
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 006E                MOVE.W  #006EH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        49F9 0000 0004           LEA     00000004H,A4
    22H        28AE 000C                MOVE.L  000C(A6),(A4)
    26H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    2CH        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    34H        28AE 0008                MOVE.L  0008(A6),(A4)
    38H        33D4 0000 0012           MOVE.W  (A4),00000012H
    3EH        33EC 0002 0000 0014      MOVE.W  0002(A4),00000014H
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref ext data at    42H, modnum =  1  checksum: o.k.

ref ext proc call at    48H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 76
GetPixel
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0012 0000 0118      MOVE.W  0012(A6),00000118H
     CH        33EE 0010 0000 011A      MOVE.W  0010(A6),0000011AH
    14H        3F3C 0069                MOVE.W  #0069H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 0014                MOVE.W  0014(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        286E 000C                MOVE.L  000C(A6),A4
    38H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    3EH        286E 0008                MOVE.L  0008(A6),A4
    42H        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
