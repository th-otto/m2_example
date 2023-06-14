link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  LongInOut, key =  2102H  F1CFH  79CFH  checksum: o.k.

import Conversions, key =  2102H  F1E3H  6E1CH, modnum =  2  checksum: o.k.

import InOut, key =  2102H  F1DDH  20A4H, modnum =  3  checksum: o.k.

data size, number of bytes = 2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        6214                     BHI     [14H] = 00000026H
    12H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4A34 5000                TST.B   00H(A4,D5.W)
    1EH        6706                     BEQ     [06H] = 00000026H
    20H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    24H        60E2                     BRA     [E2H] = 00000008H
    26H        3D6E FFFE 000E           MOVE.W  FFFE(A6),000E(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 100
PROCEDURE ReadLongInt(VAR LONGINT);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFDC                LINK    A6,#FFDCH
     4H        3F3C 001F                MOVE.W  #001FH,-(A7)
     8H        486E FFDC                PEA     FFDC(A6)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    1EH        4A39 0000 0000           TST.B   00000000H
    24H        673A                     BEQ     [3AH] = 00000060H
    26H        3F3C 001F                MOVE.W  #001FH,-(A7)
    2AH        486E FFDC                PEA     FFDC(A6)
    2EH        3F3C 000A                MOVE.W  #000AH,-(A7)
    32H        1F3C 0001                MOVE.B  #01H,-(A7)
    36H        2F3C 7FFF FFFF           MOVE.L  #7FFFFFFFH,-(A7)
    3CH        486E FFFC                PEA     FFFC(A6)
    40H        4879 0000 0000           PEA     00000000H
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        4FEF 0016                LEA     0016(A7),A7
    50H        4A39 0000 0000           TST.B   00000000H
    56H        6708                     BEQ     [08H] = 00000060H
    58H        286E 0008                MOVE.L  0008(A6),A4
    5CH        28AE FFFC                MOVE.L  FFFC(A6),(A4)
    60H        4E5E                     UNLK    A6
    62H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  8, modnum =  3  checksum: o.k.

ref ext data at    16H, modnum =  3  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref ext proc call at    48H, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    52H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 96
PROCEDURE ReadLongCard(VAR LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFDC                LINK    A6,#FFDCH
     4H        3F3C 001F                MOVE.W  #001FH,-(A7)
     8H        486E FFDC                PEA     FFDC(A6)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    1EH        4A39 0000 0000           TST.B   00000000H
    24H        6736                     BEQ     [36H] = 0000005CH
    26H        3F3C 001F                MOVE.W  #001FH,-(A7)
    2AH        486E FFDC                PEA     FFDC(A6)
    2EH        3F3C 000A                MOVE.W  #000AH,-(A7)
    32H        4227                     CLR.B   -(A7)
    34H        7AFF                     MOVEQ   #FFH,D5
    36H        2F05                     MOVE.L  D5,-(A7)
    38H        486E FFFC                PEA     FFFC(A6)
    3CH        4879 0000 0000           PEA     00000000H
    42H        4EB9 0000 0000           JSR     00000000H
    48H        4FEF 0016                LEA     0016(A7),A7
    4CH        4A39 0000 0000           TST.B   00000000H
    52H        6708                     BEQ     [08H] = 0000005CH
    54H        286E 0008                MOVE.L  0008(A6),A4
    58H        28AE FFFC                MOVE.L  FFFC(A6),(A4)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  8, modnum =  3  checksum: o.k.

ref ext data at    16H, modnum =  3  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref ext proc call at    44H, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    4EH  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 86
PROCEDURE WriteLongInt(LONGINT; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD6                LINK    A6,#FFD6H
     4H        2A2E 000A                MOVE.L  000A(A6),D5
     8H        4A85                     TST.L   D5
     AH        6C02                     BGE     [02H] = 0000000EH
     CH        4485                     NEG.L   D5
     EH        2F05                     MOVE.L  D5,-(A7)
    10H        3F3C 000A                MOVE.W  #000AH,-(A7)
    14H        4AAE 000A                TST.L   000A(A6)
    18H        5DC5                     SLT     D5
    1AH        4405                     NEG.B   D5
    1CH        1F05                     MOVE.B  D5,-(A7)
    1EH        3F3C 0027                MOVE.W  #0027H,-(A7)
    22H        486E FFD8                PEA     FFD8(A6)
    26H        486E FFD7                PEA     FFD7(A6)
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        4FEF 0012                LEA     0012(A7),A7
    34H        3F3C 0027                MOVE.W  #0027H,-(A7)
    38H        486E FFD8                PEA     FFD8(A6)
    3CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    40H        4EB9 0000 0000           JSR     00000000H
    46H        508F                     ADDQ.L  #8,A7
    48H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  2  checksum: o.k.

ref ext proc call at    42H, procnum = 14, modnum =  3  checksum: o.k.

ref ext data at    4AH, modnum =  3  checksum: o.k.

ref own data at    4EH  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 70
PROCEDURE WriteLongCard(LONGCARD; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD6                LINK    A6,#FFD6H
     4H        2F2E 000A                MOVE.L  000A(A6),-(A7)
     8H        3F3C 000A                MOVE.W  #000AH,-(A7)
     CH        4227                     CLR.B   -(A7)
     EH        3F3C 0027                MOVE.W  #0027H,-(A7)
    12H        486E FFD8                PEA     FFD8(A6)
    16H        486E FFD7                PEA     FFD7(A6)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        4FEF 0012                LEA     0012(A7),A7
    24H        3F3C 0027                MOVE.W  #0027H,-(A7)
    28H        486E FFD8                PEA     FFD8(A6)
    2CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        508F                     ADDQ.L  #8,A7
    38H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    42H        4E5E                     UNLK    A6
    44H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1CH, procnum =  1, modnum =  2  checksum: o.k.

ref ext proc call at    32H, procnum = 14, modnum =  3  checksum: o.k.

ref ext data at    3AH, modnum =  3  checksum: o.k.

ref own data at    3EH  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 118
PROCEDURE WriteLongOct(LONGCARD; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD4                LINK    A6,#FFD4H
     4H        2F2E 000A                MOVE.L  000A(A6),-(A7)
     8H        3F3C 0008                MOVE.W  #0008H,-(A7)
     CH        4227                     CLR.B   -(A7)
     EH        3F3C 0027                MOVE.W  #0027H,-(A7)
    12H        486E FFD8                PEA     FFD8(A6)
    16H        486E FFD5                PEA     FFD5(A6)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        4FEF 0012                LEA     0012(A7),A7
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 0027                MOVE.W  #0027H,-(A7)
    2AH        486E FFD8                PEA     FFD8(A6)
    2EH        6100 0000                BSR     [0000H] = 00000030H
    32H        5C8F                     ADDQ.L  #6,A7
    34H        3D5F FFD6                MOVE.W  (A7)+,FFD6(A6)
    38H        3A2E FFD6                MOVE.W  FFD6(A6),D5
    3CH        49EE FFD8                LEA     FFD8(A6),A4
    40H        19BC 0042 5000           MOVE.B  #42H,00H(A4,D5.W)
    46H        3A2E FFD6                MOVE.W  FFD6(A6),D5
    4AH        5245                     ADDQ.W  #1,D5
    4CH        49EE FFD8                LEA     FFD8(A6),A4
    50H        4234 5000                CLR.B   00H(A4,D5.W)
    54H        3F3C 0027                MOVE.W  #0027H,-(A7)
    58H        486E FFD8                PEA     FFD8(A6)
    5CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    60H        4EB9 0000 0000           JSR     00000000H
    66H        508F                     ADDQ.L  #8,A7
    68H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    72H        4E5E                     UNLK    A6
    74H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1CH, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    30H, procnum =  7  checksum: o.k.

ref ext proc call at    62H, procnum = 14, modnum =  3  checksum: o.k.

ref ext data at    6AH, modnum =  3  checksum: o.k.

ref own data at    6EH  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 118
PROCEDURE WriteLongHex(LONGCARD; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD4                LINK    A6,#FFD4H
     4H        2F2E 000A                MOVE.L  000A(A6),-(A7)
     8H        3F3C 0010                MOVE.W  #0010H,-(A7)
     CH        4227                     CLR.B   -(A7)
     EH        3F3C 0027                MOVE.W  #0027H,-(A7)
    12H        486E FFD8                PEA     FFD8(A6)
    16H        486E FFD5                PEA     FFD5(A6)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        4FEF 0012                LEA     0012(A7),A7
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 0027                MOVE.W  #0027H,-(A7)
    2AH        486E FFD8                PEA     FFD8(A6)
    2EH        6100 0000                BSR     [0000H] = 00000030H
    32H        5C8F                     ADDQ.L  #6,A7
    34H        3D5F FFD6                MOVE.W  (A7)+,FFD6(A6)
    38H        3A2E FFD6                MOVE.W  FFD6(A6),D5
    3CH        49EE FFD8                LEA     FFD8(A6),A4
    40H        19BC 0048 5000           MOVE.B  #48H,00H(A4,D5.W)
    46H        3A2E FFD6                MOVE.W  FFD6(A6),D5
    4AH        5245                     ADDQ.W  #1,D5
    4CH        49EE FFD8                LEA     FFD8(A6),A4
    50H        4234 5000                CLR.B   00H(A4,D5.W)
    54H        3F3C 0027                MOVE.W  #0027H,-(A7)
    58H        486E FFD8                PEA     FFD8(A6)
    5CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    60H        4EB9 0000 0000           JSR     00000000H
    66H        508F                     ADDQ.L  #8,A7
    68H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    72H        4E5E                     UNLK    A6
    74H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    1CH, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    30H, procnum =  7  checksum: o.k.

ref ext proc call at    62H, procnum = 14, modnum =  3  checksum: o.k.

ref ext data at    6AH, modnum =  3  checksum: o.k.

ref own data at    6EH  checksum: o.k.

scmod end  checksum: o.k.
