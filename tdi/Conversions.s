link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Conversions, key =  2102H  F1E3H  6E1CH  checksum: o.k.

data size, number of bytes = 270  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 44
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2A2E 0008                MOVE.L  0008(A6),D5
     CH        0685 0100 0000           ADDI.L  #01000000H,D5
    12H        2F05                     MOVE.L  D5,-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        588F                     ADDQ.L  #4,A7
    1CH        2A1F                     MOVE.L  (A7)+,D5
    1EH        0685 0080 0000           ADDI.L  #00800000H,D5
    24H        2D45 000C                MOVE.L  D5,000C(A6)
    28H        4E5E                     UNLK    A6
    2AH        4E75                     RTS
  checksum: o.k.

ref util: at    16H, procnum = 12  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 92
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        2D7C 3F80 0000 FFFA      MOVE.L  #3F800000H,FFFA(A6)
    10H        4A6E 0008                TST.W   0008(A6)
    14H        633C                     BLS     [3CH] = 00000052H
    16H        3A2E 0008                MOVE.W  0008(A6),D5
    1AH        0205 0001                ANDI.B  #01H,D5
    1EH        4A05                     TST.B   D5
    20H        6720                     BEQ     [20H] = 00000042H
    22H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    26H        E545                     ASL.W   #2,D5
    28H        49F9 0000 0000           LEA     00000000H,A4
    2EH        2F34 5000                MOVE.L  00H(A4,D5.W),-(A7)
    32H        2F2E FFFA                MOVE.L  FFFA(A6),-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        588F                     ADDQ.L  #4,A7
    3EH        2D5F FFFA                MOVE.L  (A7)+,FFFA(A6)
    42H        3A2E 0008                MOVE.W  0008(A6),D5
    46H        E24D                     LSR.W   #1,D5
    48H        3D45 0008                MOVE.W  D5,0008(A6)
    4CH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    50H        60BE                     BRA     [BEH] = 00000010H
    52H        2D6E FFFA 000A           MOVE.L  FFFA(A6),000A(A6)
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref util: at    38H, procnum = 14  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3A39 0000 0034           MOVE.W  00000034H,D5
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        19AE 000E 5000           MOVE.B  000E(A6),00H(A4,D5.W)
    14H        5279 0000 0034           ADDQ.W  #1,00000034H
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    16H  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 268
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE2                LINK    A6,#FFE2H
     4H        0C6E 0020 0010           CMPI.W  #0020H,0010(A6)
     AH        6514                     BCS     [14H] = 00000020H
     CH        0C6E 0002 0014           CMPI.W  #0002H,0014(A6)
    12H        650C                     BCS     [0CH] = 00000020H
    14H        0C6E 0024 0014           CMPI.W  #0024H,0014(A6)
    1AH        6204                     BHI     [04H] = 00000020H
    1CH        7A01                     MOVEQ   #01H,D5
    1EH        6002                     BRA     [02H] = 00000022H
    20H        7A00                     MOVEQ   #00H,D5
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        1885                     MOVE.B  D5,(A4)
    28H        286E 0008                MOVE.L  0008(A6),A4
    2CH        4A14                     TST.B   (A4)
    2EH        6702                     BEQ     [02H] = 00000032H
    30H        6004                     BRA     [04H] = 00000036H
    32H        4EFA 00D4                JMP     [00D4H] = 00000108H
    36H        7A00                     MOVEQ   #00H,D5
    38H        3A2E 0014                MOVE.W  0014(A6),D5
    3CH        2D45 FFE2                MOVE.L  D5,FFE2(A6)
    40H        426E FFE8                CLR.W   FFE8(A6)
    44H        2F2E 0016                MOVE.L  0016(A6),-(A7)
    48H        2F2E FFE2                MOVE.L  FFE2(A6),-(A7)
    4CH        4EB9 0000 0000           JSR     00000000H
    52H        2E9F                     MOVE.L  (A7)+,(A7)
    54H        2A1F                     MOVE.L  (A7)+,D5
    56H        3D45 FFE6                MOVE.W  D5,FFE6(A6)
    5AH        0C6E 000A FFE6           CMPI.W  #000AH,FFE6(A6)
    60H        6418                     BCC     [18H] = 0000007AH
    62H        3A2E FFE6                MOVE.W  FFE6(A6),D5
    66H        0645 0030                ADDI.W  #0030H,D5
    6AH        382E FFE8                MOVE.W  FFE8(A6),D4
    6EH        49EE FFEC                LEA     FFEC(A6),A4
    72H        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    76H        4EFA 001A                JMP     [001AH] = 00000092H
    7AH        3A2E FFE6                MOVE.W  FFE6(A6),D5
    7EH        0445 000A                SUBI.W  #000AH,D5
    82H        0645 0041                ADDI.W  #0041H,D5
    86H        382E FFE8                MOVE.W  FFE8(A6),D4
    8AH        49EE FFEC                LEA     FFEC(A6),A4
    8EH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    92H        526E FFE8                ADDQ.W  #1,FFE8(A6)
    96H        2F2E 0016                MOVE.L  0016(A6),-(A7)
    9AH        2F2E FFE2                MOVE.L  FFE2(A6),-(A7)
    9EH        4EB9 0000 0000           JSR     00000000H
    A4H        588F                     ADDQ.L  #4,A7
    A6H        2D5F 0016                MOVE.L  (A7)+,0016(A6)
    AAH        4AAE 0016                TST.L   0016(A6)
    AEH        6702                     BEQ     [02H] = 000000B2H
    B0H        6092                     BRA     [92H] = 00000044H
    B2H        4A2E 0012                TST.B   0012(A6)
    B6H        6712                     BEQ     [12H] = 000000CAH
    B8H        3A2E FFE8                MOVE.W  FFE8(A6),D5
    BCH        49EE FFEC                LEA     FFEC(A6),A4
    C0H        19BC 002D 5000           MOVE.B  #2DH,00H(A4,D5.W)
    C6H        4EFA 0006                JMP     [0006H] = 000000CEH
    CAH        536E FFE8                SUBQ.W  #1,FFE8(A6)
    CEH        3D6E FFE8 FFEA           MOVE.W  FFE8(A6),FFEA(A6)
    D4H        3A2E FFE8                MOVE.W  FFE8(A6),D5
    D8H        49EE FFEC                LEA     FFEC(A6),A4
    DCH        382E FFEA                MOVE.W  FFEA(A6),D4
    E0H        986E FFE8                SUB.W   FFE8(A6),D4
    E4H        266E 000C                MOVE.L  000C(A6),A3
    E8H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    EEH        536E FFE8                SUBQ.W  #1,FFE8(A6)
    F2H        4A6E FFE8                TST.W   FFE8(A6)
    F6H        6D02                     BLT     [02H] = 000000FAH
    F8H        60DA                     BRA     [DAH] = 000000D4H
    FAH        3A2E FFEA                MOVE.W  FFEA(A6),D5
    FEH        5245                     ADDQ.W  #1,D5
   100H        286E 000C                MOVE.L  000C(A6),A4
   104H        4234 5000                CLR.B   00H(A4,D5.W)
   108H        4E5E                     UNLK    A6
   10AH        4E75                     RTS
  checksum: o.k.

ref util: at    4EH, procnum =  9  checksum: o.k.

ref util: at    A0H, procnum =  9  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 504
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF0                LINK    A6,#FFF0H
     4H        0C6E 0002 0016           CMPI.W  #0002H,0016(A6)
     AH        650C                     BCS     [0CH] = 00000018H
     CH        0C6E 0024 0016           CMPI.W  #0024H,0016(A6)
    12H        6204                     BHI     [04H] = 00000018H
    14H        7A01                     MOVEQ   #01H,D5
    16H        6002                     BRA     [02H] = 0000001AH
    18H        7A00                     MOVEQ   #00H,D5
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        1885                     MOVE.B  D5,(A4)
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        4A14                     TST.B   (A4)
    26H        6702                     BEQ     [02H] = 0000002AH
    28H        6004                     BRA     [04H] = 0000002EH
    2AH        4EFA 01C8                JMP     [01C8H] = 000001F4H
    2EH        7A00                     MOVEQ   #00H,D5
    30H        3A2E 0016                MOVE.W  0016(A6),D5
    34H        2F2E 0010                MOVE.L  0010(A6),-(A7)
    38H        2F05                     MOVE.L  D5,-(A7)
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        2E9F                     MOVE.L  (A7)+,(A7)
    42H        2A1F                     MOVE.L  (A7)+,D5
    44H        3D45 FFF6                MOVE.W  D5,FFF6(A6)
    48H        7A00                     MOVEQ   #00H,D5
    4AH        3A2E 0016                MOVE.W  0016(A6),D5
    4EH        2F2E 0010                MOVE.L  0010(A6),-(A7)
    52H        2F05                     MOVE.L  D5,-(A7)
    54H        4EB9 0000 0000           JSR     00000000H
    5AH        588F                     ADDQ.L  #4,A7
    5CH        2D5F FFF0                MOVE.L  (A7)+,FFF0(A6)
    60H        426E FFFC                CLR.W   FFFC(A6)
    64H        286E 000C                MOVE.L  000C(A6),A4
    68H        4294                     CLR.L   (A4)
    6AH        426E FFFA                CLR.W   FFFA(A6)
    6EH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    72H        BA6E 001C                CMP.W   001C(A6),D5
    76H        6214                     BHI     [14H] = 0000008CH
    78H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    7CH        286E 0018                MOVE.L  0018(A6),A4
    80H        4A34 5000                TST.B   00H(A4,D5.W)
    84H        6706                     BEQ     [06H] = 0000008CH
    86H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    8AH        60E2                     BRA     [E2H] = 0000006EH
    8CH        422E FFFF                CLR.B   FFFF(A6)
    90H        4A2E 0014                TST.B   0014(A6)
    94H        672A                     BEQ     [2AH] = 000000C0H
    96H        286E 0018                MOVE.L  0018(A6),A4
    9AH        0C14 002B                CMPI.B  #2BH,(A4)
    9EH        660A                     BNE     [0AH] = 000000AAH
    A0H        3D7C 0001 FFFC           MOVE.W  #0001H,FFFC(A6)
    A6H        4EFA 0018                JMP     [0018H] = 000000C0H
    AAH        286E 0018                MOVE.L  0018(A6),A4
    AEH        0C14 002D                CMPI.B  #2DH,(A4)
    B2H        660C                     BNE     [0CH] = 000000C0H
    B4H        3D7C 0001 FFFC           MOVE.W  #0001H,FFFC(A6)
    BAH        1D7C 0001 FFFF           MOVE.B  #01H,FFFF(A6)
    C0H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    C4H        BA6E FFFC                CMP.W   FFFC(A6),D5
    C8H        52C5                     SHI     D5
    CAH        4405                     NEG.B   D5
    CCH        286E 0008                MOVE.L  0008(A6),A4
    D0H        1885                     MOVE.B  D5,(A4)
    D2H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    D6H        BA6E FFFA                CMP.W   FFFA(A6),D5
    DAH        640A                     BCC     [0AH] = 000000E6H
    DCH        286E 0008                MOVE.L  0008(A6),A4
    E0H        4A14                     TST.B   (A4)
    E2H        6702                     BEQ     [02H] = 000000E6H
    E4H        6004                     BRA     [04H] = 000000EAH
    E6H        4EFA 00F8                JMP     [00F8H] = 000001E0H
    EAH        3A2E FFFC                MOVE.W  FFFC(A6),D5
    EEH        286E 0018                MOVE.L  0018(A6),A4
    F2H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    F6H        0C04 0061                CMPI.B  #61H,D4
    FAH        650A                     BCS     [0AH] = 00000106H
    FCH        0C04 007A                CMPI.B  #7AH,D4
   100H        6204                     BHI     [04H] = 00000106H
   102H        0204 005F                ANDI.B  #5FH,D4
   106H        1D44 FFF5                MOVE.B  D4,FFF5(A6)
   10AH        0C2E 0030 FFF5           CMPI.B  #30H,FFF5(A6)
   110H        651A                     BCS     [1AH] = 0000012CH
   112H        0C2E 0039 FFF5           CMPI.B  #39H,FFF5(A6)
   118H        6212                     BHI     [12H] = 0000012CH
   11AH        7A00                     MOVEQ   #00H,D5
   11CH        1A2E FFF5                MOVE.B  FFF5(A6),D5
   120H        0445 0030                SUBI.W  #0030H,D5
   124H        3D45 FFF8                MOVE.W  D5,FFF8(A6)
   128H        4EFA 002E                JMP     [002EH] = 00000158H
   12CH        0C2E 0041 FFF5           CMPI.B  #41H,FFF5(A6)
   132H        651E                     BCS     [1EH] = 00000152H
   134H        0C2E 005A FFF5           CMPI.B  #5AH,FFF5(A6)
   13AH        6216                     BHI     [16H] = 00000152H
   13CH        7A00                     MOVEQ   #00H,D5
   13EH        1A2E FFF5                MOVE.B  FFF5(A6),D5
   142H        0445 0041                SUBI.W  #0041H,D5
   146H        0645 000A                ADDI.W  #000AH,D5
   14AH        3D45 FFF8                MOVE.W  D5,FFF8(A6)
   14EH        4EFA 0008                JMP     [0008H] = 00000158H
   152H        286E 0008                MOVE.L  0008(A6),A4
   156H        4214                     CLR.B   (A4)
   158H        286E 0008                MOVE.L  0008(A6),A4
   15CH        4A14                     TST.B   (A4)
   15EH        670E                     BEQ     [0EH] = 0000016EH
   160H        3A2E FFF8                MOVE.W  FFF8(A6),D5
   164H        BA6E 0016                CMP.W   0016(A6),D5
   168H        6404                     BCC     [04H] = 0000016EH
   16AH        7A01                     MOVEQ   #01H,D5
   16CH        6002                     BRA     [02H] = 00000170H
   16EH        7A00                     MOVEQ   #00H,D5
   170H        286E 0008                MOVE.L  0008(A6),A4
   174H        1885                     MOVE.B  D5,(A4)
   176H        286E 0008                MOVE.L  0008(A6),A4
   17AH        4A14                     TST.B   (A4)
   17CH        675E                     BEQ     [5EH] = 000001DCH
   17EH        286E 000C                MOVE.L  000C(A6),A4
   182H        2A14                     MOVE.L  (A4),D5
   184H        BAAE FFF0                CMP.L   FFF0(A6),D5
   188H        6516                     BCS     [16H] = 000001A0H
   18AH        286E 000C                MOVE.L  000C(A6),A4
   18EH        2A14                     MOVE.L  (A4),D5
   190H        BAAE FFF0                CMP.L   FFF0(A6),D5
   194H        660E                     BNE     [0EH] = 000001A4H
   196H        3A2E FFF8                MOVE.W  FFF8(A6),D5
   19AH        BA6E FFF6                CMP.W   FFF6(A6),D5
   19EH        6204                     BHI     [04H] = 000001A4H
   1A0H        7A01                     MOVEQ   #01H,D5
   1A2H        6002                     BRA     [02H] = 000001A6H
   1A4H        7A00                     MOVEQ   #00H,D5
   1A6H        286E 0008                MOVE.L  0008(A6),A4
   1AAH        1885                     MOVE.B  D5,(A4)
   1ACH        286E 0008                MOVE.L  0008(A6),A4
   1B0H        4A14                     TST.B   (A4)
   1B2H        6728                     BEQ     [28H] = 000001DCH
   1B4H        7A00                     MOVEQ   #00H,D5
   1B6H        3A2E 0016                MOVE.W  0016(A6),D5
   1BAH        286E 000C                MOVE.L  000C(A6),A4
   1BEH        2F14                     MOVE.L  (A4),-(A7)
   1C0H        2F05                     MOVE.L  D5,-(A7)
   1C2H        4EB9 0000 0000           JSR     00000000H
   1C8H        588F                     ADDQ.L  #4,A7
   1CAH        7A00                     MOVEQ   #00H,D5
   1CCH        3A2E FFF8                MOVE.W  FFF8(A6),D5
   1D0H        DA9F                     ADD.L   (A7)+,D5
   1D2H        286E 000C                MOVE.L  000C(A6),A4
   1D6H        2885                     MOVE.L  D5,(A4)
   1D8H        526E FFFC                ADDQ.W  #1,FFFC(A6)
   1DCH        6000 FEF4                BRA     [FEF4H] = 000000D2H
   1E0H        4A2E FFFF                TST.B   FFFF(A6)
   1E4H        670E                     BEQ     [0EH] = 000001F4H
   1E6H        286E 000C                MOVE.L  000C(A6),A4
   1EAH        2A14                     MOVE.L  (A4),D5
   1ECH        4485                     NEG.L   D5
   1EEH        286E 000C                MOVE.L  000C(A6),A4
   1F2H        2885                     MOVE.L  D5,(A4)
   1F4H        4E5E                     UNLK    A6
   1F6H        4E75                     RTS
  checksum: o.k.

