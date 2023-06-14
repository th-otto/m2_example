link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMError, key =  2102H  CABCH  2F97H  checksum: o.k.

import GEMX, key =  2102H  CABEH  345EH, modnum =  2  checksum: o.k.

import GEMDOS, key =  2102H  CAC6H  6EBFH, modnum =  3  checksum: o.k.

import AESApplications, key =  2102H  CB23H  6963H, modnum =  4  checksum: o.k.

import AESEvents, key =  2102H  CB1FH  369CH, modnum =  5  checksum: o.k.

data size, number of bytes = 1302  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        6228                     BHI     [28H] = 0000003AH
    12H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4A34 5000                TST.B   00H(A4,D5.W)
    1EH        671A                     BEQ     [1AH] = 0000003AH
    20H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    24H        286E 0008                MOVE.L  0008(A6),A4
    28H        1F34 5000                MOVE.B  00H(A4,D5.W),-(A7)
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        548F                     ADDQ.L  #2,A7
    34H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    38H        60CE                     BRA     [CEH] = 00000008H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    2EH, procnum =  4, modnum =  3  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 32
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        1F3C 000A                MOVE.B  #0AH,-(A7)
     8H        4EB9 0000 0000           JSR     00000000H
     EH        548F                     ADDQ.L  #2,A7
    10H        1F3C 000D                MOVE.B  #0DH,-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        548F                     ADDQ.L  #2,A7
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at     AH, procnum =  4, modnum =  3  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  3  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 28
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     8H        286E 0008                MOVE.L  0008(A6),A4
     CH        4854                     PEA     (A4)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        6100 0000                BSR     [0000H] = 00000016H
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum =  1  checksum: o.k.

ref own quick call at    16H, procnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 152
 DECODE --------                        INSTRUCTION
     0H        4E56 FFDC                LINK    A6,#FFDCH
     4H        426E FFDE                CLR.W   FFDE(A6)
     8H        2A2E 0008                MOVE.L  0008(A6),D5
     CH        0285 0000 000F           ANDI.L  #0000000FH,D5
    12H        3D45 FFDC                MOVE.W  D5,FFDC(A6)
    16H        0C6E 000A FFDC           CMPI.W  #000AH,FFDC(A6)
    1CH        6418                     BCC     [18H] = 00000036H
    1EH        3A2E FFDC                MOVE.W  FFDC(A6),D5
    22H        0645 0030                ADDI.W  #0030H,D5
    26H        382E FFDE                MOVE.W  FFDE(A6),D4
    2AH        49EE FFE0                LEA     FFE0(A6),A4
    2EH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    32H        4EFA 001A                JMP     [001AH] = 0000004EH
    36H        3A2E FFDC                MOVE.W  FFDC(A6),D5
    3AH        0445 000A                SUBI.W  #000AH,D5
    3EH        0645 0041                ADDI.W  #0041H,D5
    42H        382E FFDE                MOVE.W  FFDE(A6),D4
    46H        49EE FFE0                LEA     FFE0(A6),A4
    4AH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    4EH        2A2E 0008                MOVE.L  0008(A6),D5
    52H        E88D                     LSR.L   #4,D5
    54H        2D45 0008                MOVE.L  D5,0008(A6)
    58H        526E FFDE                ADDQ.W  #1,FFDE(A6)
    5CH        0C6E 0008 FFDE           CMPI.W  #0008H,FFDE(A6)
    62H        6702                     BEQ     [02H] = 00000066H
    64H        60A2                     BRA     [A2H] = 00000008H
    66H        3A2E FFDE                MOVE.W  FFDE(A6),D5
    6AH        5345                     SUBQ.W  #1,D5
    6CH        49EE FFE0                LEA     FFE0(A6),A4
    70H        1F34 5000                MOVE.B  00H(A4,D5.W),-(A7)
    74H        4EB9 0000 0000           JSR     00000000H
    7AH        548F                     ADDQ.L  #2,A7
    7CH        536E FFDE                SUBQ.W  #1,FFDE(A6)
    80H        4A6E FFDE                TST.W   FFDE(A6)
    84H        6702                     BEQ     [02H] = 00000088H
    86H        60DE                     BRA     [DEH] = 00000066H
    88H        1F3C 0048                MOVE.B  #48H,-(A7)
    8CH        4EB9 0000 0000           JSR     00000000H
    92H        548F                     ADDQ.L  #2,A7
    94H        4E5E                     UNLK    A6
    96H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    76H, procnum =  4, modnum =  3  checksum: o.k.

ref ext proc call at    8EH, procnum =  4, modnum =  3  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        49F9 0000 00FC           LEA     000000FCH,A4
     AH        204C                     MOVE.L  A4,A0
     CH        49F9 0000 00FC           LEA     000000FCH,A4
    12H        224C                     MOVE.L  A4,A1
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref util: at    16H, procnum =  5  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 116
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286D FFFC                MOVE.L  FFFC(A5),A4
     8H        397C 0046 FFDE           MOVE.W  #0046H,FFDE(A4)
     EH        286D FFFC                MOVE.L  FFFC(A5),A4
    12H        266D FFFC                MOVE.L  FFFC(A5),A3
    16H        376C FFBC FFE0           MOVE.W  FFBC(A4),FFE0(A3)
    1CH        286D FFFC                MOVE.L  FFFC(A5),A4
    20H        426C FFE2                CLR.W   FFE2(A4)
    24H        286D FFFC                MOVE.L  FFFC(A5),A4
    28H        396E 0008 FFE4           MOVE.W  0008(A6),FFE4(A4)
    2EH        286D FFFC                MOVE.L  FFFC(A5),A4
    32H        3F2C FFFE                MOVE.W  FFFE(A4),-(A7)
    36H        3F3C 0010                MOVE.W  #0010H,-(A7)
    3AH        286D FFFC                MOVE.L  FFFC(A5),A4
    3EH        49EC FFDE                LEA     FFDE(A4),A4
    42H        2A0C                     MOVE.L  A4,D5
    44H        2F05                     MOVE.L  D5,-(A7)
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        508F                     ADDQ.L  #8,A7
    4EH        286D FFFC                MOVE.L  FFFC(A5),A4
    52H        49EC FFBE                LEA     FFBE(A4),A4
    56H        2A0C                     MOVE.L  A4,D5
    58H        2F05                     MOVE.L  D5,-(A7)
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        588F                     ADDQ.L  #4,A7
    62H        286D FFFC                MOVE.L  FFFC(A5),A4
    66H        0C6C 0047 FFBE           CMPI.W  #0047H,FFBE(A4)
    6CH        6702                     BEQ     [02H] = 00000070H
    6EH        60DE                     BRA     [DEH] = 0000004EH
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    48H, procnum =  3, modnum =  4  checksum: o.k.

ref ext proc call at    5CH, procnum =  4, modnum =  5  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 66
 DECODE --------                        INSTRUCTION
     0H        4E56 FEEE                LINK    A6,#FEEEH
     4H        49EE FEEE                LEA     FEEE(A6),A4
     8H        2A0C                     MOVE.L  A4,D5
     AH        7810                     MOVEQ   #10H,D4
     CH        E8AD                     LSR.L   D4,D5
     EH        286D FFFC                MOVE.L  FFFC(A5),A4
    12H        3945 FFE6                MOVE.W  D5,FFE6(A4)
    16H        49EE FEEE                LEA     FEEE(A6),A4
    1AH        2A0C                     MOVE.L  A4,D5
    1CH        286D FFFC                MOVE.L  FFFC(A5),A4
    20H        3945 FFE8                MOVE.W  D5,FFE8(A4)
    24H        3F3C 0005                MOVE.W  #0005H,-(A7)
    28H        6100 0000                BSR     [0000H] = 0000002AH
    2CH        548F                     ADDQ.L  #2,A7
    2EH        286D FFFC                MOVE.L  FFFC(A5),A4
    32H        3A2C FFC4                MOVE.W  FFC4(A4),D5
    36H        48C5                     EXT.L   D5
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        1885                     MOVE.B  D5,(A4)
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

