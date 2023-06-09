link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESScraps, key =  2102H  CB1CH  124BH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 50
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0050                MOVE.W  #0050H,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F3C 0001                MOVE.W  #0001H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 50
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0051                MOVE.W  #0051H,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F3C 0001                MOVE.W  #0001H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
