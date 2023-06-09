link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESGraphics, key =  2102H  CB09H  4F4AH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0016                MOVE.W  0016(A6),-(A7)
     8H        3F2E 0014                MOVE.W  0014(A6),-(A7)
     CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 0046                MOVE.W  #0046H,-(A7)
    22H        3F3C 0004                MOVE.W  #0004H,-(A7)
    26H        3F3C 0003                MOVE.W  #0003H,-(A7)
    2AH        4267                     CLR.W   -(A7)
    2CH        4267                     CLR.W   -(A7)
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        4FEF 000A                LEA     000A(A7),A7
    38H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    3EH        286E 000C                MOVE.L  000C(A6),A4
    42H        4854                     PEA     (A4)
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        4854                     PEA     (A4)
    4AH        4EB9 0000 0000           JSR     00000000H
    50H        508F                     ADDQ.L  #8,A7
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3AH, modnum =  2  checksum: o.k.

ref ext proc call at    4CH, procnum =  6, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 104
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 001E                MOVE.W  001E(A6),-(A7)
     8H        3F2E 001C                MOVE.W  001C(A6),-(A7)
     CH        3F2E 001A                MOVE.W  001A(A6),-(A7)
    10H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    14H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    18H        3F2E 0014                MOVE.W  0014(A6),-(A7)
    1CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    20H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 0010                LEA     0010(A7),A7
    2EH        558F                     SUBQ.L  #2,A7
    30H        3F3C 0047                MOVE.W  #0047H,-(A7)
    34H        3F3C 0008                MOVE.W  #0008H,-(A7)
    38H        3F3C 0003                MOVE.W  #0003H,-(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4267                     CLR.W   -(A7)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4FEF 000A                LEA     000A(A7),A7
    4AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    50H        286E 000C                MOVE.L  000C(A6),A4
    54H        4854                     PEA     (A4)
    56H        286E 0008                MOVE.L  0008(A6),A4
    5AH        4854                     PEA     (A4)
    5CH        4EB9 0000 0000           JSR     00000000H
    62H        508F                     ADDQ.L  #8,A7
    64H        4E5E                     UNLK    A6
    66H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  2  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4CH, modnum =  2  checksum: o.k.

ref ext proc call at    5EH, procnum =  6, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 82
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     8H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    10H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 000A 0000 0048      MOVE.W  000A(A6),00000048H
    24H        33EE 0008 0000 004A      MOVE.W  0008(A6),0000004AH
    2CH        558F                     SUBQ.L  #2,A7
    2EH        3F3C 0048                MOVE.W  #0048H,-(A7)
    32H        3F3C 0006                MOVE.W  #0006H,-(A7)
    36H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3AH        4267                     CLR.W   -(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000A                LEA     000A(A7),A7
    48H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    4EH        4E5E                     UNLK    A6
    50H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext proc call at    40H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4AH, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 84
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0016                MOVE.W  0016(A6),-(A7)
     8H        3F2E 0014                MOVE.W  0014(A6),-(A7)
     CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    18H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    1CH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    20H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 0010                LEA     0010(A7),A7
    2EH        558F                     SUBQ.L  #2,A7
    30H        3F3C 0049                MOVE.W  #0049H,-(A7)
    34H        3F3C 0008                MOVE.W  #0008H,-(A7)
    38H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4267                     CLR.W   -(A7)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4FEF 000A                LEA     000A(A7),A7
    4AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  2  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4CH, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 84
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0016                MOVE.W  0016(A6),-(A7)
     8H        3F2E 0014                MOVE.W  0014(A6),-(A7)
     CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    18H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    1CH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    20H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 0010                LEA     0010(A7),A7
    2EH        558F                     SUBQ.L  #2,A7
    30H        3F3C 004A                MOVE.W  #004AH,-(A7)
    34H        3F3C 0008                MOVE.W  #0008H,-(A7)
    38H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4267                     CLR.W   -(A7)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        4FEF 000A                LEA     000A(A7),A7
    4AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  2  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4CH, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 72
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4267                     CLR.W   -(A7)
     6H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     AH        3F2E 000A                MOVE.W  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        508F                     ADDQ.L  #8,A7
    1AH        23EE 000E 0000 0072      MOVE.L  000E(A6),00000072H
    22H        558F                     SUBQ.L  #2,A7
    24H        3F3C 004B                MOVE.W  #004BH,-(A7)
    28H        3F3C 0004                MOVE.W  #0004H,-(A7)
    2CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    30H        3F3C 0001                MOVE.W  #0001H,-(A7)
    34H        4267                     CLR.W   -(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 000A                LEA     000A(A7),A7
    40H        3D5F 0012                MOVE.W  (A7)+,0012(A6)
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    1EH, modnum =  2  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 74
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        33EE 0008 0000 0044      MOVE.W  0008(A6),00000044H
    1CH        23EE 000E 0000 0072      MOVE.L  000E(A6),00000072H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 004C                MOVE.W  #004CH,-(A7)
    2AH        3F3C 0003                MOVE.W  #0003H,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        3F3C 0001                MOVE.W  #0001H,-(A7)
    36H        4267                     CLR.W   -(A7)
    38H        4EB9 0000 0000           JSR     00000000H
    3EH        4FEF 000A                LEA     000A(A7),A7
    42H        3D5F 0012                MOVE.W  (A7)+,0012(A6)
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    3AH, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 78
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        558F                     SUBQ.L  #2,A7
     6H        3F3C 004D                MOVE.W  #004DH,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        4267                     CLR.W   -(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    22H        286E 0014                MOVE.L  0014(A6),A4
    26H        4854                     PEA     (A4)
    28H        286E 0010                MOVE.L  0010(A6),A4
    2CH        4854                     PEA     (A4)
    2EH        286E 000C                MOVE.L  000C(A6),A4
    32H        4854                     PEA     (A4)
    34H        286E 0008                MOVE.L  0008(A6),A4
    38H        4854                     PEA     (A4)
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        4FEF 0010                LEA     0010(A7),A7
    44H        3D6E FFFE 0018           MOVE.W  FFFE(A6),0018(A6)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  1, modnum =  2  checksum: o.k.

ref ext proc call at    3CH, procnum =  7, modnum =  2  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 60
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0040      MOVE.W  000C(A6),00000040H
     CH        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 004E                MOVE.W  #004EH,-(A7)
    1AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000A                LEA     000A(A7),A7
    32H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    34H, modnum =  2  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 74
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        558F                     SUBQ.L  #2,A7
     6H        3F3C 004F                MOVE.W  #004FH,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        4267                     CLR.W   -(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    24H        286E 0014                MOVE.L  0014(A6),A4
    28H        4854                     PEA     (A4)
    2AH        286E 0010                MOVE.L  0010(A6),A4
    2EH        4854                     PEA     (A4)
    30H        286E 000C                MOVE.L  000C(A6),A4
    34H        4854                     PEA     (A4)
    36H        286E 0008                MOVE.L  0008(A6),A4
    3AH        4854                     PEA     (A4)
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        4FEF 0010                LEA     0010(A7),A7
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    3EH, procnum =  7, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