ref own quick call at    2AH, procnum =  8  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 688
 DECODE --------                        INSTRUCTION
     0H        4E56 FFAE                LINK    A6,#FFAEH
     4H        2F2D FFFC                MOVE.L  FFFC(A5),-(A7)
     8H        2B4E FFFC                MOVE.L  A6,FFFC(A5)
     CH        558F                     SUBQ.L  #2,A7
     EH        4EB9 0000 0000           JSR     00000000H
    14H        3D5F FFBC                MOVE.W  (A7)+,FFBC(A6)
    18H        49F9 0000 0000           LEA     00000000H,A4
    1EH        47EE FFB2                LEA     FFB2(A6),A3
    22H        7A08                     MOVEQ   #08H,D5
    24H        16DC                     MOVE.B  (A4)+,(A3)+
    26H        57CD FFFC                DBEQ    D5,[FFFCH] = 00000024H
    2AH        558F                     SUBQ.L  #2,A7
    2CH        3F3C 0009                MOVE.W  #0009H,-(A7)
    30H        486E FFB2                PEA     FFB2(A6)
    34H        4EB9 0000 0000           JSR     00000000H
    3AH        5C8F                     ADDQ.L  #6,A7
    3CH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    40H        4A6E FFFE                TST.W   FFFE(A6)
    44H        6D02                     BLT     [02H] = 00000048H
    46H        6004                     BRA     [04H] = 0000004CH
    48H        4EFA 0230                JMP     [0230H] = 0000027AH
    4CH        486E FFAF                PEA     FFAF(A6)
    50H        6100 0000                BSR     [0000H] = 00000052H
    54H        588F                     ADDQ.L  #4,A7
    56H        4A2E FFAF                TST.B   FFAF(A6)
    5AH        6702                     BEQ     [02H] = 0000005EH
    5CH        6004                     BRA     [04H] = 00000062H
    5EH        4EFA 0206                JMP     [0206H] = 00000266H
    62H        49F9 0000 000A           LEA     0000000AH,A4
    68H        47F9 0000 00CE           LEA     000000CEH,A3
    6EH        7A08                     MOVEQ   #08H,D5
    70H        16DC                     MOVE.B  (A4)+,(A3)+
    72H        57CD FFFC                DBEQ    D5,[FFFCH] = 00000070H
    76H        3F3C 0011                MOVE.W  #0011H,-(A7)
    7AH        4879 0000 0014           PEA     00000014H
    80H        6100 0000                BSR     [0000H] = 00000082H
    84H        5C8F                     ADDQ.L  #6,A7
    86H        3F3C 0027                MOVE.W  #0027H,-(A7)
    8AH        4879 0000 00CE           PEA     000000CEH
    90H        6100 0000                BSR     [0000H] = 00000092H
    94H        5C8F                     ADDQ.L  #6,A7
    96H        3F3C 0002                MOVE.W  #0002H,-(A7)
    9AH        4879 0000 0028           PEA     00000028H
    A0H        6100 0000                BSR     [0000H] = 000000A2H
    A4H        5C8F                     ADDQ.L  #6,A7
    A6H        23F9 0000 0000 0000 00C6 MOVE.L  00000000H,000000C6H
    B0H        2879 0000 0008           MOVE.L  00000008H,A4
    B6H        23EC 0004 0000 00CA      MOVE.L  0004(A4),000000CAH
    BEH        3F3C 0027                MOVE.W  #0027H,-(A7)
    C2H        4879 0000 00CE           PEA     000000CEH
    C8H        4267                     CLR.W   -(A7)
    CAH        4879 0000 0100           PEA     00000100H
    D0H        4EB9 0000 0000           JSR     00000000H
    D6H        4FEF 000C                LEA     000C(A7),A7
    DAH        4A79 0000 0100           TST.W   00000100H
    E0H        6C14                     BGE     [14H] = 000000F6H
    E2H        3F3C 0014                MOVE.W  #0014H,-(A7)
    E6H        4879 0000 002C           PEA     0000002CH
    ECH        6100 0000                BSR     [0000H] = 000000EEH
    F0H        5C8F                     ADDQ.L  #6,A7
    F2H        4EFA 016E                JMP     [016EH] = 00000262H
    F6H        49F9 0000 000C           LEA     0000000CH,A4
    FCH        28B9 0000 0016           MOVE.L  00000016H,(A4)
   102H        2979 0000 000C 0004      MOVE.L  0000000CH,0004(A4)
   10AH        2979 0000 0012 0008      MOVE.L  00000012H,0008(A4)
   112H        3979 0000 0008 000C      MOVE.W  00000008H,000C(A4)
   11AH        47EC 000E                LEA     000E(A4),A3
   11EH        26B9 0000 00C6           MOVE.L  000000C6H,(A3)
   124H        2779 0000 00CA 0004      MOVE.L  000000CAH,0004(A3)
   12CH        277C 0000 0200 0008      MOVE.L  #00000200H,0008(A3)
   134H        3D7C 0002 FFB0           MOVE.W  #0002H,FFB0(A6)
   13AH        3A2E FFB0                MOVE.W  FFB0(A6),D5
   13EH        CAFC 000C                MULU    #000CH,D5
   142H        47EC 0002                LEA     0002(A4),A3
   146H        47F3 5000                LEA     00H(A3,D5.W),A3
   14AH        4293                     CLR.L   (A3)
   14CH        42AB 0004                CLR.L   0004(A3)
   150H        42AB 0008                CLR.L   0008(A3)
   154H        526E FFB0                ADDQ.W  #1,FFB0(A6)
   158H        0C6E 0005 FFB0           CMPI.W  #0005H,FFB0(A6)
   15EH        66DA                     BNE     [DAH] = 0000013AH
   160H        47EC 0040                LEA     0040(A4),A3
   164H        26B9 0000 0000           MOVE.L  00000000H,(A3)
   16AH        3A2E FFB0                MOVE.W  FFB0(A6),D5
   16EH        E745                     ASL.W   #3,D5
   170H        45F9 0000 0000           LEA     00000000H,A2
   176H        2813                     MOVE.L  (A3),D4
   178H        D8B2 5004                ADD.L   04H(A2,D5.W),D4
   17CH        2744 0004                MOVE.L  D4,0004(A3)
   180H        426C 003E                CLR.W   003E(A4)
   184H        197C 0001 00B8           MOVE.B  #01H,00B8(A4)
   18AH        23FC 0000 0200 0000 00F8 MOVE.L  #00000200H,000000F8H
   194H        3F39 0000 0100           MOVE.W  00000100H,-(A7)
   19AH        4879 0000 00F8           PEA     000000F8H
   1A0H        49F9 0000 000C           LEA     0000000CH,A4
   1A6H        2A0C                     MOVE.L  A4,D5
   1A8H        2F05                     MOVE.L  D5,-(A7)
   1AAH        4EB9 0000 0000           JSR     00000000H
   1B0H        4FEF 000A                LEA     000A(A7),A7
   1B4H        0CB9 0000 0200 0000 00F8 CMPI.L  #00000200H,000000F8H
   1BEH        6714                     BEQ     [14H] = 000001D4H
   1C0H        3F3C 0012                MOVE.W  #0012H,-(A7)
   1C4H        4879 0000 0042           PEA     00000042H
   1CAH        6100 0000                BSR     [0000H] = 000001CCH
   1CEH        5C8F                     ADDQ.L  #6,A7
   1D0H        4EFA 0090                JMP     [0090H] = 00000262H
   1D4H        2A39 0000 00CA           MOVE.L  000000CAH,D5
   1DAH        9AB9 0000 00C6           SUB.L   000000C6H,D5
   1E0H        23C5 0000 00F8           MOVE.L  D5,000000F8H
   1E6H        3F39 0000 0100           MOVE.W  00000100H,-(A7)
   1ECH        4879 0000 00F8           PEA     000000F8H
   1F2H        2F39 0000 00C6           MOVE.L  000000C6H,-(A7)
   1F8H        4EB9 0000 0000           JSR     00000000H
   1FEH        4FEF 000A                LEA     000A(A7),A7
   202H        2A39 0000 00CA           MOVE.L  000000CAH,D5
   208H        9AB9 0000 00C6           SUB.L   000000C6H,D5
   20EH        BAB9 0000 00F8           CMP.L   000000F8H,D5
   214H        6714                     BEQ     [14H] = 0000022AH
   216H        3F3C 0016                MOVE.W  #0016H,-(A7)
   21AH        4879 0000 0056           PEA     00000056H
   220H        6100 0000                BSR     [0000H] = 00000222H
   224H        5C8F                     ADDQ.L  #6,A7
   226H        4EFA 003A                JMP     [003AH] = 00000262H
   22AH        558F                     SUBQ.L  #2,A7
   22CH        3F39 0000 0100           MOVE.W  00000100H,-(A7)
   232H        4EB9 0000 0000           JSR     00000000H
   238H        548F                     ADDQ.L  #2,A7
   23AH        4A1F                     TST.B   (A7)+
   23CH        6714                     BEQ     [14H] = 00000252H
   23EH        3F3C 0001                MOVE.W  #0001H,-(A7)
   242H        4879 0000 006E           PEA     0000006EH
   248H        6100 0000                BSR     [0000H] = 0000024AH
   24CH        5C8F                     ADDQ.L  #6,A7
   24EH        4EFA 0012                JMP     [0012H] = 00000262H
   252H        3F3C 0010                MOVE.W  #0010H,-(A7)
   256H        4879 0000 0072           PEA     00000072H
   25CH        6100 0000                BSR     [0000H] = 0000025EH
   260H        5C8F                     ADDQ.L  #6,A7
   262H        4EFA 0012                JMP     [0012H] = 00000276H
   266H        3F3C 000F                MOVE.W  #000FH,-(A7)
   26AH        4879 0000 0084           PEA     00000084H
   270H        6100 0000                BSR     [0000H] = 00000272H
   274H        5C8F                     ADDQ.L  #6,A7
   276H        4EFA 0012                JMP     [0012H] = 0000028AH
   27AH        3F3C 0023                MOVE.W  #0023H,-(A7)
   27EH        4879 0000 0096           PEA     00000096H
   284H        6100 0000                BSR     [0000H] = 00000286H
   288H        5C8F                     ADDQ.L  #6,A7
   28AH        6100 0000                BSR     [0000H] = 0000028CH
   28EH        49F9 0000 00FC           LEA     000000FCH,A4
   294H        204C                     MOVE.L  A4,A0
   296H        49F9 0000 00FC           LEA     000000FCH,A4
   29CH        224C                     MOVE.L  A4,A1
   29EH        4EB9 0000 0000           JSR     00000000H
   2A4H        6000 FD66                BRA     [FD66H] = 0000000CH
   2A8H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
   2ACH        4E5E                     UNLK    A6
   2AEH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    10H, procnum =  1, modnum =  4  checksum: o.k.

