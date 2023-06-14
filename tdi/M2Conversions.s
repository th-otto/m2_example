link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  M2Conversions, key =  2102H  F1E8H  393EH  checksum: o.k.

import Strings, key =  2102H  F1D3H  5C23H, modnum =  2  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 60
PROCEDURE ConvertCardinal(CARDINAL; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        33EE 0010 0000 0002      MOVE.W  0010(A6),00000002H
    12H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        1F3C 0001                MOVE.B  #01H,-(A7)
    20H        1F3C 0020                MOVE.B  #20H,-(A7)
    24H        4227                     CLR.B   -(A7)
    26H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    2AH        286E 0008                MOVE.L  0008(A6),A4
    2EH        4854                     PEA     (A4)
    30H        6100 0000                BSR     [0000H] = 00000032H
    34H        4FEF 0012                LEA     0012(A7),A7
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own quick call at    32H, procnum = 16  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 76
PROCEDURE ConvertInteger(INTEGER; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        3A2E 0010                MOVE.W  0010(A6),D5
     EH        4A45                     TST.W   D5
    10H        6C02                     BGE     [02H] = 00000014H
    12H        4445                     NEG.W   D5
    14H        33C5 0000 0002           MOVE.W  D5,00000002H
    1AH        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    20H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    24H        1F3C 0001                MOVE.B  #01H,-(A7)
    28H        1F3C 0020                MOVE.B  #20H,-(A7)
    2CH        4A6E 0010                TST.W   0010(A6)
    30H        5DC5                     SLT     D5
    32H        4405                     NEG.B   D5
    34H        1F05                     MOVE.B  D5,-(A7)
    36H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        4854                     PEA     (A4)
    40H        6100 0000                BSR     [0000H] = 00000042H
    44H        4FEF 0012                LEA     0012(A7),A7
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    42H, procnum = 16  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3A2E 000A                MOVE.W  000A(A6),D5
     8H        BA6E 0008                CMP.W   0008(A6),D5
     CH        6D0E                     BLT     [0EH] = 0000001CH
     EH        3D6E 000A 000C           MOVE.W  000A(A6),000C(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
    18H        4EFA 000C                JMP     [000CH] = 00000026H
    1CH        3D6E 0008 000C           MOVE.W  0008(A6),000C(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 1308
PROCEDURE ConvertReal(REAL; CARDINAL; INTEGER; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FF84                LINK    A6,#FF84H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        422E FF84                CLR.B   FF84(A6)
     EH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        588F                     ADDQ.L  #4,A7
    1AH        6C16                     BGE     [16H] = 00000032H
    1CH        1D7C 0001 FFF5           MOVE.B  #01H,FFF5(A6)
    22H        2A2E 0012                MOVE.L  0012(A6),D5
    26H        0885 001F                BCLR    #001FH,D5
    2AH        2D45 0012                MOVE.L  D5,0012(A6)
    2EH        4EFA 0006                JMP     [0006H] = 00000036H
    32H        422E FFF5                CLR.B   FFF5(A6)
    36H        4A6E 000E                TST.W   000E(A6)
    3AH        6D32                     BLT     [32H] = 0000006EH
    3CH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    40H        2F3C 4CBE BC20           MOVE.L  #4CBEBC20H,-(A7)
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        508F                     ADDQ.L  #8,A7
    4EH        6C1E                     BGE     [1EH] = 0000006EH
    50H        2F2E 0012                MOVE.L  0012(A6),-(A7)
    54H        598F                     SUBQ.L  #4,A7
    56H        3A2E 000E                MOVE.W  000E(A6),D5
    5AH        4445                     NEG.W   D5
    5CH        3F05                     MOVE.W  D5,-(A7)
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        548F                     ADDQ.L  #2,A7
    64H        4EB9 0000 0000           JSR     00000000H
    6AH        508F                     ADDQ.L  #8,A7
    6CH        6E2C                     BGT     [2CH] = 0000009AH
    6EH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    72H        4EB9 0000 0000           JSR     00000000H
    78H        588F                     ADDQ.L  #4,A7
    7AH        671E                     BEQ     [1EH] = 0000009AH
    7CH        1D7C 0001 FFF4           MOVE.B  #01H,FFF4(A6)
    82H        3A2E 000E                MOVE.W  000E(A6),D5
    86H        4A45                     TST.W   D5
    88H        6C02                     BGE     [02H] = 0000008CH
    8AH        4445                     NEG.W   D5
    8CH        3D45 000E                MOVE.W  D5,000E(A6)
    90H        3D7C 0007 FFF2           MOVE.W  #0007H,FFF2(A6)
    96H        4EFA 0024                JMP     [0024H] = 000000BCH
    9AH        2F2E 0012                MOVE.L  0012(A6),-(A7)
    9EH        4EB9 0000 0000           JSR     00000000H
    A4H        588F                     ADDQ.L  #4,A7
    A6H        660A                     BNE     [0AH] = 000000B2H
    A8H        4A6E 000E                TST.W   000E(A6)
    ACH        6C04                     BGE     [04H] = 000000B2H
    AEH        426E 000E                CLR.W   000E(A6)
    B2H        422E FFF4                CLR.B   FFF4(A6)
    B6H        3D7C 0003 FFF2           MOVE.W  #0003H,FFF2(A6)
    BCH        558F                     SUBQ.L  #2,A7
    BEH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    C2H        3F2E FFF2                MOVE.W  FFF2(A6),-(A7)
    C6H        6100 0000                BSR     [0000H] = 000000C8H
    CAH        588F                     ADDQ.L  #4,A7
    CCH        3D5F 0010                MOVE.W  (A7)+,0010(A6)
    D0H        558F                     SUBQ.L  #2,A7
    D2H        3A2E 000E                MOVE.W  000E(A6),D5
    D6H        4445                     NEG.W   D5
    D8H        3F05                     MOVE.W  D5,-(A7)
    DAH        3A2E FFF2                MOVE.W  FFF2(A6),D5
    DEH        9A6E 0010                SUB.W   0010(A6),D5
    E2H        3F05                     MOVE.W  D5,-(A7)
    E4H        6100 0000                BSR     [0000H] = 000000E6H
    E8H        588F                     ADDQ.L  #4,A7
    EAH        3A1F                     MOVE.W  (A7)+,D5
    ECH        4445                     NEG.W   D5
    EEH        3D45 FFEA                MOVE.W  D5,FFEA(A6)
    F2H        3A2E 0010                MOVE.W  0010(A6),D5
    F6H        9A6E FFEA                SUB.W   FFEA(A6),D5
    FAH        9A6E FFF2                SUB.W   FFF2(A6),D5
    FEH        5445                     ADDQ.W  #2,D5
   100H        3D45 FFEC                MOVE.W  D5,FFEC(A6)
   104H        2F3C 3F00 0000           MOVE.L  #3F000000H,-(A7)
   10AH        598F                     SUBQ.L  #4,A7
   10CH        3A2E FFEA                MOVE.W  FFEA(A6),D5
   110H        4445                     NEG.W   D5
   112H        3F05                     MOVE.W  D5,-(A7)
   114H        6100 0000                BSR     [0000H] = 00000116H
   118H        548F                     ADDQ.L  #2,A7
   11AH        4EB9 0000 0000           JSR     00000000H
   120H        588F                     ADDQ.L  #4,A7
   122H        2D5F FFFA                MOVE.L  (A7)+,FFFA(A6)
   126H        4A2E FFF4                TST.B   FFF4(A6)
   12AH        6702                     BEQ     [02H] = 0000012EH
   12CH        6004                     BRA     [04H] = 00000132H
   12EH        4EFA 008C                JMP     [008CH] = 000001BCH
   132H        426E FFF6                CLR.W   FFF6(A6)
   136H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   13AH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
   140H        2F2E FFFA                MOVE.L  FFFA(A6),-(A7)
   144H        4EB9 0000 0000           JSR     00000000H
   14AH        588F                     ADDQ.L  #4,A7
   14CH        4EB9 0000 0000           JSR     00000000H
   152H        508F                     ADDQ.L  #8,A7
   154H        6C2A                     BGE     [2AH] = 00000180H
   156H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   15AH        4EB9 0000 0000           JSR     00000000H
   160H        588F                     ADDQ.L  #4,A7
   162H        671C                     BEQ     [1CH] = 00000180H
   164H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   168H        2F3C 4120 0000           MOVE.L  #41200000H,-(A7)
   16EH        4EB9 0000 0000           JSR     00000000H
   174H        588F                     ADDQ.L  #4,A7
   176H        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   17AH        536E FFF6                SUBQ.W  #1,FFF6(A6)
   17EH        60B6                     BRA     [B6H] = 00000136H
   180H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   184H        2F3C 4120 0000           MOVE.L  #41200000H,-(A7)
   18AH        2F2E FFFA                MOVE.L  FFFA(A6),-(A7)
   18EH        4EB9 0000 0000           JSR     00000000H
   194H        588F                     ADDQ.L  #4,A7
   196H        4EB9 0000 0000           JSR     00000000H
   19CH        508F                     ADDQ.L  #8,A7
   19EH        6D1C                     BLT     [1CH] = 000001BCH
   1A0H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   1A4H        2F3C 3DCC CCCD           MOVE.L  #3DCCCCCDH,-(A7)
   1AAH        4EB9 0000 0000           JSR     00000000H
   1B0H        588F                     ADDQ.L  #4,A7
   1B2H        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   1B6H        526E FFF6                ADDQ.W  #1,FFF6(A6)
   1BAH        60C4                     BRA     [C4H] = 00000180H
   1BCH        2F2E 0012                MOVE.L  0012(A6),-(A7)
   1C0H        2F2E FFFA                MOVE.L  FFFA(A6),-(A7)
   1C4H        4EB9 0000 0000           JSR     00000000H
   1CAH        588F                     ADDQ.L  #4,A7
   1CCH        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   1D0H        1D7C 0020 FFFF           MOVE.B  #20H,FFFF(A6)
   1D6H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   1DAH        2F3C 461C 4000           MOVE.L  #461C4000H,-(A7)
   1E0H        4EB9 0000 0000           JSR     00000000H
   1E6H        508F                     ADDQ.L  #8,A7
   1E8H        6D02                     BLT     [02H] = 000001ECH
   1EAH        6004                     BRA     [04H] = 000001F0H
   1ECH        4EFA 00C6                JMP     [00C6H] = 000002B4H
   1F0H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   1F4H        2F3C 38D1 B717           MOVE.L  #38D1B717H,-(A7)
   1FAH        4EB9 0000 0000           JSR     00000000H
   200H        588F                     ADDQ.L  #4,A7
   202H        4EB9 0000 0000           JSR     00000000H
   208H        2A1F                     MOVE.L  (A7)+,D5
   20AH        3D45 FFF0                MOVE.W  D5,FFF0(A6)
   20EH        4279 0000 0000           CLR.W   00000000H
   214H        33EE FFF0 0000 0002      MOVE.W  FFF0(A6),00000002H
   21CH        2F39 0000 0000           MOVE.L  00000000H,-(A7)
   222H        558F                     SUBQ.L  #2,A7
   224H        3A2E FFEC                MOVE.W  FFEC(A6),D5
   228H        5945                     SUBQ.W  #4,D5
   22AH        3F05                     MOVE.W  D5,-(A7)
   22CH        3F3C 0001                MOVE.W  #0001H,-(A7)
   230H        6100 0000                BSR     [0000H] = 00000232H
   234H        588F                     ADDQ.L  #4,A7
   236H        1F3C 0001                MOVE.B  #01H,-(A7)
   23AH        1F2E FFFF                MOVE.B  FFFF(A6),-(A7)
   23EH        1F2E FFF5                MOVE.B  FFF5(A6),-(A7)
   242H        3F3C 0064                MOVE.W  #0064H,-(A7)
   246H        486E FF84                PEA     FF84(A6)
   24AH        6100 0000                BSR     [0000H] = 0000024CH
   24EH        4FEF 0012                LEA     0012(A7),A7
   252H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   256H        286E 0008                MOVE.L  0008(A6),A4
   25AH        4854                     PEA     (A4)
   25CH        3F3C 0064                MOVE.W  #0064H,-(A7)
   260H        486E FF84                PEA     FF84(A6)
   264H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   268H        286E 0008                MOVE.L  0008(A6),A4
   26CH        4854                     PEA     (A4)
   26EH        4EB9 0000 0000           JSR     00000000H
   274H        4FEF 0012                LEA     0012(A7),A7
   278H        422E FFF5                CLR.B   FFF5(A6)
   27CH        3D7C 0004 FFEC           MOVE.W  #0004H,FFEC(A6)
   282H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   286H        7A00                     MOVEQ   #00H,D5
   288H        3A2E FFF0                MOVE.W  FFF0(A6),D5
   28CH        2F05                     MOVE.L  D5,-(A7)
   28EH        4EB9 0000 0000           JSR     00000000H
   294H        2F3C 461C 4000           MOVE.L  #461C4000H,-(A7)
   29AH        4EB9 0000 0000           JSR     00000000H
   2A0H        588F                     ADDQ.L  #4,A7
   2A2H        4EB9 0000 0000           JSR     00000000H
   2A8H        588F                     ADDQ.L  #4,A7
   2AAH        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   2AEH        1D7C 0030 FFFF           MOVE.B  #30H,FFFF(A6)
   2B4H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   2B8H        4EB9 0000 0000           JSR     00000000H
   2BEH        2A1F                     MOVE.L  (A7)+,D5
   2C0H        3D45 FFF0                MOVE.W  D5,FFF0(A6)
   2C4H        4279 0000 0000           CLR.W   00000000H
   2CAH        33EE FFF0 0000 0002      MOVE.W  FFF0(A6),00000002H
   2D2H        422E FF84                CLR.B   FF84(A6)
   2D6H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
   2DCH        3F2E FFEC                MOVE.W  FFEC(A6),-(A7)
   2E0H        1F3C 0001                MOVE.B  #01H,-(A7)
   2E4H        1F2E FFFF                MOVE.B  FFFF(A6),-(A7)
   2E8H        1F2E FFF5                MOVE.B  FFF5(A6),-(A7)
   2ECH        3F3C 0064                MOVE.W  #0064H,-(A7)
   2F0H        486E FF84                PEA     FF84(A6)
   2F4H        6100 0000                BSR     [0000H] = 000002F6H
   2F8H        4FEF 0012                LEA     0012(A7),A7
   2FCH        3F2E 000C                MOVE.W  000C(A6),-(A7)
   300H        286E 0008                MOVE.L  0008(A6),A4
   304H        4854                     PEA     (A4)
   306H        3F3C 0064                MOVE.W  #0064H,-(A7)
   30AH        486E FF84                PEA     FF84(A6)
   30EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
   312H        286E 0008                MOVE.L  0008(A6),A4
   316H        4854                     PEA     (A4)
   318H        4EB9 0000 0000           JSR     00000000H
   31EH        4FEF 0012                LEA     0012(A7),A7
   322H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   326H        7A00                     MOVEQ   #00H,D5
   328H        3A2E FFF0                MOVE.W  FFF0(A6),D5
   32CH        2F05                     MOVE.L  D5,-(A7)
   32EH        4EB9 0000 0000           JSR     00000000H
   334H        4EB9 0000 0000           JSR     00000000H
   33AH        588F                     ADDQ.L  #4,A7
   33CH        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   340H        558F                     SUBQ.L  #2,A7
   342H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   346H        286E 0008                MOVE.L  0008(A6),A4
   34AH        4854                     PEA     (A4)
   34CH        4EB9 0000 0000           JSR     00000000H
   352H        5C8F                     ADDQ.L  #6,A7
   354H        3D5F FFEE                MOVE.W  (A7)+,FFEE(A6)
   358H        3A2E FFEE                MOVE.W  FFEE(A6),D5
   35CH        286E 0008                MOVE.L  0008(A6),A4
   360H        19BC 002E 5000           MOVE.B  #2EH,00H(A4,D5.W)
   366H        3A2E FFEE                MOVE.W  FFEE(A6),D5
   36AH        5245                     ADDQ.W  #1,D5
   36CH        286E 0008                MOVE.L  0008(A6),A4
   370H        4234 5000                CLR.B   00H(A4,D5.W)
   374H        3A2E FFEC                MOVE.W  FFEC(A6),D5
   378H        DA6E FFEA                ADD.W   FFEA(A6),D5
   37CH        5245                     ADDQ.W  #1,D5
   37EH        3D45 FFEE                MOVE.W  D5,FFEE(A6)
   382H        4A6E FFEA                TST.W   FFEA(A6)
   386H        6302                     BLS     [02H] = 0000038AH
   388H        6004                     BRA     [04H] = 0000038EH
   38AH        4EFA 00D4                JMP     [00D4H] = 00000460H
   38EH        558F                     SUBQ.L  #2,A7
   390H        3A2E FFEA                MOVE.W  FFEA(A6),D5
   394H        4445                     NEG.W   D5
   396H        3F05                     MOVE.W  D5,-(A7)
   398H        3F3C FFFC                MOVE.W  #FFFCH,-(A7)
   39CH        6100 0000                BSR     [0000H] = 0000039EH
   3A0H        588F                     ADDQ.L  #4,A7
   3A2H        3A1F                     MOVE.W  (A7)+,D5
   3A4H        4445                     NEG.W   D5
   3A6H        3D45 FFF8                MOVE.W  D5,FFF8(A6)
   3AAH        2F2E 0012                MOVE.L  0012(A6),-(A7)
   3AEH        598F                     SUBQ.L  #4,A7
   3B0H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
   3B4H        6100 0000                BSR     [0000H] = 000003B6H
   3B8H        548F                     ADDQ.L  #2,A7
   3BAH        4EB9 0000 0000           JSR     00000000H
   3C0H        588F                     ADDQ.L  #4,A7
   3C2H        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   3C6H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   3CAH        4EB9 0000 0000           JSR     00000000H
   3D0H        2A1F                     MOVE.L  (A7)+,D5
   3D2H        3D45 FFF0                MOVE.W  D5,FFF0(A6)
   3D6H        4279 0000 0000           CLR.W   00000000H
   3DCH        33EE FFF0 0000 0002      MOVE.W  FFF0(A6),00000002H
   3E4H        422E FF84                CLR.B   FF84(A6)
   3E8H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
   3EEH        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
   3F2H        1F3C 0001                MOVE.B  #01H,-(A7)
   3F6H        1F3C 0030                MOVE.B  #30H,-(A7)
   3FAH        4227                     CLR.B   -(A7)
   3FCH        3F3C 0064                MOVE.W  #0064H,-(A7)
   400H        486E FF84                PEA     FF84(A6)
   404H        6100 0000                BSR     [0000H] = 00000406H
   408H        4FEF 0012                LEA     0012(A7),A7
   40CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
   410H        286E 0008                MOVE.L  0008(A6),A4
   414H        4854                     PEA     (A4)
   416H        3F3C 0064                MOVE.W  #0064H,-(A7)
   41AH        486E FF84                PEA     FF84(A6)
   41EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
   422H        286E 0008                MOVE.L  0008(A6),A4
   426H        4854                     PEA     (A4)
   428H        4EB9 0000 0000           JSR     00000000H
   42EH        4FEF 0012                LEA     0012(A7),A7
   432H        2F2E 0012                MOVE.L  0012(A6),-(A7)
   436H        7A00                     MOVEQ   #00H,D5
   438H        3A2E FFF0                MOVE.W  FFF0(A6),D5
   43CH        2F05                     MOVE.L  D5,-(A7)
   43EH        4EB9 0000 0000           JSR     00000000H
   444H        4EB9 0000 0000           JSR     00000000H
   44AH        588F                     ADDQ.L  #4,A7
   44CH        2D5F 0012                MOVE.L  (A7)+,0012(A6)
   450H        3A2E FFEA                MOVE.W  FFEA(A6),D5
   454H        9A6E FFF8                SUB.W   FFF8(A6),D5
   458H        3D45 FFEA                MOVE.W  D5,FFEA(A6)
   45CH        6000 FF24                BRA     [FF24H] = 00000382H
   460H        4A2E FFF4                TST.B   FFF4(A6)
   464H        6702                     BEQ     [02H] = 00000468H
   466H        6004                     BRA     [04H] = 0000046CH
   468H        4EFA 00AE                JMP     [00AEH] = 00000518H
   46CH        3A2E FFEE                MOVE.W  FFEE(A6),D5
   470H        286E 0008                MOVE.L  0008(A6),A4
   474H        19BC 0045 5000           MOVE.B  #45H,00H(A4,D5.W)
   47AH        526E FFEE                ADDQ.W  #1,FFEE(A6)
   47EH        4A6E FFF6                TST.W   FFF6(A6)
   482H        6D12                     BLT     [12H] = 00000496H
   484H        3A2E FFEE                MOVE.W  FFEE(A6),D5
   488H        286E 0008                MOVE.L  0008(A6),A4
   48CH        19BC 002B 5000           MOVE.B  #2BH,00H(A4,D5.W)
   492H        4EFA 0010                JMP     [0010H] = 000004A4H
   496H        3A2E FFEE                MOVE.W  FFEE(A6),D5
   49AH        286E 0008                MOVE.L  0008(A6),A4
   49EH        19BC 002D 5000           MOVE.B  #2DH,00H(A4,D5.W)
   4A4H        526E FFEE                ADDQ.W  #1,FFEE(A6)
   4A8H        3A2E FFEE                MOVE.W  FFEE(A6),D5
   4ACH        286E 0008                MOVE.L  0008(A6),A4
   4B0H        4234 5000                CLR.B   00H(A4,D5.W)
   4B4H        4279 0000 0000           CLR.W   00000000H
   4BAH        3A2E FFF6                MOVE.W  FFF6(A6),D5
   4BEH        4A45                     TST.W   D5
   4C0H        6C02                     BGE     [02H] = 000004C4H
   4C2H        4445                     NEG.W   D5
   4C4H        33C5 0000 0002           MOVE.W  D5,00000002H
   4CAH        422E FF84                CLR.B   FF84(A6)
   4CEH        2F39 0000 0000           MOVE.L  00000000H,-(A7)
   4D4H        3F3C 0002                MOVE.W  #0002H,-(A7)
   4D8H        1F3C 0001                MOVE.B  #01H,-(A7)
   4DCH        1F3C 0030                MOVE.B  #30H,-(A7)
   4E0H        4227                     CLR.B   -(A7)
   4E2H        3F3C 0064                MOVE.W  #0064H,-(A7)
   4E6H        486E FF84                PEA     FF84(A6)
   4EAH        6100 0000                BSR     [0000H] = 000004ECH
   4EEH        4FEF 0012                LEA     0012(A7),A7
   4F2H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   4F6H        286E 0008                MOVE.L  0008(A6),A4
   4FAH        4854                     PEA     (A4)
   4FCH        3F3C 0064                MOVE.W  #0064H,-(A7)
   500H        486E FF84                PEA     FF84(A6)
   504H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   508H        286E 0008                MOVE.L  0008(A6),A4
   50CH        4854                     PEA     (A4)
   50EH        4EB9 0000 0000           JSR     00000000H
   514H        4FEF 0012                LEA     0012(A7),A7
   518H        4E5E                     UNLK    A6
   51AH        4E75                     RTS
  checksum: o.k.

ref util: at    14H, procnum = 17  checksum: o.k.

ref util: at    48H, procnum = 16  checksum: o.k.

ref own quick call at    60H, procnum = 18  checksum: o.k.

ref util: at    66H, procnum = 16  checksum: o.k.

ref util: at    74H, procnum = 17  checksum: o.k.

ref util: at    A0H, procnum = 17  checksum: o.k.

ref own quick call at    C8H, procnum = 15  checksum: o.k.

ref own quick call at    E6H, procnum = 15  checksum: o.k.

ref own quick call at   116H, procnum = 18  checksum: o.k.

ref util: at   11CH, procnum = 14  checksum: o.k.

ref util: at   146H, procnum = 13  checksum: o.k.

ref util: at   14EH, procnum = 16  checksum: o.k.

ref util: at   15CH, procnum = 17  checksum: o.k.

ref util: at   170H, procnum = 14  checksum: o.k.

ref util: at   190H, procnum = 13  checksum: o.k.

ref util: at   198H, procnum = 16  checksum: o.k.

ref util: at   1ACH, procnum = 14  checksum: o.k.

ref util: at   1C6H, procnum = 12  checksum: o.k.

ref util: at   1E2H, procnum = 16  checksum: o.k.

ref util: at   1FCH, procnum = 14  checksum: o.k.

ref util: at   204H, procnum = 19  checksum: o.k.

ref own data at   210H  checksum: o.k.

ref own data at   218H  checksum: o.k.

ref own data at   21EH  checksum: o.k.

ref own quick call at   232H, procnum = 15  checksum: o.k.

ref own quick call at   24CH, procnum = 16  checksum: o.k.

ref ext proc call at   270H, procnum =  6, modnum =  2  checksum: o.k.

ref util: at   290H, procnum = 18  checksum: o.k.

ref util: at   29CH, procnum = 14  checksum: o.k.

ref util: at   2A4H, procnum = 13  checksum: o.k.

ref util: at   2BAH, procnum = 19  checksum: o.k.

ref own data at   2C6H  checksum: o.k.

ref own data at   2CEH  checksum: o.k.

ref own data at   2D8H  checksum: o.k.

ref own quick call at   2F6H, procnum = 16  checksum: o.k.

ref ext proc call at   31AH, procnum =  6, modnum =  2  checksum: o.k.

ref util: at   330H, procnum = 18  checksum: o.k.

ref util: at   336H, procnum = 13  checksum: o.k.

ref ext proc call at   34EH, procnum =  7, modnum =  2  checksum: o.k.

ref own quick call at   39EH, procnum = 15  checksum: o.k.

ref own quick call at   3B6H, procnum = 18  checksum: o.k.

ref util: at   3BCH, procnum = 14  checksum: o.k.

ref util: at   3CCH, procnum = 19  checksum: o.k.

ref own data at   3D8H  checksum: o.k.

ref own data at   3E0H  checksum: o.k.

ref own data at   3EAH  checksum: o.k.

ref own quick call at   406H, procnum = 16  checksum: o.k.

ref ext proc call at   42AH, procnum =  6, modnum =  2  checksum: o.k.

ref util: at   440H, procnum = 18  checksum: o.k.

ref util: at   446H, procnum = 13  checksum: o.k.

ref own data at   4B6H  checksum: o.k.

ref own data at   4C6H  checksum: o.k.

ref own data at   4D0H  checksum: o.k.

ref own quick call at   4ECH, procnum = 16  checksum: o.k.

ref ext proc call at   510H, procnum =  6, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 58
PROCEDURE ConvertOctal(CARDINAL; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        33EE 0010 0000 0002      MOVE.W  0010(A6),00000002H
    12H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        4227                     CLR.B   -(A7)
    1EH        1F3C 0020                MOVE.B  #20H,-(A7)
    22H        4227                     CLR.B   -(A7)
    24H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    28H        286E 0008                MOVE.L  0008(A6),A4
    2CH        4854                     PEA     (A4)
    2EH        6100 0000                BSR     [0000H] = 00000030H
    32H        4FEF 0012                LEA     0012(A7),A7
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own quick call at    30H, procnum = 16  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 60
PROCEDURE ConvertHex(CARDINAL; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        33EE 0010 0000 0002      MOVE.W  0010(A6),00000002H
    12H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        1F3C 0002                MOVE.B  #02H,-(A7)
    20H        1F3C 0020                MOVE.B  #20H,-(A7)
    24H        4227                     CLR.B   -(A7)
    26H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    2AH        286E 0008                MOVE.L  0008(A6),A4
    2EH        4854                     PEA     (A4)
    30H        6100 0000                BSR     [0000H] = 00000032H
    34H        4FEF 0012                LEA     0012(A7),A7
    38H        4E5E                     UNLK    A6
    3AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own quick call at    32H, procnum = 16  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 44
PROCEDURE ConvertAddrDec(SYSTEM.ADDRESS; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0010                MOVE.L  0010(A6),-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        1F3C 0001                MOVE.B  #01H,-(A7)
    10H        1F3C 0020                MOVE.B  #20H,-(A7)
    14H        4227                     CLR.B   -(A7)
    16H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        4854                     PEA     (A4)
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 0012                LEA     0012(A7),A7
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    22H, procnum = 16  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 42
PROCEDURE ConvertAddrOct(SYSTEM.ADDRESS; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0010                MOVE.L  0010(A6),-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        4227                     CLR.B   -(A7)
     EH        1F3C 0020                MOVE.B  #20H,-(A7)
    12H        4227                     CLR.B   -(A7)
    14H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    18H        286E 0008                MOVE.L  0008(A6),A4
    1CH        4854                     PEA     (A4)
    1EH        6100 0000                BSR     [0000H] = 00000020H
    22H        4FEF 0012                LEA     0012(A7),A7
    26H        4E5E                     UNLK    A6
    28H        4E75                     RTS
  checksum: o.k.

ref own quick call at    20H, procnum = 16  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 44
PROCEDURE ConvertAddrHex(SYSTEM.ADDRESS; CARDINAL; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0010                MOVE.L  0010(A6),-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        1F3C 0002                MOVE.B  #02H,-(A7)
    10H        1F3C 0020                MOVE.B  #20H,-(A7)
    14H        4227                     CLR.B   -(A7)
    16H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        4854                     PEA     (A4)
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 0012                LEA     0012(A7),A7
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    22H, procnum = 16  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 284
PROCEDURE ConvertToCardinal(VAR ARRAY CHAR; VAR BOOLEAN; VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        426E FFFA                CLR.W   FFFA(A6)
    10H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    14H        286E 0010                MOVE.L  0010(A6),A4
    18H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    1CH        0C04 0061                CMPI.B  #61H,D4
    20H        650A                     BCS     [0AH] = 0000002CH
    22H        0C04 007A                CMPI.B  #7AH,D4
    26H        6204                     BHI     [04H] = 0000002CH
    28H        0204 005F                ANDI.B  #5FH,D4
    2CH        1D44 FFFF                MOVE.B  D4,FFFF(A6)
    30H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    34H        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
    3AH        6602                     BNE     [02H] = 0000003EH
    3CH        60D2                     BRA     [D2H] = 00000010H
    3EH        286E 0008                MOVE.L  0008(A6),A4
    42H        4254                     CLR.W   (A4)
    44H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    4AH        650A                     BCS     [0AH] = 00000056H
    4CH        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    52H        6202                     BHI     [02H] = 00000056H
    54H        6004                     BRA     [04H] = 0000005AH
    56H        4EFA 0080                JMP     [0080H] = 000000D8H
    5AH        426E FFFC                CLR.W   FFFC(A6)
    5EH        286E 0008                MOVE.L  0008(A6),A4
    62H        3A14                     MOVE.W  (A4),D5
    64H        CAFC 000A                MULU    #000AH,D5
    68H        7800                     MOVEQ   #00H,D4
    6AH        182E FFFF                MOVE.B  FFFF(A6),D4
    6EH        0444 0030                SUBI.W  #0030H,D4
    72H        DA44                     ADD.W   D4,D5
    74H        286E 0008                MOVE.L  0008(A6),A4
    78H        3885                     MOVE.W  D5,(A4)
    7AH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    7EH        286E 0010                MOVE.L  0010(A6),A4
    82H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    86H        0C04 0061                CMPI.B  #61H,D4
    8AH        650A                     BCS     [0AH] = 00000096H
    8CH        0C04 007A                CMPI.B  #7AH,D4
    90H        6204                     BHI     [04H] = 00000096H
    92H        0204 005F                ANDI.B  #5FH,D4
    96H        1D44 FFFF                MOVE.B  D4,FFFF(A6)
    9AH        526E FFFA                ADDQ.W  #1,FFFA(A6)
    9EH        3A2E FFFC                MOVE.W  FFFC(A6),D5
    A2H        286E 0008                MOVE.L  0008(A6),A4
    A6H        BA54                     CMP.W   (A4),D5
    A8H        6314                     BLS     [14H] = 000000BEH
    AAH        286E 000C                MOVE.L  000C(A6),A4
    AEH        4214                     CLR.B   (A4)
    B0H        286E 0008                MOVE.L  0008(A6),A4
    B4H        4254                     CLR.W   (A4)
    B6H        422E FFFF                CLR.B   FFFF(A6)
    BAH        4EFA 000A                JMP     [000AH] = 000000C6H
    BEH        286E 0008                MOVE.L  0008(A6),A4
    C2H        3D54 FFFC                MOVE.W  (A4),FFFC(A6)
    C6H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    CCH        650A                     BCS     [0AH] = 000000D8H
    CEH        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    D4H        6202                     BHI     [02H] = 000000D8H
    D6H        6086                     BRA     [86H] = 0000005EH
    D8H        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
    DEH        6626                     BNE     [26H] = 00000106H
    E0H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    E4H        286E 0010                MOVE.L  0010(A6),A4
    E8H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    ECH        0C04 0061                CMPI.B  #61H,D4
    F0H        650A                     BCS     [0AH] = 000000FCH
    F2H        0C04 007A                CMPI.B  #7AH,D4
    F6H        6204                     BHI     [04H] = 000000FCH
    F8H        0204 005F                ANDI.B  #5FH,D4
    FCH        1D44 FFFF                MOVE.B  D4,FFFF(A6)
   100H        526E FFFA                ADDQ.W  #1,FFFA(A6)
   104H        60D2                     BRA     [D2H] = 000000D8H
   106H        4A2E FFFF                TST.B   FFFF(A6)
   10AH        670C                     BEQ     [0CH] = 00000118H
   10CH        286E 000C                MOVE.L  000C(A6),A4
   110H        4214                     CLR.B   (A4)
   112H        286E 0008                MOVE.L  0008(A6),A4
   116H        4254                     CLR.W   (A4)
   118H        4E5E                     UNLK    A6
   11AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 76
PROCEDURE ConvertToInteger(VAR ARRAY CHAR; VAR BOOLEAN; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        4279 0000 0000           CLR.W   00000000H
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        33D4 0000 0002           MOVE.W  (A4),00000002H
    1CH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    20H        286E 0010                MOVE.L  0010(A6),A4
    24H        4854                     PEA     (A4)
    26H        4878 7FFF                PEA     7FFFH
    2AH        286E 000C                MOVE.L  000C(A6),A4
    2EH        4854                     PEA     (A4)
    30H        4879 0000 0000           PEA     00000000H
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        4FEF 0012                LEA     0012(A7),A7
    3EH        286E 0008                MOVE.L  0008(A6),A4
    42H        38B9 0000 0002           MOVE.W  00000002H,(A4)
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own quick call at    38H, procnum = 17  checksum: o.k.

ref own data at    44H  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 768
PROCEDURE ConvertToReal(VAR ARRAY CHAR; VAR BOOLEAN; VAR REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        426E FFF4                CLR.W   FFF4(A6)
    10H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    14H        286E 0010                MOVE.L  0010(A6),A4
    18H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    1CH        0C04 0061                CMPI.B  #61H,D4
    20H        650A                     BCS     [0AH] = 0000002CH
    22H        0C04 007A                CMPI.B  #7AH,D4
    26H        6204                     BHI     [04H] = 0000002CH
    28H        0204 005F                ANDI.B  #5FH,D4
    2CH        1D44 FFFB                MOVE.B  D4,FFFB(A6)
    30H        526E FFF4                ADDQ.W  #1,FFF4(A6)
    34H        0C2E 0020 FFFB           CMPI.B  #20H,FFFB(A6)
    3AH        6602                     BNE     [02H] = 0000003EH
    3CH        60D2                     BRA     [D2H] = 00000010H
    3EH        422E FFF7                CLR.B   FFF7(A6)
    42H        0C2E 002B FFFB           CMPI.B  #2BH,FFFB(A6)
    48H        6708                     BEQ     [08H] = 00000052H
    4AH        0C2E 002D FFFB           CMPI.B  #2DH,FFFB(A6)
    50H        663C                     BNE     [3CH] = 0000008EH
    52H        0C2E 002D FFFB           CMPI.B  #2DH,FFFB(A6)
    58H        57C5                     SEQ     D5
    5AH        4405                     NEG.B   D5
    5CH        1D45 FFF7                MOVE.B  D5,FFF7(A6)
    60H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    64H        286E 0010                MOVE.L  0010(A6),A4
    68H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    6CH        0C04 0061                CMPI.B  #61H,D4
    70H        650A                     BCS     [0AH] = 0000007CH
    72H        0C04 007A                CMPI.B  #7AH,D4
    76H        6204                     BHI     [04H] = 0000007CH
    78H        0204 005F                ANDI.B  #5FH,D4
    7CH        1D44 FFFB                MOVE.B  D4,FFFB(A6)
    80H        526E FFF4                ADDQ.W  #1,FFF4(A6)
    84H        0C2E 0020 FFFB           CMPI.B  #20H,FFFB(A6)
    8AH        6602                     BNE     [02H] = 0000008EH
    8CH        60D2                     BRA     [D2H] = 00000060H
    8EH        0C2E 0030 FFFB           CMPI.B  #30H,FFFB(A6)
    94H        6508                     BCS     [08H] = 0000009EH
    96H        0C2E 0039 FFFB           CMPI.B  #39H,FFFB(A6)
    9CH        6308                     BLS     [08H] = 000000A6H
    9EH        0C2E 002E FFFB           CMPI.B  #2EH,FFFB(A6)
    A4H        6602                     BNE     [02H] = 000000A8H
    A6H        6004                     BRA     [04H] = 000000ACH
    A8H        4EFA 021A                JMP     [021AH] = 000002C4H
    ACH        422E FFF6                CLR.B   FFF6(A6)
    B0H        286E 0008                MOVE.L  0008(A6),A4
    B4H        4294                     CLR.L   (A4)
    B6H        0C2E 002E FFFB           CMPI.B  #2EH,FFFB(A6)
    BCH        6702                     BEQ     [02H] = 000000C0H
    BEH        6004                     BRA     [04H] = 000000C4H
    C0H        4EFA 0078                JMP     [0078H] = 0000013AH
    C4H        1D7C 0001 FFF6           MOVE.B  #01H,FFF6(A6)
    CAH        286E 0008                MOVE.L  0008(A6),A4
    CEH        2F14                     MOVE.L  (A4),-(A7)
    D0H        2F3C 4120 0000           MOVE.L  #41200000H,-(A7)
    D6H        4EB9 0000 0000           JSR     00000000H
    DCH        588F                     ADDQ.L  #4,A7
    DEH        7A00                     MOVEQ   #00H,D5
    E0H        1A2E FFFB                MOVE.B  FFFB(A6),D5
    E4H        0445 0030                SUBI.W  #0030H,D5
    E8H        4845                     SWAP    D5
    EAH        4245                     CLR.W   D5
    ECH        4845                     SWAP    D5
    EEH        2F05                     MOVE.L  D5,-(A7)
    F0H        4EB9 0000 0000           JSR     00000000H
    F6H        4EB9 0000 0000           JSR     00000000H
    FCH        588F                     ADDQ.L  #4,A7
    FEH        286E 0008                MOVE.L  0008(A6),A4
   102H        289F                     MOVE.L  (A7)+,(A4)
   104H        3A2E FFF4                MOVE.W  FFF4(A6),D5
   108H        286E 0010                MOVE.L  0010(A6),A4
   10CH        1834 5000                MOVE.B  00H(A4,D5.W),D4
   110H        0C04 0061                CMPI.B  #61H,D4
   114H        650A                     BCS     [0AH] = 00000120H
   116H        0C04 007A                CMPI.B  #7AH,D4
   11AH        6204                     BHI     [04H] = 00000120H
   11CH        0204 005F                ANDI.B  #5FH,D4
   120H        1D44 FFFB                MOVE.B  D4,FFFB(A6)
   124H        526E FFF4                ADDQ.W  #1,FFF4(A6)
   128H        0C2E 0030 FFFB           CMPI.B  #30H,FFFB(A6)
   12EH        650A                     BCS     [0AH] = 0000013AH
   130H        0C2E 0039 FFFB           CMPI.B  #39H,FFFB(A6)
   136H        6202                     BHI     [02H] = 0000013AH
   138H        6090                     BRA     [90H] = 000000CAH
   13AH        0C2E 002E FFFB           CMPI.B  #2EH,FFFB(A6)
   140H        6602                     BNE     [02H] = 00000144H
   142H        6004                     BRA     [04H] = 00000148H
   144H        4EFA 00DC                JMP     [00DCH] = 00000222H
   148H        2D7C 3DCC CCCD FFFC      MOVE.L  #3DCCCCCDH,FFFC(A6)
   150H        3A2E FFF4                MOVE.W  FFF4(A6),D5
   154H        286E 0010                MOVE.L  0010(A6),A4
   158H        1834 5000                MOVE.B  00H(A4,D5.W),D4
   15CH        0C04 0061                CMPI.B  #61H,D4
   160H        650A                     BCS     [0AH] = 0000016CH
   162H        0C04 007A                CMPI.B  #7AH,D4
   166H        6204                     BHI     [04H] = 0000016CH
   168H        0204 005F                ANDI.B  #5FH,D4
   16CH        1D44 FFFB                MOVE.B  D4,FFFB(A6)
   170H        526E FFF4                ADDQ.W  #1,FFF4(A6)
   174H        4A2E FFF6                TST.B   FFF6(A6)
   178H        6610                     BNE     [10H] = 0000018AH
   17AH        0C2E 0030 FFFB           CMPI.B  #30H,FFFB(A6)
   180H        650C                     BCS     [0CH] = 0000018EH
   182H        0C2E 0039 FFFB           CMPI.B  #39H,FFFB(A6)
   188H        6204                     BHI     [04H] = 0000018EH
   18AH        7A01                     MOVEQ   #01H,D5
   18CH        6002                     BRA     [02H] = 00000190H
   18EH        7A00                     MOVEQ   #00H,D5
   190H        286E 000C                MOVE.L  000C(A6),A4
   194H        1885                     MOVE.B  D5,(A4)
   196H        0C2E 0030 FFFB           CMPI.B  #30H,FFFB(A6)
   19CH        650A                     BCS     [0AH] = 000001A8H
   19EH        0C2E 0039 FFFB           CMPI.B  #39H,FFFB(A6)
   1A4H        6202                     BHI     [02H] = 000001A8H
   1A6H        6004                     BRA     [04H] = 000001ACH
   1A8H        4EFA 0078                JMP     [0078H] = 00000222H
   1ACH        286E 0008                MOVE.L  0008(A6),A4
   1B0H        2F14                     MOVE.L  (A4),-(A7)
   1B2H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
   1B6H        7A00                     MOVEQ   #00H,D5
   1B8H        1A2E FFFB                MOVE.B  FFFB(A6),D5
   1BCH        0445 0030                SUBI.W  #0030H,D5
   1C0H        4845                     SWAP    D5
   1C2H        4245                     CLR.W   D5
   1C4H        4845                     SWAP    D5
   1C6H        2F05                     MOVE.L  D5,-(A7)
   1C8H        4EB9 0000 0000           JSR     00000000H
   1CEH        4EB9 0000 0000           JSR     00000000H
   1D4H        588F                     ADDQ.L  #4,A7
   1D6H        4EB9 0000 0000           JSR     00000000H
   1DCH        588F                     ADDQ.L  #4,A7
   1DEH        286E 0008                MOVE.L  0008(A6),A4
   1E2H        289F                     MOVE.L  (A7)+,(A4)
   1E4H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
   1E8H        2F3C 3DCC CCCD           MOVE.L  #3DCCCCCDH,-(A7)
   1EEH        4EB9 0000 0000           JSR     00000000H
   1F4H        588F                     ADDQ.L  #4,A7
   1F6H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
   1FAH        3A2E FFF4                MOVE.W  FFF4(A6),D5
   1FEH        286E 0010                MOVE.L  0010(A6),A4
   202H        1834 5000                MOVE.B  00H(A4,D5.W),D4
   206H        0C04 0061                CMPI.B  #61H,D4
   20AH        650A                     BCS     [0AH] = 00000216H
   20CH        0C04 007A                CMPI.B  #7AH,D4
   210H        6204                     BHI     [04H] = 00000216H
   212H        0204 005F                ANDI.B  #5FH,D4
   216H        1D44 FFFB                MOVE.B  D4,FFFB(A6)
   21AH        526E FFF4                ADDQ.W  #1,FFF4(A6)
   21EH        6000 FF76                BRA     [FF76H] = 00000196H
   222H        286E 000C                MOVE.L  000C(A6),A4
   226H        4A14                     TST.B   (A4)
   228H        6702                     BEQ     [02H] = 0000022CH
   22AH        6004                     BRA     [04H] = 00000230H
   22CH        4EFA 0096                JMP     [0096H] = 000002C4H
   230H        0C2E 0020 FFFB           CMPI.B  #20H,FFFB(A6)
   236H        6626                     BNE     [26H] = 0000025EH
   238H        3A2E FFF4                MOVE.W  FFF4(A6),D5
   23CH        286E 0010                MOVE.L  0010(A6),A4
   240H        1834 5000                MOVE.B  00H(A4,D5.W),D4
   244H        0C04 0061                CMPI.B  #61H,D4
   248H        650A                     BCS     [0AH] = 00000254H
   24AH        0C04 007A                CMPI.B  #7AH,D4
   24EH        6204                     BHI     [04H] = 00000254H
   250H        0204 005F                ANDI.B  #5FH,D4
   254H        1D44 FFFB                MOVE.B  D4,FFFB(A6)
   258H        526E FFF4                ADDQ.W  #1,FFF4(A6)
   25CH        60D2                     BRA     [D2H] = 00000230H
   25EH        0C2E 0045 FFFB           CMPI.B  #45H,FFFB(A6)
   264H        665E                     BNE     [5EH] = 000002C4H
   266H        426E FFF8                CLR.W   FFF8(A6)
   26AH        3F2E 0014                MOVE.W  0014(A6),-(A7)
   26EH        286E 0010                MOVE.L  0010(A6),A4
   272H        4854                     PEA     (A4)
   274H        4267                     CLR.W   -(A7)
   276H        3F2E FFF4                MOVE.W  FFF4(A6),-(A7)
   27AH        4EB9 0000 0000           JSR     00000000H
   280H        4FEF 000A                LEA     000A(A7),A7
   284H        3F2E 0014                MOVE.W  0014(A6),-(A7)
   288H        286E 0010                MOVE.L  0010(A6),A4
   28CH        4854                     PEA     (A4)
   28EH        286E 000C                MOVE.L  000C(A6),A4
   292H        4854                     PEA     (A4)
   294H        486E FFF8                PEA     FFF8(A6)
   298H        6100 0000                BSR     [0000H] = 0000029AH
   29CH        4FEF 000E                LEA     000E(A7),A7
   2A0H        286E 0008                MOVE.L  0008(A6),A4
   2A4H        2F14                     MOVE.L  (A4),-(A7)
   2A6H        598F                     SUBQ.L  #4,A7
   2A8H        3F2E FFF8                MOVE.W  FFF8(A6),-(A7)
   2ACH        6100 0000                BSR     [0000H] = 000002AEH
   2B0H        548F                     ADDQ.L  #2,A7
   2B2H        4EB9 0000 0000           JSR     00000000H
   2B8H        588F                     ADDQ.L  #4,A7
   2BAH        286E 0008                MOVE.L  0008(A6),A4
   2BEH        289F                     MOVE.L  (A7)+,(A4)
   2C0H        422E FFFB                CLR.B   FFFB(A6)
   2C4H        4A2E FFFB                TST.B   FFFB(A6)
   2C8H        6626                     BNE     [26H] = 000002F0H
   2CAH        286E 000C                MOVE.L  000C(A6),A4
   2CEH        4A14                     TST.B   (A4)
   2D0H        671E                     BEQ     [1EH] = 000002F0H
   2D2H        4A2E FFF7                TST.B   FFF7(A6)
   2D6H        6710                     BEQ     [10H] = 000002E8H
   2D8H        286E 0008                MOVE.L  0008(A6),A4
   2DCH        2A14                     MOVE.L  (A4),D5
   2DEH        0845 001F                BCHG    #001FH,D5
   2E2H        286E 0008                MOVE.L  0008(A6),A4
   2E6H        2885                     MOVE.L  D5,(A4)
   2E8H        4E5E                     UNLK    A6
   2EAH        4E75                     RTS
   2ECH        4EFA 000E                JMP     [000EH] = 000002FCH
   2F0H        286E 000C                MOVE.L  000C(A6),A4
   2F4H        4214                     CLR.B   (A4)
   2F6H        286E 0008                MOVE.L  0008(A6),A4
   2FAH        4294                     CLR.L   (A4)
   2FCH        4E5E                     UNLK    A6
   2FEH        4E75                     RTS
  checksum: o.k.

ref util: at    D8H, procnum = 14  checksum: o.k.

ref util: at    F2H, procnum = 18  checksum: o.k.

ref util: at    F8H, procnum = 12  checksum: o.k.

ref util: at   1CAH, procnum = 18  checksum: o.k.

ref util: at   1D0H, procnum = 14  checksum: o.k.

ref util: at   1D8H, procnum = 12  checksum: o.k.

ref util: at   1F0H, procnum = 14  checksum: o.k.

ref ext proc call at   27CH, procnum =  4, modnum =  2  checksum: o.k.

ref own quick call at   29AH, procnum = 10  checksum: o.k.

ref own quick call at   2AEH, procnum = 18  checksum: o.k.

ref util: at   2B4H, procnum = 14  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 78
PROCEDURE ConvertToOctal(VAR ARRAY CHAR; VAR BOOLEAN; VAR WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        4279 0000 0000           CLR.W   00000000H
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        33D4 0000 0002           MOVE.W  (A4),00000002H
    1CH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    20H        286E 0010                MOVE.L  0010(A6),A4
    24H        4854                     PEA     (A4)
    26H        4878 7FFF                PEA     7FFFH
    2AH        286E 000C                MOVE.L  000C(A6),A4
    2EH        4854                     PEA     (A4)
    30H        4879 0000 0000           PEA     00000000H
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        4FEF 0012                LEA     0012(A7),A7
    3EH        2A39 0000 0000           MOVE.L  00000000H,D5
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        3885                     MOVE.W  D5,(A4)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own quick call at    38H, procnum = 17  checksum: o.k.

ref own data at    40H  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 78
PROCEDURE ConvertToHex(VAR ARRAY CHAR; VAR BOOLEAN; VAR WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        4279 0000 0000           CLR.W   00000000H
    12H        286E 0008                MOVE.L  0008(A6),A4
    16H        33D4 0000 0002           MOVE.W  (A4),00000002H
    1CH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    20H        286E 0010                MOVE.L  0010(A6),A4
    24H        4854                     PEA     (A4)
    26H        4878 7FFF                PEA     7FFFH
    2AH        286E 000C                MOVE.L  000C(A6),A4
    2EH        4854                     PEA     (A4)
    30H        4879 0000 0000           PEA     00000000H
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        4FEF 0012                LEA     0012(A7),A7
    3EH        2A39 0000 0000           MOVE.L  00000000H,D5
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        3885                     MOVE.W  D5,(A4)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own quick call at    38H, procnum = 17  checksum: o.k.

ref own data at    40H  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 50
PROCEDURE ConvertToAddr(VAR ARRAY CHAR; VAR BOOLEAN; VAR ADDRESS);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        18BC 0001                MOVE.B  #01H,(A4)
     CH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    10H        286E 0010                MOVE.L  0010(A6),A4
    14H        4854                     PEA     (A4)
    16H        7AFF                     MOVEQ   #FFH,D5
    18H        2F05                     MOVE.L  D5,-(A7)
    1AH        286E 000C                MOVE.L  000C(A6),A4
    1EH        4854                     PEA     (A4)
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        4854                     PEA     (A4)
    26H        6100 0000                BSR     [0000H] = 00000028H
    2AH        4FEF 0012                LEA     0012(A7),A7
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref own quick call at    28H, procnum = 17  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 360
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE6                LINK    A6,#FFE6H
     4H        426E FFF2                CLR.W   FFF2(A6)
     8H        7A00                     MOVEQ   #00H,D5
     AH        1A2E 0012                MOVE.B  0012(A6),D5
     EH        2005                     MOVE.L  D5,D0
    10H        4EB9 0000 0000           JSR     00000000H
    16H        0000 0000                ORI.B   #00H,D0
    1AH        0000 0002                ORI.B   #02H,D0
    1EH        0000 0052                ORI.B   #52H,D0
    22H        7A08                     MOVEQ   #08H,D5
    24H        2D45 FFEA                MOVE.L  D5,FFEA(A6)
    28H        526E FFF2                ADDQ.W  #1,FFF2(A6)
    2CH        3A2E FFF2                MOVE.W  FFF2(A6),D5
    30H        49EE FFF3                LEA     FFF3(A6),A4
    34H        19BC 0042 5000           MOVE.B  #42H,00H(A4,D5.W)
    3AH        4EFA 0032                JMP     [0032H] = 0000006EH
    3EH        7A10                     MOVEQ   #10H,D5
    40H        2D45 FFEA                MOVE.L  D5,FFEA(A6)
    44H        526E FFF2                ADDQ.W  #1,FFF2(A6)
    48H        3A2E FFF2                MOVE.W  FFF2(A6),D5
    4CH        49EE FFF3                LEA     FFF3(A6),A4
    50H        19BC 0048 5000           MOVE.B  #48H,00H(A4,D5.W)
    56H        4EFA 0016                JMP     [0016H] = 0000006EH
    5AH        7A0A                     MOVEQ   #0AH,D5
    5CH        2D45 FFEA                MOVE.L  D5,FFEA(A6)
    60H        4EFA 000C                JMP     [000CH] = 0000006EH
    64H        4EFA 0008                JMP     [0008H] = 0000006EH
    68H        000C 0044                MOVEP.W 0044H(A4),D0
    6CH        0028 526E FFF2           ORI.B   #6EH,FFF2(A0)
    72H        2F2E 0016                MOVE.L  0016(A6),-(A7)
    76H        2F2E FFEA                MOVE.L  FFEA(A6),-(A7)
    7AH        4EB9 0000 0000           JSR     00000000H
    80H        2E9F                     MOVE.L  (A7)+,(A7)
    82H        2D5F FFE6                MOVE.L  (A7)+,FFE6(A6)
    86H        7A0A                     MOVEQ   #0AH,D5
    88H        BAAE FFE6                CMP.L   FFE6(A6),D5
    8CH        6316                     BLS     [16H] = 000000A4H
    8EH        7A30                     MOVEQ   #30H,D5
    90H        DAAE FFE6                ADD.L   FFE6(A6),D5
    94H        382E FFF2                MOVE.W  FFF2(A6),D4
    98H        49EE FFF3                LEA     FFF3(A6),A4
    9CH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    A0H        4EFA 0014                JMP     [0014H] = 000000B6H
    A4H        7A37                     MOVEQ   #37H,D5
    A6H        DAAE FFE6                ADD.L   FFE6(A6),D5
    AAH        382E FFF2                MOVE.W  FFF2(A6),D4
    AEH        49EE FFF3                LEA     FFF3(A6),A4
    B2H        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    B6H        2F2E 0016                MOVE.L  0016(A6),-(A7)
    BAH        2F2E FFEA                MOVE.L  FFEA(A6),-(A7)
    BEH        4EB9 0000 0000           JSR     00000000H
    C4H        588F                     ADDQ.L  #4,A7
    C6H        2D5F 0016                MOVE.L  (A7)+,0016(A6)
    CAH        4AAE 0016                TST.L   0016(A6)
    CEH        6702                     BEQ     [02H] = 000000D2H
    D0H        609C                     BRA     [9CH] = 0000006EH
    D2H        4A2E 000E                TST.B   000E(A6)
    D6H        6712                     BEQ     [12H] = 000000EAH
    D8H        526E FFF2                ADDQ.W  #1,FFF2(A6)
    DCH        3A2E FFF2                MOVE.W  FFF2(A6),D5
    E0H        49EE FFF3                LEA     FFF3(A6),A4
    E4H        19BC 002D 5000           MOVE.B  #2DH,00H(A4,D5.W)
    EAH        3A2E 0014                MOVE.W  0014(A6),D5
    EEH        BA6E FFF2                CMP.W   FFF2(A6),D5
    F2H        6408                     BCC     [08H] = 000000FCH
    F4H        426E FFEE                CLR.W   FFEE(A6)
    F8H        4EFA 000E                JMP     [000EH] = 00000108H
    FCH        3A2E 0014                MOVE.W  0014(A6),D5
   100H        9A6E FFF2                SUB.W   FFF2(A6),D5
   104H        3D45 FFEE                MOVE.W  D5,FFEE(A6)
   108H        426E FFF0                CLR.W   FFF0(A6)
   10CH        3A2E FFF0                MOVE.W  FFF0(A6),D5
   110H        BA6E FFEE                CMP.W   FFEE(A6),D5
   114H        6412                     BCC     [12H] = 00000128H
   116H        3A2E FFF0                MOVE.W  FFF0(A6),D5
   11AH        286E 0008                MOVE.L  0008(A6),A4
   11EH        19AE 0010 5000           MOVE.B  0010(A6),00H(A4,D5.W)
   124H        4EFA 001C                JMP     [001CH] = 00000142H
   128H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   12CH        49EE FFF3                LEA     FFF3(A6),A4
   130H        382E FFF0                MOVE.W  FFF0(A6),D4
   134H        266E 0008                MOVE.L  0008(A6),A3
   138H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
   13EH        536E FFF2                SUBQ.W  #1,FFF2(A6)
   142H        526E FFF0                ADDQ.W  #1,FFF0(A6)
   146H        4A6E FFF2                TST.W   FFF2(A6)
   14AH        6702                     BEQ     [02H] = 0000014EH
   14CH        60BE                     BRA     [BEH] = 0000010CH
   14EH        3A2E FFF0                MOVE.W  FFF0(A6),D5
   152H        BA6E 000C                CMP.W   000C(A6),D5
   156H        620C                     BHI     [0CH] = 00000164H
   158H        3A2E FFF0                MOVE.W  FFF0(A6),D5
   15CH        286E 0008                MOVE.L  0008(A6),A4
   160H        4234 5000                CLR.B   00H(A4,D5.W)
   164H        4E5E                     UNLK    A6
   166H        4E75                     RTS
  checksum: o.k.

ref util: at    12H, procnum =  1  checksum: o.k.

ref util: at    7CH, procnum =  9  checksum: o.k.

ref util: at    C0H, procnum =  9  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 688
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF0                LINK    A6,#FFF0H
     4H        426E FFF2                CLR.W   FFF2(A6)
     8H        286E 000C                MOVE.L  000C(A6),A4
     CH        18BC 0001                MOVE.B  #01H,(A4)
    10H        426E FFF4                CLR.W   FFF4(A6)
    14H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    18H        286E 0014                MOVE.L  0014(A6),A4
    1CH        4A34 5000                TST.B   00H(A4,D5.W)
    20H        6710                     BEQ     [10H] = 00000032H
    22H        3A2E FFF4                MOVE.W  FFF4(A6),D5
    26H        BA6E 0018                CMP.W   0018(A6),D5
    2AH        6406                     BCC     [06H] = 00000032H
    2CH        526E FFF4                ADDQ.W  #1,FFF4(A6)
    30H        60E2                     BRA     [E2H] = 00000014H
    32H        4A6E FFF4                TST.W   FFF4(A6)
    36H        6316                     BLS     [16H] = 0000004EH
    38H        536E FFF4                SUBQ.W  #1,FFF4(A6)
    3CH        3A2E FFF4                MOVE.W  FFF4(A6),D5
    40H        286E 0014                MOVE.L  0014(A6),A4
    44H        0C34 0020 5000           CMPI.B  #20H,00H(A4,D5.W)
    4AH        6602                     BNE     [02H] = 0000004EH
    4CH        60EA                     BRA     [EAH] = 00000038H
    4EH        3A2E FFF4                MOVE.W  FFF4(A6),D5
    52H        286E 0014                MOVE.L  0014(A6),A4
    56H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    5AH        0C04 0061                CMPI.B  #61H,D4
    5EH        650A                     BCS     [0AH] = 0000006AH
    60H        0C04 007A                CMPI.B  #7AH,D4
    64H        6204                     BHI     [04H] = 0000006AH
    66H        0204 005F                ANDI.B  #5FH,D4
    6AH        0284 0000 00FF           ANDI.L  #000000FFH,D4
    70H        2004                     MOVE.L  D4,D0
    72H        4EB9 0000 0000           JSR     00000000H
    78H        0000 0042                ORI.B   #42H,D0
    7CH        0000 0006                ORI.B   #06H,D0
    80H        0000 003A                ORI.B   #3AH,D0
    84H        422E FFF1                CLR.B   FFF1(A6)
    88H        7A08                     MOVEQ   #08H,D5
    8AH        2D45 FFF8                MOVE.L  D5,FFF8(A6)
    8EH        1D7C 0037 FFFE           MOVE.B  #37H,FFFE(A6)
    94H        4EFA 003C                JMP     [003CH] = 000000D2H
    98H        1D7C 0002 FFF1           MOVE.B  #02H,FFF1(A6)
    9EH        7A10                     MOVEQ   #10H,D5
    A0H        2D45 FFF8                MOVE.L  D5,FFF8(A6)
    A4H        1D7C 0039 FFFE           MOVE.B  #39H,FFFE(A6)
    AAH        4EFA 0026                JMP     [0026H] = 000000D2H
    AEH        4EFA 0010                JMP     [0010H] = 000000C0H
    B2H        000C 0036                MOVEP.W 0036H(A4),D0
    B6H        0036 0036 0036           ORI.B   #36H,36H(A6,D0.W)
    BCH        0036 0020 1D7C           ORI.B   #20H,7CH(A6,D1.L)
    C2H        0001 FFF1                ORI.B   #F1H,D1
    C6H        7A0A                     MOVEQ   #0AH,D5
    C8H        2D45 FFF8                MOVE.L  D5,FFF8(A6)
    CCH        1D7C 0039 FFFE           MOVE.B  #39H,FFFE(A6)
    D2H        3A2E FFF2                MOVE.W  FFF2(A6),D5
    D6H        286E 0014                MOVE.L  0014(A6),A4
    DAH        1834 5000                MOVE.B  00H(A4,D5.W),D4
    DEH        0C04 0061                CMPI.B  #61H,D4
    E2H        650A                     BCS     [0AH] = 000000EEH
    E4H        0C04 007A                CMPI.B  #7AH,D4
    E8H        6204                     BHI     [04H] = 000000EEH
    EAH        0204 005F                ANDI.B  #5FH,D4
    EEH        1D44 FFFF                MOVE.B  D4,FFFF(A6)
    F2H        526E FFF2                ADDQ.W  #1,FFF2(A6)
    F6H        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
    FCH        6602                     BNE     [02H] = 00000100H
    FEH        60D2                     BRA     [D2H] = 000000D2H
   100H        422E FFF7                CLR.B   FFF7(A6)
   104H        0C2E 002B FFFF           CMPI.B  #2BH,FFFF(A6)
   10AH        6708                     BEQ     [08H] = 00000114H
   10CH        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
   112H        663C                     BNE     [3CH] = 00000150H
   114H        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
   11AH        57C5                     SEQ     D5
   11CH        4405                     NEG.B   D5
   11EH        1D45 FFF7                MOVE.B  D5,FFF7(A6)
   122H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   126H        286E 0014                MOVE.L  0014(A6),A4
   12AH        1834 5000                MOVE.B  00H(A4,D5.W),D4
   12EH        0C04 0061                CMPI.B  #61H,D4
   132H        650A                     BCS     [0AH] = 0000013EH
   134H        0C04 007A                CMPI.B  #7AH,D4
   138H        6204                     BHI     [04H] = 0000013EH
   13AH        0204 005F                ANDI.B  #5FH,D4
   13EH        1D44 FFFF                MOVE.B  D4,FFFF(A6)
   142H        526E FFF2                ADDQ.W  #1,FFF2(A6)
   146H        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
   14CH        6602                     BNE     [02H] = 00000150H
   14EH        60D2                     BRA     [D2H] = 00000122H
   150H        1D7C 0001 FFF6           MOVE.B  #01H,FFF6(A6)
   156H        286E 0008                MOVE.L  0008(A6),A4
   15AH        4294                     CLR.L   (A4)
   15CH        536E FFF2                SUBQ.W  #1,FFF2(A6)
   160H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   164H        286E 0014                MOVE.L  0014(A6),A4
   168H        1834 5000                MOVE.B  00H(A4,D5.W),D4
   16CH        0C04 0061                CMPI.B  #61H,D4
   170H        650A                     BCS     [0AH] = 0000017CH
   172H        0C04 007A                CMPI.B  #7AH,D4
   176H        6204                     BHI     [04H] = 0000017CH
   178H        0204 005F                ANDI.B  #5FH,D4
   17CH        1D44 FFFF                MOVE.B  D4,FFFF(A6)
   180H        526E FFF2                ADDQ.W  #1,FFF2(A6)
   184H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   18AH        6532                     BCS     [32H] = 000001BEH
   18CH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   190H        BA2E FFFE                CMP.B   FFFE(A6),D5
   194H        6228                     BHI     [28H] = 000001BEH
   196H        286E 0008                MOVE.L  0008(A6),A4
   19AH        2F14                     MOVE.L  (A4),-(A7)
   19CH        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
   1A0H        4EB9 0000 0000           JSR     00000000H
   1A6H        588F                     ADDQ.L  #4,A7
   1A8H        7A00                     MOVEQ   #00H,D5
   1AAH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   1AEH        7830                     MOVEQ   #30H,D4
   1B0H        9A84                     SUB.L   D4,D5
   1B2H        DA9F                     ADD.L   (A7)+,D5
   1B4H        286E 0008                MOVE.L  0008(A6),A4
   1B8H        2885                     MOVE.L  D5,(A4)
   1BAH        4EFA 0046                JMP     [0046H] = 00000202H
   1BEH        0C2E 0041 FFFF           CMPI.B  #41H,FFFF(A6)
   1C4H        6538                     BCS     [38H] = 000001FEH
   1C6H        0C2E 0046 FFFF           CMPI.B  #46H,FFFF(A6)
   1CCH        6230                     BHI     [30H] = 000001FEH
   1CEH        0C2E 0002 FFF1           CMPI.B  #02H,FFF1(A6)
   1D4H        6628                     BNE     [28H] = 000001FEH
   1D6H        286E 0008                MOVE.L  0008(A6),A4
   1DAH        2F14                     MOVE.L  (A4),-(A7)
   1DCH        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
   1E0H        4EB9 0000 0000           JSR     00000000H
   1E6H        588F                     ADDQ.L  #4,A7
   1E8H        7A00                     MOVEQ   #00H,D5
   1EAH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   1EEH        7837                     MOVEQ   #37H,D4
   1F0H        9A84                     SUB.L   D4,D5
   1F2H        DA9F                     ADD.L   (A7)+,D5
   1F4H        286E 0008                MOVE.L  0008(A6),A4
   1F8H        2885                     MOVE.L  D5,(A4)
   1FAH        4EFA 0006                JMP     [0006H] = 00000202H
   1FEH        422E FFF6                CLR.B   FFF6(A6)
   202H        4A2E FFF6                TST.B   FFF6(A6)
   206H        6704                     BEQ     [04H] = 0000020CH
   208H        6000 FF56                BRA     [FF56H] = 00000160H
   20CH        0C2E 0020 FFFF           CMPI.B  #20H,FFFF(A6)
   212H        6626                     BNE     [26H] = 0000023AH
   214H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   218H        286E 0014                MOVE.L  0014(A6),A4
   21CH        1834 5000                MOVE.B  00H(A4,D5.W),D4
   220H        0C04 0061                CMPI.B  #61H,D4
   224H        650A                     BCS     [0AH] = 00000230H
   226H        0C04 007A                CMPI.B  #7AH,D4
   22AH        6204                     BHI     [04H] = 00000230H
   22CH        0204 005F                ANDI.B  #5FH,D4
   230H        1D44 FFFF                MOVE.B  D4,FFFF(A6)
   234H        526E FFF2                ADDQ.W  #1,FFF2(A6)
   238H        60D2                     BRA     [D2H] = 0000020CH
   23AH        0C2E 0048 FFFF           CMPI.B  #48H,FFFF(A6)
   240H        671C                     BEQ     [1CH] = 0000025EH
   242H        0C2E 0042 FFFF           CMPI.B  #42H,FFFF(A6)
   248H        6606                     BNE     [06H] = 00000250H
   24AH        4A2E FFF1                TST.B   FFF1(A6)
   24EH        670E                     BEQ     [0EH] = 0000025EH
   250H        4A2E FFFF                TST.B   FFFF(A6)
   254H        664A                     BNE     [4AH] = 000002A0H
   256H        0C2E 0001 FFF1           CMPI.B  #01H,FFF1(A6)
   25CH        6642                     BNE     [42H] = 000002A0H
   25EH        4A2E FFF7                TST.B   FFF7(A6)
   262H        6726                     BEQ     [26H] = 0000028AH
   264H        2A2E 0010                MOVE.L  0010(A6),D5
   268H        5285                     ADDQ.L  #1,D5
   26AH        286E 0008                MOVE.L  0008(A6),A4
   26EH        BA94                     CMP.L   (A4),D5
   270H        6518                     BCS     [18H] = 0000028AH
   272H        286E 0008                MOVE.L  0008(A6),A4
   276H        2A14                     MOVE.L  (A4),D5
   278H        4445                     NEG.W   D5
   27AH        48C5                     EXT.L   D5
   27CH        286E 0008                MOVE.L  0008(A6),A4
   280H        2885                     MOVE.L  D5,(A4)
   282H        4E5E                     UNLK    A6
   284H        4E75                     RTS
   286H        4EFA 0018                JMP     [0018H] = 000002A0H
   28AH        4A2E FFF7                TST.B   FFF7(A6)
   28EH        6610                     BNE     [10H] = 000002A0H
   290H        286E 0008                MOVE.L  0008(A6),A4
   294H        2A14                     MOVE.L  (A4),D5
   296H        BAAE 0010                CMP.L   0010(A6),D5
   29AH        6204                     BHI     [04H] = 000002A0H
   29CH        4E5E                     UNLK    A6
   29EH        4E75                     RTS
   2A0H        286E 0008                MOVE.L  0008(A6),A4
   2A4H        4294                     CLR.L   (A4)
   2A6H        286E 000C                MOVE.L  000C(A6),A4
   2AAH        4214                     CLR.B   (A4)
   2ACH        4E5E                     UNLK    A6
   2AEH        4E75                     RTS
  checksum: o.k.

ref util: at    74H, procnum =  1  checksum: o.k.

ref util: at   1A2H, procnum =  8  checksum: o.k.

ref util: at   1E2H, procnum =  8  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 114
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        4A6E 0008                TST.W   0008(A6)
     8H        6F0C                     BLE     [0CH] = 00000016H
     AH        2D7C 4120 0000 FFF8      MOVE.L  #41200000H,FFF8(A6)
    12H        4EFA 000A                JMP     [000AH] = 0000001EH
    16H        2D7C 3DCC CCCD FFF8      MOVE.L  #3DCCCCCDH,FFF8(A6)
    1EH        2D7C 3F80 0000 FFFC      MOVE.L  #3F800000H,FFFC(A6)
    26H        3D7C 0001 FFF6           MOVE.W  #0001H,FFF6(A6)
    2CH        3A2E 0008                MOVE.W  0008(A6),D5
    30H        4A45                     TST.W   D5
    32H        6C02                     BGE     [02H] = 00000036H
    34H        4445                     NEG.W   D5
    36H        3F05                     MOVE.W  D5,-(A7)
    38H        302E FFF6                MOVE.W  FFF6(A6),D0
    3CH        B057                     CMP.W   (A7),D0
    3EH        6F04                     BLE     [04H] = 00000044H
    40H        4EFA 0024                JMP     [0024H] = 00000066H
    44H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    48H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    4CH        4EB9 0000 0000           JSR     00000000H
    52H        588F                     ADDQ.L  #4,A7
    54H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    58H        302E FFF6                MOVE.W  FFF6(A6),D0
    5CH        B057                     CMP.W   (A7),D0
    5EH        6C06                     BGE     [06H] = 00000066H
    60H        526E FFF6                ADDQ.W  #1,FFF6(A6)
    64H        60DE                     BRA     [DEH] = 00000044H
    66H        548F                     ADDQ.L  #2,A7
    68H        2D6E FFFC 000A           MOVE.L  FFFC(A6),000A(A6)
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref util: at    4EH, procnum = 14  checksum: o.k.

scmod end  checksum: o.k.
