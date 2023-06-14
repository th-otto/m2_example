link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESObjects, key =  2102H  CB18H  7D47H  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 0028                MOVE.W  #0028H,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 60
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        23EE 000A 0000 0072      MOVE.L  000A(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 0029                MOVE.W  #0029H,-(A7)
    1AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000A                LEA     000A(A7),A7
    32H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    34H, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 92
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
    2CH        23EE 0014 0000 0072      MOVE.L  0014(A6),00000072H
    34H        558F                     SUBQ.L  #2,A7
    36H        3F3C 002A                MOVE.W  #002AH,-(A7)
    3AH        3F3C 0006                MOVE.W  #0006H,-(A7)
    3EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    42H        3F3C 0001                MOVE.W  #0001H,-(A7)
    46H        4267                     CLR.W   -(A7)
    48H        4EB9 0000 0000           JSR     00000000H
    4EH        4FEF 000A                LEA     000A(A7),A7
    52H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext data at    30H, modnum =  2  checksum: o.k.

ref ext proc call at    4AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    54H, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 74
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    10H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        23EE 0010 0000 0072      MOVE.L  0010(A6),00000072H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 002B                MOVE.W  #002BH,-(A7)
    2AH        3F3C 0004                MOVE.W  #0004H,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        3F3C 0001                MOVE.W  #0001H,-(A7)
    36H        4267                     CLR.W   -(A7)
    38H        4EB9 0000 0000           JSR     00000000H
    3EH        4FEF 000A                LEA     000A(A7),A7
    42H        3D5F 0014                MOVE.W  (A7)+,0014(A6)
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    3AH, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 80
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        33EE 0010 0000 0040      MOVE.W  0010(A6),00000040H
     CH        23EE 0012 0000 0072      MOVE.L  0012(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 002C                MOVE.W  #002CH,-(A7)
    1AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    1EH        3F3C 0003                MOVE.W  #0003H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000A                LEA     000A(A7),A7
    32H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    38H        286E 000C                MOVE.L  000C(A6),A4
    3CH        38B9 0000 0064           MOVE.W  00000064H,(A4)
    42H        286E 0008                MOVE.L  0008(A6),A4
    46H        38B9 0000 0066           MOVE.W  00000066H,(A4)
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    34H, modnum =  2  checksum: o.k.

ref ext data at    3EH, modnum =  2  checksum: o.k.

ref ext data at    48H, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 002D                MOVE.W  #002DH,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     8H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    10H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        23EE 0014 0000 0072      MOVE.L  0014(A6),00000072H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 002E                MOVE.W  #002EH,-(A7)
    2AH        3F3C 0004                MOVE.W  #0004H,-(A7)
    2EH        3F3C 0002                MOVE.W  #0002H,-(A7)
    32H        3F3C 0001                MOVE.W  #0001H,-(A7)
    36H        4267                     CLR.W   -(A7)
    38H        4EB9 0000 0000           JSR     00000000H
    3EH        4FEF 000A                LEA     000A(A7),A7
    42H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        38B9 0000 0064           MOVE.W  00000064H,(A4)
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    3AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    44H, modnum =  2  checksum: o.k.

ref ext data at    4EH, modnum =  2  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 94
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
    2EH        23EE 0018 0000 0072      MOVE.L  0018(A6),00000072H
    36H        558F                     SUBQ.L  #2,A7
    38H        3F3C 002F                MOVE.W  #002FH,-(A7)
    3CH        3F3C 0008                MOVE.W  #0008H,-(A7)
    40H        3F3C 0001                MOVE.W  #0001H,-(A7)
    44H        3F3C 0001                MOVE.W  #0001H,-(A7)
    48H        4267                     CLR.W   -(A7)
    4AH        4EB9 0000 0000           JSR     00000000H
    50H        4FEF 000A                LEA     000A(A7),A7
    54H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    5AH        4E5E                     UNLK    A6
    5CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

ref ext proc call at    4CH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    56H, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