ref util: at    3CH, procnum =  9  checksum: o.k.

ref util: at    56H, procnum =  9  checksum: o.k.

ref util: at   1C4H, procnum =  8  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 932
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        3A2E 000C                MOVE.W  000C(A6),D5
     8H        BA6E 0012                CMP.W   0012(A6),D5
     CH        55C5                     SCS     D5
     EH        4405                     NEG.B   D5
    10H        286E 0008                MOVE.L  0008(A6),A4
    14H        1885                     MOVE.B  D5,(A4)
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4A14                     TST.B   (A4)
    1CH        6702                     BEQ     [02H] = 00000020H
    1EH        6004                     BRA     [04H] = 00000024H
    20H        4EFA 037E                JMP     [037EH] = 000003A0H
    24H        4279 0000 0034           CLR.W   00000034H
    2AH        2F2E 0014                MOVE.L  0014(A6),-(A7)
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        588F                     ADDQ.L  #4,A7
    36H        663A                     BNE     [3AH] = 00000072H
    38H        1F3C 0020                MOVE.B  #20H,-(A7)
    3CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    40H        286E 000E                MOVE.L  000E(A6),A4
    44H        4854                     PEA     (A4)
    46H        6100 0000                BSR     [0000H] = 00000048H
    4AH        508F                     ADDQ.L  #8,A7
    4CH        536E 000C                SUBQ.W  #1,000C(A6)
    50H        0C6E 0001 000C           CMPI.W  #0001H,000C(A6)
    56H        6302                     BLS     [02H] = 0000005AH
    58H        60DE                     BRA     [DEH] = 00000038H
    5AH        1F3C 0030                MOVE.B  #30H,-(A7)
    5EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    62H        286E 000E                MOVE.L  000E(A6),A4
    66H        4854                     PEA     (A4)
    68H        6100 0000                BSR     [0000H] = 0000006AH
    6CH        508F                     ADDQ.L  #8,A7
    6EH        4EFA 0322                JMP     [0322H] = 00000392H
    72H        0C6E 0009 000C           CMPI.W  #0009H,000C(A6)
    78H        620A                     BHI     [0AH] = 00000084H
    7AH        3D7C 0003 000C           MOVE.W  #0003H,000C(A6)
    80H        4EFA 0006                JMP     [0006H] = 00000088H
    84H        5D6E 000C                SUBQ.W  #6,000C(A6)
    88H        1F3C 0020                MOVE.B  #20H,-(A7)
    8CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    90H        286E 000E                MOVE.L  000E(A6),A4
    94H        4854                     PEA     (A4)
    96H        6100 0000                BSR     [0000H] = 00000098H
    9AH        508F                     ADDQ.L  #8,A7
    9CH        536E 000C                SUBQ.W  #1,000C(A6)
    A0H        0C6E 0008 000C           CMPI.W  #0008H,000C(A6)
    A6H        6302                     BLS     [02H] = 000000AAH
    A8H        60DE                     BRA     [DEH] = 00000088H
    AAH        2F2E 0014                MOVE.L  0014(A6),-(A7)
    AEH        4EB9 0000 0000           JSR     00000000H
    B4H        588F                     ADDQ.L  #4,A7
    B6H        6C24                     BGE     [24H] = 000000DCH
    B8H        1F3C 002D                MOVE.B  #2DH,-(A7)
    BCH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    C0H        286E 000E                MOVE.L  000E(A6),A4
    C4H        4854                     PEA     (A4)
    C6H        6100 0000                BSR     [0000H] = 000000C8H
    CAH        508F                     ADDQ.L  #8,A7
    CCH        2A2E 0014                MOVE.L  0014(A6),D5
    D0H        0885 001F                BCLR    #001FH,D5
    D4H        2D45 0014                MOVE.L  D5,0014(A6)
    D8H        4EFA 0016                JMP     [0016H] = 000000F0H
    DCH        1F3C 0020                MOVE.B  #20H,-(A7)
    E0H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    E4H        286E 000E                MOVE.L  000E(A6),A4
    E8H        4854                     PEA     (A4)
    EAH        6100 0000                BSR     [0000H] = 000000ECH
    EEH        508F                     ADDQ.L  #8,A7
    F0H        2A2E 0014                MOVE.L  0014(A6),D5
    F4H        7817                     MOVEQ   #17H,D4
    F6H        E8AD                     LSR.L   D4,D5
    F8H        3D45 FFFE                MOVE.W  D5,FFFE(A6)
    FCH        0C6E 007F FFFE           CMPI.W  #007FH,FFFE(A6)
   102H        6566                     BCS     [66H] = 0000016AH
   104H        3A2E FFFE                MOVE.W  FFFE(A6),D5
   108H        0445 007F                SUBI.W  #007FH,D5
   10CH        CAFC 004D                MULU    #004DH,D5
   110H        E04D                     LSR.W   #8,D5
   112H        3D45 FFFE                MOVE.W  D5,FFFE(A6)
   116H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   11AH        598F                     SUBQ.L  #4,A7
   11CH        3F2E FFFE                MOVE.W  FFFE(A6),-(A7)
   120H        6100 0000                BSR     [0000H] = 00000122H
   124H        548F                     ADDQ.L  #2,A7
   126H        4EB9 0000 0000           JSR     00000000H
   12CH        588F                     ADDQ.L  #4,A7
   12EH        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   132H        3D6E FFFE FFFC           MOVE.W  FFFE(A6),FFFC(A6)
   138H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   13CH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
   142H        4EB9 0000 0000           JSR     00000000H
   148H        508F                     ADDQ.L  #8,A7
   14AH        6D1A                     BLT     [1AH] = 00000166H
   14CH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   150H        2F3C 3DCC CCCD           MOVE.L  #3DCCCCCDH,-(A7)
   156H        4EB9 0000 0000           JSR     00000000H
   15CH        588F                     ADDQ.L  #4,A7
   15EH        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   162H        526E FFFC                ADDQ.W  #1,FFFC(A6)
   166H        4EFA 0066                JMP     [0066H] = 000001CEH
   16AH        7A7F                     MOVEQ   #7FH,D5
   16CH        9A6E FFFE                SUB.W   FFFE(A6),D5
   170H        CAFC 004D                MULU    #004DH,D5
   174H        E04D                     LSR.W   #8,D5
   176H        3D45 FFFE                MOVE.W  D5,FFFE(A6)
   17AH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   17EH        598F                     SUBQ.L  #4,A7
   180H        3F2E FFFE                MOVE.W  FFFE(A6),-(A7)
   184H        6100 0000                BSR     [0000H] = 00000186H
   188H        548F                     ADDQ.L  #2,A7
   18AH        4EB9 0000 0000           JSR     00000000H
   190H        588F                     ADDQ.L  #4,A7
   192H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   196H        3A2E FFFE                MOVE.W  FFFE(A6),D5
   19AH        4445                     NEG.W   D5
   19CH        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   1A0H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   1A4H        2F3C 3DCC CCCD           MOVE.L  #3DCCCCCDH,-(A7)
   1AAH        4EB9 0000 0000           JSR     00000000H
   1B0H        508F                     ADDQ.L  #8,A7
   1B2H        6C1A                     BGE     [1AH] = 000001CEH
   1B4H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   1B8H        2F3C 4120 0000           MOVE.L  #41200000H,-(A7)
   1BEH        4EB9 0000 0000           JSR     00000000H
   1C4H        588F                     ADDQ.L  #4,A7
   1C6H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   1CAH        536E FFFC                SUBQ.W  #1,FFFC(A6)
   1CEH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   1D2H        3A2E 000C                MOVE.W  000C(A6),D5
   1D6H        E545                     ASL.W   #2,D5
   1D8H        49F9 0000 0010           LEA     00000010H,A4
   1DEH        2F34 5000                MOVE.L  00H(A4,D5.W),-(A7)
   1E2H        4EB9 0000 0000           JSR     00000000H
   1E8H        588F                     ADDQ.L  #4,A7
   1EAH        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   1EEH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   1F2H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
   1F8H        4EB9 0000 0000           JSR     00000000H
   1FEH        508F                     ADDQ.L  #8,A7
   200H        6D1A                     BLT     [1AH] = 0000021CH
   202H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   206H        2F3C 3DCC CCCD           MOVE.L  #3DCCCCCDH,-(A7)
   20CH        4EB9 0000 0000           JSR     00000000H
   212H        588F                     ADDQ.L  #4,A7
   214H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   218H        526E FFFC                ADDQ.W  #1,FFFC(A6)
   21CH        598F                     SUBQ.L  #4,A7
   21EH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   222H        6100 0000                BSR     [0000H] = 00000224H
   226H        588F                     ADDQ.L  #4,A7
   228H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   22CH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   230H        4EB9 0000 0000           JSR     00000000H
   236H        2A1F                     MOVE.L  (A7)+,D5
   238H        0645 0030                ADDI.W  #0030H,D5
   23CH        1F05                     MOVE.B  D5,-(A7)
   23EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   242H        286E 000E                MOVE.L  000E(A6),A4
   246H        4854                     PEA     (A4)
   248H        6100 0000                BSR     [0000H] = 0000024AH
   24CH        508F                     ADDQ.L  #8,A7
   24EH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   252H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   256H        4EB9 0000 0000           JSR     00000000H
   25CH        2A1F                     MOVE.L  (A7)+,D5
   25EH        4845                     SWAP    D5
   260H        4245                     CLR.W   D5
   262H        4845                     SWAP    D5
   264H        2F05                     MOVE.L  D5,-(A7)
   266H        4EB9 0000 0000           JSR     00000000H
   26CH        4EB9 0000 0000           JSR     00000000H
   272H        588F                     ADDQ.L  #4,A7
   274H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   278H        1F3C 002E                MOVE.B  #2EH,-(A7)
   27CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   280H        286E 000E                MOVE.L  000E(A6),A4
   284H        4854                     PEA     (A4)
   286H        6100 0000                BSR     [0000H] = 00000288H
   28AH        508F                     ADDQ.L  #8,A7
   28CH        536E 000C                SUBQ.W  #1,000C(A6)
   290H        598F                     SUBQ.L  #4,A7
   292H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   296H        6100 0000                BSR     [0000H] = 00000298H
   29AH        588F                     ADDQ.L  #4,A7
   29CH        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   2A0H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   2A4H        4EB9 0000 0000           JSR     00000000H
   2AAH        2A1F                     MOVE.L  (A7)+,D5
   2ACH        0645 0030                ADDI.W  #0030H,D5
   2B0H        1F05                     MOVE.B  D5,-(A7)
   2B2H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   2B6H        286E 000E                MOVE.L  000E(A6),A4
   2BAH        4854                     PEA     (A4)
   2BCH        6100 0000                BSR     [0000H] = 000002BEH
   2C0H        508F                     ADDQ.L  #8,A7
   2C2H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   2C6H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   2CAH        4EB9 0000 0000           JSR     00000000H
   2D0H        2A1F                     MOVE.L  (A7)+,D5
   2D2H        4845                     SWAP    D5
   2D4H        4245                     CLR.W   D5
   2D6H        4845                     SWAP    D5
   2D8H        2F05                     MOVE.L  D5,-(A7)
   2DAH        4EB9 0000 0000           JSR     00000000H
   2E0H        4EB9 0000 0000           JSR     00000000H
   2E6H        588F                     ADDQ.L  #4,A7
   2E8H        2D5F 0014                MOVE.L  (A7)+,0014(A6)
   2ECH        536E 000C                SUBQ.W  #1,000C(A6)
   2F0H        4A6E 000C                TST.W   000C(A6)
   2F4H        6702                     BEQ     [02H] = 000002F8H
   2F6H        6098                     BRA     [98H] = 00000290H
   2F8H        1F3C 0045                MOVE.B  #45H,-(A7)
   2FCH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   300H        286E 000E                MOVE.L  000E(A6),A4
   304H        4854                     PEA     (A4)
   306H        6100 0000                BSR     [0000H] = 00000308H
   30AH        508F                     ADDQ.L  #8,A7
   30CH        536E FFFC                SUBQ.W  #1,FFFC(A6)
   310H        4A6E FFFC                TST.W   FFFC(A6)
   314H        6C22                     BGE     [22H] = 00000338H
   316H        1F3C 002D                MOVE.B  #2DH,-(A7)
   31AH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   31EH        286E 000E                MOVE.L  000E(A6),A4
   322H        4854                     PEA     (A4)
   324H        6100 0000                BSR     [0000H] = 00000326H
   328H        508F                     ADDQ.L  #8,A7
   32AH        3A2E FFFC                MOVE.W  FFFC(A6),D5
   32EH        4445                     NEG.W   D5
   330H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   334H        4EFA 0016                JMP     [0016H] = 0000034CH
   338H        1F3C 002B                MOVE.B  #2BH,-(A7)
   33CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   340H        286E 000E                MOVE.L  000E(A6),A4
   344H        4854                     PEA     (A4)
   346H        6100 0000                BSR     [0000H] = 00000348H
   34AH        508F                     ADDQ.L  #8,A7
   34CH        3A2E FFFC                MOVE.W  FFFC(A6),D5
   350H        48C5                     EXT.L   D5
   352H        8BFC 000A                DIVS    #000AH,D5
   356H        0645 0030                ADDI.W  #0030H,D5
   35AH        48C5                     EXT.L   D5
   35CH        1F05                     MOVE.B  D5,-(A7)
   35EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   362H        286E 000E                MOVE.L  000E(A6),A4
   366H        4854                     PEA     (A4)
   368H        6100 0000                BSR     [0000H] = 0000036AH
   36CH        508F                     ADDQ.L  #8,A7
   36EH        3A2E FFFC                MOVE.W  FFFC(A6),D5
   372H        48C5                     EXT.L   D5
   374H        8BFC 000A                DIVS    #000AH,D5
   378H        4845                     SWAP    D5
   37AH        0645 0030                ADDI.W  #0030H,D5
   37EH        48C5                     EXT.L   D5
   380H        1F05                     MOVE.B  D5,-(A7)
   382H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   386H        286E 000E                MOVE.L  000E(A6),A4
   38AH        4854                     PEA     (A4)
   38CH        6100 0000                BSR     [0000H] = 0000038EH
   390H        508F                     ADDQ.L  #8,A7
   392H        3A39 0000 0034           MOVE.W  00000034H,D5
   398H        286E 000E                MOVE.L  000E(A6),A4
   39CH        4234 5000                CLR.B   00H(A4,D5.W)
   3A0H        4E5E                     UNLK    A6
   3A2H        4E75                     RTS
  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref util: at    30H, procnum = 17  checksum: o.k.