ref own string: at    1AH  checksum: o.k.

ref ext proc call at    36H, procnum =  4, modnum =  4  checksum: o.k.

ref own quick call at    52H, procnum =  9  checksum: o.k.

ref own string: at    64H  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own string: at    7CH  checksum: o.k.

ref own quick call at    82H, procnum =  1  checksum: o.k.

ref own data at    8CH  checksum: o.k.

ref own quick call at    92H, procnum =  1  checksum: o.k.

ref own string: at    9CH  checksum: o.k.

ref own quick call at    A2H, procnum =  1  checksum: o.k.

ref own data at    A8H  checksum: o.k.

ref own data at    ACH  checksum: o.k.

ref own data at    B2H  checksum: o.k.

ref own data at    BAH  checksum: o.k.

ref own data at    C4H  checksum: o.k.

ref own data at    CCH  checksum: o.k.

ref ext proc call at    D2H, procnum = 33, modnum =  3  checksum: o.k.

ref own data at    DCH  checksum: o.k.

ref own string: at    E8H  checksum: o.k.

ref own quick call at    EEH, procnum =  3  checksum: o.k.

ref own data at    F8H  checksum: o.k.

ref ext data at    FEH, modnum =  2  checksum: o.k.

ref ext data at   104H, modnum =  2  checksum: o.k.

ref ext data at   10CH, modnum =  2  checksum: o.k.

ref ext data at   114H, modnum =  2  checksum: o.k.

ref own data at   120H  checksum: o.k.

ref own data at   126H  checksum: o.k.

ref own data at   166H  checksum: o.k.

ref own data at   172H  checksum: o.k.

ref own data at   190H  checksum: o.k.

ref own data at   196H  checksum: o.k.

ref own data at   19CH  checksum: o.k.

ref own data at   1A2H  checksum: o.k.

ref ext proc call at   1ACH, procnum = 37, modnum =  3  checksum: o.k.

ref own data at   1BAH  checksum: o.k.

ref own string: at   1C6H  checksum: o.k.

ref own quick call at   1CCH, procnum =  3  checksum: o.k.

ref own data at   1D6H  checksum: o.k.

ref own data at   1DCH  checksum: o.k.

ref own data at   1E2H  checksum: o.k.

ref own data at   1E8H  checksum: o.k.

ref own data at   1EEH  checksum: o.k.

ref own data at   1F4H  checksum: o.k.

ref ext proc call at   1FAH, procnum = 37, modnum =  3  checksum: o.k.

ref own data at   204H  checksum: o.k.

ref own data at   20AH  checksum: o.k.

ref own data at   210H  checksum: o.k.

ref own string: at   21CH  checksum: o.k.

ref own quick call at   222H, procnum =  3  checksum: o.k.

ref own data at   22EH  checksum: o.k.

ref ext proc call at   234H, procnum = 35, modnum =  3  checksum: o.k.

ref own string: at   244H  checksum: o.k.

ref own quick call at   24AH, procnum =  3  checksum: o.k.

ref own string: at   258H  checksum: o.k.

ref own quick call at   25EH, procnum =  3  checksum: o.k.

ref own string: at   26CH  checksum: o.k.

ref own quick call at   272H, procnum =  3  checksum: o.k.

ref own string: at   280H  checksum: o.k.

ref own quick call at   286H, procnum =  3  checksum: o.k.

ref own quick call at   28CH, procnum =  2  checksum: o.k.

ref own data at   290H  checksum: o.k.

ref own data at   298H  checksum: o.k.

ref util: at   2A0H, procnum =  5  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
     AH        49F9 0000 0102           LEA     00000102H,A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        2F05                     MOVE.L  D5,-(A7)
    14H        4878 0280                PEA     0280H
    18H        4879 0000 00FC           PEA     000000FCH
    1EH        4878 0201                PEA     0201H
    22H        4EB9 0000 0000           JSR     00000000H
    28H        4FEF 0014                LEA     0014(A7),A7
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own proc ass at     6H, procnum =  7  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref util: at    24H, procnum =  4  checksum: o.k.

