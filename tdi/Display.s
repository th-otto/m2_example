link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Display, key =  2102H  F1E7H  6763H  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 22
PROCEDURE Write(CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        4E41                     TRAP    #1
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

scmod end  checksum: o.k.