ref own quick call at    48H, procnum = 10  checksum: o.k.

ref own quick call at    6AH, procnum = 10  checksum: o.k.

ref own quick call at    98H, procnum = 10  checksum: o.k.

ref util: at    B0H, procnum = 17  checksum: o.k.

ref own quick call at    C8H, procnum = 10  checksum: o.k.

ref own quick call at    ECH, procnum = 10  checksum: o.k.

ref own quick call at   122H, procnum =  9  checksum: o.k.

ref util: at   128H, procnum = 15  checksum: o.k.

ref util: at   144H, procnum = 16  checksum: o.k.

ref util: at   158H, procnum = 14  checksum: o.k.

ref own quick call at   186H, procnum =  9  checksum: o.k.

ref util: at   18CH, procnum = 14  checksum: o.k.

ref util: at   1ACH, procnum = 16  checksum: o.k.

ref util: at   1C0H, procnum = 14  checksum: o.k.

ref own data at   1DAH  checksum: o.k.

ref util: at   1E4H, procnum = 12  checksum: o.k.

ref util: at   1FAH, procnum = 16  checksum: o.k.

ref util: at   20EH, procnum = 14  checksum: o.k.

ref own quick call at   224H, procnum =  8  checksum: o.k.

ref util: at   232H, procnum = 19  checksum: o.k.

ref own quick call at   24AH, procnum = 10  checksum: o.k.

ref util: at   258H, procnum = 19  checksum: o.k.

ref util: at   268H, procnum = 18  checksum: o.k.

ref util: at   26EH, procnum = 13  checksum: o.k.

ref own quick call at   288H, procnum = 10  checksum: o.k.

ref own quick call at   298H, procnum =  8  checksum: o.k.

ref util: at   2A6H, procnum = 19  checksum: o.k.

ref own quick call at   2BEH, procnum = 10  checksum: o.k.

ref util: at   2CCH, procnum = 19  checksum: o.k.

ref util: at   2DCH, procnum = 18  checksum: o.k.

ref util: at   2E2H, procnum = 13  checksum: o.k.

ref own quick call at   308H, procnum = 10  checksum: o.k.

ref own quick call at   326H, procnum = 10  checksum: o.k.

ref own quick call at   348H, procnum = 10  checksum: o.k.

ref own quick call at   36AH, procnum = 10  checksum: o.k.

ref own quick call at   38EH, procnum = 10  checksum: o.k.

ref own data at   394H  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 72
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286D FFFC                MOVE.L  FFFC(A5),A4
     8H        266D FFFC                MOVE.L  FFFC(A5),A3
     CH        3A2C FFF8                MOVE.W  FFF8(A4),D5
    10H        BA6B 0010                CMP.W   0010(A3),D5
    14H        630C                     BLS     [0CH] = 00000022H
    16H        286D FFFC                MOVE.L  FFFC(A5),A4
    1AH        422C FFFF                CLR.B   FFFF(A4)
    1EH        4EFA 0024                JMP     [0024H] = 00000044H
    22H        286D FFFC                MOVE.L  FFFC(A5),A4
    26H        266D FFFC                MOVE.L  FFFC(A5),A3
    2AH        3A2B FFF8                MOVE.W  FFF8(A3),D5
    2EH        286C 000C                MOVE.L  000C(A4),A4
    32H        266D FFFC                MOVE.L  FFFC(A5),A3
    36H        1774 5000 FFFF           MOVE.B  00H(A4,D5.W),FFFF(A3)
    3CH        286D FFFC                MOVE.L  FFFC(A5),A4
    40H        526C FFF8                ADDQ.W  #1,FFF8(A4)
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 646
 DECODE --------                        INSTRUCTION
     0H        4E56 FFC8                LINK    A6,#FFC8H
     4H        2F2D FFFC                MOVE.L  FFFC(A5),-(A7)
     8H        2B4E FFFC                MOVE.L  A6,FFFC(A5)
     CH        426E FFF8                CLR.W   FFF8(A6)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
    1AH        660E                     BNE     [0EH] = 0000002AH
    1CH        1D7C 0001 FFC9           MOVE.B  #01H,FFC9(A6)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4EFA 0012                JMP     [0012H] = 0000003AH
    2AH        422E FFC9                CLR.B   FFC9(A6)
    2EH        0C2E 002B FFFF           CMPI.B  #2BH,FFFF(A6)
    34H        6604                     BNE     [04H] = 0000003AH
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    40H        6508                     BCS     [08H] = 0000004AH
    42H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    48H        6308                     BLS     [08H] = 00000052H
    4AH        0C2E 002E FFFF           CMPI.B  #2EH,FFFF(A6)
    50H        6602                     BNE     [02H] = 00000054H
    52H        6004                     BRA     [04H] = 00000058H
    54H        4EFA 0222                JMP     [0222H] = 00000278H
    58H        426E FFFA                CLR.W   FFFA(A6)
    5CH        426E FFF6                CLR.W   FFF6(A6)
    60H        42AE FFF2                CLR.L   FFF2(A6)
    64H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    6AH        6606                     BNE     [06H] = 00000072H
    6CH        6100 0000                BSR     [0000H] = 0000006EH
    70H        60F2                     BRA     [F2H] = 00000064H
    72H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    78H        6552                     BCS     [52H] = 000000CCH
    7AH        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    80H        624A                     BHI     [4AH] = 000000CCH
    82H        0C6E 0007 FFF6           CMPI.W  #0007H,FFF6(A6)
    88H        6438                     BCC     [38H] = 000000C2H
    8AH        598F                     SUBQ.L  #4,A7
    8CH        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    90H        6100 0000                BSR     [0000H] = 00000092H
    94H        588F                     ADDQ.L  #4,A7
    96H        7A00                     MOVEQ   #00H,D5
    98H        1A2E FFFF                MOVE.B  FFFF(A6),D5
    9CH        0445 0030                SUBI.W  #0030H,D5
    A0H        4845                     SWAP    D5
    A2H        4245                     CLR.W   D5
    A4H        4845                     SWAP    D5
    A6H        2F05                     MOVE.L  D5,-(A7)
    A8H        4EB9 0000 0000           JSR     00000000H
    AEH        4EB9 0000 0000           JSR     00000000H
    B4H        588F                     ADDQ.L  #4,A7
    B6H        2D5F FFF2                MOVE.L  (A7)+,FFF2(A6)
    BAH        526E FFF6                ADDQ.W  #1,FFF6(A6)
    BEH        4EFA 0006                JMP     [0006H] = 000000C6H
    C2H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    C6H        6100 0000                BSR     [0000H] = 000000C8H
    CAH        60A6                     BRA     [A6H] = 00000072H
    CCH        0C2E 002E FFFF           CMPI.B  #2EH,FFFF(A6)
    D2H        665A                     BNE     [5AH] = 0000012EH
    D4H        6100 0000                BSR     [0000H] = 000000D6H
    D8H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    DEH        654E                     BCS     [4EH] = 0000012EH
    E0H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    E6H        6246                     BHI     [46H] = 0000012EH
    E8H        0C6E 0007 FFF6           CMPI.W  #0007H,FFF6(A6)
    EEH        6438                     BCC     [38H] = 00000128H
    F0H        598F                     SUBQ.L  #4,A7
    F2H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    F6H        6100 0000                BSR     [0000H] = 000000F8H
    FAH        588F                     ADDQ.L  #4,A7
    FCH        7A00                     MOVEQ   #00H,D5
    FEH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   102H        0445 0030                SUBI.W  #0030H,D5
   106H        4845                     SWAP    D5
   108H        4245                     CLR.W   D5
   10AH        4845                     SWAP    D5
   10CH        2F05                     MOVE.L  D5,-(A7)
   10EH        4EB9 0000 0000           JSR     00000000H
   114H        4EB9 0000 0000           JSR     00000000H
   11AH        588F                     ADDQ.L  #4,A7
   11CH        2D5F FFF2                MOVE.L  (A7)+,FFF2(A6)
   120H        526E FFF6                ADDQ.W  #1,FFF6(A6)
   124H        536E FFFA                SUBQ.W  #1,FFFA(A6)
   128H        6100 0000                BSR     [0000H] = 0000012AH
   12CH        60AA                     BRA     [AAH] = 000000D8H
   12EH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   132H        0C05 0061                CMPI.B  #61H,D5
   136H        650A                     BCS     [0AH] = 00000142H
   138H        0C05 007A                CMPI.B  #7AH,D5
   13CH        6204                     BHI     [04H] = 00000142H
   13EH        0205 005F                ANDI.B  #5FH,D5
   142H        0C05 0045                CMPI.B  #45H,D5
   146H        6602                     BNE     [02H] = 0000014AH
   148H        6004                     BRA     [04H] = 0000014EH
   14AH        4EFA 00AC                JMP     [00ACH] = 000001F8H
   14EH        6100 0000                BSR     [0000H] = 00000150H
   152H        426E FFFC                CLR.W   FFFC(A6)
   156H        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
   15CH        660E                     BNE     [0EH] = 0000016CH
   15EH        1D7C 0001 FFC8           MOVE.B  #01H,FFC8(A6)
   164H        6100 0000                BSR     [0000H] = 00000166H
   168H        4EFA 0012                JMP     [0012H] = 0000017CH
   16CH        422E FFC8                CLR.B   FFC8(A6)
   170H        0C2E 002B FFFF           CMPI.B  #2BH,FFFF(A6)
   176H        6604                     BNE     [04H] = 0000017CH
   178H        6100 0000                BSR     [0000H] = 0000017AH
   17CH        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   182H        654C                     BCS     [4CH] = 000001D0H
   184H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
   18AH        6244                     BHI     [44H] = 000001D0H
   18CH        7A00                     MOVEQ   #00H,D5
   18EH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   192H        0445 0030                SUBI.W  #0030H,D5
   196H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   19AH        6100 0000                BSR     [0000H] = 0000019CH
   19EH        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   1A4H        6526                     BCS     [26H] = 000001CCH
   1A6H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
   1ACH        621E                     BHI     [1EH] = 000001CCH
   1AEH        3A2E FFFC                MOVE.W  FFFC(A6),D5
   1B2H        CBFC 000A                MULS    #000AH,D5
   1B6H        7800                     MOVEQ   #00H,D4
   1B8H        182E FFFF                MOVE.B  FFFF(A6),D4
   1BCH        DA44                     ADD.W   D4,D5
   1BEH        0445 0030                SUBI.W  #0030H,D5
   1C2H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   1C6H        6100 0000                BSR     [0000H] = 000001C8H
   1CAH        60D2                     BRA     [D2H] = 0000019EH
   1CCH        4EFA 0010                JMP     [0010H] = 000001DEH
   1D0H        286E 0008                MOVE.L  0008(A6),A4
   1D4H        4214                     CLR.B   (A4)
   1D6H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
   1DAH        4E5E                     UNLK    A6
   1DCH        4E75                     RTS
   1DEH        4A2E FFC8                TST.B   FFC8(A6)
   1E2H        670C                     BEQ     [0CH] = 000001F0H
   1E4H        3A2E FFFC                MOVE.W  FFFC(A6),D5
   1E8H        9B6E FFFA                SUB.W   D5,FFFA(A6)
   1ECH        4EFA 000A                JMP     [000AH] = 000001F8H
   1F0H        3A2E FFFC                MOVE.W  FFFC(A6),D5
   1F4H        DB6E FFFA                ADD.W   D5,FFFA(A6)
   1F8H        4A2E FFFF                TST.B   FFFF(A6)
   1FCH        57C5                     SEQ     D5
   1FEH        4405                     NEG.B   D5
   200H        286E 0008                MOVE.L  0008(A6),A4
   204H        1885                     MOVE.B  D5,(A4)
   206H        286E 0008                MOVE.L  0008(A6),A4
   20AH        4A14                     TST.B   (A4)
   20CH        6766                     BEQ     [66H] = 00000274H
   20EH        4A6E FFFA                TST.W   FFFA(A6)
   212H        6C24                     BGE     [24H] = 00000238H
   214H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   218H        598F                     SUBQ.L  #4,A7
   21AH        3A2E FFFA                MOVE.W  FFFA(A6),D5
   21EH        4445                     NEG.W   D5
   220H        3F05                     MOVE.W  D5,-(A7)
   222H        6100 0000                BSR     [0000H] = 00000224H
   226H        548F                     ADDQ.L  #2,A7
   228H        4EB9 0000 0000           JSR     00000000H
   22EH        588F                     ADDQ.L  #4,A7
   230H        2D5F FFF2                MOVE.L  (A7)+,FFF2(A6)
   234H        4EFA 001E                JMP     [001EH] = 00000254H
   238H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   23CH        598F                     SUBQ.L  #4,A7
   23EH        3F2E FFFA                MOVE.W  FFFA(A6),-(A7)
   242H        6100 0000                BSR     [0000H] = 00000244H
   246H        548F                     ADDQ.L  #2,A7
   248H        4EB9 0000 0000           JSR     00000000H
   24EH        588F                     ADDQ.L  #4,A7
   250H        2D5F FFF2                MOVE.L  (A7)+,FFF2(A6)
   254H        4A2E FFC9                TST.B   FFC9(A6)
   258H        6712                     BEQ     [12H] = 0000026CH
   25AH        2A2E FFF2                MOVE.L  FFF2(A6),D5
   25EH        0845 001F                BCHG    #001FH,D5
   262H        286E 0012                MOVE.L  0012(A6),A4
   266H        2885                     MOVE.L  D5,(A4)
   268H        4EFA 000A                JMP     [000AH] = 00000274H
   26CH        286E 0012                MOVE.L  0012(A6),A4
   270H        28AE FFF2                MOVE.L  FFF2(A6),(A4)
   274H        4EFA 0008                JMP     [0008H] = 0000027EH
   278H        286E 0008                MOVE.L  0008(A6),A4
   27CH        4214                     CLR.B   (A4)
   27EH        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
   282H        4E5E                     UNLK    A6
   284H        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum = 11  checksum: o.k.

