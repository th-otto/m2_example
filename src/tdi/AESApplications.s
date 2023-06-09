link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESApplications, key =  2102H  CB23H  6963H  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 38
ApplInitialise
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        558F                     SUBQ.L  #2,A7
     6H        3F3C 000A                MOVE.W  #000AH,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        4267                     CLR.W   -(A7)
    14H        4EB9 0000 0000           JSR     GemCall
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        3D5F 0008                MOVE.W  (A7)+,0008(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 68
ApplRead
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        4EB9 0000 0000           JSR     IntIn2
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 000B                MOVE.W  #000BH,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     GemCall
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
ApplWrite
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        4EB9 0000 0000           JSR     IntIn2
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 000C                MOVE.W  #000CH,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     GemCall
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 52
ApplFind:
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        23C5 0000 0072           MOVE.L  D5,00000072H
    10H        558F                     SUBQ.L  #2,A7
    12H        3F3C 000D                MOVE.W  #000DH,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    20H        4267                     CLR.W   -(A7)
    22H        4EB9 0000 0000           JSR     GemCall
    28H        4FEF 000A                LEA     000A(A7),A7
    2CH        3D5F 000E                MOVE.W  (A7)+,000E(A6)
    30H        4E5E                     UNLK    A6
    32H        4E75                     RTS
  checksum: o.k.

ref ext data at     CH, modnum =  2  checksum: o.k.

ref ext proc call at    24H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 68
ApplTPlayback
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     IntIn2
    12H        588F                     ADDQ.L  #4,A7
    14H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F3C 000E                MOVE.W  #000EH,-(A7)
    22H        3F3C 0002                MOVE.W  #0002H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        4267                     CLR.W   -(A7)
    30H        4EB9 0000 0000           JSR     GemCall
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 60
ApplTRecord
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        23EE 000A 0000 0072      MOVE.L  000A(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 000F                MOVE.W  #000FH,-(A7)
    1AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4EB9 0000 0000           JSR     GemCall
    2EH        4FEF 000A                LEA     000A(A7),A7
    32H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    34H, modnum =  2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 40
ApplExit
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        558F                     SUBQ.L  #2,A7
     6H        3F3C 0013                MOVE.W  #0013H,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        4267                     CLR.W   -(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