init code, procnum =  5, entrypoint =     0H, number of bytes = 12
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        6100 0000                BSR     [0000H] = 00000006H
     8H        4E5E                     UNLK    A6
     AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     6H, procnum = 10  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 1650
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        1F3C 001B                MOVE.B  #1BH,-(A7)
     8H        4EB9 0000 0000           JSR     00000000H
     EH        548F                     ADDQ.L  #2,A7
    10H        1F3C 0048                MOVE.B  #48H,-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        548F                     ADDQ.L  #2,A7
    1CH        1F3C 001B                MOVE.B  #1BH,-(A7)
    20H        4EB9 0000 0000           JSR     00000000H
    26H        548F                     ADDQ.L  #2,A7
    28H        1F3C 004A                MOVE.B  #4AH,-(A7)
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        548F                     ADDQ.L  #2,A7
    34H        6100 0000                BSR     [0000H] = 00000036H
    38H        3F3C 0033                MOVE.W  #0033H,-(A7)
    3CH        4879 0000 00BC           PEA     000000BCH
    42H        6100 0000                BSR     [0000H] = 00000044H
    46H        5C8F                     ADDQ.L  #6,A7
    48H        6100 0000                BSR     [0000H] = 0000004AH
    4CH        49F9 0000 0008           LEA     00000008H,A4
    52H        2F0C                     MOVE.L  A4,-(A7)
    54H        3F3C 000A                MOVE.W  #000AH,-(A7)
    58H        4879 0000 00F2           PEA     000000F2H
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        5C8F                     ADDQ.L  #6,A7
    64H        285F                     MOVE.L  (A7)+,A4
    66H        2F0C                     MOVE.L  A4,-(A7)
    68H        3A14                     MOVE.W  (A4),D5
    6AH        48C5                     EXT.L   D5
    6CH        2F05                     MOVE.L  D5,-(A7)
    6EH        6100 0000                BSR     [0000H] = 00000070H
    72H        588F                     ADDQ.L  #4,A7
    74H        285F                     MOVE.L  (A7)+,A4
    76H        2F0C                     MOVE.L  A4,-(A7)
    78H        3F3C 0001                MOVE.W  #0001H,-(A7)
    7CH        4879 0000 00FE           PEA     000000FEH
    82H        6100 0000                BSR     [0000H] = 00000084H
    86H        5C8F                     ADDQ.L  #6,A7
    88H        285F                     MOVE.L  (A7)+,A4
    8AH        3A14                     MOVE.W  (A4),D5
    8CH        48C5                     EXT.L   D5
    8EH        2005                     MOVE.L  D5,D0
    90H        4EB9 0000 0000           JSR     00000000H
    96H        0000 0003                ORI.B   #03H,D0
    9AH        0000 000F                ORI.B   #0FH,D0
    9EH        0000 0178                ORI.B   #78H,D0
    A2H        2F0C                     MOVE.L  A4,-(A7)
    A4H        3F3C 0017                MOVE.W  #0017H,-(A7)
    A8H        4879 0000 0102           PEA     00000102H
    AEH        6100 0000                BSR     [0000H] = 000000B0H
    B2H        5C8F                     ADDQ.L  #6,A7
    B4H        285F                     MOVE.L  (A7)+,A4
    B6H        4EFA 018A                JMP     [018AH] = 00000242H
    BAH        2F0C                     MOVE.L  A4,-(A7)
    BCH        3F3C 0010                MOVE.W  #0010H,-(A7)
    C0H        4879 0000 011C           PEA     0000011CH
    C6H        6100 0000                BSR     [0000H] = 000000C8H
    CAH        5C8F                     ADDQ.L  #6,A7
    CCH        285F                     MOVE.L  (A7)+,A4
    CEH        4EFA 0172                JMP     [0172H] = 00000242H
    D2H        2F0C                     MOVE.L  A4,-(A7)
    D4H        3F3C 0014                MOVE.W  #0014H,-(A7)
    D8H        4879 0000 012E           PEA     0000012EH
    DEH        6100 0000                BSR     [0000H] = 000000E0H
    E2H        5C8F                     ADDQ.L  #6,A7
    E4H        285F                     MOVE.L  (A7)+,A4
    E6H        4EFA 015A                JMP     [015AH] = 00000242H
    EAH        2F0C                     MOVE.L  A4,-(A7)
    ECH        3F3C 0011                MOVE.W  #0011H,-(A7)
    F0H        4879 0000 0144           PEA     00000144H
    F6H        6100 0000                BSR     [0000H] = 000000F8H
    FAH        5C8F                     ADDQ.L  #6,A7
    FCH        285F                     MOVE.L  (A7)+,A4
    FEH        4EFA 0142                JMP     [0142H] = 00000242H
   102H        2F0C                     MOVE.L  A4,-(A7)
   104H        3F3C 000D                MOVE.W  #000DH,-(A7)
   108H        4879 0000 0158           PEA     00000158H
   10EH        6100 0000                BSR     [0000H] = 00000110H
   112H        5C8F                     ADDQ.L  #6,A7
   114H        285F                     MOVE.L  (A7)+,A4
   116H        4EFA 012A                JMP     [012AH] = 00000242H
   11AH        2F0C                     MOVE.L  A4,-(A7)
   11CH        3F3C 000B                MOVE.W  #000BH,-(A7)
   120H        4879 0000 0168           PEA     00000168H
   126H        6100 0000                BSR     [0000H] = 00000128H
   12AH        5C8F                     ADDQ.L  #6,A7
   12CH        285F                     MOVE.L  (A7)+,A4
   12EH        4EFA 0112                JMP     [0112H] = 00000242H
   132H        2F0C                     MOVE.L  A4,-(A7)
   134H        3F3C 0020                MOVE.W  #0020H,-(A7)
   138H        4879 0000 0176           PEA     00000176H
   13EH        6100 0000                BSR     [0000H] = 00000140H
   142H        5C8F                     ADDQ.L  #6,A7
   144H        285F                     MOVE.L  (A7)+,A4
   146H        4EFA 00FA                JMP     [00FAH] = 00000242H
   14AH        2F0C                     MOVE.L  A4,-(A7)
   14CH        3F3C 0017                MOVE.W  #0017H,-(A7)
   150H        4879 0000 0198           PEA     00000198H
   156H        6100 0000                BSR     [0000H] = 00000158H
   15AH        5C8F                     ADDQ.L  #6,A7
   15CH        285F                     MOVE.L  (A7)+,A4
   15EH        4EFA 00E2                JMP     [00E2H] = 00000242H
   162H        2F0C                     MOVE.L  A4,-(A7)
   164H        3F3C 000D                MOVE.W  #000DH,-(A7)
   168H        4879 0000 01B2           PEA     000001B2H
   16EH        6100 0000                BSR     [0000H] = 00000170H
   172H        5C8F                     ADDQ.L  #6,A7
   174H        285F                     MOVE.L  (A7)+,A4
   176H        4EFA 00CA                JMP     [00CAH] = 00000242H
   17AH        2F0C                     MOVE.L  A4,-(A7)
   17CH        3F3C 000B                MOVE.W  #000BH,-(A7)
   180H        4879 0000 01C2           PEA     000001C2H
   186H        6100 0000                BSR     [0000H] = 00000188H
   18AH        5C8F                     ADDQ.L  #6,A7
   18CH        285F                     MOVE.L  (A7)+,A4
   18EH        4EFA 00B2                JMP     [00B2H] = 00000242H
   192H        2F0C                     MOVE.L  A4,-(A7)
   194H        3F3C 0012                MOVE.W  #0012H,-(A7)
   198H        4879 0000 01D0           PEA     000001D0H
   19EH        6100 0000                BSR     [0000H] = 000001A0H
   1A2H        5C8F                     ADDQ.L  #6,A7
   1A4H        285F                     MOVE.L  (A7)+,A4
   1A6H        4EFA 009A                JMP     [009AH] = 00000242H
   1AAH        2F0C                     MOVE.L  A4,-(A7)
   1ACH        3F3C 0023                MOVE.W  #0023H,-(A7)
   1B0H        4879 0000 01E4           PEA     000001E4H
   1B6H        6100 0000                BSR     [0000H] = 000001B8H
   1BAH        5C8F                     ADDQ.L  #6,A7
   1BCH        285F                     MOVE.L  (A7)+,A4
   1BEH        4EFA 0082                JMP     [0082H] = 00000242H
   1C2H        2F0C                     MOVE.L  A4,-(A7)
   1C4H        3F3C 0011                MOVE.W  #0011H,-(A7)
   1C8H        4879 0000 020A           PEA     0000020AH
   1CEH        6100 0000                BSR     [0000H] = 000001D0H
   1D2H        5C8F                     ADDQ.L  #6,A7
   1D4H        285F                     MOVE.L  (A7)+,A4
   1D6H        4EFA 006A                JMP     [006AH] = 00000242H
   1DAH        2F0C                     MOVE.L  A4,-(A7)
   1DCH        3F3C 001D                MOVE.W  #001DH,-(A7)
   1E0H        4879 0000 021E           PEA     0000021EH
   1E6H        6100 0000                BSR     [0000H] = 000001E8H
   1EAH        5C8F                     ADDQ.L  #6,A7
   1ECH        285F                     MOVE.L  (A7)+,A4
   1EEH        4EFA 0052                JMP     [0052H] = 00000242H
   1F2H        2F0C                     MOVE.L  A4,-(A7)
   1F4H        3F3C 001F                MOVE.W  #001FH,-(A7)
   1F8H        4879 0000 023E           PEA     0000023EH
   1FEH        6100 0000                BSR     [0000H] = 00000200H
   202H        5C8F                     ADDQ.L  #6,A7
   204H        285F                     MOVE.L  (A7)+,A4
   206H        4EFA 003A                JMP     [003AH] = 00000242H
   20AH        4EFA 0022                JMP     [0022H] = 0000022EH
   20EH        000C 0024                MOVEP.W 0024H(A4),D0
   212H        003C 0174                ORI     #74H,CCR
   216H        0054 006C                ORI.W   #006CH,(A4)
   21AH        0084 009C 00B4           ORI.L   #009C00B4H,D4
   220H        00CC 00E4                MOVEP.L D0,00E4H(A4)
   224H        00FC 0114                ORI     #0114H,SR
   228H        012C 0144                BTST    D0,0144(A4)
   22CH        015C                     BCHG    D0,(A4)+
   22EH        2F0C                     MOVE.L  A4,-(A7)
   230H        3F3C 0019                MOVE.W  #0019H,-(A7)
   234H        4879 0000 0260           PEA     00000260H
   23AH        6100 0000                BSR     [0000H] = 0000023CH
   23EH        5C8F                     ADDQ.L  #6,A7
   240H        285F                     MOVE.L  (A7)+,A4
   242H        2F0C                     MOVE.L  A4,-(A7)
   244H        3F3C 000F                MOVE.W  #000FH,-(A7)
   248H        4879 0000 027C           PEA     0000027CH
   24EH        6100 0000                BSR     [0000H] = 00000250H
   252H        5C8F                     ADDQ.L  #6,A7
   254H        285F                     MOVE.L  (A7)+,A4
   256H        7A00                     MOVEQ   #00H,D5
   258H        1A2C 0002                MOVE.B  0002(A4),D5
   25CH        2005                     MOVE.L  D5,D0
   25EH        4EB9 0000 0000           JSR     00000000H
   264H        0000 0000                ORI.B   #00H,D0
   268H        0000 0002                ORI.B   #02H,D0
   26CH        0000 0058                ORI.B   #58H,D0
   270H        2F0C                     MOVE.L  A4,-(A7)
   272H        3F3C 000D                MOVE.W  #000DH,-(A7)
   276H        4879 0000 028E           PEA     0000028EH
   27CH        6100 0000                BSR     [0000H] = 0000027EH
   280H        5C8F                     ADDQ.L  #6,A7
   282H        285F                     MOVE.L  (A7)+,A4
   284H        4EFA 0050                JMP     [0050H] = 000002D6H
   288H        2F0C                     MOVE.L  A4,-(A7)
   28AH        3F3C 000B                MOVE.W  #000BH,-(A7)
   28EH        4879 0000 029E           PEA     0000029EH
   294H        6100 0000                BSR     [0000H] = 00000296H
   298H        5C8F                     ADDQ.L  #6,A7
   29AH        285F                     MOVE.L  (A7)+,A4
   29CH        4EFA 0038                JMP     [0038H] = 000002D6H
   2A0H        2F0C                     MOVE.L  A4,-(A7)
   2A2H        3F3C 000F                MOVE.W  #000FH,-(A7)
   2A6H        4879 0000 02AC           PEA     000002ACH
   2ACH        6100 0000                BSR     [0000H] = 000002AEH
   2B0H        5C8F                     ADDQ.L  #6,A7
   2B2H        285F                     MOVE.L  (A7)+,A4
   2B4H        4EFA 0020                JMP     [0020H] = 000002D6H
   2B8H        4EFA 0008                JMP     [0008H] = 000002C2H
   2BCH        000C 0024                MOVEP.W 0024H(A4),D0
   2C0H        003C 2F0C                ORI     #0CH,CCR
   2C4H        3F3C 0019                MOVE.W  #0019H,-(A7)
   2C8H        4879 0000 02BE           PEA     000002BEH
   2CEH        6100 0000                BSR     [0000H] = 000002D0H
   2D2H        5C8F                     ADDQ.L  #6,A7
   2D4H        285F                     MOVE.L  (A7)+,A4
   2D6H        2F0C                     MOVE.L  A4,-(A7)
   2D8H        6100 0000                BSR     [0000H] = 000002DAH
   2DCH        285F                     MOVE.L  (A7)+,A4
   2DEH        2F0C                     MOVE.L  A4,-(A7)
   2E0H        3F3C 0004                MOVE.W  #0004H,-(A7)
   2E4H        4879 0000 02DA           PEA     000002DAH
   2EAH        6100 0000                BSR     [0000H] = 000002ECH
   2EEH        5C8F                     ADDQ.L  #6,A7
   2F0H        285F                     MOVE.L  (A7)+,A4
   2F2H        2F0C                     MOVE.L  A4,-(A7)
   2F4H        2F2C 0004                MOVE.L  0004(A4),-(A7)
   2F8H        6100 0000                BSR     [0000H] = 000002FAH
   2FCH        588F                     ADDQ.L  #4,A7
   2FEH        285F                     MOVE.L  (A7)+,A4
   300H        2F0C                     MOVE.L  A4,-(A7)
   302H        3F3C 0006                MOVE.W  #0006H,-(A7)
   306H        4879 0000 02E0           PEA     000002E0H
   30CH        6100 0000                BSR     [0000H] = 0000030EH
   310H        5C8F                     ADDQ.L  #6,A7
   312H        285F                     MOVE.L  (A7)+,A4
   314H        2F0C                     MOVE.L  A4,-(A7)
   316H        7A00                     MOVEQ   #00H,D5
   318H        3A2C 0008                MOVE.W  0008(A4),D5
   31CH        2F05                     MOVE.L  D5,-(A7)
   31EH        6100 0000                BSR     [0000H] = 00000320H
   322H        588F                     ADDQ.L  #4,A7
   324H        285F                     MOVE.L  (A7)+,A4
   326H        2F0C                     MOVE.L  A4,-(A7)
   328H        6100 0000                BSR     [0000H] = 0000032AH
   32CH        285F                     MOVE.L  (A7)+,A4
   32EH        2F0C                     MOVE.L  A4,-(A7)
   330H        3F3C 000E                MOVE.W  #000EH,-(A7)
   334H        4879 0000 02E8           PEA     000002E8H
   33AH        6100 0000                BSR     [0000H] = 0000033CH
   33EH        5C8F                     ADDQ.L  #6,A7
   340H        285F                     MOVE.L  (A7)+,A4
   342H        2F0C                     MOVE.L  A4,-(A7)
   344H        2F2C 000A                MOVE.L  000A(A4),-(A7)
   348H        6100 0000                BSR     [0000H] = 0000034AH
   34CH        588F                     ADDQ.L  #4,A7
   34EH        285F                     MOVE.L  (A7)+,A4
   350H        2F0C                     MOVE.L  A4,-(A7)
   352H        3F3C 000D                MOVE.W  #000DH,-(A7)
   356H        4879 0000 02F8           PEA     000002F8H
   35CH        6100 0000                BSR     [0000H] = 0000035EH
   360H        5C8F                     ADDQ.L  #6,A7
   362H        285F                     MOVE.L  (A7)+,A4
   364H        2F0C                     MOVE.L  A4,-(A7)
   366H        2F2C 000E                MOVE.L  000E(A4),-(A7)
   36AH        6100 0000                BSR     [0000H] = 0000036CH
   36EH        588F                     ADDQ.L  #4,A7
   370H        285F                     MOVE.L  (A7)+,A4
   372H        2F0C                     MOVE.L  A4,-(A7)
   374H        3F3C 000B                MOVE.W  #000BH,-(A7)
   378H        4879 0000 0308           PEA     00000308H
   37EH        6100 0000                BSR     [0000H] = 00000380H
   382H        5C8F                     ADDQ.L  #6,A7
   384H        285F                     MOVE.L  (A7)+,A4
   386H        2F0C                     MOVE.L  A4,-(A7)
   388H        2F2C 0012                MOVE.L  0012(A4),-(A7)
   38CH        6100 0000                BSR     [0000H] = 0000038EH
   390H        588F                     ADDQ.L  #4,A7
   392H        285F                     MOVE.L  (A7)+,A4
   394H        2F0C                     MOVE.L  A4,-(A7)
   396H        6100 0000                BSR     [0000H] = 00000398H
   39AH        285F                     MOVE.L  (A7)+,A4
   39CH        2F0C                     MOVE.L  A4,-(A7)
   39EH        3F3C 0009                MOVE.W  #0009H,-(A7)
   3A2H        4879 0000 0316           PEA     00000316H
   3A8H        6100 0000                BSR     [0000H] = 000003AAH
   3ACH        5C8F                     ADDQ.L  #6,A7
   3AEH        285F                     MOVE.L  (A7)+,A4
   3B0H        2F0C                     MOVE.L  A4,-(A7)
   3B2H        2F2C 0016                MOVE.L  0016(A4),-(A7)
   3B6H        6100 0000                BSR     [0000H] = 000003B8H
   3BAH        588F                     ADDQ.L  #4,A7
   3BCH        285F                     MOVE.L  (A7)+,A4
   3BEH        2F0C                     MOVE.L  A4,-(A7)
   3C0H        6100 0000                BSR     [0000H] = 000003C2H
   3C4H        285F                     MOVE.L  (A7)+,A4
   3C6H        2F0C                     MOVE.L  A4,-(A7)
   3C8H        6100 0000                BSR     [0000H] = 000003CAH
   3CCH        285F                     MOVE.L  (A7)+,A4
   3CEH        2F0C                     MOVE.L  A4,-(A7)
   3D0H        3F3C 0010                MOVE.W  #0010H,-(A7)
   3D4H        4879 0000 0322           PEA     00000322H
   3DAH        6100 0000                BSR     [0000H] = 000003DCH
   3DEH        5C8F                     ADDQ.L  #6,A7
   3E0H        285F                     MOVE.L  (A7)+,A4
   3E2H        2F0C                     MOVE.L  A4,-(A7)
   3E4H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
   3EAH        6100 0000                BSR     [0000H] = 000003ECH
   3EEH        588F                     ADDQ.L  #4,A7
   3F0H        285F                     MOVE.L  (A7)+,A4
   3F2H        2F0C                     MOVE.L  A4,-(A7)
   3F4H        6100 0000                BSR     [0000H] = 000003F6H
   3F8H        285F                     MOVE.L  (A7)+,A4
   3FAH        23F9 0000 0000 0000 0008 MOVE.L  00000000H,00000008H
   404H        2679 0000 0008           MOVE.L  00000008H,A3
   40AH        23EB 0008 0000 0000      MOVE.L  0008(A3),00000000H
   412H        2A2B 000C                MOVE.L  000C(A3),D5
   416H        DAAB 0014                ADD.L   0014(A3),D5
   41AH        DAAB 001C                ADD.L   001C(A3),D5
   41EH        23C5 0000 0004           MOVE.L  D5,00000004H
   424H        48E7 0018                MOVEM.L #0018H,-(A7)
   428H        3F3C 000B                MOVE.W  #000BH,-(A7)
   42CH        4879 0000 0334           PEA     00000334H
   432H        6100 0000                BSR     [0000H] = 00000434H
   436H        5C8F                     ADDQ.L  #6,A7
   438H        4CDF 1800                MOVEM.L (A7)+,#1800H
   43CH        48E7 0018                MOVEM.L #0018H,-(A7)
   440H        2F13                     MOVE.L  (A3),-(A7)
   442H        6100 0000                BSR     [0000H] = 00000444H
   446H        588F                     ADDQ.L  #4,A7
   448H        4CDF 1800                MOVEM.L (A7)+,#1800H
   44CH        48E7 0018                MOVEM.L #0018H,-(A7)
   450H        3F3C 0010                MOVE.W  #0010H,-(A7)
   454H        4879 0000 0342           PEA     00000342H
   45AH        6100 0000                BSR     [0000H] = 0000045CH
   45EH        5C8F                     ADDQ.L  #6,A7
   460H        4CDF 1800                MOVEM.L (A7)+,#1800H
   464H        48E7 0018                MOVEM.L #0018H,-(A7)
   468H        2F2B 0004                MOVE.L  0004(A3),-(A7)
   46CH        6100 0000                BSR     [0000H] = 0000046EH
   470H        588F                     ADDQ.L  #4,A7
   472H        4CDF 1800                MOVEM.L (A7)+,#1800H
   476H        48E7 0018                MOVEM.L #0018H,-(A7)
   47AH        6100 0000                BSR     [0000H] = 0000047CH
   47EH        4CDF 1800                MOVEM.L (A7)+,#1800H
   482H        48E7 0018                MOVEM.L #0018H,-(A7)
   486H        3F3C 000B                MOVE.W  #000BH,-(A7)
   48AH        4879 0000 0354           PEA     00000354H
   490H        6100 0000                BSR     [0000H] = 00000492H
   494H        5C8F                     ADDQ.L  #6,A7
   496H        4CDF 1800                MOVEM.L (A7)+,#1800H
   49AH        48E7 0018                MOVEM.L #0018H,-(A7)
   49EH        2F2B 0008                MOVE.L  0008(A3),-(A7)
   4A2H        6100 0000                BSR     [0000H] = 000004A4H
   4A6H        588F                     ADDQ.L  #4,A7
   4A8H        4CDF 1800                MOVEM.L (A7)+,#1800H
   4ACH        48E7 0018                MOVEM.L #0018H,-(A7)
   4B0H        3F3C 0010                MOVE.W  #0010H,-(A7)
   4B4H        4879 0000 0362           PEA     00000362H
   4BAH        6100 0000                BSR     [0000H] = 000004BCH
   4BEH        5C8F                     ADDQ.L  #6,A7
   4C0H        4CDF 1800                MOVEM.L (A7)+,#1800H
   4C4H        48E7 0018                MOVEM.L #0018H,-(A7)
   4C8H        2F2B 000C                MOVE.L  000C(A3),-(A7)
   4CCH        6100 0000                BSR     [0000H] = 000004CEH
   4D0H        588F                     ADDQ.L  #4,A7
   4D2H        4CDF 1800                MOVEM.L (A7)+,#1800H
   4D6H        48E7 0018                MOVEM.L #0018H,-(A7)
   4DAH        6100 0000                BSR     [0000H] = 000004DCH
   4DEH        4CDF 1800                MOVEM.L (A7)+,#1800H
   4E2H        48E7 0018                MOVEM.L #0018H,-(A7)
   4E6H        3F3C 000B                MOVE.W  #000BH,-(A7)
   4EAH        4879 0000 0374           PEA     00000374H
   4F0H        6100 0000                BSR     [0000H] = 000004F2H
   4F4H        5C8F                     ADDQ.L  #6,A7
   4F6H        4CDF 1800                MOVEM.L (A7)+,#1800H
   4FAH        48E7 0018                MOVEM.L #0018H,-(A7)
   4FEH        2F2B 0010                MOVE.L  0010(A3),-(A7)
   502H        6100 0000                BSR     [0000H] = 00000504H
   506H        588F                     ADDQ.L  #4,A7
   508H        4CDF 1800                MOVEM.L (A7)+,#1800H
   50CH        48E7 0018                MOVEM.L #0018H,-(A7)
   510H        3F3C 0010                MOVE.W  #0010H,-(A7)
   514H        4879 0000 0382           PEA     00000382H
   51AH        6100 0000                BSR     [0000H] = 0000051CH
   51EH        5C8F                     ADDQ.L  #6,A7
   520H        4CDF 1800                MOVEM.L (A7)+,#1800H
   524H        48E7 0018                MOVEM.L #0018H,-(A7)
   528H        2F2B 0014                MOVE.L  0014(A3),-(A7)
   52CH        6100 0000                BSR     [0000H] = 0000052EH
   530H        588F                     ADDQ.L  #4,A7
   532H        4CDF 1800                MOVEM.L (A7)+,#1800H
   536H        48E7 0018                MOVEM.L #0018H,-(A7)
   53AH        6100 0000                BSR     [0000H] = 0000053CH
   53EH        4CDF 1800                MOVEM.L (A7)+,#1800H
   542H        48E7 0018                MOVEM.L #0018H,-(A7)
   546H        3F3C 000B                MOVE.W  #000BH,-(A7)
   54AH        4879 0000 0394           PEA     00000394H
   550H        6100 0000                BSR     [0000H] = 00000552H
   554H        5C8F                     ADDQ.L  #6,A7
   556H        4CDF 1800                MOVEM.L (A7)+,#1800H
   55AH        48E7 0018                MOVEM.L #0018H,-(A7)
   55EH        2F2B 0018                MOVE.L  0018(A3),-(A7)
   562H        6100 0000                BSR     [0000H] = 00000564H
   566H        588F                     ADDQ.L  #4,A7
   568H        4CDF 1800                MOVEM.L (A7)+,#1800H
   56CH        48E7 0018                MOVEM.L #0018H,-(A7)
   570H        3F3C 0010                MOVE.W  #0010H,-(A7)
   574H        4879 0000 03A2           PEA     000003A2H
   57AH        6100 0000                BSR     [0000H] = 0000057CH
   57EH        5C8F                     ADDQ.L  #6,A7
   580H        4CDF 1800                MOVEM.L (A7)+,#1800H
   584H        48E7 0018                MOVEM.L #0018H,-(A7)
   588H        2F2B 001C                MOVE.L  001C(A3),-(A7)
   58CH        6100 0000                BSR     [0000H] = 0000058EH
   590H        588F                     ADDQ.L  #4,A7
   592H        4CDF 1800                MOVEM.L (A7)+,#1800H
   596H        48E7 0018                MOVEM.L #0018H,-(A7)
   59AH        6100 0000                BSR     [0000H] = 0000059CH
   59EH        4CDF 1800                MOVEM.L (A7)+,#1800H
   5A2H        48E7 0018                MOVEM.L #0018H,-(A7)
   5A6H        6100 0000                BSR     [0000H] = 000005A8H
   5AAH        4CDF 1800                MOVEM.L (A7)+,#1800H
   5AEH        48E7 0018                MOVEM.L #0018H,-(A7)
   5B2H        3F3C 001A                MOVE.W  #001AH,-(A7)
   5B6H        4879 0000 03B4           PEA     000003B4H
   5BCH        6100 0000                BSR     [0000H] = 000005BEH
   5C0H        5C8F                     ADDQ.L  #6,A7
   5C2H        4CDF 1800                MOVEM.L (A7)+,#1800H
   5C6H        48E7 0018                MOVEM.L #0018H,-(A7)
   5CAH        2A2C 0004                MOVE.L  0004(A4),D5
   5CEH        9AAB 0008                SUB.L   0008(A3),D5
   5D2H        2F05                     MOVE.L  D5,-(A7)
   5D4H        6100 0000                BSR     [0000H] = 000005D6H
   5D8H        588F                     ADDQ.L  #4,A7
   5DAH        4CDF 1800                MOVEM.L (A7)+,#1800H
   5DEH        48E7 0018                MOVEM.L #0018H,-(A7)
   5E2H        6100 0000                BSR     [0000H] = 000005E4H
   5E6H        4CDF 1800                MOVEM.L (A7)+,#1800H
   5EAH        48E7 0018                MOVEM.L #0018H,-(A7)
   5EEH        6100 0000                BSR     [0000H] = 000005F0H
   5F2H        4CDF 1800                MOVEM.L (A7)+,#1800H
   5F6H        2A0F                     MOVE.L  A7,D5
   5F8H        23C5 0000 0512           MOVE.L  D5,00000512H
   5FEH        45F9 0000 0382           LEA     00000382H,A2
   604H        2A0A                     MOVE.L  A2,D5
   606H        0685 0000 0190           ADDI.L  #00000190H,D5
   60CH        2E45                     MOVE.L  D5,A7
   60EH        48E7 0018                MOVEM.L #0018H,-(A7)
   612H        45F9 0000 00FC           LEA     000000FCH,A2
   618H        204A                     MOVE.L  A2,A0
   61AH        45F9 0000 00FC           LEA     000000FCH,A2
   620H        224A                     MOVE.L  A2,A1
   622H        4EB9 0000 0000           JSR     00000000H
   628H        4CDF 1800                MOVEM.L (A7)+,#1800H
   62CH        2E79 0000 0512           MOVE.L  00000512H,A7
   632H        3F3C 001C                MOVE.W  #001CH,-(A7)
   636H        4879 0000 03D0           PEA     000003D0H
   63CH        6100 0000                BSR     [0000H] = 0000063EH
   640H        5C8F                     ADDQ.L  #6,A7
   642H        486E FFFF                PEA     FFFF(A6)
   646H        4EB9 0000 0000           JSR     00000000H
   64CH        588F                     ADDQ.L  #4,A7
   64EH        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
   654H        6702                     BEQ     [02H] = 00000658H
   656H        60EA                     BRA     [EAH] = 00000642H
   658H        2A0D                     MOVE.L  A5,D5
   65AH        7828                     MOVEQ   #28H,D4
   65CH        9A84                     SUB.L   D4,D5
   65EH        2D45 FFFA                MOVE.L  D5,FFFA(A6)
   662H        286E FFFA                MOVE.L  FFFA(A6),A4
   666H        2F0C                     MOVE.L  A4,-(A7)
   668H        2854                     MOVE.L  (A4),A4
   66AH        4E94                     JSR     (A4)
   66CH        285F                     MOVE.L  (A7)+,A4
   66EH        4E5E                     UNLK    A6
   670H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     AH, procnum =  4, modnum =  3  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  3  checksum: o.k.

