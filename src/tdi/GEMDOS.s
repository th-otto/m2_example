link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMDOS, key =  2102H  CAC6H  6EBFH  checksum: o.k.

data size, number of bytes = 12  checksum: o.k.

proc code, procnum = 52, entrypoint =     0H, number of bytes = 20
trap_1_w
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        4E41                     TRAP    #1
     AH        2A00                     MOVE.L  D0,D5
     CH        2D45 000A                MOVE.L  D5,000A(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 53, entrypoint =     0H, number of bytes = 24
trap_1_ww
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        4E41                     TRAP    #1
     EH        2A00                     MOVE.L  D0,D5
    10H        2D45 000C                MOVE.L  D5,000C(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 54, entrypoint =     0H, number of bytes = 32
trap_1_wwll
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     CH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    10H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    14H        4E41                     TRAP    #1
    16H        2A00                     MOVE.L  D0,D5
    18H        2D45 0014                MOVE.L  D5,0014(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 55, entrypoint =     0H, number of bytes = 36
trap_1_wwlll
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     CH        2F2E 0010                MOVE.L  0010(A6),-(A7)
    10H        3F2E 0014                MOVE.W  0014(A6),-(A7)
    14H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    18H        4E41                     TRAP    #1
    1AH        2A00                     MOVE.L  D0,D5
    1CH        2D45 0018                MOVE.L  D5,0018(A6)
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 56, entrypoint =     0H, number of bytes = 24
trap_1_wl
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        4E41                     TRAP    #1
     EH        2A00                     MOVE.L  D0,D5
    10H        2D45 000E                MOVE.L  D5,000E(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 57, entrypoint =     0H, number of bytes = 28
trap_1_wlw
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        2F2E 000A                MOVE.L  000A(A6),-(A7)
     CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    10H        4E41                     TRAP    #1
    12H        2A00                     MOVE.L  D0,D5
    14H        2D45 0010                MOVE.L  D5,0010(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 58, entrypoint =     0H, number of bytes = 32
trap_1_wlww
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     8H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     CH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    10H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    14H        4E41                     TRAP    #1
    16H        2A00                     MOVE.L  D0,D5
    18H        2D45 0012                MOVE.L  D5,0012(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 22
OldTerm
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        4267                     CLR.W   -(A7)
     8H        6100 0000                BSR     [0000H] = 0000000AH
     CH        548F                     ADDQ.L  #2,A7
     EH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

ref own quick call at     AH, procnum = 52  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 28
ConIn
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0001                MOVE.W  #0001H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        1885                     MOVE.B  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 48
ConScanIn
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0001                MOVE.W  #0001H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    14H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    18H        286E 000C                MOVE.L  000C(A6),A4
    1CH        1885                     MOVE.B  D5,(A4)
    1EH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    22H        7810                     MOVEQ   #10H,D4
    24H        E8AD                     LSR.L   D4,D5
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        1885                     MOVE.B  D5,(A4)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 32
ConOut
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0002                MOVE.W  #0002H,-(A7)
     AH        7A00                     MOVEQ   #00H,D5
     CH        1A2E 0008                MOVE.B  0008(A6),D5
    10H        3F05                     MOVE.W  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        588F                     ADDQ.L  #4,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 53  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 28
AuxIn
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0003                MOVE.W  #0003H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        1885                     MOVE.B  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 32
AuxOut
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0004                MOVE.W  #0004H,-(A7)
     AH        7A00                     MOVEQ   #00H,D5
     CH        1A2E 0008                MOVE.B  0008(A6),D5
    10H        3F05                     MOVE.W  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        588F                     ADDQ.L  #4,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 53  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 32
PrnOut
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0005                MOVE.W  #0005H,-(A7)
     AH        7A00                     MOVEQ   #00H,D5
     CH        1A2E 0008                MOVE.B  0008(A6),D5
    10H        3F05                     MOVE.W  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        588F                     ADDQ.L  #4,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 53  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 68
RawIO
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        4A2E 0008                TST.B   0008(A6)
     8H        661C                     BNE     [1CH] = 00000026H
     AH        598F                     SUBQ.L  #4,A7
     CH        3F3C 0006                MOVE.W  #0006H,-(A7)
    10H        3F3C 00FF                MOVE.W  #00FFH,-(A7)
    14H        6100 0000                BSR     [0000H] = 00000016H
    18H        588F                     ADDQ.L  #4,A7
    1AH        2A1F                     MOVE.L  (A7)+,D5
    1CH        286E 000A                MOVE.L  000A(A6),A4
    20H        1885                     MOVE.B  D5,(A4)
    22H        4EFA 001C                JMP     [001CH] = 00000040H
    26H        286E 000A                MOVE.L  000A(A6),A4
    2AH        1014                     MOVE.B  (A4),D0
    2CH        598F                     SUBQ.L  #4,A7
    2EH        3F3C 0006                MOVE.W  #0006H,-(A7)
    32H        4267                     CLR.W   -(A7)
    34H        6100 0000                BSR     [0000H] = 00000036H
    38H        588F                     ADDQ.L  #4,A7
    3AH        2A1F                     MOVE.L  (A7)+,D5
    3CH        1D45 FFFF                MOVE.B  D5,FFFF(A6)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref own quick call at    16H, procnum = 53  checksum: o.k.

ref own quick call at    36H, procnum = 53  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 28
RawIn
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0007                MOVE.W  #0007H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        1885                     MOVE.B  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 48
RawScanIn
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0007                MOVE.W  #0007H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    14H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    18H        286E 000C                MOVE.L  000C(A6),A4
    1CH        1885                     MOVE.B  D5,(A4)
    1EH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    22H        7810                     MOVEQ   #10H,D4
    24H        E8AD                     LSR.L   D4,D5
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        1885                     MOVE.B  D5,(A4)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 28
NecIn
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0008                MOVE.W  #0008H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        1885                     MOVE.B  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 32
ConWS
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0009                MOVE.W  #0009H,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 32
ConRS
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 000A                MOVE.W  #000AH,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 30
ConIS
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 000B                MOVE.W  #000BH,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        4A9F                     TST.L   (A7)+
    12H        56C5                     SNE     D5
    14H        4405                     NEG.B   D5
    16H        1D45 0008                MOVE.B  D5,0008(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 30
SetDrv
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 000E                MOVE.W  #000EH,-(A7)
     AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        588F                     ADDQ.L  #4,A7
    14H        286E 0008                MOVE.L  0008(A6),A4
    18H        289F                     MOVE.L  (A7)+,(A4)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 53  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 30
ConOS
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0010                MOVE.W  #0010H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        4A9F                     TST.L   (A7)+
    12H        56C5                     SNE     D5
    14H        4405                     NEG.B   D5
    16H        1D45 0008                MOVE.B  D5,0008(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 30
PrnOS
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0011                MOVE.W  #0011H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        4A9F                     TST.L   (A7)+
    12H        56C5                     SNE     D5
    14H        4405                     NEG.B   D5
    16H        1D45 0008                MOVE.B  D5,0008(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 30
AuxIS
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0012                MOVE.W  #0012H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        4A9F                     TST.L   (A7)+
    12H        56C5                     SNE     D5
    14H        4405                     NEG.B   D5
    16H        1D45 0008                MOVE.B  D5,0008(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 30
AuxOS
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0013                MOVE.W  #0013H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        4A9F                     TST.L   (A7)+
    12H        56C5                     SNE     D5
    14H        4405                     NEG.B   D5
    16H        1D45 0008                MOVE.B  D5,0008(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 28
GetDrv
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0019                MOVE.W  #0019H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        3885                     MOVE.W  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 28
SetDTA
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 001A                MOVE.W  #001AH,-(A7)
     AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 56  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 28
GetDate
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 002A                MOVE.W  #002AH,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        3885                     MOVE.W  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 28
SetDate
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 002B                MOVE.W  #002BH,-(A7)
     AH        3F2E 0008                MOVE.W  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        588F                     ADDQ.L  #4,A7
    14H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 53  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 28
GetTime
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 002C                MOVE.W  #002CH,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        3885                     MOVE.W  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 28
SetTime
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 002D                MOVE.W  #002DH,-(A7)
     AH        3F2E 0008                MOVE.W  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        588F                     ADDQ.L  #4,A7
    14H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 53  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 26
GetDTA
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 002F                MOVE.W  #002FH,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        286E 0008                MOVE.L  0008(A6),A4
    14H        289F                     MOVE.L  (A7)+,(A4)
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 28
Version
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0030                MOVE.W  #0030H,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        3885                     MOVE.W  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 32
TermRes
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0031                MOVE.W  #0031H,-(A7)
     AH        2F2E 000A                MOVE.L  000A(A6),-(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 57  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 36
DFree
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0036                MOVE.W  #0036H,-(A7)
     AH        286E 000A                MOVE.L  000A(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
  checksum: o.k.

ref own quick call at    18H, procnum = 57  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 38
DirCreate
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0039                MOVE.W  #0039H,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        4A9F                     TST.L   (A7)+
    1AH        57C5                     SEQ     D5
    1CH        4405                     NEG.B   D5
    1EH        1D45 000E                MOVE.B  D5,000E(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 38
DirDelete
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003A                MOVE.W  #003AH,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        4A9F                     TST.L   (A7)+
    1AH        57C5                     SEQ     D5
    1CH        4405                     NEG.B   D5
    1EH        1D45 000E                MOVE.B  D5,000E(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 38
SetPath
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003B                MOVE.W  #003BH,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        4A9F                     TST.L   (A7)+
    1AH        57C5                     SEQ     D5
    1CH        4405                     NEG.B   D5
    1EH        1D45 000E                MOVE.B  D5,000E(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 40
Create
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003C                MOVE.W  #003CH,-(A7)
     AH        286E 000E                MOVE.L  000E(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        2A1F                     MOVE.L  (A7)+,D5
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        3885                     MOVE.W  D5,(A4)
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref own quick call at    18H, procnum = 57  checksum: o.k.

proc code, procnum = 34, entrypoint =     0H, number of bytes = 40
Open
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003D                MOVE.W  #003DH,-(A7)
     AH        286E 000E                MOVE.L  000E(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        2A1F                     MOVE.L  (A7)+,D5
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        3885                     MOVE.W  D5,(A4)
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref own quick call at    18H, procnum = 57  checksum: o.k.

proc code, procnum = 35, entrypoint =     0H, number of bytes = 34
Close
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003E                MOVE.W  #003EH,-(A7)
     AH        3F2E 0008                MOVE.W  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        588F                     ADDQ.L  #4,A7
    14H        4A9F                     TST.L   (A7)+
    16H        57C5                     SEQ     D5
    18H        4405                     NEG.B   D5
    1AH        1D45 000A                MOVE.B  D5,000A(A6)
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 53  checksum: o.k.

proc code, procnum = 36, entrypoint =     0H, number of bytes = 42
Read
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 003F                MOVE.W  #003FH,-(A7)
     AH        3F2E 0010                MOVE.W  0010(A6),-(A7)
     EH        286E 000C                MOVE.L  000C(A6),A4
    12H        2F14                     MOVE.L  (A4),-(A7)
    14H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    18H        6100 0000                BSR     [0000H] = 0000001AH
    1CH        4FEF 000C                LEA     000C(A7),A7
    20H        286E 000C                MOVE.L  000C(A6),A4
    24H        289F                     MOVE.L  (A7)+,(A4)
    26H        4E5E                     UNLK    A6
    28H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1AH, procnum = 54  checksum: o.k.

proc code, procnum = 37, entrypoint =     0H, number of bytes = 42
Write
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0040                MOVE.W  #0040H,-(A7)
     AH        3F2E 0010                MOVE.W  0010(A6),-(A7)
     EH        286E 000C                MOVE.L  000C(A6),A4
    12H        2F14                     MOVE.L  (A4),-(A7)
    14H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    18H        6100 0000                BSR     [0000H] = 0000001AH
    1CH        4FEF 000C                LEA     000C(A7),A7
    20H        286E 000C                MOVE.L  000C(A6),A4
    24H        289F                     MOVE.L  (A7)+,(A4)
    26H        4E5E                     UNLK    A6
    28H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1AH, procnum = 54  checksum: o.k.

proc code, procnum = 38, entrypoint =     0H, number of bytes = 38
Delete
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0041                MOVE.W  #0041H,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        4A9F                     TST.L   (A7)+
    1AH        57C5                     SEQ     D5
    1CH        4405                     NEG.B   D5
    1EH        1D45 000E                MOVE.B  D5,000E(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 56  checksum: o.k.

proc code, procnum = 39, entrypoint =     0H, number of bytes = 44
Seek
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0042                MOVE.W  #0042H,-(A7)
     AH        2F2E 0010                MOVE.L  0010(A6),-(A7)
     EH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    12H        7A00                     MOVEQ   #00H,D5
    14H        1A2E 000C                MOVE.B  000C(A6),D5
    18H        3F05                     MOVE.W  D5,-(A7)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        289F                     MOVE.L  (A7)+,(A4)
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum = 58  checksum: o.k.

proc code, procnum = 40, entrypoint =     0H, number of bytes = 92
Attrib
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        4A2E 000C                TST.B   000C(A6)
     8H        6628                     BNE     [28H] = 00000032H
     AH        598F                     SUBQ.L  #4,A7
     CH        3F3C 0043                MOVE.W  #0043H,-(A7)
    10H        286E 000E                MOVE.L  000E(A6),A4
    14H        2A0C                     MOVE.L  A4,D5
    16H        2F05                     MOVE.L  D5,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        286E 0008                MOVE.L  0008(A6),A4
    20H        3F14                     MOVE.W  (A4),-(A7)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    2EH        4EFA 0028                JMP     [0028H] = 00000058H
    32H        598F                     SUBQ.L  #4,A7
    34H        3F3C 0043                MOVE.W  #0043H,-(A7)
    38H        286E 000E                MOVE.L  000E(A6),A4
    3CH        2A0C                     MOVE.L  A4,D5
    3EH        2F05                     MOVE.L  D5,-(A7)
    40H        4267                     CLR.W   -(A7)
    42H        286E 0008                MOVE.L  0008(A6),A4
    46H        3F14                     MOVE.W  (A4),-(A7)
    48H        6100 0000                BSR     [0000H] = 0000004AH
    4CH        4FEF 000A                LEA     000A(A7),A7
    50H        2A1F                     MOVE.L  (A7)+,D5
    52H        286E 0008                MOVE.L  0008(A6),A4
    56H        3885                     MOVE.W  D5,(A4)
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 58  checksum: o.k.

ref own quick call at    4AH, procnum = 58  checksum: o.k.

proc code, procnum = 41, entrypoint =     0H, number of bytes = 36
GetPath
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0047                MOVE.W  #0047H,-(A7)
     AH        286E 000A                MOVE.L  000A(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
  checksum: o.k.

ref own quick call at    18H, procnum = 57  checksum: o.k.

proc code, procnum = 42, entrypoint =     0H, number of bytes = 30
Alloc
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0048                MOVE.W  #0048H,-(A7)
     AH        2F2E 000C                MOVE.L  000C(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        286E 0008                MOVE.L  0008(A6),A4
    18H        289F                     MOVE.L  (A7)+,(A4)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 56  checksum: o.k.

proc code, procnum = 43, entrypoint =     0H, number of bytes = 34
Free
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0049                MOVE.W  #0049H,-(A7)
     AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        4A9F                     TST.L   (A7)+
    16H        57C5                     SEQ     D5
    18H        4405                     NEG.B   D5
    1AH        1D45 000C                MOVE.B  D5,000C(A6)
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 56  checksum: o.k.

proc code, procnum = 44, entrypoint =     0H, number of bytes = 42
Shrink
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 004A                MOVE.W  #004AH,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    10H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    14H        6100 0000                BSR     [0000H] = 00000016H
    18H        4FEF 000C                LEA     000C(A7),A7
    1CH        4A9F                     TST.L   (A7)+
    1EH        57C5                     SEQ     D5
    20H        4405                     NEG.B   D5
    22H        1D45 0010                MOVE.B  D5,0010(A6)
    26H        4E5E                     UNLK    A6
    28H        4E75                     RTS
  checksum: o.k.

ref own quick call at    16H, procnum = 54  checksum: o.k.

proc code, procnum = 45, entrypoint =     0H, number of bytes = 96
Exec
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        286E 0012                MOVE.L  0012(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        2F05                     MOVE.L  D5,-(A7)
    14H        286E 0018                MOVE.L  0018(A6),A4
    18H        2A0C                     MOVE.L  A4,D5
    1AH        2F05                     MOVE.L  D5,-(A7)
    1CH        7A00                     MOVEQ   #00H,D5
    1EH        1A2E 001E                MOVE.B  001E(A6),D5
    22H        3F05                     MOVE.W  D5,-(A7)
    24H        3F3C 004B                MOVE.W  #004BH,-(A7)
    28H        2A0D                     MOVE.L  A5,D5
    2AH        23C5 0000 0000           MOVE.L  D5,00000000H
    30H        2A0E                     MOVE.L  A6,D5
    32H        23C5 0000 0004           MOVE.L  D5,00000004H
    38H        2A0F                     MOVE.L  A7,D5
    3AH        23C5 0000 0008           MOVE.L  D5,00000008H
    40H        4E41                     TRAP    #1
    42H        2A79 0000 0000           MOVE.L  00000000H,A5
    48H        2C79 0000 0004           MOVE.L  00000004H,A6
    4EH        2E79 0000 0008           MOVE.L  00000008H,A7
    54H        2A00                     MOVE.L  D0,D5
    56H        286E 0008                MOVE.L  0008(A6),A4
    5AH        3885                     MOVE.W  D5,(A4)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    44H  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own data at    50H  checksum: o.k.

proc code, procnum = 46, entrypoint =     0H, number of bytes = 34
Term
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 004C                MOVE.W  #004CH,-(A7)
     AH        3F2E 0008                MOVE.W  0008(A6),-(A7)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        588F                     ADDQ.L  #4,A7
    14H        4A9F                     TST.L   (A7)+
    16H        57C5                     SEQ     D5
    18H        4405                     NEG.B   D5
    1AH        1D45 000A                MOVE.B  D5,000A(A6)
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 53  checksum: o.k.

proc code, procnum = 47, entrypoint =     0H, number of bytes = 40
SFirst
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 004E                MOVE.W  #004EH,-(A7)
     AH        286E 000E                MOVE.L  000E(A6),A4
     EH        2A0C                     MOVE.L  A4,D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        2A1F                     MOVE.L  (A7)+,D5
    1EH        286E 0008                MOVE.L  0008(A6),A4
    22H        3885                     MOVE.W  D5,(A4)
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref own quick call at    18H, procnum = 57  checksum: o.k.

proc code, procnum = 48, entrypoint =     0H, number of bytes = 28
SNext
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 004F                MOVE.W  #004FH,-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        548F                     ADDQ.L  #2,A7
    10H        2A1F                     MOVE.L  (A7)+,D5
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        3885                     MOVE.W  D5,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 52  checksum: o.k.

proc code, procnum = 49, entrypoint =     0H, number of bytes = 44
Rename
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0056                MOVE.W  #0056H,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        286E 000E                MOVE.L  000E(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        2F05                     MOVE.L  D5,-(A7)
    14H        286E 0008                MOVE.L  0008(A6),A4
    18H        2A0C                     MOVE.L  A4,D5
    1AH        2F05                     MOVE.L  D5,-(A7)
    1CH        6100 0000                BSR     [0000H] = 0000001EH
    20H        4FEF 000C                LEA     000C(A7),A7
    24H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    1EH, procnum = 54  checksum: o.k.

proc code, procnum = 50, entrypoint =     0H, number of bytes = 76
DaTime
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        4A2E 0008                TST.B   0008(A6)
     8H        6620                     BNE     [20H] = 0000002AH
     AH        598F                     SUBQ.L  #4,A7
     CH        3F3C 0057                MOVE.W  #0057H,-(A7)
    10H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    14H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    26H        4EFA 0020                JMP     [0020H] = 00000048H
    2AH        598F                     SUBQ.L  #4,A7
    2CH        3F3C 0057                MOVE.W  #0057H,-(A7)
    30H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    34H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    38H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        4FEF 000A                LEA     000A(A7),A7
    44H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum = 58  checksum: o.k.

ref own quick call at    3EH, procnum = 58  checksum: o.k.

proc code, procnum = 51, entrypoint =     0H, number of bytes = 32
Super
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        3F3C 0020                MOVE.W  #0020H,-(A7)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        2F14                     MOVE.L  (A4),-(A7)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        5C8F                     ADDQ.L  #6,A7
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        289F                     MOVE.L  (A7)+,(A4)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum = 56  checksum: o.k.

scmod end  checksum: o.k.
