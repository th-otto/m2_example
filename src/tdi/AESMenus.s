link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESMenus, key =  2102H  CB25H  45DCH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 60
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        23EE 000A 0000 0072      MOVE.L  000A(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 001E                MOVE.W  #001EH,-(A7)
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

proc code, procnum =  2, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 001F                MOVE.W  #001FH,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 0020                MOVE.W  #0020H,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 0021                MOVE.W  #0021H,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0040      MOVE.W  000C(A6),00000040H
     CH        23EE 000E 0000 0072      MOVE.L  000E(A6),00000072H
    14H        23EE 0008 0000 0076      MOVE.L  0008(A6),00000076H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 0022                MOVE.W  #0022H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000E 0000 0040      MOVE.W  000E(A6),00000040H
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        23C5 0000 0072           MOVE.L  D5,00000072H
    18H        558F                     SUBQ.L  #2,A7
    1AH        3F3C 0023                MOVE.W  #0023H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        4267                     CLR.W   -(A7)
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        4FEF 000A                LEA     000A(A7),A7
    36H        3D5F 0010                MOVE.W  (A7)+,0010(A6)
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    14H, modnum =  2  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