ref ext proc call at    22H, procnum =  4, modnum =  3  checksum: o.k.

ref ext proc call at    2EH, procnum =  4, modnum =  3  checksum: o.k.

ref own quick call at    36H, procnum =  2  checksum: o.k.

ref own string: at    3EH  checksum: o.k.

ref own quick call at    44H, procnum =  3  checksum: o.k.

ref own quick call at    4AH, procnum =  2  checksum: o.k.

ref ext data at    4EH, modnum =  2  checksum: o.k.

ref own string: at    5AH  checksum: o.k.

ref own quick call at    60H, procnum =  1  checksum: o.k.

ref own quick call at    70H, procnum =  4  checksum: o.k.

ref own string: at    7EH  checksum: o.k.

ref own quick call at    84H, procnum =  1  checksum: o.k.

ref util: at    92H, procnum =  1  checksum: o.k.

ref own string: at    AAH  checksum: o.k.

ref own quick call at    B0H, procnum =  3  checksum: o.k.

ref own string: at    C2H  checksum: o.k.

ref own quick call at    C8H, procnum =  3  checksum: o.k.

ref own string: at    DAH  checksum: o.k.

ref own quick call at    E0H, procnum =  3  checksum: o.k.

ref own string: at    F2H  checksum: o.k.

ref own quick call at    F8H, procnum =  3  checksum: o.k.

