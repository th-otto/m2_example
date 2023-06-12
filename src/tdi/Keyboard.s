link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Keyboard, key =  2102H  F1D9H  608AH  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 26
PROCEDURE Status(): BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000B                MOVE.W  #000BH,-(A7)
     8H        4E41                     TRAP    #1
     AH        2A00                     MOVE.L  D0,D5
     CH        4A85                     TST.L   D5
     EH        56C5                     SNE     D5
    10H        4405                     NEG.B   D5
    12H        1D45 0008                MOVE.B  D5,0008(A6)
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 22
PROCEDURE Read(VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0008                MOVE.W  #0008H,-(A7)
     8H        4E41                     TRAP    #1
     AH        2A00                     MOVE.L  D0,D5
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        1885                     MOVE.B  D5,(A4)
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

scmod end  checksum: o.k.
