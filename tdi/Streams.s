link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Streams, key =  2102H  F1DBH  1317H  checksum: o.k.

import GEMDOS, key =  2102H  CAC6H  6EBFH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 80
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        0C6E 0003 0012           CMPI.W  #0003H,0012(A6)
     AH        6408                     BCC     [08H] = 00000014H
     CH        422E 0014                CLR.B   0014(A6)
    10H        4E5E                     UNLK    A6
    12H        4E75                     RTS
    14H        426E FFFE                CLR.W   FFFE(A6)
    18H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    1CH        286E 000E                MOVE.L  000E(A6),A4
    20H        382E FFFE                MOVE.W  FFFE(A6),D4
    24H        266E 0008                MOVE.L  0008(A6),A3
    28H        1634 5000                MOVE.B  00H(A4,D5.W),D3
    2CH        B633 4000                CMP.B   00H(A3,D4.W),D3
    30H        6708                     BEQ     [08H] = 0000003AH
    32H        422E 0014                CLR.B   0014(A6)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
    3AH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    3EH        0C6E 0004 FFFE           CMPI.W  #0004H,FFFE(A6)
    44H        66D2                     BNE     [D2H] = 00000018H
    46H        1D7C 0001 0014           MOVE.B  #01H,0014(A6)
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 432
PROCEDURE OpenStream(VAR s: Stream; VAR filename: ARRAY CHAR; kind: StreamKinds; VAR result: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD0                LINK    A6,#FFD0H
     4H        426E FFD4                CLR.W   FFD4(A6)
     8H        3A2E FFD4                MOVE.W  FFD4(A6),D5
     CH        BA6E 0012                CMP.W   0012(A6),D5
    10H        623C                     BHI     [3CH] = 0000004EH
    12H        3A2E FFD4                MOVE.W  FFD4(A6),D5
    16H        286E 000E                MOVE.L  000E(A6),A4
    1AH        4A34 5000                TST.B   00H(A4,D5.W)
    1EH        672E                     BEQ     [2EH] = 0000004EH
    20H        3A2E FFD4                MOVE.W  FFD4(A6),D5
    24H        286E 000E                MOVE.L  000E(A6),A4
    28H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    2CH        0C04 0061                CMPI.B  #61H,D4
    30H        650A                     BCS     [0AH] = 0000003CH
    32H        0C04 007A                CMPI.B  #7AH,D4
    36H        6204                     BHI     [04H] = 0000003CH
    38H        0204 005F                ANDI.B  #5FH,D4
    3CH        3A2E FFD4                MOVE.W  FFD4(A6),D5
    40H        49EE FFD6                LEA     FFD6(A6),A4
    44H        1984 5000                MOVE.B  D4,00H(A4,D5.W)
    48H        526E FFD4                ADDQ.W  #1,FFD4(A6)
    4CH        60BA                     BRA     [BAH] = 00000008H
    4EH        3A2E FFD4                MOVE.W  FFD4(A6),D5
    52H        49EE FFD6                LEA     FFD6(A6),A4
    56H        4234 5000                CLR.B   00H(A4,D5.W)
    5AH        286E 0008                MOVE.L  0008(A6),A4
    5EH        4254                     CLR.W   (A4)
    60H        286E 0014                MOVE.L  0014(A6),A4
    64H        397C FFFF 0002           MOVE.W  #FFFFH,0002(A4)
    6AH        2F0C                     MOVE.L  A4,-(A7)
    6CH        558F                     SUBQ.L  #2,A7
    6EH        3F3C 0029                MOVE.W  #0029H,-(A7)
    72H        486E FFD6                PEA     FFD6(A6)
    76H        3F3C 0003                MOVE.W  #0003H,-(A7)
    7AH        4879 0000 0000           PEA     00000000H
    80H        6100 0000                BSR     [0000H] = 00000082H
    84H        4FEF 000C                LEA     000C(A7),A7
    88H        1A1F                     MOVE.B  (A7)+,D5
    8AH        285F                     MOVE.L  (A7)+,A4
    8CH        4A05                     TST.B   D5
    8EH        6708                     BEQ     [08H] = 00000098H
    90H        422C 0008                CLR.B   0008(A4)
    94H        4EFA 0112                JMP     [0112H] = 000001A8H
    98H        2F0C                     MOVE.L  A4,-(A7)
    9AH        558F                     SUBQ.L  #2,A7
    9CH        3F3C 0029                MOVE.W  #0029H,-(A7)
    A0H        486E FFD6                PEA     FFD6(A6)
    A4H        3F3C 0003                MOVE.W  #0003H,-(A7)
    A8H        4879 0000 0006           PEA     00000006H
    AEH        6100 0000                BSR     [0000H] = 000000B0H
    B2H        4FEF 000C                LEA     000C(A7),A7
    B6H        1A1F                     MOVE.B  (A7)+,D5
    B8H        285F                     MOVE.L  (A7)+,A4
    BAH        4A05                     TST.B   D5
    BCH        670A                     BEQ     [0AH] = 000000C8H
    BEH        197C 0002 0008           MOVE.B  #02H,0008(A4)
    C4H        4EFA 00E2                JMP     [00E2H] = 000001A8H
    C8H        2F0C                     MOVE.L  A4,-(A7)
    CAH        558F                     SUBQ.L  #2,A7
    CCH        3F3C 0029                MOVE.W  #0029H,-(A7)
    D0H        486E FFD6                PEA     FFD6(A6)
    D4H        3F3C 0003                MOVE.W  #0003H,-(A7)
    D8H        4879 0000 000C           PEA     0000000CH
    DEH        6100 0000                BSR     [0000H] = 000000E0H
    E2H        4FEF 000C                LEA     000C(A7),A7
    E6H        1A1F                     MOVE.B  (A7)+,D5
    E8H        285F                     MOVE.L  (A7)+,A4
    EAH        4A05                     TST.B   D5
    ECH        670A                     BEQ     [0AH] = 000000F8H
    EEH        197C 0001 0008           MOVE.B  #01H,0008(A4)
    F4H        4EFA 00B2                JMP     [00B2H] = 000001A8H
    F8H        197C 0003 0008           MOVE.B  #03H,0008(A4)
    FEH        4A2E 000C                TST.B   000C(A6)
   102H        6656                     BNE     [56H] = 0000015AH
   104H        2F0C                     MOVE.L  A4,-(A7)
   106H        3F3C 0029                MOVE.W  #0029H,-(A7)
   10AH        486E FFD6                PEA     FFD6(A6)
   10EH        4267                     CLR.W   -(A7)
   110H        486C 0002                PEA     0002(A4)
   114H        4EB9 0000 0000           JSR     GEMDOS.Open
   11AH        4FEF 000C                LEA     000C(A7),A7
   11EH        285F                     MOVE.L  (A7)+,A4
   120H        2F0C                     MOVE.L  A4,-(A7)
   122H        42A7                     CLR.L   -(A7)
   124H        3F2C 0002                MOVE.W  0002(A4),-(A7)
   128H        1F3C 0002                MOVE.B  #02H,-(A7)
   12CH        486C 0004                PEA     0004(A4)
   130H        4EB9 0000 0000           JSR     GEMDOS.Seek
   136H        4FEF 000C                LEA     000C(A7),A7
   13AH        285F                     MOVE.L  (A7)+,A4
   13CH        2F0C                     MOVE.L  A4,-(A7)
   13EH        42A7                     CLR.L   -(A7)
   140H        3F2C 0002                MOVE.W  0002(A4),-(A7)
   144H        4227                     CLR.B   -(A7)
   146H        486E FFD0                PEA     FFD0(A6)
   14AH        4EB9 0000 0000           JSR     GEMDOS.Seek
   150H        4FEF 000C                LEA     000C(A7),A7
   154H        285F                     MOVE.L  (A7)+,A4
   156H        4EFA 0042                JMP     [0042H] = 0000019AH
   15AH        2F0C                     MOVE.L  A4,-(A7)
   15CH        3F3C 0029                MOVE.W  #0029H,-(A7)
   160H        486E FFD6                PEA     FFD6(A6)
   164H        3F3C 0002                MOVE.W  #0002H,-(A7)
   168H        486C 0002                PEA     0002(A4)
   16CH        4EB9 0000 0000           JSR     GEMDOS.Open
   172H        4FEF 000C                LEA     000C(A7),A7
   176H        285F                     MOVE.L  (A7)+,A4
   178H        4A6C 0002                TST.W   0002(A4)
   17CH        6C1C                     BGE     [1CH] = 0000019AH
   17EH        2F0C                     MOVE.L  A4,-(A7)
   180H        3F3C 0029                MOVE.W  #0029H,-(A7)
   184H        486E FFD6                PEA     FFD6(A6)
   188H        4267                     CLR.W   -(A7)
   18AH        486C 0002                PEA     0002(A4)
   18EH        4EB9 0000 0000           JSR     GEMDOS.Create
   194H        4FEF 000C                LEA     000C(A7),A7
   198H        285F                     MOVE.L  (A7)+,A4
   19AH        4A6C 0002                TST.W   0002(A4)
   19EH        6C08                     BGE     [08H] = 000001A8H
   1A0H        266E 0008                MOVE.L  0008(A6),A3
   1A4H        36AC 0002                MOVE.W  0002(A4),(A3)
   1A8H        422C 0001                CLR.B   0001(A4)
   1ACH        4E5E                     UNLK    A6
   1AEH        4E75                     RTS
  checksum: o.k.

ref own string: at    7CH  checksum: o.k.

ref own quick call at    82H, procnum = 18  checksum: o.k.

ref own string: at    AAH  checksum: o.k.

ref own quick call at    B0H, procnum = 18  checksum: o.k.

ref own string: at    DAH  checksum: o.k.

ref own quick call at    E0H, procnum = 18  checksum: o.k.

ref ext proc call at   116H, procnum = 34, modnum =  2  checksum: o.k.

ref ext proc call at   132H, procnum = 39, modnum =  2  checksum: o.k.

ref ext proc call at   14CH, procnum = 39, modnum =  2  checksum: o.k.

ref ext proc call at   16EH, procnum = 34, modnum =  2  checksum: o.k.

ref ext proc call at   190H, procnum = 33, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 56
PROCEDURE CloseStream(VAR s: Stream; VAR result: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4254                     CLR.W   (A4)
     AH        286E 000C                MOVE.L  000C(A6),A4
     EH        0C2C 0003 0008           CMPI.B  #03H,0008(A4)
    14H        661E                     BNE     [1EH] = 00000034H
    16H        558F                     SUBQ.L  #2,A7
    18H        286E 000C                MOVE.L  000C(A6),A4
    1CH        3F2C 0002                MOVE.W  0002(A4),-(A7)
    20H        4EB9 0000 0000           JSR     GEMDOS.Close
    26H        548F                     ADDQ.L  #2,A7
    28H        4A1F                     TST.B   (A7)+
    2AH        6608                     BNE     [08H] = 00000034H
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        38BC FFFF                MOVE.W  #FFFFH,(A4)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    22H, procnum = 35, modnum =  2  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 72
PROCEDURE Write8Bit(s: Stream; v: BYTE);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        2D6E 0008 FFFA           MOVE.L  0008(A6),FFFA(A6)
     AH        3D7C 0001 FFFE           MOVE.W  #0001H,FFFE(A6)
    10H        3A2E 000C                MOVE.W  000C(A6),D5
    14H        3F05                     MOVE.W  D5,-(A7)
    16H        302E FFFE                MOVE.W  FFFE(A6),D0
    1AH        B057                     CMP.W   (A7),D0
    1CH        6304                     BLS     [04H] = 00000022H
    1EH        4EFA 0022                JMP     [0022H] = 00000042H
    22H        286E FFFA                MOVE.L  FFFA(A6),A4
    26H        1F14                     MOVE.B  (A4),-(A7)
    28H        286E 000E                MOVE.L  000E(A6),A4
    2CH        4E94                     JSR     (A4)
    2EH        548F                     ADDQ.L  #2,A7
    30H        52AE FFFA                ADDQ.L  #1,FFFA(A6)
    34H        302E FFFE                MOVE.W  FFFE(A6),D0
    38H        B057                     CMP.W   (A7),D0
    3AH        6406                     BCC     [06H] = 00000042H
    3CH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    40H        60E0                     BRA     [E0H] = 00000022H
    42H        548F                     ADDQ.L  #2,A7
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 174
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7A00                     MOVEQ   #00H,D5
    14H        1A2E FFFE                MOVE.B  FFFE(A6),D5
    18H        2005                     MOVE.L  D5,D0
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        0000 0000                ORI.B   #00H,D0
    24H        0000 0003                ORI.B   #03H,D0
    28H        0000 0082                ORI.B   #82H,D0
    2CH        7A00                     MOVEQ   #00H,D5
    2EH        3A2E 000C                MOVE.W  000C(A6),D5
    32H        2D45 FFF2                MOVE.L  D5,FFF2(A6)
    36H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    3AH        486E FFF2                PEA     FFF2(A6)
    3EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    42H        4EB9 0000 0000           JSR     GEMDOS.Write
    48H        4FEF 000A                LEA     000A(A7),A7
    4CH        4EFA 005C                JMP     [005CH] = 000000AAH
    50H        2F3C 0000 0000           MOVE.L  #GEMDOS.PrnOut,-(A7)
    56H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    5AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 000A                LEA     000A(A7),A7
    66H        4EFA 0042                JMP     [0042H] = 000000AAH
    6AH        2F3C 0000 0000           MOVE.L  #GEMDOS.ConOut,-(A7)
    70H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    74H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    78H        6100 0000                BSR     [0000H] = 0000007AH
    7CH        4FEF 000A                LEA     000A(A7),A7
    80H        4EFA 0028                JMP     [0028H] = 000000AAH
    84H        2F3C 0000 0000           MOVE.L  #GEMDOS.AuxOut,-(A7)
    8AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    8EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    92H        6100 0000                BSR     [0000H] = 00000094H
    96H        4FEF 000A                LEA     000A(A7),A7
    9AH        4EFA 000E                JMP     [000EH] = 000000AAH
    9EH        4EFA 000A                JMP     [000AH] = 000000AAH
    A2H        004A 0064                MOVEP.L 0064H(A2),D0
    A6H        0030 000C 4E5E           ORI.B   #0CH,5EH(A0,D4.L)
    ACH        4E75                     RTS
  checksum: o.k.

ref util: at    1CH, procnum =  1  checksum: o.k.

ref ext proc call at    44H, procnum = 37, modnum =  2  checksum: o.k.

ref ext proc ass at    52H, procnum =  7, modnum =  2  checksum: o.k.

ref own quick call at    60H, procnum = 20  checksum: o.k.

ref ext proc ass at    6CH, procnum =  4, modnum =  2  checksum: o.k.

ref own quick call at    7AH, procnum = 20  checksum: o.k.

ref ext proc ass at    86H, procnum =  6, modnum =  2  checksum: o.k.

ref own quick call at    94H, procnum = 20  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 46
PROCEDURE Write8Bit(s: Stream; v: BYTE);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        49EE 0008                LEA     0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 19  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 46
Write16Bit(s: Stream; v: WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0002                MOVE.W  #0002H,-(A7)
    1AH        49EE 0008                LEA     0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 19  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 46
Write32Bit(s: Stream; v: LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0004                MOVE.W  #0004H,-(A7)
    1AH        49EE 0008                LEA     0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 19  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 62
Write8BitBack(s: Stream; v: BYTE);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFF                     MOVEQ   #FFH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    34H        6100 0000                BSR     Write8Bit
    38H        5C8F                     ADDQ.L  #6,A7
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    36H, procnum =  3  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 62
Write16BitBack(s: Stream; v: WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFE                     MOVEQ   #FEH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    34H        6100 0000                BSR     Write16Bit
    38H        5C8F                     ADDQ.L  #6,A7
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    36H, procnum =  4  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 62
Write32BitBack(s: Stream; v: LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFC                     MOVEQ   #FCH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    34H        6100 0000                BSR     Write32Bit
    38H        508F                     ADDQ.L  #8,A7
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    36H, procnum =  5  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 78
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        2D6E 0008 FFFA           MOVE.L  0008(A6),FFFA(A6)
     AH        3D7C 0001 FFFE           MOVE.W  #0001H,FFFE(A6)
    10H        3A2E 000C                MOVE.W  000C(A6),D5
    14H        3F05                     MOVE.W  D5,-(A7)
    16H        302E FFFE                MOVE.W  FFFE(A6),D0
    1AH        B057                     CMP.W   (A7),D0
    1CH        6304                     BLS     [04H] = 00000022H
    1EH        4EFA 0028                JMP     [0028H] = 00000048H
    22H        486E FFF9                PEA     FFF9(A6)
    26H        286E 000E                MOVE.L  000E(A6),A4
    2AH        4E94                     JSR     (A4)
    2CH        588F                     ADDQ.L  #4,A7
    2EH        286E FFFA                MOVE.L  FFFA(A6),A4
    32H        18AE FFF9                MOVE.B  FFF9(A6),(A4)
    36H        52AE FFFA                ADDQ.L  #1,FFFA(A6)
    3AH        302E FFFE                MOVE.W  FFFE(A6),D0
    3EH        B057                     CMP.W   (A7),D0
    40H        6406                     BCC     [06H] = 00000048H
    42H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    46H        60DA                     BRA     [DAH] = 00000022H
    48H        548F                     ADDQ.L  #2,A7
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 152
PROCEDURE ReadBytes(s: Stream; count: CARDINAL; adr: ADDRESS);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7A00                     MOVEQ   #00H,D5
    14H        1A2E FFFE                MOVE.B  FFFE(A6),D5
    18H        2005                     MOVE.L  D5,D0
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        0000 0000                ORI.B   #00H,D0
    24H        0000 0003                ORI.B   #03H,D0
    28H        0000 006C                ORI.B   #6CH,D0
    2CH        7A00                     MOVEQ   #00H,D5
    2EH        3A2E 000C                MOVE.W  000C(A6),D5
    32H        2D45 FFF2                MOVE.L  D5,FFF2(A6)
    36H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    3AH        486E FFF2                PEA     FFF2(A6)
    3EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    42H        4EB9 0000 0000           JSR     GEMDOS.Read
    48H        4FEF 000A                LEA     000A(A7),A7
    4CH        4EFA 0046                JMP     [0046H] = 00000094H
    50H        4EFA 0042                JMP     [0042H] = 00000094H
    54H        2F3C 0000 0000           MOVE.L  #GEMDOS.ConIn,-(A7)
    5AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    5EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    62H        6100 0000                BSR     [0000H] = 00000064H
    66H        4FEF 000A                LEA     000A(A7),A7
    6AH        4EFA 0028                JMP     [0028H] = 00000094H
    6EH        2F3C 0000 0000           MOVE.L  #GEMDOS.AuxIn,-(A7)
    74H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    78H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    7CH        6100 0000                BSR     [0000H] = 0000007EH
    80H        4FEF 000A                LEA     000A(A7),A7
    84H        4EFA 000E                JMP     [000EH] = 00000094H
    88H        4EFA 000A                JMP     [000AH] = 00000094H
    8CH        0034 004E 0030           ORI.B   #4EH,30H(A4,D0.W)
    92H        000C 4E5E                MOVEP.W 4E5EH(A4),D0
    96H        4E75                     RTS
  checksum: o.k.

ref util: at    1CH, procnum =  1  checksum: o.k.

ref ext proc call at    44H, procnum = 36, modnum =  2  checksum: o.k.

ref ext proc ass at    56H, procnum =  2, modnum =  2  checksum: o.k.

ref own quick call at    64H, procnum = 22  checksum: o.k.

ref ext proc ass at    70H, procnum =  5, modnum =  2  checksum: o.k.

ref own quick call at    7EH, procnum = 22  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 46
PROCEDURE Read8Bit(s: Stream; VAR v: BYTE);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     ReadBytes
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 21  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 46
PROCEDURE Read16Bit(s: Stream; VAR v: WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0002                MOVE.W  #0002H,-(A7)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     ReadBytes
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 21  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 46
PROCEDURE Read32Bit(s: Stream; VAR v: LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        486E FFF6                PEA     FFF6(A6)
    16H        3F3C 0004                MOVE.W  #0004H,-(A7)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        2F05                     MOVE.L  D5,-(A7)
    22H        6100 0000                BSR     ReadBytes
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    24H, procnum = 21  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 90
PROCEDURE Read8BitBack(s: Stream; VAR v: BYTE);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFF                     MOVEQ   #FFH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        286E 0008                MOVE.L  0008(A6),A4
    34H        4854                     PEA     (A4)
    36H        6100 0000                BSR     Read8Bit
    3AH        508F                     ADDQ.L  #8,A7
    3CH        7AFF                     MOVEQ   #FFH,D5
    3EH        2F05                     MOVE.L  D5,-(A7)
    40H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    44H        1F3C 0001                MOVE.B  #01H,-(A7)
    48H        486E FFF2                PEA     FFF2(A6)
    4CH        4EB9 0000 0000           JSR     GEMDOS.Seek
    52H        4FEF 000C                LEA     000C(A7),A7
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    38H, procnum =  9  checksum: o.k.

ref ext proc call at    4EH, procnum = 39, modnum =  2  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 90
Read16BitBack(s: Stream; VAR v: WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFE                     MOVEQ   #FEH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        286E 0008                MOVE.L  0008(A6),A4
    34H        4854                     PEA     (A4)
    36H        6100 0000                BSR     Read16Bit
    3AH        508F                     ADDQ.L  #8,A7
    3CH        7AFE                     MOVEQ   #FEH,D5
    3EH        2F05                     MOVE.L  D5,-(A7)
    40H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    44H        1F3C 0001                MOVE.B  #01H,-(A7)
    48H        486E FFF2                PEA     FFF2(A6)
    4CH        4EB9 0000 0000           JSR     GEMDOS.Seek
    52H        4FEF 000C                LEA     000C(A7),A7
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    38H, procnum = 10  checksum: o.k.

ref ext proc call at    4EH, procnum = 39, modnum =  2  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 90
Read32BitBack(s: Stream; VAR v: LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        7AFC                     MOVEQ   #FCH,D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        1F3C 0001                MOVE.B  #01H,-(A7)
    1EH        486E FFF2                PEA     FFF2(A6)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        486E FFF6                PEA     FFF6(A6)
    30H        286E 0008                MOVE.L  0008(A6),A4
    34H        4854                     PEA     (A4)
    36H        6100 0000                BSR     Read32Bit
    3AH        508F                     ADDQ.L  #8,A7
    3CH        7AFC                     MOVEQ   #FCH,D5
    3EH        2F05                     MOVE.L  D5,-(A7)
    40H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    44H        1F3C 0001                MOVE.B  #01H,-(A7)
    48H        486E FFF2                PEA     FFF2(A6)
    4CH        4EB9 0000 0000           JSR     GEMDOS.Seek
    52H        4FEF 000C                LEA     000C(A7),A7
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

ref own quick call at    38H, procnum = 11  checksum: o.k.

ref ext proc call at    4EH, procnum = 39, modnum =  2  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 48
GetPos(s: Stream; VAR v: LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        42A7                     CLR.L   -(A7)
    14H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    18H        1F3C 0001                MOVE.B  #01H,-(A7)
    1CH        286E 0008                MOVE.L  0008(A6),A4
    20H        4854                     PEA     (A4)
    22H        4EB9 0000 0000           JSR     GEMDOS.Seek
    28H        4FEF 000C                LEA     000C(A7),A7
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    24H, procnum = 39, modnum =  2  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 46
SetPos(s: Stream; v: LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    16H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    1AH        4227                     CLR.B   -(A7)
    1CH        486E 0008                PEA     0008(A6)
    20H        4EB9 0000 0000           JSR     GEMDOS.Seek
    26H        4FEF 000C                LEA     000C(A7),A7
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    22H, procnum = 39, modnum =  2  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 82
PROCEDURE EOS(s: Stream) : BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF6                LEA     FFF6(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        36DC                     MOVE.W  (A4)+,(A3)+
    12H        0C2E 0003 FFFE           CMPI.B  #03H,FFFE(A6)
    18H        6630                     BNE     [30H] = 0000004AH
    1AH        42A7                     CLR.L   -(A7)
    1CH        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
    20H        1F3C 0001                MOVE.B  #01H,-(A7)
    24H        486E FFF2                PEA     FFF2(A6)
    28H        4EB9 0000 0000           JSR     GEMDOS.Seek
    2EH        4FEF 000C                LEA     000C(A7),A7
    32H        2A2E FFF2                MOVE.L  FFF2(A6),D5
    36H        BAAE FFFA                CMP.L   FFFA(A6),D5
    3AH        54C5                     SCC     D5
    3CH        4405                     NEG.B   D5
    3EH        1D45 000C                MOVE.B  D5,000C(A6)
    42H        4E5E                     UNLK    A6
    44H        4E75                     RTS
    46H        4EFA 000A                JMP     [000AH] = 00000052H
    4AH        422E 000C                CLR.B   000C(A6)
    4EH        4E5E                     UNLK    A6
    50H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    2AH, procnum = 39, modnum =  2  checksum: o.k.

string data:, number of bytes = 18
NO DECODE -------- DATA

     0H         434F     4E3A     0000     5052     4E3A     
     AH         0000     4155     583A     0000       checksum: o.k.

scmod end  checksum: o.k.