ref own string: at   10AH  checksum: o.k.

ref own quick call at   110H, procnum =  3  checksum: o.k.

ref own string: at   122H  checksum: o.k.

ref own quick call at   128H, procnum =  3  checksum: o.k.

ref own string: at   13AH  checksum: o.k.

ref own quick call at   140H, procnum =  3  checksum: o.k.

ref own string: at   152H  checksum: o.k.

ref own quick call at   158H, procnum =  3  checksum: o.k.

ref own string: at   16AH  checksum: o.k.

ref own quick call at   170H, procnum =  3  checksum: o.k.

ref own string: at   182H  checksum: o.k.

ref own quick call at   188H, procnum =  3  checksum: o.k.

ref own string: at   19AH  checksum: o.k.

ref own quick call at   1A0H, procnum =  3  checksum: o.k.

ref own string: at   1B2H  checksum: o.k.

ref own quick call at   1B8H, procnum =  3  checksum: o.k.

ref own string: at   1CAH  checksum: o.k.

ref own quick call at   1D0H, procnum =  3  checksum: o.k.

ref own string: at   1E2H  checksum: o.k.

ref own quick call at   1E8H, procnum =  3  checksum: o.k.

ref own string: at   1FAH  checksum: o.k.

ref own quick call at   200H, procnum =  3  checksum: o.k.