ref own quick call at    24H, procnum = 11  checksum: o.k.

ref own quick call at    38H, procnum = 11  checksum: o.k.

ref own quick call at    6EH, procnum = 11  checksum: o.k.

ref own quick call at    92H, procnum =  8  checksum: o.k.

ref util: at    AAH, procnum = 18  checksum: o.k.

ref util: at    B0H, procnum = 12  checksum: o.k.

ref own quick call at    C8H, procnum = 11  checksum: o.k.

ref own quick call at    D6H, procnum = 11  checksum: o.k.

ref own quick call at    F8H, procnum =  8  checksum: o.k.

ref util: at   110H, procnum = 18  checksum: o.k.

ref util: at   116H, procnum = 12  checksum: o.k.

ref own quick call at   12AH, procnum = 11  checksum: o.k.

ref own quick call at   150H, procnum = 11  checksum: o.k.

ref own quick call at   166H, procnum = 11  checksum: o.k.

ref own quick call at   17AH, procnum = 11  checksum: o.k.

ref own quick call at   19CH, procnum = 11  checksum: o.k.

ref own quick call at   1C8H, procnum = 11  checksum: o.k.

ref own quick call at   224H, procnum =  9  checksum: o.k.

ref util: at   22AH, procnum = 15  checksum: o.k.

ref own quick call at   244H, procnum =  9  checksum: o.k.

ref util: at   24AH, procnum = 14  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 112
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E 000A                MOVE.W  000A(A6),D5
     CH        0245 0007                ANDI.W  #0007H,D5
    10H        382E FFFE                MOVE.W  FFFE(A6),D4
    14H        D844                     ADD.W   D4,D4
    16H        49EE FFF4                LEA     FFF4(A6),A4
    1AH        3985 4000                MOVE.W  D5,00H(A4,D4.W)
    1EH        3A2E 000A                MOVE.W  000A(A6),D5
    22H        E64D                     LSR.W   #3,D5
    24H        3D45 000A                MOVE.W  D5,000A(A6)
    28H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    2CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    30H        BA6E 0008                CMP.W   0008(A6),D5
    34H        6702                     BEQ     [02H] = 00000038H
    36H        60D0                     BRA     [D0H] = 00000008H
    38H        536E FFFE                SUBQ.W  #1,FFFE(A6)
    3CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    40H        DA45                     ADD.W   D5,D5
    42H        49EE FFF4                LEA     FFF4(A6),A4
    46H        3834 5000                MOVE.W  00H(A4,D5.W),D4
    4AH        0644 0030                ADDI.W  #0030H,D4
    4EH        1F04                     MOVE.B  D4,-(A7)
    50H        286D FFFC                MOVE.L  FFFC(A5),A4
    54H        3F2C 0010                MOVE.W  0010(A4),-(A7)
    58H        286C 000C                MOVE.L  000C(A4),A4
    5CH        4854                     PEA     (A4)
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        508F                     ADDQ.L  #8,A7
    64H        4A6E FFFE                TST.W   FFFE(A6)
    68H        6702                     BEQ     [02H] = 0000006CH
    6AH        60CC                     BRA     [CCH] = 00000038H
    6CH        4E5E                     UNLK    A6
    6EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    60H, procnum = 10  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 236
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2D FFFC                MOVE.L  FFFC(A5),-(A7)
     8H        2B4E FFFC                MOVE.L  A6,FFFC(A5)
     CH        0C6E 000F 0010           CMPI.W  #000FH,0010(A6)
    12H        54C5                     SCC     D5
    14H        4405                     NEG.B   D5
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        1885                     MOVE.B  D5,(A4)
    1CH        286E 0008                MOVE.L  0008(A6),A4
    20H        4A14                     TST.B   (A4)
    22H        6702                     BEQ     [02H] = 00000026H
    24H        6004                     BRA     [04H] = 0000002AH
    26H        4EFA 00BC                JMP     [00BCH] = 000000E4H
    2AH        4279 0000 0034           CLR.W   00000034H
    30H        2F2E 0012                MOVE.L  0012(A6),-(A7)
    34H        4EB9 0000 0000           JSR     00000000H
    3AH        588F                     ADDQ.L  #4,A7
    3CH        6C24                     BGE     [24H] = 00000062H
    3EH        1F3C 002D                MOVE.B  #2DH,-(A7)
    42H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    46H        286E 000C                MOVE.L  000C(A6),A4
    4AH        4854                     PEA     (A4)
    4CH        6100 0000                BSR     [0000H] = 0000004EH
    50H        508F                     ADDQ.L  #8,A7
    52H        2A2E 0012                MOVE.L  0012(A6),D5
    56H        0885 001F                BCLR    #001FH,D5
    5AH        2D45 0012                MOVE.L  D5,0012(A6)
    5EH        4EFA 0016                JMP     [0016H] = 00000076H
    62H        1F3C 0020                MOVE.B  #20H,-(A7)
    66H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    6AH        286E 000C                MOVE.L  000C(A6),A4
    6EH        4854                     PEA     (A4)
    70H        6100 0000                BSR     [0000H] = 00000072H
    74H        508F                     ADDQ.L  #8,A7
    76H        2A2E 0012                MOVE.L  0012(A6),D5
    7AH        7810                     MOVEQ   #10H,D4
    7CH        E8AD                     LSR.L   D4,D5
    7EH        0245 007F                ANDI.W  #007FH,D5
    82H        DA45                     ADD.W   D5,D5
    84H        282E 0012                MOVE.L  0012(A6),D4
    88H        EE4C                     LSR.W   #7,D4
    8AH        E04C                     LSR.W   #8,D4
    8CH        DA44                     ADD.W   D4,D5
    8EH        3F05                     MOVE.W  D5,-(A7)
    90H        3F3C 0003                MOVE.W  #0003H,-(A7)
    94H        6100 0000                BSR     [0000H] = 00000096H
    98H        588F                     ADDQ.L  #4,A7
    9AH        2A2E 0012                MOVE.L  0012(A6),D5
    9EH        0245 7FFF                ANDI.W  #7FFFH,D5
    A2H        3F05                     MOVE.W  D5,-(A7)
    A4H        3F3C 0005                MOVE.W  #0005H,-(A7)
    A8H        6100 0000                BSR     [0000H] = 000000AAH
    ACH        588F                     ADDQ.L  #4,A7
    AEH        1F3C 0027                MOVE.B  #27H,-(A7)
    B2H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    B6H        286E 000C                MOVE.L  000C(A6),A4
    BAH        4854                     PEA     (A4)
    BCH        6100 0000                BSR     [0000H] = 000000BEH
    C0H        508F                     ADDQ.L  #8,A7
    C2H        2A2E 0012                MOVE.L  0012(A6),D5
    C6H        7817                     MOVEQ   #17H,D4
    C8H        E8AD                     LSR.L   D4,D5
    CAH        3F05                     MOVE.W  D5,-(A7)
    CCH        3F3C 0003                MOVE.W  #0003H,-(A7)
    D0H        6100 0000                BSR     [0000H] = 000000D2H
    D4H        588F                     ADDQ.L  #4,A7
    D6H        3A39 0000 0034           MOVE.W  00000034H,D5
    DCH        286E 000C                MOVE.L  000C(A6),A4
    E0H        4234 5000                CLR.B   00H(A4,D5.W)
    E4H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
    E8H        4E5E                     UNLK    A6
    EAH        4E75                     RTS
  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref util: at    36H, procnum = 17  checksum: o.k.

ref own quick call at    4EH, procnum = 10  checksum: o.k.

ref own quick call at    72H, procnum = 10  checksum: o.k.

ref own quick call at    96H, procnum = 12  checksum: o.k.

ref own quick call at    AAH, procnum = 12  checksum: o.k.

ref own quick call at    BEH, procnum = 10  checksum: o.k.

ref own quick call at    D2H, procnum = 12  checksum: o.k.

