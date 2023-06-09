link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  BIOS, key =  2102H  CB4DH  70E9H  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        4267                     CLR.W   -(A7)
     EH        4E4D                     TRAP    #D
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4E4D                     TRAP    #D
    12H        2A00                     MOVE.L  D0,D5
    14H        0245 0001                ANDI.W  #0001H,D5
    18H        4845                     SWAP    D5
    1AH        4245                     CLR.W   D5
    1CH        4845                     SWAP    D5
    1EH        1D45 000A                MOVE.B  D5,000A(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 0008                MOVE.W  #0008H,-(A7)
    10H        4E4D                     TRAP    #D
    12H        2A00                     MOVE.L  D0,D5
    14H        0245 0001                ANDI.W  #0001H,D5
    18H        4845                     SWAP    D5
    1AH        4245                     CLR.W   D5
    1CH        4845                     SWAP    D5
    1EH        1D45 000A                MOVE.B  D5,000A(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    10H        4E4D                     TRAP    #D
    12H        2A00                     MOVE.L  D0,D5
    14H        2D45 000A                MOVE.L  D5,000A(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        7A00                     MOVEQ   #00H,D5
     EH        1A2E 000A                MOVE.B  000A(A6),D5
    12H        3F05                     MOVE.W  D5,-(A7)
    14H        3F3C 0003                MOVE.W  #0003H,-(A7)
    18H        4E4D                     TRAP    #D
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 44
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        2F2E 000E                MOVE.L  000E(A6),-(A7)
    14H        7A00                     MOVEQ   #00H,D5
    16H        1A2E 0012                MOVE.B  0012(A6),D5
    1AH        3F05                     MOVE.W  D5,-(A7)
    1CH        3F3C 0004                MOVE.W  #0004H,-(A7)
    20H        4E4D                     TRAP    #D
    22H        2A00                     MOVE.L  D0,D5
    24H        2D45 0014                MOVE.L  D5,0014(A6)
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        4E4D                     TRAP    #D
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4878 FFFF                PEA     FFFFH
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    10H        4E4D                     TRAP    #D
    12H        2A00                     MOVE.L  D0,D5
    14H        2D45 000A                MOVE.L  D5,000A(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0006                MOVE.W  #0006H,-(A7)
     8H        4E4D                     TRAP    #D
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 0007                MOVE.W  #0007H,-(A7)
     CH        4E4D                     TRAP    #D
     EH        2A00                     MOVE.L  D0,D5
    10H        2D45 000A                MOVE.L  D5,000A(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 0009                MOVE.W  #0009H,-(A7)
     CH        4E4D                     TRAP    #D
     EH        2A00                     MOVE.L  D0,D5
    10H        1D45 000A                MOVE.B  D5,000A(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 000A                MOVE.W  #000AH,-(A7)
     8H        4E4D                     TRAP    #D
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 000B                MOVE.W  #000BH,-(A7)
    10H        4E4D                     TRAP    #D
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C FFFF                MOVE.W  #FFFFH,-(A7)
     8H        3F3C 000B                MOVE.W  #000BH,-(A7)
     CH        4E4D                     TRAP    #D
     EH        2A00                     MOVE.L  D0,D5
    10H        1D45 0008                MOVE.B  D5,0008(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

scmod end  checksum: o.k.