ref own string: at   236H  checksum: o.k.

ref own quick call at   23CH, procnum =  3  checksum: o.k.

ref own string: at   24AH  checksum: o.k.

ref own quick call at   250H, procnum =  1  checksum: o.k.

ref util: at   260H, procnum =  1  checksum: o.k.

ref own string: at   278H  checksum: o.k.

ref own quick call at   27EH, procnum =  3  checksum: o.k.

ref own string: at   290H  checksum: o.k.

ref own quick call at   296H, procnum =  3  checksum: o.k.

ref own string: at   2A8H  checksum: o.k.

ref own quick call at   2AEH, procnum =  3  checksum: o.k.

ref own string: at   2CAH  checksum: o.k.

ref own quick call at   2D0H, procnum =  3  checksum: o.k.

ref own quick call at   2DAH, procnum =  2  checksum: o.k.

ref own string: at   2E6H  checksum: o.k.

ref own quick call at   2ECH, procnum =  1  checksum: o.k.

ref own quick call at   2FAH, procnum =  4  checksum: o.k.

ref own string: at   308H  checksum: o.k.

ref own quick call at   30EH, procnum =  1  checksum: o.k.

ref own quick call at   320H, procnum =  4  checksum: o.k.

ref own quick call at   32AH, procnum =  2  checksum: o.k.

ref own string: at   336H  checksum: o.k.

ref own quick call at   33CH, procnum =  1  checksum: o.k.

ref own quick call at   34AH, procnum =  4  checksum: o.k.

ref own string: at   358H  checksum: o.k.

ref own quick call at   35EH, procnum =  1  checksum: o.k.

ref own quick call at   36CH, procnum =  4  checksum: o.k.

ref own string: at   37AH  checksum: o.k.

ref own quick call at   380H, procnum =  1  checksum: o.k.

ref own quick call at   38EH, procnum =  4  checksum: o.k.

ref own quick call at   398H, procnum =  2  checksum: o.k.

ref own string: at   3A4H  checksum: o.k.

ref own quick call at   3AAH, procnum =  1  checksum: o.k.

ref own quick call at   3B8H, procnum =  4  checksum: o.k.

ref own quick call at   3C2H, procnum =  2  checksum: o.k.

ref own quick call at   3CAH, procnum =  2  checksum: o.k.

ref own string: at   3D6H  checksum: o.k.

ref own quick call at   3DCH, procnum =  1  checksum: o.k.

ref ext data at   3E6H, modnum =  2  checksum: o.k.

ref own quick call at   3ECH, procnum =  4  checksum: o.k.

ref own quick call at   3F6H, procnum =  2  checksum: o.k.

ref ext data at   3FCH, modnum =  2  checksum: o.k.

ref own data at   400H  checksum: o.k.

ref own data at   406H  checksum: o.k.

ref own data at   40EH  checksum: o.k.

ref own data at   420H  checksum: o.k.

ref own string: at   42EH  checksum: o.k.

ref own quick call at   434H, procnum =  1  checksum: o.k.

ref own quick call at   444H, procnum =  4  checksum: o.k.

ref own string: at   456H  checksum: o.k.

