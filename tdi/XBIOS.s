link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  XBIOS, key =  2102H  CACDH  48A7H  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 32
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        286E 000C                MOVE.L  000C(A6),A4
     CH        2A0C                     MOVE.L  A4,D5
     EH        2F05                     MOVE.L  D5,-(A7)
    10H        7A00                     MOVEQ   #00H,D5
    12H        1A2E 0010                MOVE.B  0010(A6),D5
    16H        3F05                     MOVE.W  D5,-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        4E4E                     TRAP    #E
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0002                MOVE.W  #0002H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0003                MOVE.W  #0003H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0004                MOVE.W  #0004H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        3D45 0008                MOVE.W  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 26
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        2F2E 000A                MOVE.L  000A(A6),-(A7)
     CH        2F2E 000E                MOVE.L  000E(A6),-(A7)
    10H        3F3C 0005                MOVE.W  #0005H,-(A7)
    14H        4E4E                     TRAP    #E
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F3C 0006                MOVE.W  #0006H,-(A7)
    10H        4E4E                     TRAP    #E
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F3C 0007                MOVE.W  #0007H,-(A7)
    10H        4E4E                     TRAP    #E
    12H        2A00                     MOVE.L  D0,D5
    14H        3D45 000C                MOVE.W  D5,000C(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 46
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    14H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    18H        42A7                     CLR.L   -(A7)
    1AH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    1EH        3F3C 0008                MOVE.W  #0008H,-(A7)
    22H        4E4E                     TRAP    #E
    24H        2A00                     MOVE.L  D0,D5
    26H        3D45 0016                MOVE.W  D5,0016(A6)
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 46
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    14H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    18H        42A7                     CLR.L   -(A7)
    1AH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    1EH        3F3C 0009                MOVE.W  #0009H,-(A7)
    22H        4E4E                     TRAP    #E
    24H        2A00                     MOVE.L  D0,D5
    26H        3D45 0016                MOVE.W  D5,0016(A6)
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        2F3C 8765 4321           MOVE.L  #87654321H,-(A7)
     EH        3F2E 000A                MOVE.W  000A(A6),-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1AH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    1EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    22H        42A7                     CLR.L   -(A7)
    24H        2F2E 0014                MOVE.L  0014(A6),-(A7)
    28H        3F3C 000A                MOVE.W  #000AH,-(A7)
    2CH        4E4E                     TRAP    #E
    2EH        2A00                     MOVE.L  D0,D5
    30H        3D45 0018                MOVE.W  D5,0018(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 26
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    10H        3F3C 000C                MOVE.W  #000CH,-(A7)
    14H        4E4E                     TRAP    #E
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        3F3C 000D                MOVE.W  #000DH,-(A7)
    10H        4E4E                     TRAP    #E
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0008                MOVE.B  0008(A6),D5
     AH        3F05                     MOVE.W  D5,-(A7)
     CH        3F3C 000E                MOVE.W  #000EH,-(A7)
    10H        4E4E                     TRAP    #E
    12H        2A00                     MOVE.L  D0,D5
    14H        2D45 000A                MOVE.L  D5,000A(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 46
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    14H        7A00                     MOVEQ   #00H,D5
    16H        1A2E 0010                MOVE.B  0010(A6),D5
    1AH        3F05                     MOVE.W  D5,-(A7)
    1CH        7A00                     MOVEQ   #00H,D5
    1EH        1A2E 0012                MOVE.B  0012(A6),D5
    22H        3F05                     MOVE.W  D5,-(A7)
    24H        3F3C 000F                MOVE.W  #000FH,-(A7)
    28H        4E4E                     TRAP    #E
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        2F14                     MOVE.L  (A4),-(A7)
     AH        286E 000C                MOVE.L  000C(A6),A4
     EH        2F14                     MOVE.L  (A4),-(A7)
    10H        286E 0010                MOVE.L  0010(A6),A4
    14H        2F14                     MOVE.L  (A4),-(A7)
    16H        3F3C 0010                MOVE.W  #0010H,-(A7)
    1AH        4E4E                     TRAP    #E
    1CH        2A00                     MOVE.L  D0,D5
    1EH        2D45 0014                MOVE.L  D5,0014(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0011                MOVE.W  #0011H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    10H        2F2E 0010                MOVE.L  0010(A6),-(A7)
    14H        3F3C 0012                MOVE.W  #0012H,-(A7)
    18H        4E4E                     TRAP    #E
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 46
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    14H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    18H        42A7                     CLR.L   -(A7)
    1AH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    1EH        3F3C 0013                MOVE.W  #0013H,-(A7)
    22H        4E4E                     TRAP    #E
    24H        2A00                     MOVE.L  D0,D5
    26H        3D45 0016                MOVE.W  D5,0016(A6)
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        3F3C 0015                MOVE.W  #0015H,-(A7)
    10H        4E4E                     TRAP    #E
    12H        2A00                     MOVE.L  D0,D5
    14H        3D45 000C                MOVE.W  D5,000C(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F3C 0016                MOVE.W  #0016H,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0017                MOVE.W  #0017H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 26
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    10H        3F3C 0019                MOVE.W  #0019H,-(A7)
    14H        4E4E                     TRAP    #E
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 001A                MOVE.W  #001AH,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 001B                MOVE.W  #001BH,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 26
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        4227                     CLR.B   -(A7)
     AH        3F3C 001C                MOVE.W  #001CH,-(A7)
     EH        4E4E                     TRAP    #E
    10H        2A00                     MOVE.L  D0,D5
    12H        3D45 000A                MOVE.W  D5,000A(A6)
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3A2E 000A                MOVE.W  000A(A6),D5
     8H        0045 0080                ORI.W   #0080H,D5
     CH        3F05                     MOVE.W  D5,-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        3F3C 001C                MOVE.W  #001CH,-(A7)
    16H        4E4E                     TRAP    #E
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 001D                MOVE.W  #001DH,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 001E                MOVE.W  #001EH,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 34
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    10H        7A00                     MOVEQ   #00H,D5
    12H        1A2E 0010                MOVE.B  0010(A6),D5
    16H        3F05                     MOVE.W  D5,-(A7)
    18H        3F3C 001F                MOVE.W  #001FH,-(A7)
    1CH        4E4E                     TRAP    #E
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F3C 0020                MOVE.W  #0020H,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F3C 0021                MOVE.W  #0021H,-(A7)
     CH        4E4E                     TRAP    #E
     EH        2A00                     MOVE.L  D0,D5
    10H        3D45 000A                MOVE.W  D5,000A(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 34, entrypoint =     0H, number of bytes = 20
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0022                MOVE.W  #0022H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 0008                MOVE.L  D5,0008(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 35, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        3F3C 0023                MOVE.W  #0023H,-(A7)
    10H        4E4E                     TRAP    #E
    12H        2A00                     MOVE.L  D0,D5
    14H        3D45 000C                MOVE.W  D5,000C(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0018                MOVE.W  #0018H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        4E5E                     UNLK    A6
     CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0014                MOVE.W  #0014H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        4E5E                     UNLK    A6
     CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 36, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0025                MOVE.W  #0025H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        4E5E                     UNLK    A6
     CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 37, entrypoint =     0H, number of bytes = 18
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F3C 0026                MOVE.W  #0026H,-(A7)
     CH        4E4E                     TRAP    #E
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 38, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0027                MOVE.W  #0027H,-(A7)
     8H        4E4E                     TRAP    #E
     AH        4E5E                     UNLK    A6
     CH        4E75                     RTS
  checksum: o.k.

scmod end  checksum: o.k.