ref own data at    D8H  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 138
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        4878 0005                PEA     0005H
     8H        4EB9 0000 0000           JSR     00000000H
     EH        4878 03E8                PEA     03E8H
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        588F                     ADDQ.L  #4,A7
    20H        2A1F                     MOVE.L  (A7)+,D5
    22H        598F                     SUBQ.L  #4,A7
    24H        2F05                     MOVE.L  D5,-(A7)
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        49F9 0000 007E           LEA     0000007EH,A4
    32H        28DF                     MOVE.L  (A7)+,(A4)+
    34H        28DF                     MOVE.L  (A7)+,(A4)+
    36H        3D7C 0003 FFFE           MOVE.W  #0003H,FFFE(A6)
    3CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    40H        5345                     SUBQ.W  #1,D5
    42H        E745                     ASL.W   #3,D5
    44H        49F9 0000 006E           LEA     0000006EH,A4
    4AH        2F34 5004                MOVE.L  04H(A4,D5.W),-(A7)
    4EH        2F34 5000                MOVE.L  00H(A4,D5.W),-(A7)
    52H        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
    58H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
    5EH        4EB9 0000 0000           JSR     00000000H
    64H        508F                     ADDQ.L  #8,A7
    66H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    6AH        E745                     ASL.W   #3,D5
    6CH        49F9 0000 006E           LEA     0000006EH,A4
    72H        49F4 5000                LEA     00H(A4,D5.W),A4
    76H        28DF                     MOVE.L  (A7)+,(A4)+
    78H        28DF                     MOVE.L  (A7)+,(A4)+
    7AH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    7EH        0C6E 0011 FFFE           CMPI.W  #0011H,FFFE(A6)
    84H        66B6                     BNE     [B6H] = 0000003CH
    86H        4E5E                     UNLK    A6
    88H        4E75                     RTS
  checksum: o.k.

ref util: at     AH, procnum = 18  checksum: o.k.

ref util: at    14H, procnum = 18  checksum: o.k.

ref util: at    1AH, procnum = 15  checksum: o.k.

ref util: at    28H, procnum = 28  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref own data at    54H  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref util: at    60H, procnum = 23  checksum: o.k.

ref own data at    6EH  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 132
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        4878 0001                PEA     0001H
     CH        4EB9 0000 0000           JSR     00000000H
    12H        2A1F                     MOVE.L  (A7)+,D5
    14H        598F                     SUBQ.L  #4,A7
    16H        2F05                     MOVE.L  D5,-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        49EE FFF6                LEA     FFF6(A6),A4
    22H        28DF                     MOVE.L  (A7)+,(A4)+
    24H        28DF                     MOVE.L  (A7)+,(A4)+
    26H        4A6E 0008                TST.W   0008(A6)
    2AH        6348                     BLS     [48H] = 00000074H
    2CH        3A2E 0008                MOVE.W  0008(A6),D5
    30H        0205 0001                ANDI.B  #01H,D5
    34H        4A05                     TST.B   D5
    36H        672C                     BEQ     [2CH] = 00000064H
    38H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    3CH        E745                     ASL.W   #3,D5
    3EH        49F9 0000 0036           LEA     00000036H,A4
    44H        2F34 5004                MOVE.L  04H(A4,D5.W),-(A7)
    48H        2F34 5000                MOVE.L  00H(A4,D5.W),-(A7)
    4CH        2F2E FFFA                MOVE.L  FFFA(A6),-(A7)
    50H        2F2E FFF6                MOVE.L  FFF6(A6),-(A7)
    54H        4EB9 0000 0000           JSR     00000000H
    5AH        508F                     ADDQ.L  #8,A7
    5CH        49EE FFF6                LEA     FFF6(A6),A4
    60H        28DF                     MOVE.L  (A7)+,(A4)+
    62H        28DF                     MOVE.L  (A7)+,(A4)+
    64H        3A2E 0008                MOVE.W  0008(A6),D5
    68H        E24D                     LSR.W   #1,D5
    6AH        3D45 0008                MOVE.W  D5,0008(A6)
    6EH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    72H        60B2                     BRA     [B2H] = 00000026H
    74H        49EE FFF6                LEA     FFF6(A6),A4
    78H        47EE 000A                LEA     000A(A6),A3
    7CH        26DC                     MOVE.L  (A4)+,(A3)+
    7EH        26DC                     MOVE.L  (A4)+,(A3)+
    80H        4E5E                     UNLK    A6
    82H        4E75                     RTS
  checksum: o.k.

ref util: at     EH, procnum = 18  checksum: o.k.