ref own quick call at   45CH, procnum =  1  checksum: o.k.

ref own quick call at   46EH, procnum =  4  checksum: o.k.

ref own quick call at   47CH, procnum =  2  checksum: o.k.

ref own string: at   48CH  checksum: o.k.

ref own quick call at   492H, procnum =  1  checksum: o.k.

ref own quick call at   4A4H, procnum =  4  checksum: o.k.

ref own string: at   4B6H  checksum: o.k.

ref own quick call at   4BCH, procnum =  1  checksum: o.k.

ref own quick call at   4CEH, procnum =  4  checksum: o.k.

ref own quick call at   4DCH, procnum =  2  checksum: o.k.

ref own string: at   4ECH  checksum: o.k.

ref own quick call at   4F2H, procnum =  1  checksum: o.k.

ref own quick call at   504H, procnum =  4  checksum: o.k.

ref own string: at   516H  checksum: o.k.

ref own quick call at   51CH, procnum =  1  checksum: o.k.

ref own quick call at   52EH, procnum =  4  checksum: o.k.

ref own quick call at   53CH, procnum =  2  checksum: o.k.

ref own string: at   54CH  checksum: o.k.

ref own quick call at   552H, procnum =  1  checksum: o.k.

ref own quick call at   564H, procnum =  4  checksum: o.k.

ref own string: at   576H  checksum: o.k.

ref own quick call at   57CH, procnum =  1  checksum: o.k.

ref own quick call at   58EH, procnum =  4  checksum: o.k.

ref own quick call at   59CH, procnum =  2  checksum: o.k.

ref own quick call at   5A8H, procnum =  2  checksum: o.k.

ref own string: at   5B8H  checksum: o.k.

ref own quick call at   5BEH, procnum =  1  checksum: o.k.

ref own quick call at   5D6H, procnum =  4  checksum: o.k.

ref own quick call at   5E4H, procnum =  2  checksum: o.k.

ref own quick call at   5F0H, procnum =  2  checksum: o.k.

ref own data at   5FAH  checksum: o.k.

ref own data at   600H  checksum: o.k.

ref own data at   614H  checksum: o.k.

ref own data at   61CH  checksum: o.k.

ref util: at   624H, procnum =  5  checksum: o.k.

ref own data at   62EH  checksum: o.k.

ref own string: at   638H  checksum: o.k.

ref own quick call at   63EH, procnum =  1  checksum: o.k.

ref ext proc call at   648H, procnum =  2, modnum =  3  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 32
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        23FC 0000 0000 0000 0004 MOVE.L  #00000000H,00000004H
    18H        4E5E                     UNLK    A6
    1AH        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own quick call at     CH, procnum =  5  checksum: o.k.

ref own proc ass at    10H, procnum = 11  checksum: o.k.

ref ext data at    14H, modnum =  2  checksum: o.k.

ref ext init call at    1AH  checksum: o.k.

string data:, number of bytes = 1006
NO DECODE -------- DATA

     0H         4D32     4F50     5449     4F4E     0000     
     AH         4455     4D50     2E43     4F52     0000     
    14H         5772     6974     696E     6720     6475     
    1EH         6D70     2066     696C     6520     0000     
    28H         202D     2000     756E     6162     6C65     
    32H         2074     6F20     6372     6561     7465     
    3CH         2066     696C     6500     6361     6E6E     
    46H         6F74     2077     7269     7465     2068     
    50H         6561     6465     7200     6E6F     7420     
    5AH         656E     6F75     6768     2072     6F6F     
    64H         6D20     6F6E     2064     6973     6300     
    6EH         6F6B     0000     6361     6E6E     6F74     
    78H         2063     6C6F     7365     2066     696C     
    82H         6500     4475     6D70     206E     6F74     
    8CH         2065     6E61     626C     6564     0000     
    96H         4E6F     2022     4D6F     6475     6C61     
    A0H         2D32     204F     7074     696F     6E73     
    AAH         2220     6465     736B     2061     6363     
    B4H         6573     736F     7279     0000     4745     
    BEH         4D45     7272     6F72     3A20     4D6F     
    C8H         6475     6C61     2D32     2F53     5420     
    D2H         5275     6E2D     7469     6D65     2065     
    DCH         7272     6F72     2070     726F     6365     
    E6H         7373     6F72     2033     2E30     3061     
    F0H         0000     4572     726F     7220     636F     
    FAH         6465     2000     3A20     0000     4172     
   104H         6974     686D     6574     6963     206F     
   10EH         7665     7266     6C6F     7720     7472     
   118H         6170     0000     4F75     7420     6F66     
   122H         2072     616E     6765     2074     7261     
   12CH         7000     4469     7669     7369     6F6E     
   136H         2062     7920     7A65     726F     2074     
   140H         7261     7000     4164     6472     6573     
   14AH         7320     6572     726F     7220     7472     
   154H         6170     0000     4275     7320     6572     
   15EH         726F     7220     7472     6170     0000     
   168H         5072     6F67     7261     6D20     4841     
   172H         4C54     0000     4E6F     2052     4554     
   17CH         5552     4E20     6672     6F6D     2066     
   186H         756E     6374     696F     6E20     7072     
   190H         6F63     6564     7572     6500     496C     
   19AH         6C65     6761     6C20     4341     5345     
   1A4H         2069     6E64     6578     2072     616E     
   1AEH         6765     0000     5374     6163     6B20     
   1B8H         6F76     6572     666C     6F77     0000     
   1C2H         4F75     7420     6F66     2072     616E     
   1CCH         6765     0000     4172     6974     686D     
   1D6H         6574     6963     206F     7665     7266     
   1E0H         6C6F     7700     4E6F     7420     656E     
   1EAH         6F75     6768     2077     6F72     6B73     
   1F4H         7061     6365     2066     6F72     206E     
   1FEH         6577     2070     726F     6365     7373     
   208H         0000     5072     6F63     6573     7320     
   212H         7465     726D     696E     6174     6564     
   21CH         0000     556E     696D     706C     696D     
   226H         656E     7465     6420     7275     6E2D     
   230H         7469     6D65     2072     6F75     7469     
   23AH         6E65     0000     4E6F     726D     616C     
   244H         2072     6574     7572     6E20     2D20     
   24EH         7368     6F75     6C64     206E     6F74     
   258H         206F     6363     7572     0000     556E     
   262H         6B6E     6F77     6E20     2D20     7368     
   26CH         6F75     6C64     206E     6F74     206F     
   276H         6363     7572     0000     4572     726F     
   280H         7220     6361     7573     6520     7761     
   28AH         7320     0000     5275     6E2D     7469     
   294H         6D65     2065     7272     6F72     0000     
   29EH         5261     6973     6564     2065     7272     
   2A8H         6F72     0000     5072     6F70     6167     
   2B2H         6174     6564     2065     7272     6F72     
   2BCH         0000     756E     6B6E     6F77     6E20     
   2C6H         2D20     7368     6F75     6C64     206E     
   2D0H         6F74     206F     6363     7572     0000     
   2DAH         5043     203D     2000     2C20     5352     
   2E4H         203D     2000     4135     2028     5072     
   2EEH         6F63     6573     7329     203D     2000     
   2F8H         2C20     4136     2028     4D61     726B     
   302H         2920     3D20     0000     2C20     4137     
   30CH         2028     5350     2920     3D20     0000     
   316H         4C61     7374     204D     5020     3D20     
   320H         0000     4261     7365     2070     6167     
   32AH         6520     6164     6472     203D     2000     
   334H         4C6F     7720     5450     4120     2020     
   33EH         3D20     0000     2C20     4869     6768     
   348H         2054     5041     2020     2020     203D     
   352H         2000     436F     6465     2062     6173     
   35CH         6520     3D20     0000     2C20     436F     
   366H         6465     206C     656E     6774     6820     
   370H         203D     2000     4461     7461     2062     
   37AH         6173     6520     3D20     0000     2C20     
   384H         4461     7461     206C     656E     6774     
   38EH         6820     203D     2000     4253     5320     
   398H         6261     7365     2020     3D20     0000     
   3A2H         2C20     4253     5320     6C65     6E67     
   3ACH         7468     2020     203D     2000     5043     
   3B6H         206F     6666     7365     7420     6672     
   3C0H         6F6D     2043     6F64     6520     4261     
   3CAH         7365     203D     2000     5072     6573     
   3D4H         7320     3C73     7061     6365     3E20     
   3DEH         746F     2063     6F6E     7469     6E75     
   3E8H         652E     2E2E     2000       checksum: o.k.

scmod end  checksum: o.k.
