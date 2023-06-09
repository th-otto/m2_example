link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIAttribs, key =  2102H  CB00H  5B76H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0020                MOVE.W  #0020H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 84
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF8                LEA     FFF8(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        33EE 000C 0000 0018      MOVE.W  000C(A6),00000018H
    18H        33EE FFF8 0000 001A      MOVE.W  FFF8(A6),0000001AH
    20H        33EE FFFA 0000 001C      MOVE.W  FFFA(A6),0000001CH
    28H        33EE FFFC 0000 001E      MOVE.W  FFFC(A6),0000001EH
    30H        3F3C 000E                MOVE.W  #000EH,-(A7)
    34H        4267                     CLR.W   -(A7)
    36H        3F3C 0004                MOVE.W  #0004H,-(A7)
    3AH        4267                     CLR.W   -(A7)
    3CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4FEF 000A                LEA     000A(A7),A7
    4AH        4EB9 0000 0000           JSR     00000000H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext data at    14H, modnum =  1  checksum: o.k.

ref ext data at    1CH, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref ext data at    2CH, modnum =  1  checksum: o.k.

ref ext proc call at    42H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    4CH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 000F                MOVE.W  #000FH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0071                MOVE.W  #0071H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0118      MOVE.W  0008(A6),00000118H
     CH        4279 0000 011A           CLR.W   0000011AH
    12H        3F3C 0010                MOVE.W  #0010H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    22H        4EB9 0000 0000           JSR     00000000H
    28H        4FEF 000A                LEA     000A(A7),A7
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        3D79 0000 0318 000C      MOVE.W  00000318H,000C(A6)
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at     EH, modnum =  1  checksum: o.k.

ref ext proc call at    24H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0011                MOVE.W  #0011H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
     CH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    14H        3F3C 006C                MOVE.W  #006CH,-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0012                MOVE.W  #0012H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0118           CLR.W   00000118H
     AH        33EE 0008 0000 011A      MOVE.W  0008(A6),0000011AH
    12H        3F3C 0013                MOVE.W  #0013H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    22H        4EB9 0000 0000           JSR     00000000H
    28H        4FEF 000A                LEA     000A(A7),A7
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        3D79 0000 031A 000C      MOVE.W  0000031AH,000C(A6)
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext data at     6H, modnum =  1  checksum: o.k.

ref ext data at     EH, modnum =  1  checksum: o.k.

ref ext proc call at    24H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    34H, modnum =  1  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0014                MOVE.W  #0014H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 94
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0118           CLR.W   00000118H
     AH        33EE 0018 0000 011A      MOVE.W  0018(A6),0000011AH
    12H        3F3C 000C                MOVE.W  #000CH,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        3F2E 001A                MOVE.W  001A(A6),-(A7)
    22H        4EB9 0000 0000           JSR     00000000H
    28H        4FEF 000A                LEA     000A(A7),A7
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        286E 0014                MOVE.L  0014(A6),A4
    36H        38B9 0000 0318           MOVE.W  00000318H,(A4)
    3CH        286E 0010                MOVE.L  0010(A6),A4
    40H        38B9 0000 031A           MOVE.W  0000031AH,(A4)
    46H        286E 000C                MOVE.L  000C(A6),A4
    4AH        38B9 0000 031C           MOVE.W  0000031CH,(A4)
    50H        286E 0008                MOVE.L  0008(A6),A4
    54H        38B9 0000 031E           MOVE.W  0000031EH,(A4)
    5AH        4E5E                     UNLK    A6
    5CH        4E75                     RTS
  checksum: o.k.

ref ext data at     6H, modnum =  1  checksum: o.k.

ref ext data at     EH, modnum =  1  checksum: o.k.

ref ext proc call at    24H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    38H, modnum =  1  checksum: o.k.

ref ext data at    42H, modnum =  1  checksum: o.k.

ref ext data at    4CH, modnum =  1  checksum: o.k.

ref ext data at    56H, modnum =  1  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 96
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0018 0000 0018      MOVE.W  0018(A6),00000018H
     CH        3F3C 006B                MOVE.W  #006BH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 001A                MOVE.W  001A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        286E 0014                MOVE.L  0014(A6),A4
    30H        38B9 0000 0318           MOVE.W  00000318H,(A4)
    36H        286E 0010                MOVE.L  0010(A6),A4
    3AH        38B9 0000 031A           MOVE.W  0000031AH,(A4)
    40H        286E 000C                MOVE.L  000C(A6),A4
    44H        38B9 0000 031C           MOVE.W  0000031CH,(A4)
    4AH        286E 0008                MOVE.L  0008(A6),A4
    4EH        38B9 0000 031E           MOVE.W  0000031EH,(A4)
    54H        3D79 0000 021A 001C      MOVE.W  0000021AH,001C(A6)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

ref ext data at    56H, modnum =  1  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 000D                MOVE.W  #000DH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0015                MOVE.W  #0015H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0016                MOVE.W  #0016H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 006A                MOVE.W  #006AH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 76
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0012 0000 0018      MOVE.W  0012(A6),00000018H
     CH        33EE 0010 0000 001A      MOVE.W  0010(A6),0000001AH
    14H        3F3C 0027                MOVE.W  #0027H,-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
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

proc code, procnum = 18, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0017                MOVE.W  #0017H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0018                MOVE.W  #0018H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0019                MOVE.W  #0019H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 0068                MOVE.W  #0068H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 66
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0070                MOVE.W  #0070H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        3A2E 0008                MOVE.W  0008(A6),D5
     EH        E945                     ASL.W   #4,D5
    10H        3F05                     MOVE.W  D5,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        286E 000A                MOVE.L  000A(A6),A4
    26H        2A0C                     MOVE.L  A4,D5
    28H        23C5 0000 0434           MOVE.L  D5,00000434H
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        23F9 0000 041C 0000 0434 MOVE.L  0000041CH,00000434H
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1AH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    2AH, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