ref util: at    1AH, procnum = 28  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref util: at    56H, procnum = 22  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 1274
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        3A2E 000C                MOVE.W  000C(A6),D5
     8H        BA6E 0012                CMP.W   0012(A6),D5
     CH        55C5                     SCS     D5
     EH        4405                     NEG.B   D5
    10H        286E 0008                MOVE.L  0008(A6),A4
    14H        1885                     MOVE.B  D5,(A4)
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        4A14                     TST.B   (A4)
    1CH        6702                     BEQ     [02H] = 00000020H
    1EH        6004                     BRA     [04H] = 00000024H
    20H        4EFA 04D4                JMP     [04D4H] = 000004F6H
    24H        4279 0000 0034           CLR.W   00000034H
    2AH        2F2E 0018                MOVE.L  0018(A6),-(A7)
    2EH        2F2E 0014                MOVE.L  0014(A6),-(A7)
    32H        2F39 0000 00FA           MOVE.L  000000FAH,-(A7)
    38H        2F39 0000 00F6           MOVE.L  000000F6H,-(A7)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 0010                LEA     0010(A7),A7
    48H        663A                     BNE     [3AH] = 00000084H
    4AH        1F3C 0020                MOVE.B  #20H,-(A7)
    4EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    52H        286E 000E                MOVE.L  000E(A6),A4
    56H        4854                     PEA     (A4)
    58H        6100 0000                BSR     [0000H] = 0000005AH
    5CH        508F                     ADDQ.L  #8,A7
    5EH        536E 000C                SUBQ.W  #1,000C(A6)
    62H        0C6E 0001 000C           CMPI.W  #0001H,000C(A6)
    68H        6302                     BLS     [02H] = 0000006CH
    6AH        60DE                     BRA     [DEH] = 0000004AH
    6CH        1F3C 0030                MOVE.B  #30H,-(A7)
    70H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    74H        286E 000E                MOVE.L  000E(A6),A4
    78H        4854                     PEA     (A4)
    7AH        6100 0000                BSR     [0000H] = 0000007CH
    7EH        508F                     ADDQ.L  #8,A7
    80H        4EFA 0466                JMP     [0466H] = 000004E8H
    84H        0C6E 000A 000C           CMPI.W  #000AH,000C(A6)
    8AH        620A                     BHI     [0AH] = 00000096H
    8CH        3D7C 0003 000C           MOVE.W  #0003H,000C(A6)
    92H        4EFA 0006                JMP     [0006H] = 0000009AH
    96H        5F6E 000C                SUBQ.W  #7,000C(A6)
    9AH        0C6E 000F 000C           CMPI.W  #000FH,000C(A6)
    A0H        631A                     BLS     [1AH] = 000000BCH
    A2H        1F3C 0020                MOVE.B  #20H,-(A7)
    A6H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    AAH        286E 000E                MOVE.L  000E(A6),A4
    AEH        4854                     PEA     (A4)
    B0H        6100 0000                BSR     [0000H] = 000000B2H
    B4H        508F                     ADDQ.L  #8,A7
    B6H        536E 000C                SUBQ.W  #1,000C(A6)
    BAH        60DE                     BRA     [DEH] = 0000009AH
    BCH        2F2E 0018                MOVE.L  0018(A6),-(A7)
    C0H        2F2E 0014                MOVE.L  0014(A6),-(A7)
    C4H        2F39 0000 00FA           MOVE.L  000000FAH,-(A7)
    CAH        2F39 0000 00F6           MOVE.L  000000F6H,-(A7)
    D0H        4EB9 0000 0000           JSR     00000000H
    D6H        4FEF 0010                LEA     0010(A7),A7
    DAH        6C2E                     BGE     [2EH] = 0000010AH
    DCH        1F3C 002D                MOVE.B  #2DH,-(A7)
    E0H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    E4H        286E 000E                MOVE.L  000E(A6),A4
    E8H        4854                     PEA     (A4)
    EAH        6100 0000                BSR     [0000H] = 000000ECH
    EEH        508F                     ADDQ.L  #8,A7
    F0H        2F2E 0018                MOVE.L  0018(A6),-(A7)
    F4H        2F2E 0014                MOVE.L  0014(A6),-(A7)
    F8H        0297 7FFF FFFF           ANDI.L  #7FFFFFFFH,(A7)
    FEH        49EE 0014                LEA     0014(A6),A4
   102H        28DF                     MOVE.L  (A7)+,(A4)+
   104H        28DF                     MOVE.L  (A7)+,(A4)+
   106H        4EFA 0016                JMP     [0016H] = 0000011EH
   10AH        1F3C 0020                MOVE.B  #20H,-(A7)
   10EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   112H        286E 000E                MOVE.L  000E(A6),A4
   116H        4854                     PEA     (A4)
   118H        6100 0000                BSR     [0000H] = 0000011AH
   11CH        508F                     ADDQ.L  #8,A7
   11EH        49EE 0014                LEA     0014(A6),A4
   122H        47EE FFF8                LEA     FFF8(A6),A3
   126H        26DC                     MOVE.L  (A4)+,(A3)+
   128H        26DC                     MOVE.L  (A4)+,(A3)+
   12AH        2A2E FFF8                MOVE.L  FFF8(A6),D5
   12EH        7814                     MOVEQ   #14H,D4
   130H        E8AD                     LSR.L   D4,D5
   132H        3D45 FFF4                MOVE.W  D5,FFF4(A6)
   136H        0C6E 03FF FFF4           CMPI.W  #03FFH,FFF4(A6)
   13CH        6302                     BLS     [02H] = 00000140H
   13EH        6004                     BRA     [04H] = 00000144H
   140H        4EFA 009A                JMP     [009AH] = 000001DCH
   144H        7A00                     MOVEQ   #00H,D5
   146H        3A2E FFF4                MOVE.W  FFF4(A6),D5
   14AH        0485 0000 03FF           SUBI.L  #000003FFH,D5
   150H        2F05                     MOVE.L  D5,-(A7)
   152H        4878 004D                PEA     004DH
   156H        4EB9 0000 0000           JSR     00000000H
   15CH        588F                     ADDQ.L  #4,A7
   15EH        2A1F                     MOVE.L  (A7)+,D5
   160H        E08D                     LSR.L   #8,D5
   162H        3D45 FFF4                MOVE.W  D5,FFF4(A6)
   166H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   16AH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   16EH        518F                     SUBQ.L  #8,A7
   170H        3F2E FFF4                MOVE.W  FFF4(A6),-(A7)
   174H        6100 0000                BSR     [0000H] = 00000176H
   178H        548F                     ADDQ.L  #2,A7
   17AH        4EB9 0000 0000           JSR     00000000H
   180H        508F                     ADDQ.L  #8,A7
   182H        49EE 0014                LEA     0014(A6),A4
   186H        28DF                     MOVE.L  (A7)+,(A4)+
   188H        28DF                     MOVE.L  (A7)+,(A4)+
   18AH        3D6E FFF4 FFF2           MOVE.W  FFF4(A6),FFF2(A6)
   190H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   194H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   198H        2F39 0000 0102           MOVE.L  00000102H,-(A7)
   19EH        2F39 0000 00FE           MOVE.L  000000FEH,-(A7)
   1A4H        4EB9 0000 0000           JSR     00000000H
   1AAH        4FEF 0010                LEA     0010(A7),A7
   1AEH        6D28                     BLT     [28H] = 000001D8H
   1B0H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   1B4H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   1B8H        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   1BEH        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   1C4H        4EB9 0000 0000           JSR     00000000H
   1CAH        508F                     ADDQ.L  #8,A7
   1CCH        49EE 0014                LEA     0014(A6),A4
   1D0H        28DF                     MOVE.L  (A7)+,(A4)+
   1D2H        28DF                     MOVE.L  (A7)+,(A4)+
   1D4H        526E FFF2                ADDQ.W  #1,FFF2(A6)
   1D8H        4EFA 00B0                JMP     [00B0H] = 0000028AH
   1DCH        7A00                     MOVEQ   #00H,D5
   1DEH        3A2E FFF4                MOVE.W  FFF4(A6),D5
   1E2H        283C 0000 03FF           MOVE.L  #000003FFH,D4
   1E8H        9885                     SUB.L   D5,D4
   1EAH        2F04                     MOVE.L  D4,-(A7)
   1ECH        4878 004D                PEA     004DH
   1F0H        4EB9 0000 0000           JSR     00000000H
   1F6H        588F                     ADDQ.L  #4,A7
   1F8H        2A1F                     MOVE.L  (A7)+,D5
   1FAH        E08D                     LSR.L   #8,D5
   1FCH        3D45 FFF4                MOVE.W  D5,FFF4(A6)
   200H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   204H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   208H        518F                     SUBQ.L  #8,A7
   20AH        3F2E FFF4                MOVE.W  FFF4(A6),-(A7)
   20EH        6100 0000                BSR     [0000H] = 00000210H
   212H        548F                     ADDQ.L  #2,A7
   214H        4EB9 0000 0000           JSR     00000000H
   21AH        508F                     ADDQ.L  #8,A7
   21CH        49EE 0014                LEA     0014(A6),A4
   220H        28DF                     MOVE.L  (A7)+,(A4)+
   222H        28DF                     MOVE.L  (A7)+,(A4)+
   224H        3A2E FFF4                MOVE.W  FFF4(A6),D5
   228H        4445                     NEG.W   D5
   22AH        3D45 FFF2                MOVE.W  D5,FFF2(A6)
   22EH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   232H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   236H        2F39 0000 0102           MOVE.L  00000102H,-(A7)
   23CH        2F39 0000 00FE           MOVE.L  000000FEH,-(A7)
   242H        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   248H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   24EH        4EB9 0000 0000           JSR     00000000H
   254H        508F                     ADDQ.L  #8,A7
   256H        4EB9 0000 0000           JSR     00000000H
   25CH        4FEF 0010                LEA     0010(A7),A7
   260H        6C28                     BGE     [28H] = 0000028AH
   262H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   266H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   26AH        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   270H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   276H        4EB9 0000 0000           JSR     00000000H
   27CH        508F                     ADDQ.L  #8,A7
   27EH        49EE 0014                LEA     0014(A6),A4
   282H        28DF                     MOVE.L  (A7)+,(A4)+
   284H        28DF                     MOVE.L  (A7)+,(A4)+
   286H        536E FFF2                SUBQ.W  #1,FFF2(A6)
   28AH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   28EH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   292H        3A2E 000C                MOVE.W  000C(A6),D5
   296H        E745                     ASL.W   #3,D5
   298H        49F9 0000 006E           LEA     0000006EH,A4
   29EH        2F34 5004                MOVE.L  04H(A4,D5.W),-(A7)
   2A2H        2F34 5000                MOVE.L  00H(A4,D5.W),-(A7)
   2A6H        4EB9 0000 0000           JSR     00000000H
   2ACH        508F                     ADDQ.L  #8,A7
   2AEH        49EE 0014                LEA     0014(A6),A4
   2B2H        28DF                     MOVE.L  (A7)+,(A4)+
   2B4H        28DF                     MOVE.L  (A7)+,(A4)+
   2B6H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   2BAH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   2BEH        2F39 0000 0102           MOVE.L  00000102H,-(A7)
   2C4H        2F39 0000 00FE           MOVE.L  000000FEH,-(A7)
   2CAH        4EB9 0000 0000           JSR     00000000H
   2D0H        4FEF 0010                LEA     0010(A7),A7
   2D4H        6D28                     BLT     [28H] = 000002FEH
   2D6H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   2DAH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   2DEH        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   2E4H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   2EAH        4EB9 0000 0000           JSR     00000000H
   2F0H        508F                     ADDQ.L  #8,A7
   2F2H        49EE 0014                LEA     0014(A6),A4
   2F6H        28DF                     MOVE.L  (A7)+,(A4)+
   2F8H        28DF                     MOVE.L  (A7)+,(A4)+
   2FAH        526E FFF2                ADDQ.W  #1,FFF2(A6)
   2FEH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   302H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   306H        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   30CH        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   312H        4EB9 0000 0000           JSR     00000000H
   318H        508F                     ADDQ.L  #8,A7
   31AH        49EE 0014                LEA     0014(A6),A4
   31EH        28DF                     MOVE.L  (A7)+,(A4)+
   320H        28DF                     MOVE.L  (A7)+,(A4)+
   322H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   326H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   32AH        4EB9 0000 0000           JSR     00000000H
   330H        588F                     ADDQ.L  #4,A7
   332H        2A1F                     MOVE.L  (A7)+,D5
   334H        0645 0030                ADDI.W  #0030H,D5
   338H        1F05                     MOVE.B  D5,-(A7)
   33AH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   33EH        286E 000E                MOVE.L  000E(A6),A4
   342H        4854                     PEA     (A4)
   344H        6100 0000                BSR     [0000H] = 00000346H
   348H        508F                     ADDQ.L  #8,A7
   34AH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   34EH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   352H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   356H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   35AH        4EB9 0000 0000           JSR     00000000H
   360H        588F                     ADDQ.L  #4,A7
   362H        2A1F                     MOVE.L  (A7)+,D5
   364H        598F                     SUBQ.L  #4,A7
   366H        2F05                     MOVE.L  D5,-(A7)
   368H        4EB9 0000 0000           JSR     00000000H
   36EH        4EB9 0000 0000           JSR     00000000H
   374H        508F                     ADDQ.L  #8,A7
   376H        49EE 0014                LEA     0014(A6),A4
   37AH        28DF                     MOVE.L  (A7)+,(A4)+
   37CH        28DF                     MOVE.L  (A7)+,(A4)+
   37EH        1F3C 002E                MOVE.B  #2EH,-(A7)
   382H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   386H        286E 000E                MOVE.L  000E(A6),A4
   38AH        4854                     PEA     (A4)
   38CH        6100 0000                BSR     [0000H] = 0000038EH
   390H        508F                     ADDQ.L  #8,A7
   392H        536E 000C                SUBQ.W  #1,000C(A6)
   396H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   39AH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   39EH        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   3A4H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   3AAH        4EB9 0000 0000           JSR     00000000H
   3B0H        508F                     ADDQ.L  #8,A7
   3B2H        49EE 0014                LEA     0014(A6),A4
   3B6H        28DF                     MOVE.L  (A7)+,(A4)+
   3B8H        28DF                     MOVE.L  (A7)+,(A4)+
   3BAH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   3BEH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   3C2H        4EB9 0000 0000           JSR     00000000H
   3C8H        588F                     ADDQ.L  #4,A7
   3CAH        2A1F                     MOVE.L  (A7)+,D5
   3CCH        0645 0030                ADDI.W  #0030H,D5
   3D0H        1F05                     MOVE.B  D5,-(A7)
   3D2H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   3D6H        286E 000E                MOVE.L  000E(A6),A4
   3DAH        4854                     PEA     (A4)
   3DCH        6100 0000                BSR     [0000H] = 000003DEH
   3E0H        508F                     ADDQ.L  #8,A7
   3E2H        2F2E 0018                MOVE.L  0018(A6),-(A7)
   3E6H        2F2E 0014                MOVE.L  0014(A6),-(A7)
   3EAH        2F2E 0018                MOVE.L  0018(A6),-(A7)
   3EEH        2F2E 0014                MOVE.L  0014(A6),-(A7)
   3F2H        4EB9 0000 0000           JSR     00000000H
   3F8H        588F                     ADDQ.L  #4,A7
   3FAH        2A1F                     MOVE.L  (A7)+,D5
   3FCH        598F                     SUBQ.L  #4,A7
   3FEH        2F05                     MOVE.L  D5,-(A7)
   400H        4EB9 0000 0000           JSR     00000000H
   406H        4EB9 0000 0000           JSR     00000000H
   40CH        508F                     ADDQ.L  #8,A7
   40EH        49EE 0014                LEA     0014(A6),A4
   412H        28DF                     MOVE.L  (A7)+,(A4)+
   414H        28DF                     MOVE.L  (A7)+,(A4)+
   416H        536E 000C                SUBQ.W  #1,000C(A6)
   41AH        4A6E 000C                TST.W   000C(A6)
   41EH        6704                     BEQ     [04H] = 00000424H
   420H        6000 FF74                BRA     [FF74H] = 00000396H
   424H        1F3C 0045                MOVE.B  #45H,-(A7)
   428H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   42CH        286E 000E                MOVE.L  000E(A6),A4
   430H        4854                     PEA     (A4)
   432H        6100 0000                BSR     [0000H] = 00000434H
   436H        508F                     ADDQ.L  #8,A7
   438H        536E FFF2                SUBQ.W  #1,FFF2(A6)
   43CH        4A6E FFF2                TST.W   FFF2(A6)
   440H        6C22                     BGE     [22H] = 00000464H
   442H        1F3C 002D                MOVE.B  #2DH,-(A7)
   446H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   44AH        286E 000E                MOVE.L  000E(A6),A4
   44EH        4854                     PEA     (A4)
   450H        6100 0000                BSR     [0000H] = 00000452H
   454H        508F                     ADDQ.L  #8,A7
   456H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   45AH        4445                     NEG.W   D5
   45CH        3D45 FFF2                MOVE.W  D5,FFF2(A6)
   460H        4EFA 0016                JMP     [0016H] = 00000478H
   464H        1F3C 002B                MOVE.B  #2BH,-(A7)
   468H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   46CH        286E 000E                MOVE.L  000E(A6),A4
   470H        4854                     PEA     (A4)
   472H        6100 0000                BSR     [0000H] = 00000474H
   476H        508F                     ADDQ.L  #8,A7
   478H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   47CH        48C5                     EXT.L   D5
   47EH        8BFC 0064                DIVS    #0064H,D5
   482H        0645 0030                ADDI.W  #0030H,D5
   486H        48C5                     EXT.L   D5
   488H        1F05                     MOVE.B  D5,-(A7)
   48AH        3F2E 0012                MOVE.W  0012(A6),-(A7)
   48EH        286E 000E                MOVE.L  000E(A6),A4
   492H        4854                     PEA     (A4)
   494H        6100 0000                BSR     [0000H] = 00000496H
   498H        508F                     ADDQ.L  #8,A7
   49AH        3A2E FFF2                MOVE.W  FFF2(A6),D5
   49EH        48C5                     EXT.L   D5
   4A0H        8BFC 0064                DIVS    #0064H,D5
   4A4H        4845                     SWAP    D5
   4A6H        48C5                     EXT.L   D5
   4A8H        8BFC 000A                DIVS    #000AH,D5
   4ACH        0645 0030                ADDI.W  #0030H,D5
   4B0H        48C5                     EXT.L   D5
   4B2H        1F05                     MOVE.B  D5,-(A7)
   4B4H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   4B8H        286E 000E                MOVE.L  000E(A6),A4
   4BCH        4854                     PEA     (A4)
   4BEH        6100 0000                BSR     [0000H] = 000004C0H
   4C2H        508F                     ADDQ.L  #8,A7
   4C4H        3A2E FFF2                MOVE.W  FFF2(A6),D5
   4C8H        48C5                     EXT.L   D5
   4CAH        8BFC 000A                DIVS    #000AH,D5
   4CEH        4845                     SWAP    D5
   4D0H        0645 0030                ADDI.W  #0030H,D5
   4D4H        48C5                     EXT.L   D5
   4D6H        1F05                     MOVE.B  D5,-(A7)
   4D8H        3F2E 0012                MOVE.W  0012(A6),-(A7)
   4DCH        286E 000E                MOVE.L  000E(A6),A4
   4E0H        4854                     PEA     (A4)
   4E2H        6100 0000                BSR     [0000H] = 000004E4H
   4E6H        508F                     ADDQ.L  #8,A7
   4E8H        3A39 0000 0034           MOVE.W  00000034H,D5
   4EEH        286E 000E                MOVE.L  000E(A6),A4
   4F2H        4234 5000                CLR.B   00H(A4,D5.W)
   4F6H        4E5E                     UNLK    A6
   4F8H        4E75                     RTS
  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref own data at    3AH  checksum: o.k.

ref util: at    40H, procnum = 24  checksum: o.k.

ref own quick call at    5AH, procnum = 10  checksum: o.k.

ref own quick call at    7CH, procnum = 10  checksum: o.k.

ref own quick call at    B2H, procnum = 10  checksum: o.k.

ref own data at    C6H  checksum: o.k.

ref own data at    CCH  checksum: o.k.

ref util: at    D2H, procnum = 24  checksum: o.k.

ref own quick call at    ECH, procnum = 10  checksum: o.k.

ref own quick call at   11AH, procnum = 10  checksum: o.k.

ref util: at   158H, procnum =  8  checksum: o.k.

ref own quick call at   176H, procnum = 14  checksum: o.k.

ref util: at   17CH, procnum = 23  checksum: o.k.

ref own data at   19AH  checksum: o.k.

ref own data at   1A0H  checksum: o.k.

ref util: at   1A6H, procnum = 24  checksum: o.k.

ref own data at   1BAH  checksum: o.k.

ref own data at   1C0H  checksum: o.k.

ref util: at   1C6H, procnum = 23  checksum: o.k.

ref util: at   1F2H, procnum =  8  checksum: o.k.

ref own quick call at   210H, procnum = 14  checksum: o.k.

ref util: at   216H, procnum = 22  checksum: o.k.

ref own data at   238H  checksum: o.k.

ref own data at   23EH  checksum: o.k.

ref own data at   244H  checksum: o.k.

ref own data at   24AH  checksum: o.k.

ref util: at   250H, procnum = 23  checksum: o.k.

ref util: at   258H, procnum = 24  checksum: o.k.

ref own data at   26CH  checksum: o.k.

ref own data at   272H  checksum: o.k.

ref util: at   278H, procnum = 22  checksum: o.k.

ref own data at   29AH  checksum: o.k.

ref util: at   2A8H, procnum = 20  checksum: o.k.

ref own data at   2C0H  checksum: o.k.

ref own data at   2C6H  checksum: o.k.

ref util: at   2CCH, procnum = 24  checksum: o.k.

ref own data at   2E0H  checksum: o.k.

ref own data at   2E6H  checksum: o.k.

ref util: at   2ECH, procnum = 23  checksum: o.k.

ref own data at   308H  checksum: o.k.

ref own data at   30EH  checksum: o.k.

ref util: at   314H, procnum = 22  checksum: o.k.

