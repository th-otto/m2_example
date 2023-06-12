link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Storage, key =  2102H  F1E2H  6A2EH  checksum: o.k.

import GEMDOS, key =  2102H  CAC6H  6EBFH, modnum =  2  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 296
PROCEDURE ALLOCATE(VAR addr: ADDRESS; amount: LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF6                LINK    A6,#FFF6H
     4H        7AFF                     MOVEQ   #FFH,D5
     6H        BAB9 0000 0000           CMP.L   00000000H,D5
     CH        661A                     BNE     [1AH] = 00000028H
     EH        558F                     SUBQ.L  #2,A7
    10H        4878 4000                PEA     4000H
    14H        4227                     CLR.B   -(A7)
    16H        6100 0000                BSR     [0000H] = 00000018H
    1AH        5C8F                     ADDQ.L  #6,A7
    1CH        4A1F                     TST.B   (A7)+
    1EH        6608                     BNE     [08H] = 00000028H
    20H        7000                     MOVEQ   #00H,D0
    22H        4EB9 0000 0000           JSR     00000000H
    28H        2879 0000 0000           MOVE.L  00000000H,A4
    2EH        2A2E 0008                MOVE.L  0008(A6),D5
    32H        0205 0001                ANDI.B  #01H,D5
    36H        4A05                     TST.B   D5
    38H        6704                     BEQ     [04H] = 0000003EH
    3AH        52AE 0008                ADDQ.L  #1,0008(A6)
    3EH        2D6C 000C FFF8           MOVE.L  000C(A4),FFF8(A6)
    44H        266E FFF8                MOVE.L  FFF8(A6),A3
    48H        2D53 FFFC                MOVE.L  (A3),FFFC(A6)
    4CH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    50H        BAAC 000C                CMP.L   000C(A4),D5
    54H        6732                     BEQ     [32H] = 00000088H
    56H        266E FFFC                MOVE.L  FFFC(A6),A3
    5AH        2A2B 0004                MOVE.L  0004(A3),D5
    5EH        BAAE 0008                CMP.L   0008(A6),D5
    62H        6618                     BNE     [18H] = 0000007CH
    64H        246E 000C                MOVE.L  000C(A6),A2
    68H        24AE FFFC                MOVE.L  FFFC(A6),(A2)
    6CH        246E FFF8                MOVE.L  FFF8(A6),A2
    70H        2493                     MOVE.L  (A3),(A2)
    72H        296E FFF8 000C           MOVE.L  FFF8(A6),000C(A4)
    78H        4E5E                     UNLK    A6
    7AH        4E75                     RTS
    7CH        2D6E FFFC FFF8           MOVE.L  FFFC(A6),FFF8(A6)
    82H        2D53 FFFC                MOVE.L  (A3),FFFC(A6)
    86H        60C4                     BRA     [C4H] = 0000004CH
    88H        2A14                     MOVE.L  (A4),D5
    8AH        9AAE 0008                SUB.L   0008(A6),D5
    8EH        BAAC 0008                CMP.L   0008(A4),D5
    92H        6314                     BLS     [14H] = 000000A8H
    94H        266E 000C                MOVE.L  000C(A6),A3
    98H        26AC 0008                MOVE.L  0008(A4),(A3)
    9CH        2A2E 0008                MOVE.L  0008(A6),D5
    A0H        DBAC 0008                ADD.L   D5,0008(A4)
    A4H        4E5E                     UNLK    A6
    A6H        4E75                     RTS
    A8H        266E FFFC                MOVE.L  FFFC(A6),A3
    ACH        2A2B 0004                MOVE.L  0004(A3),D5
    B0H        BAAE 0008                CMP.L   0008(A6),D5
    B4H        633A                     BLS     [3AH] = 000000F0H
    B6H        2A2B 0004                MOVE.L  0004(A3),D5
    BAH        9AAE 0008                SUB.L   0008(A6),D5
    BEH        2745 0004                MOVE.L  D5,0004(A3)
    C2H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    C6H        DAAB 0004                ADD.L   0004(A3),D5
    CAH        246E 000C                MOVE.L  000C(A6),A2
    CEH        2485                     MOVE.L  D5,(A2)
    D0H        7A08                     MOVEQ   #08H,D5
    D2H        BAAB 0004                CMP.L   0004(A3),D5
    D6H        630E                     BLS     [0EH] = 000000E6H
    D8H        246E FFF8                MOVE.L  FFF8(A6),A2
    DCH        2493                     MOVE.L  (A3),(A2)
    DEH        2953 000C                MOVE.L  (A3),000C(A4)
    E2H        4EFA 0008                JMP     [0008H] = 000000ECH
    E6H        296E FFFC 000C           MOVE.L  FFFC(A6),000C(A4)
    ECH        4E5E                     UNLK    A6
    EEH        4E75                     RTS
    F0H        2D6E FFFC FFF8           MOVE.L  FFFC(A6),FFF8(A6)
    F6H        2D53 FFFC                MOVE.L  (A3),FFFC(A6)
    FAH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    FEH        BAAC 000C                CMP.L   000C(A4),D5
   102H        6702                     BEQ     [02H] = 00000106H
   104H        60A2                     BRA     [A2H] = 000000A8H
   106H        4A2C 0014                TST.B   0014(A4)
   10AH        670C                     BEQ     [0CH] = 00000118H
   10CH        7AFF                     MOVEQ   #FFH,D5
   10EH        266E 000C                MOVE.L  000C(A6),A3
   112H        2685                     MOVE.L  D5,(A3)
   114H        4EFA 000E                JMP     [000EH] = 00000124H
   118H        2F0C                     MOVE.L  A4,-(A7)
   11AH        7000                     MOVEQ   #00H,D0
   11CH        4EB9 0000 0000           JSR     00000000H
   122H        285F                     MOVE.L  (A7)+,A4
   124H        4E5E                     UNLK    A6
   126H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own quick call at    18H, procnum =  3  checksum: o.k.

ref util: at    24H, procnum =  2  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref util: at   11EH, procnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 78
PROCEDURE DEALLOCATE(VAR addr: ADDRESS; amount: LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        2879 0000 0000           MOVE.L  00000000H,A4
     AH        2A2E 0008                MOVE.L  0008(A6),D5
     EH        0205 0001                ANDI.B  #01H,D5
    12H        4A05                     TST.B   D5
    14H        6704                     BEQ     [04H] = 0000001AH
    16H        52AE 0008                ADDQ.L  #1,0008(A6)
    1AH        266E 000C                MOVE.L  000C(A6),A3
    1EH        2D53 FFFC                MOVE.L  (A3),FFFC(A6)
    22H        7A08                     MOVEQ   #08H,D5
    24H        BAAE 0008                CMP.L   0008(A6),D5
    28H        6218                     BHI     [18H] = 00000042H
    2AH        266E FFFC                MOVE.L  FFFC(A6),A3
    2EH        246C 0010                MOVE.L  0010(A4),A2
    32H        2692                     MOVE.L  (A2),(A3)
    34H        276E 0008 0004           MOVE.L  0008(A6),0004(A3)
    3AH        266C 0010                MOVE.L  0010(A4),A3
    3EH        26AE FFFC                MOVE.L  FFFC(A6),(A3)
    42H        7AFF                     MOVEQ   #FFH,D5
    44H        266E 000C                MOVE.L  000C(A6),A3
    48H        2685                     MOVE.L  D5,(A3)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 148
PROCEDURE CreateHeap(amount: LONGCARD; BOOLEAN): BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        7AFF                     MOVEQ   #FFH,D5
     6H        BAB9 0000 0000           CMP.L   00000000H,D5
     CH        6714                     BEQ     [14H] = 00000022H
     EH        558F                     SUBQ.L  #2,A7
    10H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    16H        4EB9 0000 0000           JSR     GEMDOS.Free
    1CH        588F                     ADDQ.L  #4,A7
    1EH        4A1F                     TST.B   (A7)+
    20H        4E71                     NOP
    22H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    26H        486E FFFC                PEA     FFFC(A6)
    2AH        4EB9 0000 0000           JSR     GEMDOS.Alloc
    30H        508F                     ADDQ.L  #8,A7
    32H        4AAE FFFC                TST.L   FFFC(A6)
    36H        6608                     BNE     [08H] = 00000040H
    38H        422E 000E                CLR.B   000E(A6)
    3CH        4E5E                     UNLK    A6
    3EH        4E75                     RTS
    40H        23EE FFFC 0000 0000      MOVE.L  FFFC(A6),00000000H
    48H        2879 0000 0000           MOVE.L  00000000H,A4
    4EH        7A16                     MOVEQ   #16H,D5
    50H        DAAE FFFC                ADD.L   FFFC(A6),D5
    54H        2945 0004                MOVE.L  D5,0004(A4)
    58H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    5CH        DAAE 000A                ADD.L   000A(A6),D5
    60H        2885                     MOVE.L  D5,(A4)
    62H        296C 0004 0010           MOVE.L  0004(A4),0010(A4)
    68H        296C 0010 000C           MOVE.L  0010(A4),000C(A4)
    6EH        2A2C 0004                MOVE.L  0004(A4),D5
    72H        5085                     ADDQ.L  #8,D5
    74H        2945 0008                MOVE.L  D5,0008(A4)
    78H        196E 0008 0014           MOVE.B  0008(A6),0014(A4)
    7EH        266C 0010                MOVE.L  0010(A4),A3
    82H        26AC 000C                MOVE.L  000C(A4),(A3)
    86H        42AB 0004                CLR.L   0004(A3)
    8AH        1D7C 0001 000E           MOVE.B  #01H,000E(A6)
    90H        4E5E                     UNLK    A6
    92H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref ext proc call at    18H, procnum = 43, modnum =  2  checksum: o.k.

ref ext proc call at    2CH, procnum = 42, modnum =  2  checksum: o.k.

ref own data at    44H  checksum: o.k.

ref own data at    4AH  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 26
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        7AFF                     MOVEQ   #FFH,D5
     CH        23C5 0000 0000           MOVE.L  D5,00000000H
    12H        4E5E                     UNLK    A6
    14H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref ext init call at    14H  checksum: o.k.

scmod end  checksum: o.k.
