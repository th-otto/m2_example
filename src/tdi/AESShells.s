link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESShells, key =  2102H  CB33H  324FH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 58
ShellRead
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
     CH        23EE 0008 0000 0076      MOVE.L  0008(A6),00000076H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 0078                MOVE.W  #0078H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    20H        3F3C 0002                MOVE.W  #0002H,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     GemCall
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 84
ShellWrite:
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0014                MOVE.W  0014(A6),-(A7)
     8H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     CH        4EB9 0000 0000           JSR     IntIn2
    12H        588F                     ADDQ.L  #4,A7
    14H        33EE 0010 0000 0044      MOVE.W  0010(A6),00000044H
    1CH        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
    24H        23EE 0008 0000 0076      MOVE.L  0008(A6),00000076H
    2CH        558F                     SUBQ.L  #2,A7
    2EH        3F3C 0079                MOVE.W  #0079H,-(A7)
    32H        3F3C 0003                MOVE.W  #0003H,-(A7)
    36H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    3EH        4267                     CLR.W   -(A7)
    40H        4EB9 0000 0000           JSR     GemCall
    46H        4FEF 000A                LEA     000A(A7),A7
    4AH        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext proc call at    42H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4CH, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 50
ShellFind:
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 007C                MOVE.W  #007CH,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F3C 0001                MOVE.W  #0001H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     GemCall
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 58
ShellEnvrn
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 000C 0000 0072      MOVE.L  000C(A6),00000072H
     CH        23EE 0008 0000 0076      MOVE.L  0008(A6),00000076H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 007D                MOVE.W  #007DH,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    20H        3F3C 0002                MOVE.W  #0002H,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     GemCall
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