ref util: at   32CH, procnum = 27  checksum: o.k.

ref own quick call at   346H, procnum = 10  checksum: o.k.

ref util: at   35CH, procnum = 27  checksum: o.k.

ref util: at   36AH, procnum = 26  checksum: o.k.

ref util: at   370H, procnum = 21  checksum: o.k.

ref own quick call at   38EH, procnum = 10  checksum: o.k.

ref own data at   3A0H  checksum: o.k.

ref own data at   3A6H  checksum: o.k.

ref util: at   3ACH, procnum = 22  checksum: o.k.

ref util: at   3C4H, procnum = 27  checksum: o.k.

ref own quick call at   3DEH, procnum = 10  checksum: o.k.

ref util: at   3F4H, procnum = 27  checksum: o.k.

ref util: at   402H, procnum = 26  checksum: o.k.

ref util: at   408H, procnum = 21  checksum: o.k.

ref own quick call at   434H, procnum = 10  checksum: o.k.

ref own quick call at   452H, procnum = 10  checksum: o.k.

ref own quick call at   474H, procnum = 10  checksum: o.k.

ref own quick call at   496H, procnum = 10  checksum: o.k.

ref own quick call at   4C0H, procnum = 10  checksum: o.k.

ref own quick call at   4E4H, procnum = 10  checksum: o.k.

ref own data at   4EAH  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 72
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286D FFFC                MOVE.L  FFFC(A5),A4
     8H        266D FFFC                MOVE.L  FFFC(A5),A3
     CH        3A2C FFF8                MOVE.W  FFF8(A4),D5
    10H        BA6B 0010                CMP.W   0010(A3),D5
    14H        630C                     BLS     [0CH] = 00000022H
    16H        286D FFFC                MOVE.L  FFFC(A5),A4
    1AH        422C FFFF                CLR.B   FFFF(A4)
    1EH        4EFA 0024                JMP     [0024H] = 00000044H
    22H        286D FFFC                MOVE.L  FFFC(A5),A4
    26H        266D FFFC                MOVE.L  FFFC(A5),A3
    2AH        3A2B FFF8                MOVE.W  FFF8(A3),D5
    2EH        286C 000C                MOVE.L  000C(A4),A4
    32H        266D FFFC                MOVE.L  FFFC(A5),A3
    36H        1774 5000 FFFF           MOVE.B  00H(A4,D5.W),FFFF(A3)
    3CH        286D FFFC                MOVE.L  FFFC(A5),A4
    40H        526C FFF8                ADDQ.W  #1,FFF8(A4)
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 736
 DECODE --------                        INSTRUCTION
     0H        4E56 FFC4                LINK    A6,#FFC4H
     4H        2F2D FFFC                MOVE.L  FFFC(A5),-(A7)
     8H        2B4E FFFC                MOVE.L  A6,FFFC(A5)
     CH        426E FFF8                CLR.W   FFF8(A6)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
    1AH        660E                     BNE     [0EH] = 0000002AH
    1CH        1D7C 0001 FFC5           MOVE.B  #01H,FFC5(A6)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4EFA 0012                JMP     [0012H] = 0000003AH
    2AH        422E FFC5                CLR.B   FFC5(A6)
    2EH        0C2E 002B FFFF           CMPI.B  #2BH,FFFF(A6)
    34H        6604                     BNE     [04H] = 0000003AH
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        4214                     CLR.B   (A4)
    40H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    46H        6510                     BCS     [10H] = 00000058H
    48H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    4EH        6314                     BLS     [14H] = 00000064H
    50H        0C2E 002E FFFF           CMPI.B  #2EH,FFFF(A6)
    56H        670C                     BEQ     [0CH] = 00000064H
    58H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
    60H        4EFA 0276                JMP     [0276H] = 000002D8H
    64H        426E FFFA                CLR.W   FFFA(A6)
    68H        426E FFF6                CLR.W   FFF6(A6)
    6CH        49F9 0000 00F6           LEA     000000F6H,A4
    72H        47EE FFEE                LEA     FFEE(A6),A3
    76H        26DC                     MOVE.L  (A4)+,(A3)+
    78H        26DC                     MOVE.L  (A4)+,(A3)+
    7AH        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    80H        6606                     BNE     [06H] = 00000088H
    82H        6100 0000                BSR     [0000H] = 00000084H
    86H        60F2                     BRA     [F2H] = 0000007AH
    88H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
    8EH        6568                     BCS     [68H] = 000000F8H
    90H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
    96H        6260                     BHI     [60H] = 000000F8H
    98H        0C6E 000F FFF6           CMPI.W  #000FH,FFF6(A6)
    9EH        644E                     BCC     [4EH] = 000000EEH
    A0H        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
    A6H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
    ACH        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    B0H        2F2E FFEE                MOVE.L  FFEE(A6),-(A7)
    B4H        4EB9 0000 0000           JSR     00000000H
    BAH        508F                     ADDQ.L  #8,A7
    BCH        7A00                     MOVEQ   #00H,D5
    BEH        1A2E FFFF                MOVE.B  FFFF(A6),D5
    C2H        0445 0030                SUBI.W  #0030H,D5
    C6H        598F                     SUBQ.L  #4,A7
    C8H        4845                     SWAP    D5
    CAH        4245                     CLR.W   D5
    CCH        4845                     SWAP    D5
    CEH        2F05                     MOVE.L  D5,-(A7)
    D0H        4EB9 0000 0000           JSR     00000000H
    D6H        4EB9 0000 0000           JSR     00000000H
    DCH        508F                     ADDQ.L  #8,A7
    DEH        49EE FFEE                LEA     FFEE(A6),A4
    E2H        28DF                     MOVE.L  (A7)+,(A4)+
    E4H        28DF                     MOVE.L  (A7)+,(A4)+
    E6H        526E FFF6                ADDQ.W  #1,FFF6(A6)
    EAH        4EFA 0006                JMP     [0006H] = 000000F2H
    EEH        526E FFFA                ADDQ.W  #1,FFFA(A6)
    F2H        6100 0000                BSR     [0000H] = 000000F4H
    F6H        6090                     BRA     [90H] = 00000088H
    F8H        0C2E 002E FFFF           CMPI.B  #2EH,FFFF(A6)
    FEH        6670                     BNE     [70H] = 00000170H
   100H        6100 0000                BSR     [0000H] = 00000102H
   104H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   10AH        6564                     BCS     [64H] = 00000170H
   10CH        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
   112H        625C                     BHI     [5CH] = 00000170H
   114H        0C6E 000F FFF6           CMPI.W  #000FH,FFF6(A6)
   11AH        644E                     BCC     [4EH] = 0000016AH
   11CH        2F39 0000 010A           MOVE.L  0000010AH,-(A7)
   122H        2F39 0000 0106           MOVE.L  00000106H,-(A7)
   128H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   12CH        2F2E FFEE                MOVE.L  FFEE(A6),-(A7)
   130H        4EB9 0000 0000           JSR     00000000H
   136H        508F                     ADDQ.L  #8,A7
   138H        7A00                     MOVEQ   #00H,D5
   13AH        1A2E FFFF                MOVE.B  FFFF(A6),D5
   13EH        0445 0030                SUBI.W  #0030H,D5
   142H        598F                     SUBQ.L  #4,A7
   144H        4845                     SWAP    D5
   146H        4245                     CLR.W   D5
   148H        4845                     SWAP    D5
   14AH        2F05                     MOVE.L  D5,-(A7)
   14CH        4EB9 0000 0000           JSR     00000000H
   152H        4EB9 0000 0000           JSR     00000000H
   158H        508F                     ADDQ.L  #8,A7
   15AH        49EE FFEE                LEA     FFEE(A6),A4
   15EH        28DF                     MOVE.L  (A7)+,(A4)+
   160H        28DF                     MOVE.L  (A7)+,(A4)+
   162H        526E FFF6                ADDQ.W  #1,FFF6(A6)
   166H        536E FFFA                SUBQ.W  #1,FFFA(A6)
   16AH        6100 0000                BSR     [0000H] = 0000016CH
   16EH        6094                     BRA     [94H] = 00000104H
   170H        1A2E FFFF                MOVE.B  FFFF(A6),D5
   174H        0C05 0061                CMPI.B  #61H,D5
   178H        650A                     BCS     [0AH] = 00000184H
   17AH        0C05 007A                CMPI.B  #7AH,D5
   17EH        6204                     BHI     [04H] = 00000184H
   180H        0205 005F                ANDI.B  #5FH,D5
   184H        0C05 0045                CMPI.B  #45H,D5
   188H        6602                     BNE     [02H] = 0000018CH
   18AH        6004                     BRA     [04H] = 00000190H
   18CH        4EFA 00AC                JMP     [00ACH] = 0000023AH
   190H        6100 0000                BSR     [0000H] = 00000192H
   194H        426E FFFC                CLR.W   FFFC(A6)
   198H        0C2E 002D FFFF           CMPI.B  #2DH,FFFF(A6)
   19EH        660E                     BNE     [0EH] = 000001AEH
   1A0H        1D7C 0001 FFC4           MOVE.B  #01H,FFC4(A6)
   1A6H        6100 0000                BSR     [0000H] = 000001A8H
   1AAH        4EFA 0012                JMP     [0012H] = 000001BEH
   1AEH        422E FFC4                CLR.B   FFC4(A6)
   1B2H        0C2E 002B FFFF           CMPI.B  #2BH,FFFF(A6)
   1B8H        6604                     BNE     [04H] = 000001BEH
   1BAH        6100 0000                BSR     [0000H] = 000001BCH
   1BEH        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   1C4H        654C                     BCS     [4CH] = 00000212H
   1C6H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
   1CCH        6244                     BHI     [44H] = 00000212H
   1CEH        7A00                     MOVEQ   #00H,D5
   1D0H        1A2E FFFF                MOVE.B  FFFF(A6),D5
   1D4H        0445 0030                SUBI.W  #0030H,D5
   1D8H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   1DCH        6100 0000                BSR     [0000H] = 000001DEH
   1E0H        0C2E 0030 FFFF           CMPI.B  #30H,FFFF(A6)
   1E6H        6526                     BCS     [26H] = 0000020EH
   1E8H        0C2E 0039 FFFF           CMPI.B  #39H,FFFF(A6)
   1EEH        621E                     BHI     [1EH] = 0000020EH
   1F0H        3A2E FFFC                MOVE.W  FFFC(A6),D5
   1F4H        CBFC 000A                MULS    #000AH,D5
   1F8H        7800                     MOVEQ   #00H,D4
   1FAH        182E FFFF                MOVE.B  FFFF(A6),D4
   1FEH        DA44                     ADD.W   D4,D5
   200H        0445 0030                SUBI.W  #0030H,D5
   204H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   208H        6100 0000                BSR     [0000H] = 0000020AH
   20CH        60D2                     BRA     [D2H] = 000001E0H
   20EH        4EFA 0010                JMP     [0010H] = 00000220H
   212H        286E 0008                MOVE.L  0008(A6),A4
   216H        4214                     CLR.B   (A4)
   218H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
   21CH        4E5E                     UNLK    A6
   21EH        4E75                     RTS
   220H        4A2E FFC4                TST.B   FFC4(A6)
   224H        670C                     BEQ     [0CH] = 00000232H
   226H        3A2E FFFC                MOVE.W  FFFC(A6),D5
   22AH        9B6E FFFA                SUB.W   D5,FFFA(A6)
   22EH        4EFA 000A                JMP     [000AH] = 0000023AH
   232H        3A2E FFFC                MOVE.W  FFFC(A6),D5
   236H        DB6E FFFA                ADD.W   D5,FFFA(A6)
   23AH        4A2E FFFF                TST.B   FFFF(A6)
   23EH        57C5                     SEQ     D5
   240H        4405                     NEG.B   D5
   242H        286E 0008                MOVE.L  0008(A6),A4
   246H        1885                     MOVE.B  D5,(A4)
   248H        286E 0008                MOVE.L  0008(A6),A4
   24CH        4A14                     TST.B   (A4)
   24EH        6702                     BEQ     [02H] = 00000252H
   250H        6004                     BRA     [04H] = 00000256H
   252H        4EFA 0084                JMP     [0084H] = 000002D8H
   256H        4A6E FFFA                TST.W   FFFA(A6)
   25AH        6C2C                     BGE     [2CH] = 00000288H
   25CH        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   260H        2F2E FFEE                MOVE.L  FFEE(A6),-(A7)
   264H        518F                     SUBQ.L  #8,A7
   266H        3A2E FFFA                MOVE.W  FFFA(A6),D5
   26AH        4445                     NEG.W   D5
   26CH        3F05                     MOVE.W  D5,-(A7)
   26EH        6100 0000                BSR     [0000H] = 00000270H
   272H        548F                     ADDQ.L  #2,A7
   274H        4EB9 0000 0000           JSR     00000000H
   27AH        508F                     ADDQ.L  #8,A7
   27CH        49EE FFEE                LEA     FFEE(A6),A4
   280H        28DF                     MOVE.L  (A7)+,(A4)+
   282H        28DF                     MOVE.L  (A7)+,(A4)+
   284H        4EFA 0026                JMP     [0026H] = 000002ACH
   288H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   28CH        2F2E FFEE                MOVE.L  FFEE(A6),-(A7)
   290H        518F                     SUBQ.L  #8,A7
   292H        3F2E FFFA                MOVE.W  FFFA(A6),-(A7)
   296H        6100 0000                BSR     [0000H] = 00000298H
   29AH        548F                     ADDQ.L  #2,A7
   29CH        4EB9 0000 0000           JSR     00000000H
   2A2H        508F                     ADDQ.L  #8,A7
   2A4H        49EE FFEE                LEA     FFEE(A6),A4
   2A8H        28DF                     MOVE.L  (A7)+,(A4)+
   2AAH        28DF                     MOVE.L  (A7)+,(A4)+
   2ACH        4A2E FFC5                TST.B   FFC5(A6)
   2B0H        671A                     BEQ     [1AH] = 000002CCH
   2B2H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
   2B6H        2F2E FFEE                MOVE.L  FFEE(A6),-(A7)
   2BAH        0A97 8000 0000           EORI.L  #80000000H,(A7)
   2C0H        286E 0012                MOVE.L  0012(A6),A4
   2C4H        28DF                     MOVE.L  (A7)+,(A4)+
   2C6H        28DF                     MOVE.L  (A7)+,(A4)+
   2C8H        4EFA 000E                JMP     [000EH] = 000002D8H
   2CCH        49EE FFEE                LEA     FFEE(A6),A4
   2D0H        266E 0012                MOVE.L  0012(A6),A3
   2D4H        26DC                     MOVE.L  (A4)+,(A3)+
   2D6H        26DC                     MOVE.L  (A4)+,(A3)+
   2D8H        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
   2DCH        4E5E                     UNLK    A6
   2DEH        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum = 15  checksum: o.k.

ref own quick call at    24H, procnum = 15  checksum: o.k.

ref own quick call at    38H, procnum = 15  checksum: o.k.

ref own data at    6EH  checksum: o.k.

ref own quick call at    84H, procnum = 15  checksum: o.k.

ref own data at    A2H  checksum: o.k.

ref own data at    A8H  checksum: o.k.

ref util: at    B6H, procnum = 22  checksum: o.k.

ref util: at    D2H, procnum = 26  checksum: o.k.

ref util: at    D8H, procnum = 20  checksum: o.k.

ref own quick call at    F4H, procnum = 15  checksum: o.k.

ref own quick call at   102H, procnum = 15  checksum: o.k.

ref own data at   11EH  checksum: o.k.

ref own data at   124H  checksum: o.k.

ref util: at   132H, procnum = 22  checksum: o.k.

ref util: at   14EH, procnum = 26  checksum: o.k.

ref util: at   154H, procnum = 20  checksum: o.k.

ref own quick call at   16CH, procnum = 15  checksum: o.k.

ref own quick call at   192H, procnum = 15  checksum: o.k.

ref own quick call at   1A8H, procnum = 15  checksum: o.k.

ref own quick call at   1BCH, procnum = 15  checksum: o.k.

ref own quick call at   1DEH, procnum = 15  checksum: o.k.

ref own quick call at   20AH, procnum = 15  checksum: o.k.

ref own quick call at   270H, procnum = 14  checksum: o.k.

ref util: at   276H, procnum = 23  checksum: o.k.

ref own quick call at   298H, procnum = 14  checksum: o.k.

ref util: at   29EH, procnum = 22  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 530
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        598F                     SUBQ.L  #4,A7
     CH        42A7                     CLR.L   -(A7)
     EH        4EB9 0000 0000           JSR     00000000H
    14H        49F9 0000 00F6           LEA     000000F6H,A4
    1AH        28DF                     MOVE.L  (A7)+,(A4)+
    1CH        28DF                     MOVE.L  (A7)+,(A4)+
    1EH        598F                     SUBQ.L  #4,A7
    20H        4878 0001                PEA     0001H
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        49F9 0000 00FE           LEA     000000FEH,A4
    30H        28DF                     MOVE.L  (A7)+,(A4)+
    32H        28DF                     MOVE.L  (A7)+,(A4)+
    34H        598F                     SUBQ.L  #4,A7
    36H        4878 000A                PEA     000AH
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        49F9 0000 0106           LEA     00000106H,A4
    46H        28DF                     MOVE.L  (A7)+,(A4)+
    48H        28DF                     MOVE.L  (A7)+,(A4)+
    4AH        6100 0000                BSR     [0000H] = 0000004CH
    4EH        598F                     SUBQ.L  #4,A7
    50H        4878 000A                PEA     000AH
    54H        4EB9 0000 0000           JSR     00000000H
    5AH        49F9 0000 0036           LEA     00000036H,A4
    60H        28DF                     MOVE.L  (A7)+,(A4)+
    62H        28DF                     MOVE.L  (A7)+,(A4)+
    64H        598F                     SUBQ.L  #4,A7
    66H        4878 0064                PEA     0064H
    6AH        4EB9 0000 0000           JSR     00000000H
    70H        49F9 0000 003E           LEA     0000003EH,A4
    76H        28DF                     MOVE.L  (A7)+,(A4)+
    78H        28DF                     MOVE.L  (A7)+,(A4)+
    7AH        598F                     SUBQ.L  #4,A7
    7CH        4878 2710                PEA     2710H
    80H        4EB9 0000 0000           JSR     00000000H
    86H        49F9 0000 0046           LEA     00000046H,A4
    8CH        28DF                     MOVE.L  (A7)+,(A4)+
    8EH        28DF                     MOVE.L  (A7)+,(A4)+
    90H        2F39 0000 004A           MOVE.L  0000004AH,-(A7)
    96H        2F39 0000 0046           MOVE.L  00000046H,-(A7)
    9CH        2F39 0000 004A           MOVE.L  0000004AH,-(A7)
    A2H        2F39 0000 0046           MOVE.L  00000046H,-(A7)
    A8H        4EB9 0000 0000           JSR     00000000H
    AEH        508F                     ADDQ.L  #8,A7
    B0H        49F9 0000 004E           LEA     0000004EH,A4
    B6H        28DF                     MOVE.L  (A7)+,(A4)+
    B8H        28DF                     MOVE.L  (A7)+,(A4)+
    BAH        2F39 0000 0052           MOVE.L  00000052H,-(A7)
    C0H        2F39 0000 004E           MOVE.L  0000004EH,-(A7)
    C6H        2F39 0000 0052           MOVE.L  00000052H,-(A7)
    CCH        2F39 0000 004E           MOVE.L  0000004EH,-(A7)
    D2H        4EB9 0000 0000           JSR     00000000H
    D8H        508F                     ADDQ.L  #8,A7
    DAH        49F9 0000 0056           LEA     00000056H,A4
    E0H        28DF                     MOVE.L  (A7)+,(A4)+
    E2H        28DF                     MOVE.L  (A7)+,(A4)+
    E4H        2F39 0000 005A           MOVE.L  0000005AH,-(A7)
    EAH        2F39 0000 0056           MOVE.L  00000056H,-(A7)
    F0H        2F39 0000 005A           MOVE.L  0000005AH,-(A7)
    F6H        2F39 0000 0056           MOVE.L  00000056H,-(A7)
    FCH        4EB9 0000 0000           JSR     00000000H
   102H        508F                     ADDQ.L  #8,A7
   104H        49F9 0000 005E           LEA     0000005EH,A4
   10AH        28DF                     MOVE.L  (A7)+,(A4)+
   10CH        28DF                     MOVE.L  (A7)+,(A4)+
   10EH        2F39 0000 0062           MOVE.L  00000062H,-(A7)
   114H        2F39 0000 005E           MOVE.L  0000005EH,-(A7)
   11AH        2F39 0000 0062           MOVE.L  00000062H,-(A7)
   120H        2F39 0000 005E           MOVE.L  0000005EH,-(A7)
   126H        4EB9 0000 0000           JSR     00000000H
   12CH        508F                     ADDQ.L  #8,A7
   12EH        49F9 0000 0066           LEA     00000066H,A4
   134H        28DF                     MOVE.L  (A7)+,(A4)+
   136H        28DF                     MOVE.L  (A7)+,(A4)+
   138H        2F39 0000 006A           MOVE.L  0000006AH,-(A7)
   13EH        2F39 0000 0066           MOVE.L  00000066H,-(A7)
   144H        2F39 0000 006A           MOVE.L  0000006AH,-(A7)
   14AH        2F39 0000 0066           MOVE.L  00000066H,-(A7)
   150H        4EB9 0000 0000           JSR     00000000H
   156H        508F                     ADDQ.L  #8,A7
   158H        49F9 0000 006E           LEA     0000006EH,A4
   15EH        28DF                     MOVE.L  (A7)+,(A4)+
   160H        28DF                     MOVE.L  (A7)+,(A4)+
   162H        2F39 0000 0072           MOVE.L  00000072H,-(A7)
   168H        2F39 0000 006E           MOVE.L  0000006EH,-(A7)
   16EH        2F39 0000 0072           MOVE.L  00000072H,-(A7)
   174H        2F39 0000 006E           MOVE.L  0000006EH,-(A7)
   17AH        4EB9 0000 0000           JSR     00000000H
   180H        508F                     ADDQ.L  #8,A7
   182H        49F9 0000 0076           LEA     00000076H,A4
   188H        28DF                     MOVE.L  (A7)+,(A4)+
   18AH        28DF                     MOVE.L  (A7)+,(A4)+
   18CH        23FC 4120 0000 0000 0000 MOVE.L  #41200000H,00000000H
   196H        23FC 3BA3 D70A 0000 0018 MOVE.L  #3BA3D70AH,00000018H
   1A0H        23FC 42C8 0000 0000 0004 MOVE.L  #42C80000H,00000004H
   1AAH        23FC 3A03 126F 0000 001C MOVE.L  #3A03126FH,0000001CH
   1B4H        23FC 461C 4000 0000 0008 MOVE.L  #461C4000H,00000008H
   1BEH        23FC 3851 B717 0000 0020 MOVE.L  #3851B717H,00000020H
   1C8H        23FC 4CBE BC20 0000 000C MOVE.L  #4CBEBC20H,0000000CH
   1D2H        23FC 36A7 C5AC 0000 0024 MOVE.L  #36A7C5ACH,00000024H
   1DCH        23FC 5A0E 1BCA 0000 0010 MOVE.L  #5A0E1BCAH,00000010H
   1E6H        23FC 3506 37BD 0000 0028 MOVE.L  #350637BDH,00000028H
   1F0H        23FC 749D C5AE 0000 0014 MOVE.L  #749DC5AEH,00000014H
   1FAH        23FC 3356 BF95 0000 002C MOVE.L  #3356BF95H,0000002CH
   204H        42B9 0000 0030           CLR.L   00000030H
   20AH        4E5E                     UNLK    A6
   20CH        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref util: at    10H, procnum = 26  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref util: at    26H, procnum = 26  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref util: at    3CH, procnum = 26  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own quick call at    4CH, procnum = 13  checksum: o.k.

ref util: at    56H, procnum = 26  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref util: at    6CH, procnum = 26  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref util: at    82H, procnum = 26  checksum: o.k.

ref own data at    88H  checksum: o.k.

ref own data at    92H  checksum: o.k.

ref own data at    98H  checksum: o.k.

ref own data at    9EH  checksum: o.k.

ref own data at    A4H  checksum: o.k.

ref util: at    AAH, procnum = 22  checksum: o.k.

ref own data at    B2H  checksum: o.k.

ref own data at    BCH  checksum: o.k.

ref own data at    C2H  checksum: o.k.

ref own data at    C8H  checksum: o.k.

ref own data at    CEH  checksum: o.k.

ref util: at    D4H, procnum = 22  checksum: o.k.

ref own data at    DCH  checksum: o.k.

ref own data at    E6H  checksum: o.k.

ref own data at    ECH  checksum: o.k.

ref own data at    F2H  checksum: o.k.

ref own data at    F8H  checksum: o.k.

ref util: at    FEH, procnum = 22  checksum: o.k.

ref own data at   106H  checksum: o.k.

ref own data at   110H  checksum: o.k.

ref own data at   116H  checksum: o.k.

ref own data at   11CH  checksum: o.k.

ref own data at   122H  checksum: o.k.

ref util: at   128H, procnum = 22  checksum: o.k.

ref own data at   130H  checksum: o.k.

ref own data at   13AH  checksum: o.k.

ref own data at   140H  checksum: o.k.

ref own data at   146H  checksum: o.k.

ref own data at   14CH  checksum: o.k.

ref util: at   152H, procnum = 22  checksum: o.k.

ref own data at   15AH  checksum: o.k.

ref own data at   164H  checksum: o.k.

ref own data at   16AH  checksum: o.k.

ref own data at   170H  checksum: o.k.

ref own data at   176H  checksum: o.k.

ref util: at   17CH, procnum = 22  checksum: o.k.

ref own data at   184H  checksum: o.k.

ref own data at   192H  checksum: o.k.

ref own data at   19CH  checksum: o.k.

ref own data at   1A6H  checksum: o.k.

ref own data at   1B0H  checksum: o.k.

ref own data at   1BAH  checksum: o.k.

ref own data at   1C4H  checksum: o.k.

ref own data at   1CEH  checksum: o.k.

ref own data at   1D8H  checksum: o.k.

ref own data at   1E2H  checksum: o.k.

ref own data at   1ECH  checksum: o.k.

ref own data at   1F6H  checksum: o.k.

ref own data at   200H  checksum: o.k.

ref own data at   206H  checksum: o.k.

ref ext init call at   20CH  checksum: o.k.

scmod end  checksum: o.k.
