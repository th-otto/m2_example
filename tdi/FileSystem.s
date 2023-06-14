link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  FileSystem, key =  2102H  F1EBH  157DH  checksum: o.k.

import Strings, key =  2102H  F1D3H  5C23H, modnum =  2  checksum: o.k.

import GEMDOS, key =  2102H  CAC6H  6EBFH, modnum =  3  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3A2E 000A                MOVE.W  000A(A6),D5
     8H        BA6E 0008                CMP.W   0008(A6),D5
     CH        630E                     BLS     [0EH] = 0000001CH
     EH        3D6E 000A 000C           MOVE.W  000A(A6),000C(A6)
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
    18H        4EFA 000C                JMP     [000CH] = 00000026H
    1CH        3D6E 0008 000C           MOVE.W  0008(A6),000C(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 136
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        422C 0007                CLR.B   0007(A4)
     EH        197C 0004 0006           MOVE.B  #04H,0006(A4)
    14H        2F0C                     MOVE.L  A4,-(A7)
    16H        4878 0800                PEA     0800H
    1AH        486C 0002                PEA     0002(A4)
    1EH        4EB9 0000 0000           JSR     GEMDOS.Alloc
    24H        508F                     ADDQ.L  #8,A7
    26H        285F                     MOVE.L  (A7)+,A4
    28H        7AFF                     MOVEQ   #FFH,D5
    2AH        BAAC 0002                CMP.L   0002(A4),D5
    2EH        6618                     BNE     [18H] = 00000048H
    30H        2F0C                     MOVE.L  A4,-(A7)
    32H        266E 000E                MOVE.L  000E(A6),A3
    36H        4853                     PEA     (A3)
    38H        1F3C 0001                MOVE.B  #01H,-(A7)
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        5C8F                     ADDQ.L  #6,A7
    42H        285F                     MOVE.L  (A7)+,A4
    44H        4EFA 003E                JMP     [003EH] = 00000084H
    48H        397C FFFF 0008           MOVE.W  #FFFFH,0008(A4)
    4EH        2F0C                     MOVE.L  A4,-(A7)
    50H        3F3C 0027                MOVE.W  #0027H,-(A7)
    54H        486C 000A                PEA     000A(A4)
    58H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    5CH        266E 0008                MOVE.L  0008(A6),A3
    60H        4853                     PEA     (A3)
    62H        4EB9 0000 0000           JSR     Strings.Assign
    68H        4FEF 000C                LEA     000C(A7),A7
    6CH        285F                     MOVE.L  (A7)+,A4
    6EH        422C 0031                CLR.B   0031(A4)
    72H        42AC 0032                CLR.L   0032(A4)
    76H        7AFF                     MOVEQ   #FFH,D5
    78H        2945 0036                MOVE.L  D5,0036(A4)
    7CH        426C 003E                CLR.W   003E(A4)
    80H        42AC 003A                CLR.L   003A(A4)
    84H        4E5E                     UNLK    A6
    86H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    20H, procnum = 42, modnum =  3  checksum: o.k.

ref own quick call at    3EH, procnum = 26  checksum: o.k.

ref ext proc call at    64H, procnum =  2, modnum =  2  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 180
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        422C 0007                CLR.B   0007(A4)
     EH        1A2C 0006                MOVE.B  0006(A4),D5
    12H        0805 0007                BTST    #0007H,D5
    16H        6702                     BEQ     [02H] = 0000001AH
    18H        6004                     BRA     [04H] = 0000001EH
    1AH        4EFA 0084                JMP     [0084H] = 000000A0H
    1EH        7A00                     MOVEQ   #00H,D5
    20H        3A2C 003E                MOVE.W  003E(A4),D5
    24H        2D45 FFFC                MOVE.L  D5,FFFC(A6)
    28H        4AAE FFFC                TST.L   FFFC(A6)
    2CH        6772                     BEQ     [72H] = 000000A0H
    2EH        2F0C                     MOVE.L  A4,-(A7)
    30H        3F2C 0008                MOVE.W  0008(A4),-(A7)
    34H        486E FFFC                PEA     FFFC(A6)
    38H        2F2C 0002                MOVE.L  0002(A4),-(A7)
    3CH        4EB9 0000 0000           JSR     GEMDOS.Write
    42H        4FEF 000A                LEA     000A(A7),A7
    46H        285F                     MOVE.L  (A7)+,A4
    48H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    4CH        4A45                     TST.W   D5
    4EH        6C1C                     BGE     [1CH] = 0000006CH
    50H        2F0C                     MOVE.L  A4,-(A7)
    52H        266E 0008                MOVE.L  0008(A6),A3
    56H        4853                     PEA     (A3)
    58H        1F3C 0010                MOVE.B  #10H,-(A7)
    5CH        6100 0000                BSR     [0000H] = 0000005EH
    60H        5C8F                     ADDQ.L  #6,A7
    62H        285F                     MOVE.L  (A7)+,A4
    64H        4E5E                     UNLK    A6
    66H        4E75                     RTS
    68H        4EFA 0026                JMP     [0026H] = 00000090H
    6CH        7A00                     MOVEQ   #00H,D5
    6EH        3A2C 003E                MOVE.W  003E(A4),D5
    72H        BAAE FFFC                CMP.L   FFFC(A6),D5
    76H        6718                     BEQ     [18H] = 00000090H
    78H        2F0C                     MOVE.L  A4,-(A7)
    7AH        266E 0008                MOVE.L  0008(A6),A3
    7EH        4853                     PEA     (A3)
    80H        1F3C 0008                MOVE.B  #08H,-(A7)
    84H        6100 0000                BSR     [0000H] = 00000086H
    88H        5C8F                     ADDQ.L  #6,A7
    8AH        285F                     MOVE.L  (A7)+,A4
    8CH        4E5E                     UNLK    A6
    8EH        4E75                     RTS
    90H        2A2C 003A                MOVE.L  003A(A4),D5
    94H        BAAC 0032                CMP.L   0032(A4),D5
    98H        6306                     BLS     [06H] = 000000A0H
    9AH        296C 003A 0032           MOVE.L  003A(A4),0032(A4)
    A0H        7AFF                     MOVEQ   #FFH,D5
    A2H        2945 0036                MOVE.L  D5,0036(A4)
    A6H        426C 003E                CLR.W   003E(A4)
    AAH        08AC 0007 0006           BCLR    #0007H,0006(A4)
    B0H        4E5E                     UNLK    A6
    B2H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    3EH, procnum = 37, modnum =  3  checksum: o.k.

ref own quick call at    5EH, procnum = 26  checksum: o.k.

ref own quick call at    86H, procnum = 26  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 304
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        4A39 0000 0002           TST.B   00000002H
     EH        6716                     BEQ     [16H] = 00000026H
    10H        4239 0000 0002           CLR.B   00000002H
    16H        2F0C                     MOVE.L  A4,-(A7)
    18H        266E 000C                MOVE.L  000C(A6),A3
    1CH        4853                     PEA     (A3)
    1EH        6100 0000                BSR     [0000H] = 00000020H
    22H        588F                     ADDQ.L  #4,A7
    24H        285F                     MOVE.L  (A7)+,A4
    26H        4214                     CLR.B   (A4)
    28H        422C 0007                CLR.B   0007(A4)
    2CH        2A2C 003A                MOVE.L  003A(A4),D5
    30H        BAAC 0032                CMP.L   0032(A4),D5
    34H        6518                     BCS     [18H] = 0000004EH
    36H        2F0C                     MOVE.L  A4,-(A7)
    38H        266E 000C                MOVE.L  000C(A6),A3
    3CH        4853                     PEA     (A3)
    3EH        1F3C 0003                MOVE.B  #03H,-(A7)
    42H        6100 0000                BSR     [0000H] = 00000044H
    46H        5C8F                     ADDQ.L  #6,A7
    48H        285F                     MOVE.L  (A7)+,A4
    4AH        4EFA 00E0                JMP     [00E0H] = 0000012CH
    4EH        2A2C 003A                MOVE.L  003A(A4),D5
    52H        E68D                     LSR.L   #3,D5
    54H        E08D                     LSR.L   #8,D5
    56H        700B                     MOVEQ   #0BH,D0
    58H        E1A5                     ASL.L   D0,D5
    5AH        2D45 FFFC                MOVE.L  D5,FFFC(A6)
    5EH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    62H        BAAC 0036                CMP.L   0036(A4),D5
    66H        6702                     BEQ     [02H] = 0000006AH
    68H        6004                     BRA     [04H] = 0000006EH
    6AH        4EFA 007E                JMP     [007EH] = 000000EAH
    6EH        2F0C                     MOVE.L  A4,-(A7)
    70H        266E 000C                MOVE.L  000C(A6),A3
    74H        4853                     PEA     (A3)
    76H        6100 0000                BSR     [0000H] = 00000078H
    7AH        588F                     ADDQ.L  #4,A7
    7CH        285F                     MOVE.L  (A7)+,A4
    7EH        4A14                     TST.B   (A4)
    80H        6704                     BEQ     [04H] = 00000086H
    82H        4E5E                     UNLK    A6
    84H        4E75                     RTS
    86H        296E FFFC 0036           MOVE.L  FFFC(A6),0036(A4)
    8CH        2F0C                     MOVE.L  A4,-(A7)
    8EH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    92H        3F2C 0008                MOVE.W  0008(A4),-(A7)
    96H        4227                     CLR.B   -(A7)
    98H        486E FFFC                PEA     FFFC(A6)
    9CH        4EB9 0000 0000           JSR     GEMDOS.Seek
    A2H        4FEF 000C                LEA     000C(A7),A7
    A6H        285F                     MOVE.L  (A7)+,A4
    A8H        2D7C 0000 0800 FFF8      MOVE.L  #00000800H,FFF8(A6)
    B0H        2F0C                     MOVE.L  A4,-(A7)
    B2H        3F2C 0008                MOVE.W  0008(A4),-(A7)
    B6H        486E FFF8                PEA     FFF8(A6)
    BAH        2F2C 0002                MOVE.L  0002(A4),-(A7)
    BEH        4EB9 0000 0000           JSR     GEMDOS.Read
    C4H        4FEF 000A                LEA     000A(A7),A7
    C8H        285F                     MOVE.L  (A7)+,A4
    CAH        2A2E FFF8                MOVE.L  FFF8(A6),D5
    CEH        4A45                     TST.W   D5
    D0H        6C18                     BGE     [18H] = 000000EAH
    D2H        2F0C                     MOVE.L  A4,-(A7)
    D4H        266E 000C                MOVE.L  000C(A6),A3
    D8H        4853                     PEA     (A3)
    DAH        1F3C 0010                MOVE.B  #10H,-(A7)
    DEH        6100 0000                BSR     [0000H] = 000000E0H
    E2H        5C8F                     ADDQ.L  #6,A7
    E4H        285F                     MOVE.L  (A7)+,A4
    E6H        4E5E                     UNLK    A6
    E8H        4E75                     RTS
    EAH        2F0C                     MOVE.L  A4,-(A7)
    ECH        558F                     SUBQ.L  #2,A7
    EEH        2A2C 003A                MOVE.L  003A(A4),D5
    F2H        0285 0000 07FF           ANDI.L  #000007FFH,D5
    F8H        5245                     ADDQ.W  #1,D5
    FAH        3F05                     MOVE.W  D5,-(A7)
    FCH        3F2C 003E                MOVE.W  003E(A4),-(A7)
   100H        6100 0000                BSR     [0000H] = 00000102H
   104H        588F                     ADDQ.L  #4,A7
   106H        3A1F                     MOVE.W  (A7)+,D5
   108H        285F                     MOVE.L  (A7)+,A4
   10AH        3945 003E                MOVE.W  D5,003E(A4)
   10EH        2D6C 0002 FFF4           MOVE.L  0002(A4),FFF4(A6)
   114H        266E FFF4                MOVE.L  FFF4(A6),A3
   118H        2A2C 003A                MOVE.L  003A(A4),D5
   11CH        0245 07FF                ANDI.W  #07FFH,D5
   120H        246E 0008                MOVE.L  0008(A6),A2
   124H        14B3 5000                MOVE.B  00H(A3,D5.W),(A2)
   128H        52AC 003A                ADDQ.L  #1,003A(A4)
   12CH        4E5E                     UNLK    A6
   12EH        4E75                     RTS
  checksum: o.k.

ref own data at     AH  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own quick call at    20H, procnum = 21  checksum: o.k.

ref own quick call at    44H, procnum = 26  checksum: o.k.

ref own quick call at    78H, procnum = 21  checksum: o.k.

ref ext proc call at    9EH, procnum = 39, modnum =  3  checksum: o.k.

ref ext proc call at    C0H, procnum = 36, modnum =  3  checksum: o.k.

ref own quick call at    E0H, procnum = 26  checksum: o.k.

ref own quick call at   102H, procnum = 19  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 70
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        4854                     PEA     (A4)
     AH        486E FFFF                PEA     FFFF(A6)
     EH        6100 0000                BSR     [0000H] = 00000010H
    12H        508F                     ADDQ.L  #8,A7
    14H        286E 000C                MOVE.L  000C(A6),A4
    18H        4A14                     TST.B   (A4)
    1AH        6626                     BNE     [26H] = 00000042H
    1CH        286E 000C                MOVE.L  000C(A6),A4
    20H        4854                     PEA     (A4)
    22H        486E FFFE                PEA     FFFE(A6)
    26H        6100 0000                BSR     [0000H] = 00000028H
    2AH        508F                     ADDQ.L  #8,A7
    2CH        7A00                     MOVEQ   #00H,D5
    2EH        1A2E FFFF                MOVE.B  FFFF(A6),D5
    32H        E145                     ASL.W   #8,D5
    34H        7800                     MOVEQ   #00H,D4
    36H        182E FFFE                MOVE.B  FFFE(A6),D4
    3AH        DA44                     ADD.W   D4,D5
    3CH        286E 0008                MOVE.L  0008(A6),A4
    40H        3885                     MOVE.W  D5,(A4)
    42H        4E5E                     UNLK    A6
    44H        4E75                     RTS
  checksum: o.k.

ref own quick call at    10H, procnum = 22  checksum: o.k.

ref own quick call at    28H, procnum = 22  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 340
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        0C39 0001 0000 0002      CMPI.B  #01H,00000002H
    10H        6718                     BEQ     [18H] = 0000002AH
    12H        13FC 0001 0000 0002      MOVE.B  #01H,00000002H
    1AH        2F0C                     MOVE.L  A4,-(A7)
    1CH        266E 000C                MOVE.L  000C(A6),A3
    20H        4853                     PEA     (A3)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        588F                     ADDQ.L  #4,A7
    28H        285F                     MOVE.L  (A7)+,A4
    2AH        2A2C 003A                MOVE.L  003A(A4),D5
    2EH        E68D                     LSR.L   #3,D5
    30H        E08D                     LSR.L   #8,D5
    32H        700B                     MOVEQ   #0BH,D0
    34H        E1A5                     ASL.L   D0,D5
    36H        2D45 FFFC                MOVE.L  D5,FFFC(A6)
    3AH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    3EH        BAAC 0036                CMP.L   0036(A4),D5
    42H        6702                     BEQ     [02H] = 00000046H
    44H        6004                     BRA     [04H] = 0000004AH
    46H        4EFA 0088                JMP     [0088H] = 000000D0H
    4AH        2F0C                     MOVE.L  A4,-(A7)
    4CH        266E 000C                MOVE.L  000C(A6),A3
    50H        4853                     PEA     (A3)
    52H        6100 0000                BSR     [0000H] = 00000054H
    56H        588F                     ADDQ.L  #4,A7
    58H        285F                     MOVE.L  (A7)+,A4
    5AH        4A14                     TST.B   (A4)
    5CH        6704                     BEQ     [04H] = 00000062H
    5EH        4E5E                     UNLK    A6
    60H        4E75                     RTS
    62H        296E FFFC 0036           MOVE.L  FFFC(A6),0036(A4)
    68H        2F0C                     MOVE.L  A4,-(A7)
    6AH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    6EH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    72H        4227                     CLR.B   -(A7)
    74H        486E FFFC                PEA     FFFC(A6)
    78H        4EB9 0000 0000           JSR     GEMDOS.Seek
    7EH        4FEF 000C                LEA     000C(A7),A7
    82H        285F                     MOVE.L  (A7)+,A4
    84H        2D7C 0000 0800 FFF8      MOVE.L  #00000800H,FFF8(A6)
    8CH        2F0C                     MOVE.L  A4,-(A7)
    8EH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    92H        486E FFF8                PEA     FFF8(A6)
    96H        2F2C 0002                MOVE.L  0002(A4),-(A7)
    9AH        4EB9 0000 0000           JSR     GEMDOS.Read
    A0H        4FEF 000A                LEA     000A(A7),A7
    A4H        285F                     MOVE.L  (A7)+,A4
    A6H        2A2E FFF8                MOVE.L  FFF8(A6),D5
    AAH        4A45                     TST.W   D5
    ACH        4E71                     NOP
    AEH        2D6C 0036 FFFC           MOVE.L  0036(A4),FFFC(A6)
    B4H        2F0C                     MOVE.L  A4,-(A7)
    B6H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    BAH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    BEH        4227                     CLR.B   -(A7)
    C0H        486E FFFC                PEA     FFFC(A6)
    C4H        4EB9 0000 0000           JSR     GEMDOS.Seek
    CAH        4FEF 000C                LEA     000C(A7),A7
    CEH        285F                     MOVE.L  (A7)+,A4
    D0H        2F0C                     MOVE.L  A4,-(A7)
    D2H        558F                     SUBQ.L  #2,A7
    D4H        2A2C 003A                MOVE.L  003A(A4),D5
    D8H        0285 0000 07FF           ANDI.L  #000007FFH,D5
    DEH        5245                     ADDQ.W  #1,D5
    E0H        3F05                     MOVE.W  D5,-(A7)
    E2H        3F2C 003E                MOVE.W  003E(A4),-(A7)
    E6H        6100 0000                BSR     [0000H] = 000000E8H
    EAH        588F                     ADDQ.L  #4,A7
    ECH        3A1F                     MOVE.W  (A7)+,D5
    EEH        285F                     MOVE.L  (A7)+,A4
    F0H        3945 003E                MOVE.W  D5,003E(A4)
    F4H        2D6C 0002 FFF4           MOVE.L  0002(A4),FFF4(A6)
    FAH        266E FFF4                MOVE.L  FFF4(A6),A3
    FEH        2A2C 003A                MOVE.L  003A(A4),D5
   102H        0245 07FF                ANDI.W  #07FFH,D5
   106H        17AE 000A 5000           MOVE.B  000A(A6),00H(A3,D5.W)
   10CH        08EC 0007 0006           BSET    #0007H,0006(A4)
   112H        52AC 003A                ADDQ.L  #1,003A(A4)
   116H        4A2E 0008                TST.B   0008(A6)
   11AH        670A                     BEQ     [0AH] = 00000126H
   11CH        2A2C 003A                MOVE.L  003A(A4),D5
   120H        BAAC 0032                CMP.L   0032(A4),D5
   124H        6306                     BLS     [06H] = 0000012CH
   126H        296C 003A 0032           MOVE.L  003A(A4),0032(A4)
   12CH        2A2C 003A                MOVE.L  003A(A4),D5
   130H        0285 0000 07FF           ANDI.L  #000007FFH,D5
   136H        4A85                     TST.L   D5
   138H        6616                     BNE     [16H] = 00000150H
   13AH        2F0C                     MOVE.L  A4,-(A7)
   13CH        266E 000C                MOVE.L  000C(A6),A3
   140H        4853                     PEA     (A3)
   142H        6100 0000                BSR     [0000H] = 00000144H
   146H        588F                     ADDQ.L  #4,A7
   148H        285F                     MOVE.L  (A7)+,A4
   14AH        296C 003A 0036           MOVE.L  003A(A4),0036(A4)
   150H        4E5E                     UNLK    A6
   152H        4E75                     RTS
  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref own quick call at    24H, procnum = 21  checksum: o.k.

ref own quick call at    54H, procnum = 21  checksum: o.k.

ref ext proc call at    7AH, procnum = 39, modnum =  3  checksum: o.k.

ref ext proc call at    9CH, procnum = 36, modnum =  3  checksum: o.k.

ref ext proc call at    C6H, procnum = 39, modnum =  3  checksum: o.k.

ref own quick call at    E8H, procnum = 19  checksum: o.k.

ref own quick call at   144H, procnum = 21  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 70
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        4854                     PEA     (A4)
     AH        3A2E 000A                MOVE.W  000A(A6),D5
     EH        E04D                     LSR.W   #8,D5
    10H        4845                     SWAP    D5
    12H        4245                     CLR.W   D5
    14H        4845                     SWAP    D5
    16H        1F05                     MOVE.B  D5,-(A7)
    18H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    1CH        6100 0000                BSR     [0000H] = 0000001EH
    20H        508F                     ADDQ.L  #8,A7
    22H        286E 000C                MOVE.L  000C(A6),A4
    26H        4A14                     TST.B   (A4)
    28H        6618                     BNE     [18H] = 00000042H
    2AH        286E 000C                MOVE.L  000C(A6),A4
    2EH        4854                     PEA     (A4)
    30H        7A00                     MOVEQ   #00H,D5
    32H        3A2E 000A                MOVE.W  000A(A6),D5
    36H        1F05                     MOVE.B  D5,-(A7)
    38H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        508F                     ADDQ.L  #8,A7
    42H        4E5E                     UNLK    A6
    44H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1EH, procnum = 24  checksum: o.k.

ref own quick call at    3EH, procnum = 24  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 34
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        18AE 0008                MOVE.B  0008(A6),(A4)
     CH        4A2E 0008                TST.B   0008(A6)
    10H        670C                     BEQ     [0CH] = 0000001EH
    12H        197C 0001 0007           MOVE.B  #01H,0007(A4)
    18H        08EC 0000 0006           BSET    #0000H,0006(A4)
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 356
PROCEDURE Create(VAR File; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFCA                LINK    A6,#FFCAH
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        0C79 0009 0000 0000      CMPI.W  #0009H,00000000H
    10H        6518                     BCS     [18H] = 0000002AH
    12H        2F0C                     MOVE.L  A4,-(A7)
    14H        266E 000E                MOVE.L  000E(A6),A3
    18H        4853                     PEA     (A3)
    1AH        1F3C 0007                MOVE.B  #07H,-(A7)
    1EH        6100 0000                BSR     [0000H] = 00000020H
    22H        5C8F                     ADDQ.L  #6,A7
    24H        285F                     MOVE.L  (A7)+,A4
    26H        4EFA 0138                JMP     [0138H] = 00000160H
    2AH        2F0C                     MOVE.L  A4,-(A7)
    2CH        3F3C 0032                MOVE.W  #0032H,-(A7)
    30H        486E FFCC                PEA     FFCC(A6)
    34H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    38H        266E 0008                MOVE.L  0008(A6),A3
    3CH        4853                     PEA     (A3)
    3EH        4EB9 0000 0000           JSR     Strings.Assign
    44H        4FEF 000C                LEA     000C(A7),A7
    48H        285F                     MOVE.L  (A7)+,A4
    4AH        3A39 0000 0000           MOVE.W  00000000H,D5
    50H        0645 0030                ADDI.W  #0030H,D5
    54H        1D45 FFCB                MOVE.B  D5,FFCB(A6)
    58H        2F0C                     MOVE.L  A4,-(A7)
    5AH        4267                     CLR.W   -(A7)
    5CH        486E FFCB                PEA     FFCB(A6)
    60H        3F3C 0032                MOVE.W  #0032H,-(A7)
    64H        486E FFCC                PEA     FFCC(A6)
    68H        2F0C                     MOVE.L  A4,-(A7)
    6AH        558F                     SUBQ.L  #2,A7
    6CH        3F3C 0032                MOVE.W  #0032H,-(A7)
    70H        486E FFCC                PEA     FFCC(A6)
    74H        4EB9 0000 0000           JSR     Strings.Length
    7AH        5C8F                     ADDQ.L  #6,A7
    7CH        3A1F                     MOVE.W  (A7)+,D5
    7EH        285F                     MOVE.L  (A7)+,A4
    80H        5345                     SUBQ.W  #1,D5
    82H        3F05                     MOVE.W  D5,-(A7)
    84H        4EB9 0000 0000           JSR     Strings.Insert
    8AH        4FEF 000E                LEA     000E(A7),A7
    8EH        285F                     MOVE.L  (A7)+,A4
    90H        5279 0000 0000           ADDQ.W  #1,00000000H
    96H        2F0C                     MOVE.L  A4,-(A7)
    98H        3F3C 0003                MOVE.W  #0003H,-(A7)
    9CH        4879 0000 0000           PEA     00000000H
    A2H        3F3C 0032                MOVE.W  #0032H,-(A7)
    A6H        486E FFCC                PEA     FFCC(A6)
    AAH        2F0C                     MOVE.L  A4,-(A7)
    ACH        558F                     SUBQ.L  #2,A7
    AEH        3F3C 0032                MOVE.W  #0032H,-(A7)
    B2H        486E FFCC                PEA     FFCC(A6)
    B6H        4EB9 0000 0000           JSR     Strings.Length
    BCH        5C8F                     ADDQ.L  #6,A7
    BEH        3A1F                     MOVE.W  (A7)+,D5
    C0H        285F                     MOVE.L  (A7)+,A4
    C2H        5345                     SUBQ.W  #1,D5
    C4H        3F05                     MOVE.W  D5,-(A7)
    C6H        4EB9 0000 0000           JSR     Strings.Insert
    CCH        4FEF 000E                LEA     000E(A7),A7
    D0H        285F                     MOVE.L  (A7)+,A4
    D2H        2F0C                     MOVE.L  A4,-(A7)
    D4H        266E 000E                MOVE.L  000E(A6),A3
    D8H        4853                     PEA     (A3)
    DAH        3F3C 0032                MOVE.W  #0032H,-(A7)
    DEH        486E FFCC                PEA     FFCC(A6)
    E2H        6100 0000                BSR     [0000H] = 000000E4H
    E6H        4FEF 000A                LEA     000A(A7),A7
    EAH        285F                     MOVE.L  (A7)+,A4
    ECH        4A14                     TST.B   (A4)
    EEH        6652                     BNE     [52H] = 00000142H
    F0H        2F0C                     MOVE.L  A4,-(A7)
    F2H        3F3C 0032                MOVE.W  #0032H,-(A7)
    F6H        486E FFCC                PEA     FFCC(A6)
    FAH        4267                     CLR.W   -(A7)
    FCH        486C 0008                PEA     0008(A4)
   100H        4EB9 0000 0000           JSR     GEMDOS.Create
   106H        4FEF 000C                LEA     000C(A7),A7
   10AH        285F                     MOVE.L  (A7)+,A4
   10CH        4A6C 0008                TST.W   0008(A4)
   110H        6C2C                     BGE     [2CH] = 0000013EH
   112H        2F0C                     MOVE.L  A4,-(A7)
   114H        266E 000E                MOVE.L  000E(A6),A3
   118H        4853                     PEA     (A3)
   11AH        1F3C 0001                MOVE.B  #01H,-(A7)
   11EH        6100 0000                BSR     [0000H] = 00000120H
   122H        5C8F                     ADDQ.L  #6,A7
   124H        285F                     MOVE.L  (A7)+,A4
   126H        2F0C                     MOVE.L  A4,-(A7)
   128H        558F                     SUBQ.L  #2,A7
   12AH        2F2C 0002                MOVE.L  0002(A4),-(A7)
   12EH        4EB9 0000 0000           JSR     GEMDOS.Free
   134H        588F                     ADDQ.L  #4,A7
   136H        1A1F                     MOVE.B  (A7)+,D5
   138H        285F                     MOVE.L  (A7)+,A4
   13AH        4A05                     TST.B   D5
   13CH        4E71                     NOP
   13EH        4EFA 0020                JMP     [0020H] = 00000160H
   142H        197C 0001 0007           MOVE.B  #01H,0007(A4)
   148H        197C 0008 0006           MOVE.B  #08H,0006(A4)
   14EH        2F0C                     MOVE.L  A4,-(A7)
   150H        266E 000E                MOVE.L  000E(A6),A3
   154H        4853                     PEA     (A3)
   156H        4227                     CLR.B   -(A7)
   158H        6100 0000                BSR     [0000H] = 0000015AH
   15CH        5C8F                     ADDQ.L  #6,A7
   15EH        285F                     MOVE.L  (A7)+,A4
   160H        4E5E                     UNLK    A6
   162H        4E75                     RTS
  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own quick call at    20H, procnum = 26  checksum: o.k.

ref ext proc call at    40H, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    4CH  checksum: o.k.

ref ext proc call at    76H, procnum =  7, modnum =  2  checksum: o.k.

ref ext proc call at    86H, procnum =  3, modnum =  2  checksum: o.k.

ref own data at    92H  checksum: o.k.

ref own string: at    9EH  checksum: o.k.

ref ext proc call at    B8H, procnum =  7, modnum =  2  checksum: o.k.

ref ext proc call at    C8H, procnum =  3, modnum =  2  checksum: o.k.

ref own quick call at    E4H, procnum = 20  checksum: o.k.

ref ext proc call at   102H, procnum = 33, modnum =  3  checksum: o.k.

ref own quick call at   120H, procnum = 26  checksum: o.k.

ref ext proc call at   130H, procnum = 43, modnum =  3  checksum: o.k.

ref own quick call at   15AH, procnum = 26  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 238
PROCEDURE Close(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        1A2C 0006                MOVE.B  0006(A4),D5
     CH        0805 0006                BTST    #0006H,D5
    10H        6702                     BEQ     [02H] = 00000014H
    12H        6004                     BRA     [04H] = 00000018H
    14H        4EFA 007C                JMP     [007CH] = 00000092H
    18H        2F0C                     MOVE.L  A4,-(A7)
    1AH        558F                     SUBQ.L  #2,A7
    1CH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    20H        4EB9 0000 0000           JSR     GEMDOS.Close
    26H        548F                     ADDQ.L  #2,A7
    28H        1A1F                     MOVE.B  (A7)+,D5
    2AH        285F                     MOVE.L  (A7)+,A4
    2CH        4A05                     TST.B   D5
    2EH        6732                     BEQ     [32H] = 00000062H
    30H        2F0C                     MOVE.L  A4,-(A7)
    32H        558F                     SUBQ.L  #2,A7
    34H        3F3C 0027                MOVE.W  #0027H,-(A7)
    38H        486C 000A                PEA     000A(A4)
    3CH        4EB9 0000 0000           JSR     GEMDOS.Delete
    42H        5C8F                     ADDQ.L  #6,A7
    44H        1A1F                     MOVE.B  (A7)+,D5
    46H        285F                     MOVE.L  (A7)+,A4
    48H        4A05                     TST.B   D5
    4AH        6716                     BEQ     [16H] = 00000062H
    4CH        2F0C                     MOVE.L  A4,-(A7)
    4EH        266E 0008                MOVE.L  0008(A6),A3
    52H        4853                     PEA     (A3)
    54H        4227                     CLR.B   -(A7)
    56H        6100 0000                BSR     [0000H] = 00000058H
    5AH        5C8F                     ADDQ.L  #6,A7
    5CH        285F                     MOVE.L  (A7)+,A4
    5EH        4EFA 0016                JMP     [0016H] = 00000076H
    62H        2F0C                     MOVE.L  A4,-(A7)
    64H        266E 0008                MOVE.L  0008(A6),A3
    68H        4853                     PEA     (A3)
    6AH        1F3C 0001                MOVE.B  #01H,-(A7)
    6EH        6100 0000                BSR     [0000H] = 00000070H
    72H        5C8F                     ADDQ.L  #6,A7
    74H        285F                     MOVE.L  (A7)+,A4
    76H        2F0C                     MOVE.L  A4,-(A7)
    78H        558F                     SUBQ.L  #2,A7
    7AH        2F2C 0002                MOVE.L  0002(A4),-(A7)
    7EH        4EB9 0000 0000           JSR     GEMDOS.Free
    84H        588F                     ADDQ.L  #4,A7
    86H        1A1F                     MOVE.B  (A7)+,D5
    88H        285F                     MOVE.L  (A7)+,A4
    8AH        4A05                     TST.B   D5
    8CH        4E71                     NOP
    8EH        4EFA 005A                JMP     [005AH] = 000000EAH
    92H        2F0C                     MOVE.L  A4,-(A7)
    94H        266E 0008                MOVE.L  0008(A6),A3
    98H        4853                     PEA     (A3)
    9AH        6100 0000                BSR     [0000H] = 0000009CH
    9EH        588F                     ADDQ.L  #4,A7
    A0H        285F                     MOVE.L  (A7)+,A4
    A2H        4A14                     TST.B   (A4)
    A4H        662C                     BNE     [2CH] = 000000D2H
    A6H        2F0C                     MOVE.L  A4,-(A7)
    A8H        558F                     SUBQ.L  #2,A7
    AAH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    AEH        4EB9 0000 0000           JSR     GEMDOS.Close
    B4H        548F                     ADDQ.L  #2,A7
    B6H        1A1F                     MOVE.B  (A7)+,D5
    B8H        285F                     MOVE.L  (A7)+,A4
    BAH        4A05                     TST.B   D5
    BCH        6614                     BNE     [14H] = 000000D2H
    BEH        2F0C                     MOVE.L  A4,-(A7)
    C0H        266E 0008                MOVE.L  0008(A6),A3
    C4H        4853                     PEA     (A3)
    C6H        1F3C 0001                MOVE.B  #01H,-(A7)
    CAH        6100 0000                BSR     [0000H] = 000000CCH
    CEH        5C8F                     ADDQ.L  #6,A7
    D0H        285F                     MOVE.L  (A7)+,A4
    D2H        2F0C                     MOVE.L  A4,-(A7)
    D4H        558F                     SUBQ.L  #2,A7
    D6H        2F2C 0002                MOVE.L  0002(A4),-(A7)
    DAH        4EB9 0000 0000           JSR     GEMDOS.Free
    E0H        588F                     ADDQ.L  #4,A7
    E2H        1A1F                     MOVE.B  (A7)+,D5
    E4H        285F                     MOVE.L  (A7)+,A4
    E6H        4A05                     TST.B   D5
    E8H        4E71                     NOP
    EAH        4E5E                     UNLK    A6
    ECH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    22H, procnum = 35, modnum =  3  checksum: o.k.

ref ext proc call at    3EH, procnum = 38, modnum =  3  checksum: o.k.

ref own quick call at    58H, procnum = 26  checksum: o.k.

ref own quick call at    70H, procnum = 26  checksum: o.k.

ref ext proc call at    80H, procnum = 43, modnum =  3  checksum: o.k.

ref own quick call at    9CH, procnum = 21  checksum: o.k.

ref ext proc call at    B0H, procnum = 35, modnum =  3  checksum: o.k.

ref own quick call at    CCH, procnum = 26  checksum: o.k.

ref ext proc call at    DCH, procnum = 43, modnum =  3  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 306
PROCEDURE Lookup(VAR File; VAR ARRAY CHAR; BOOLEAN);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        286E 0010                MOVE.L  0010(A6),A4
     8H        2F0C                     MOVE.L  A4,-(A7)
     AH        266E 0010                MOVE.L  0010(A6),A3
     EH        4853                     PEA     (A3)
    10H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    14H        266E 000A                MOVE.L  000A(A6),A3
    18H        4853                     PEA     (A3)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        4FEF 000A                LEA     000A(A7),A7
    22H        285F                     MOVE.L  (A7)+,A4
    24H        4A14                     TST.B   (A4)
    26H        6602                     BNE     [02H] = 0000002AH
    28H        6004                     BRA     [04H] = 0000002EH
    2AH        4EFA 0102                JMP     [0102H] = 0000012EH
    2EH        2F0C                     MOVE.L  A4,-(A7)
    30H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    34H        266E 000A                MOVE.L  000A(A6),A3
    38H        4853                     PEA     (A3)
    3AH        4267                     CLR.W   -(A7)
    3CH        486C 0008                PEA     0008(A4)
    40H        4EB9 0000 0000           JSR     GEMDOS.Open
    46H        4FEF 000C                LEA     000C(A7),A7
    4AH        285F                     MOVE.L  (A7)+,A4
    4CH        4A6C 0008                TST.W   0008(A4)
    50H        6D40                     BLT     [40H] = 00000092H
    52H        197C 0004 0006           MOVE.B  #04H,0006(A4)
    58H        2F0C                     MOVE.L  A4,-(A7)
    5AH        42A7                     CLR.L   -(A7)
    5CH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    60H        1F3C 0002                MOVE.B  #02H,-(A7)
    64H        486C 0032                PEA     0032(A4)
    68H        4EB9 0000 0000           JSR     GEMDOS.Seek
    6EH        4FEF 000C                LEA     000C(A7),A7
    72H        285F                     MOVE.L  (A7)+,A4
    74H        2F0C                     MOVE.L  A4,-(A7)
    76H        42A7                     CLR.L   -(A7)
    78H        3F2C 0008                MOVE.W  0008(A4),-(A7)
    7CH        4227                     CLR.B   -(A7)
    7EH        486E FFFC                PEA     FFFC(A6)
    82H        4EB9 0000 0000           JSR     GEMDOS.Seek
    88H        4FEF 000C                LEA     000C(A7),A7
    8CH        285F                     MOVE.L  (A7)+,A4
    8EH        4EFA 0092                JMP     [0092H] = 00000122H
    92H        4A2E 0008                TST.B   0008(A6)
    96H        675E                     BEQ     [5EH] = 000000F6H
    98H        197C 0008 0006           MOVE.B  #08H,0006(A4)
    9EH        2F0C                     MOVE.L  A4,-(A7)
    A0H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    A4H        266E 000A                MOVE.L  000A(A6),A3
    A8H        4853                     PEA     (A3)
    AAH        4267                     CLR.W   -(A7)
    ACH        486C 0008                PEA     0008(A4)
    B0H        4EB9 0000 0000           JSR     GEMDOS.Create
    B6H        4FEF 000C                LEA     000C(A7),A7
    BAH        285F                     MOVE.L  (A7)+,A4
    BCH        4A6C 0008                TST.W   0008(A4)
    C0H        6C30                     BGE     [30H] = 000000F2H
    C2H        2F0C                     MOVE.L  A4,-(A7)
    C4H        558F                     SUBQ.L  #2,A7
    C6H        2F2C 0002                MOVE.L  0002(A4),-(A7)
    CAH        4EB9 0000 0000           JSR     GEMDOS.Free
    D0H        588F                     ADDQ.L  #4,A7
    D2H        1A1F                     MOVE.B  (A7)+,D5
    D4H        285F                     MOVE.L  (A7)+,A4
    D6H        4A05                     TST.B   D5
    D8H        4E71                     NOP
    DAH        2F0C                     MOVE.L  A4,-(A7)
    DCH        266E 0010                MOVE.L  0010(A6),A3
    E0H        4853                     PEA     (A3)
    E2H        1F3C 0001                MOVE.B  #01H,-(A7)
    E6H        6100 0000                BSR     [0000H] = 000000E8H
    EAH        5C8F                     ADDQ.L  #6,A7
    ECH        285F                     MOVE.L  (A7)+,A4
    EEH        4E5E                     UNLK    A6
    F0H        4E75                     RTS
    F2H        4EFA 002E                JMP     [002EH] = 00000122H
    F6H        2F0C                     MOVE.L  A4,-(A7)
    F8H        266E 0010                MOVE.L  0010(A6),A3
    FCH        4853                     PEA     (A3)
    FEH        1F3C 0005                MOVE.B  #05H,-(A7)
   102H        6100 0000                BSR     [0000H] = 00000104H
   106H        5C8F                     ADDQ.L  #6,A7
   108H        285F                     MOVE.L  (A7)+,A4
   10AH        2F0C                     MOVE.L  A4,-(A7)
   10CH        558F                     SUBQ.L  #2,A7
   10EH        2F2C 0002                MOVE.L  0002(A4),-(A7)
   112H        4EB9 0000 0000           JSR     GEMDOS.Free
   118H        588F                     ADDQ.L  #4,A7
   11AH        1A1F                     MOVE.B  (A7)+,D5
   11CH        285F                     MOVE.L  (A7)+,A4
   11EH        4A05                     TST.B   D5
   120H        4E71                     NOP
   122H        4AAC 0032                TST.L   0032(A4)
   126H        57C5                     SEQ     D5
   128H        4405                     NEG.B   D5
   12AH        1945 0007                MOVE.B  D5,0007(A4)
   12EH        4E5E                     UNLK    A6
   130H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum = 20  checksum: o.k.

ref ext proc call at    42H, procnum = 34, modnum =  3  checksum: o.k.

ref ext proc call at    6AH, procnum = 39, modnum =  3  checksum: o.k.

ref ext proc call at    84H, procnum = 39, modnum =  3  checksum: o.k.

ref ext proc call at    B2H, procnum = 33, modnum =  3  checksum: o.k.

ref ext proc call at    CCH, procnum = 43, modnum =  3  checksum: o.k.

ref own quick call at    E8H, procnum = 26  checksum: o.k.

ref own quick call at   104H, procnum = 26  checksum: o.k.

ref ext proc call at   114H, procnum = 43, modnum =  3  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 364
PROCEDURE Rename(VAR File; VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFC2                LINK    A6,#FFC2H
     4H        286E 000E                MOVE.L  000E(A6),A4
     8H        266E 0008                MOVE.L  0008(A6),A3
     CH        4A13                     TST.B   (A3)
     EH        6602                     BNE     [02H] = 00000012H
    10H        6004                     BRA     [04H] = 00000016H
    12H        4EFA 010E                JMP     [010EH] = 00000122H
    16H        1A2C 0006                MOVE.B  0006(A4),D5
    1AH        0805 0006                BTST    #0006H,D5
    1EH        6602                     BNE     [02H] = 00000022H
    20H        6004                     BRA     [04H] = 00000026H
    22H        4EFA 00FA                JMP     [00FAH] = 0000011EH
    26H        0C79 0009 0000 0000      CMPI.W  #0009H,00000000H
    2EH        6518                     BCS     [18H] = 00000048H
    30H        2F0C                     MOVE.L  A4,-(A7)
    32H        266E 000E                MOVE.L  000E(A6),A3
    36H        4853                     PEA     (A3)
    38H        1F3C 0007                MOVE.B  #07H,-(A7)
    3CH        6100 0000                BSR     [0000H] = 0000003EH
    40H        5C8F                     ADDQ.L  #6,A7
    42H        285F                     MOVE.L  (A7)+,A4
    44H        4EFA 00D8                JMP     [00D8H] = 0000011EH
    48H        3A39 0000 0000           MOVE.W  00000000H,D5
    4EH        0645 0030                ADDI.W  #0030H,D5
    52H        1D45 FFC3                MOVE.B  D5,FFC3(A6)
    56H        2F0C                     MOVE.L  A4,-(A7)
    58H        4267                     CLR.W   -(A7)
    5AH        486E FFC3                PEA     FFC3(A6)
    5EH        3F3C 003B                MOVE.W  #003BH,-(A7)
    62H        486E FFC4                PEA     FFC4(A6)
    66H        2F0C                     MOVE.L  A4,-(A7)
    68H        558F                     SUBQ.L  #2,A7
    6AH        3F3C 003B                MOVE.W  #003BH,-(A7)
    6EH        486E FFC4                PEA     FFC4(A6)
    72H        4EB9 0000 0000           JSR     Strings.Length
    78H        5C8F                     ADDQ.L  #6,A7
    7AH        3A1F                     MOVE.W  (A7)+,D5
    7CH        285F                     MOVE.L  (A7)+,A4
    7EH        5345                     SUBQ.W  #1,D5
    80H        3F05                     MOVE.W  D5,-(A7)
    82H        4EB9 0000 0000           JSR     Strings.Insert
    88H        4FEF 000E                LEA     000E(A7),A7
    8CH        285F                     MOVE.L  (A7)+,A4
    8EH        5279 0000 0000           ADDQ.W  #1,00000000H
    94H        2F0C                     MOVE.L  A4,-(A7)
    96H        3F3C 0003                MOVE.W  #0003H,-(A7)
    9AH        4879 0000 0006           PEA     00000006H
    A0H        3F3C 003B                MOVE.W  #003BH,-(A7)
    A4H        486E FFC4                PEA     FFC4(A6)
    A8H        2F0C                     MOVE.L  A4,-(A7)
    AAH        558F                     SUBQ.L  #2,A7
    ACH        3F3C 003B                MOVE.W  #003BH,-(A7)
    B0H        486E FFC4                PEA     FFC4(A6)
    B4H        4EB9 0000 0000           JSR     Strings.Length
    BAH        5C8F                     ADDQ.L  #6,A7
    BCH        3A1F                     MOVE.W  (A7)+,D5
    BEH        285F                     MOVE.L  (A7)+,A4
    C0H        5345                     SUBQ.W  #1,D5
    C2H        3F05                     MOVE.W  D5,-(A7)
    C4H        4EB9 0000 0000           JSR     Strings.Insert
    CAH        4FEF 000E                LEA     000E(A7),A7
    CEH        285F                     MOVE.L  (A7)+,A4
    D0H        2F0C                     MOVE.L  A4,-(A7)
    D2H        3F3C 0027                MOVE.W  #0027H,-(A7)
    D6H        486C 000A                PEA     000A(A4)
    DAH        3F3C 003B                MOVE.W  #003BH,-(A7)
    DEH        486E FFC4                PEA     FFC4(A6)
    E2H        4EB9 0000 0000           JSR     GEMDOS.Rename
    E8H        4FEF 000C                LEA     000C(A7),A7
    ECH        285F                     MOVE.L  (A7)+,A4
    EEH        2F0C                     MOVE.L  A4,-(A7)
    F0H        3F3C 0027                MOVE.W  #0027H,-(A7)
    F4H        486C 000A                PEA     000A(A4)
    F8H        3F3C 003B                MOVE.W  #003BH,-(A7)
    FCH        486E FFC4                PEA     FFC4(A6)
   100H        4EB9 0000 0000           JSR     Strings.Assign
   106H        4FEF 000C                LEA     000C(A7),A7
   10AH        285F                     MOVE.L  (A7)+,A4
   10CH        2F0C                     MOVE.L  A4,-(A7)
   10EH        266E 000E                MOVE.L  000E(A6),A3
   112H        4853                     PEA     (A3)
   114H        4227                     CLR.B   -(A7)
   116H        6100 0000                BSR     [0000H] = 00000118H
   11AH        5C8F                     ADDQ.L  #6,A7
   11CH        285F                     MOVE.L  (A7)+,A4
   11EH        4EFA 0048                JMP     [0048H] = 00000168H
   122H        08AC 0006 0006           BCLR    #0006H,0006(A4)
   128H        2F0C                     MOVE.L  A4,-(A7)
   12AH        3F3C 0027                MOVE.W  #0027H,-(A7)
   12EH        486C 000A                PEA     000A(A4)
   132H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   136H        266E 0008                MOVE.L  0008(A6),A3
   13AH        4853                     PEA     (A3)
   13CH        4EB9 0000 0000           JSR     GEMDOS.Rename
   142H        4FEF 000C                LEA     000C(A7),A7
   146H        285F                     MOVE.L  (A7)+,A4
   148H        2F0C                     MOVE.L  A4,-(A7)
   14AH        3F3C 0027                MOVE.W  #0027H,-(A7)
   14EH        486C 000A                PEA     000A(A4)
   152H        3F2E 000C                MOVE.W  000C(A6),-(A7)
   156H        266E 0008                MOVE.L  0008(A6),A3
   15AH        4853                     PEA     (A3)
   15CH        4EB9 0000 0000           JSR     Strings.Assign
   162H        4FEF 000C                LEA     000C(A7),A7
   166H        285F                     MOVE.L  (A7)+,A4
   168H        4E5E                     UNLK    A6
   16AH        4E75                     RTS
  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own quick call at    3EH, procnum = 26  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref ext proc call at    74H, procnum =  7, modnum =  2  checksum: o.k.

ref ext proc call at    84H, procnum =  3, modnum =  2  checksum: o.k.

ref own data at    90H  checksum: o.k.

ref own string: at    9CH  checksum: o.k.

ref ext proc call at    B6H, procnum =  7, modnum =  2  checksum: o.k.

ref ext proc call at    C6H, procnum =  3, modnum =  2  checksum: o.k.

ref ext proc call at    E4H, procnum = 49, modnum =  3  checksum: o.k.

ref ext proc call at   102H, procnum =  2, modnum =  2  checksum: o.k.

ref own quick call at   118H, procnum = 26  checksum: o.k.

ref ext proc call at   13EH, procnum = 49, modnum =  3  checksum: o.k.

ref ext proc call at   15EH, procnum =  2, modnum =  2  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 110
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        4854                     PEA     (A4)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        588F                     ADDQ.L  #4,A7
    10H        286E 000A                MOVE.L  000A(A6),A4
    14H        2D6C 003A FFFC           MOVE.L  003A(A4),FFFC(A6)
    1AH        2F0C                     MOVE.L  A4,-(A7)
    1CH        558F                     SUBQ.L  #2,A7
    1EH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    22H        4EB9 0000 0000           JSR     GEMDOS.Close
    28H        548F                     ADDQ.L  #2,A7
    2AH        1A1F                     MOVE.B  (A7)+,D5
    2CH        285F                     MOVE.L  (A7)+,A4
    2EH        4A05                     TST.B   D5
    30H        4E71                     NOP
    32H        2F0C                     MOVE.L  A4,-(A7)
    34H        3F3C 0027                MOVE.W  #0027H,-(A7)
    38H        486C 000A                PEA     000A(A4)
    3CH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    40H        486C 0008                PEA     0008(A4)
    44H        4EB9 0000 0000           JSR     GEMDOS.Open
    4AH        4FEF 000C                LEA     000C(A7),A7
    4EH        285F                     MOVE.L  (A7)+,A4
    50H        2F0C                     MOVE.L  A4,-(A7)
    52H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    56H        4267                     CLR.W   -(A7)
    58H        4227                     CLR.B   -(A7)
    5AH        486E FFFC                PEA     FFFC(A6)
    5EH        4EB9 0000 0000           JSR     GEMDOS.Seek
    64H        4FEF 000C                LEA     000C(A7),A7
    68H        285F                     MOVE.L  (A7)+,A4
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 21  checksum: o.k.

ref ext proc call at    24H, procnum = 35, modnum =  3  checksum: o.k.

ref ext proc call at    46H, procnum = 34, modnum =  3  checksum: o.k.

ref ext proc call at    60H, procnum = 39, modnum =  3  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 56
PROCEDURE SetRead(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        1A2C 0006                MOVE.B  0006(A4),D5
     CH        0205 000C                ANDI.B  #0CH,D5
    10H        0C05 0004                CMPI.B  #04H,D5
    14H        671E                     BEQ     [1EH] = 00000034H
    16H        08EC 0002 0006           BSET    #0002H,0006(A4)
    1CH        08AC 0003 0006           BCLR    #0003H,0006(A4)
    22H        2F0C                     MOVE.L  A4,-(A7)
    24H        266E 0008                MOVE.L  0008(A6),A3
    28H        4853                     PEA     (A3)
    2AH        4267                     CLR.W   -(A7)
    2CH        6100 0000                BSR     [0000H] = 0000002EH
    30H        5C8F                     ADDQ.L  #6,A7
    32H        285F                     MOVE.L  (A7)+,A4
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref own quick call at    2EH, procnum = 27  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 58
PROCEDURE SetWrite(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        1A2C 0006                MOVE.B  0006(A4),D5
     CH        0205 000C                ANDI.B  #0CH,D5
    10H        0C05 0008                CMPI.B  #08H,D5
    14H        6720                     BEQ     [20H] = 00000036H
    16H        08EC 0003 0006           BSET    #0003H,0006(A4)
    1CH        08AC 0002 0006           BCLR    #0002H,0006(A4)
    22H        2F0C                     MOVE.L  A4,-(A7)
    24H        266E 0008                MOVE.L  0008(A6),A3
    28H        4853                     PEA     (A3)
    2AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    2EH        6100 0000                BSR     [0000H] = 00000030H
    32H        5C8F                     ADDQ.L  #6,A7
    34H        285F                     MOVE.L  (A7)+,A4
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref own quick call at    30H, procnum = 27  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 58
PROCEDURE SetModify(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        1A2C 0006                MOVE.B  0006(A4),D5
     CH        0205 000C                ANDI.B  #0CH,D5
    10H        0C05 000C                CMPI.B  #0CH,D5
    14H        6720                     BEQ     [20H] = 00000036H
    16H        08EC 0003 0006           BSET    #0003H,0006(A4)
    1CH        08EC 0002 0006           BSET    #0002H,0006(A4)
    22H        2F0C                     MOVE.L  A4,-(A7)
    24H        266E 0008                MOVE.L  0008(A6),A3
    28H        4853                     PEA     (A3)
    2AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    2EH        6100 0000                BSR     [0000H] = 00000030H
    32H        5C8F                     ADDQ.L  #6,A7
    34H        285F                     MOVE.L  (A7)+,A4
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref own quick call at    30H, procnum = 27  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 16
PROCEDURE SetOpen(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        18BC 0002                MOVE.B  #02H,(A4)
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 16
PROCEDURE Doio(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        18BC 0002                MOVE.B  #02H,(A4)
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 144
PROCEDURE SetPos(VAR File; LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        08AC 0005 0006           BCLR    #0005H,0006(A4)
     EH        2A2E 0008                MOVE.L  0008(A6),D5
    12H        BAAC 0032                CMP.L   0032(A4),D5
    16H        630C                     BLS     [0CH] = 00000024H
    18H        18BC 0003                MOVE.B  #03H,(A4)
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
    20H        4EFA 0004                JMP     [0004H] = 00000026H
    24H        4214                     CLR.B   (A4)
    26H        2A2E 0008                MOVE.L  0008(A6),D5
    2AH        E68D                     LSR.L   #3,D5
    2CH        E08D                     LSR.L   #8,D5
    2EH        700B                     MOVEQ   #0BH,D0
    30H        E1A5                     ASL.L   D0,D5
    32H        2D45 FFFC                MOVE.L  D5,FFFC(A6)
    36H        2A2E FFFC                MOVE.L  FFFC(A6),D5
    3AH        BAAC 0036                CMP.L   0036(A4),D5
    3EH        6718                     BEQ     [18H] = 00000058H
    40H        2F0C                     MOVE.L  A4,-(A7)
    42H        266E 000C                MOVE.L  000C(A6),A3
    46H        4853                     PEA     (A3)
    48H        6100 0000                BSR     [0000H] = 0000004AH
    4CH        588F                     ADDQ.L  #4,A7
    4EH        285F                     MOVE.L  (A7)+,A4
    50H        4A14                     TST.B   (A4)
    52H        6704                     BEQ     [04H] = 00000058H
    54H        4E5E                     UNLK    A6
    56H        4E75                     RTS
    58H        2F0C                     MOVE.L  A4,-(A7)
    5AH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    5EH        3F2C 0008                MOVE.W  0008(A4),-(A7)
    62H        4227                     CLR.B   -(A7)
    64H        486E FFFC                PEA     FFFC(A6)
    68H        4EB9 0000 0000           JSR     GEMDOS.Seek
    6EH        4FEF 000C                LEA     000C(A7),A7
    72H        285F                     MOVE.L  (A7)+,A4
    74H        296E 0008 003A           MOVE.L  0008(A6),003A(A4)
    7AH        4214                     CLR.B   (A4)
    7CH        2A2C 003A                MOVE.L  003A(A4),D5
    80H        BAAC 0032                CMP.L   0032(A4),D5
    84H        57C5                     SEQ     D5
    86H        4405                     NEG.B   D5
    88H        1945 0007                MOVE.B  D5,0007(A4)
    8CH        4E5E                     UNLK    A6
    8EH        4E75                     RTS
  checksum: o.k.

ref own quick call at    4AH, procnum = 21  checksum: o.k.

ref ext proc call at    6AH, procnum = 39, modnum =  3  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 52
PROCEDURE GetPos(VAR File; VAR LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        266E 0008                MOVE.L  0008(A6),A3
     CH        26AC 003A                MOVE.L  003A(A4),(A3)
    10H        286E 000C                MOVE.L  000C(A6),A4
    14H        4214                     CLR.B   (A4)
    16H        286E 000C                MOVE.L  000C(A6),A4
    1AH        266E 0008                MOVE.L  0008(A6),A3
    1EH        2A13                     MOVE.L  (A3),D5
    20H        BAAC 0032                CMP.L   0032(A4),D5
    24H        57C5                     SEQ     D5
    26H        4405                     NEG.B   D5
    28H        286E 000C                MOVE.L  000C(A6),A4
    2CH        1945 0007                MOVE.B  D5,0007(A4)
    30H        4E5E                     UNLK    A6
    32H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 26
PROCEDURE Length(VAR File; VAR LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        266E 0008                MOVE.L  0008(A6),A3
     CH        26AC 0032                MOVE.L  0032(A4),(A3)
    10H        286E 000C                MOVE.L  000C(A6),A4
    14H        4214                     CLR.B   (A4)
    16H        4E5E                     UNLK    A6
    18H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 28
PROCEDURE Reset(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        286E 0008                MOVE.L  0008(A6),A4
     EH        4854                     PEA     (A4)
    10H        42A7                     CLR.L   -(A7)
    12H        6100 0000                BSR     [0000H] = 00000014H
    16H        508F                     ADDQ.L  #8,A7
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own quick call at    14H, procnum = 10  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 66
PROCEDURE Again(VAR File);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        4AAC 003A                TST.L   003A(A4)
     CH        6618                     BNE     [18H] = 00000026H
     EH        2F0C                     MOVE.L  A4,-(A7)
    10H        266E 0008                MOVE.L  0008(A6),A3
    14H        4853                     PEA     (A3)
    16H        1F3C 0001                MOVE.B  #01H,-(A7)
    1AH        6100 0000                BSR     [0000H] = 0000001CH
    1EH        5C8F                     ADDQ.L  #6,A7
    20H        285F                     MOVE.L  (A7)+,A4
    22H        4EFA 001A                JMP     [001AH] = 0000003EH
    26H        08EC 0005 0006           BSET    #0005H,0006(A4)
    2CH        2F0C                     MOVE.L  A4,-(A7)
    2EH        266E 0008                MOVE.L  0008(A6),A3
    32H        4853                     PEA     (A3)
    34H        4227                     CLR.B   -(A7)
    36H        6100 0000                BSR     [0000H] = 00000038H
    3AH        5C8F                     ADDQ.L  #6,A7
    3CH        285F                     MOVE.L  (A7)+,A4
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

ref own quick call at    1CH, procnum = 26  checksum: o.k.

ref own quick call at    38H, procnum = 26  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 146
PROCEDURE ReadWord(VAR File; VAR SYSTEM.WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        1A2C 0006                MOVE.B  0006(A4),D5
     EH        0805 0002                BTST    #0002H,D5
    12H        6766                     BEQ     [66H] = 0000007AH
    14H        1A2C 0006                MOVE.B  0006(A4),D5
    18H        0805 0005                BTST    #0005H,D5
    1CH        6734                     BEQ     [34H] = 00000052H
    1EH        08AC 0005 0006           BCLR    #0005H,0006(A4)
    24H        1A2C 0006                MOVE.B  0006(A4),D5
    28H        0805 0004                BTST    #0004H,D5
    2CH        6718                     BEQ     [18H] = 00000046H
    2EH        2F0C                     MOVE.L  A4,-(A7)
    30H        266E 000C                MOVE.L  000C(A6),A3
    34H        4853                     PEA     (A3)
    36H        1F3C 0001                MOVE.B  #01H,-(A7)
    3AH        6100 0000                BSR     [0000H] = 0000003CH
    3EH        5C8F                     ADDQ.L  #6,A7
    40H        285F                     MOVE.L  (A7)+,A4
    42H        4EFA 000A                JMP     [000AH] = 0000004EH
    46H        266E 0008                MOVE.L  0008(A6),A3
    4AH        36AC 0040                MOVE.W  0040(A4),(A3)
    4EH        4EFA 0026                JMP     [0026H] = 00000076H
    52H        2F0C                     MOVE.L  A4,-(A7)
    54H        266E 000C                MOVE.L  000C(A6),A3
    58H        4853                     PEA     (A3)
    5AH        266E 0008                MOVE.L  0008(A6),A3
    5EH        4853                     PEA     (A3)
    60H        6100 0000                BSR     [0000H] = 00000062H
    64H        508F                     ADDQ.L  #8,A7
    66H        285F                     MOVE.L  (A7)+,A4
    68H        08AC 0004 0006           BCLR    #0004H,0006(A4)
    6EH        266E 0008                MOVE.L  0008(A6),A3
    72H        3953 0040                MOVE.W  (A3),0040(A4)
    76H        4EFA 0016                JMP     [0016H] = 0000008EH
    7AH        2F0C                     MOVE.L  A4,-(A7)
    7CH        266E 000C                MOVE.L  000C(A6),A3
    80H        4853                     PEA     (A3)
    82H        1F3C 0003                MOVE.B  #03H,-(A7)
    86H        6100 0000                BSR     [0000H] = 00000088H
    8AH        5C8F                     ADDQ.L  #6,A7
    8CH        285F                     MOVE.L  (A7)+,A4
    8EH        4E5E                     UNLK    A6
    90H        4E75                     RTS
  checksum: o.k.

ref own quick call at    3CH, procnum = 26  checksum: o.k.

ref own quick call at    62H, procnum = 23  checksum: o.k.

ref own quick call at    88H, procnum = 26  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 154
PROCEDURE ReadChar(VAR File; VAR CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        1A2C 0006                MOVE.B  0006(A4),D5
     EH        0805 0002                BTST    #0002H,D5
    12H        676E                     BEQ     [6EH] = 00000082H
    14H        1A2C 0006                MOVE.B  0006(A4),D5
    18H        0805 0005                BTST    #0005H,D5
    1CH        6738                     BEQ     [38H] = 00000056H
    1EH        08AC 0005 0006           BCLR    #0005H,0006(A4)
    24H        1A2C 0006                MOVE.B  0006(A4),D5
    28H        0805 0004                BTST    #0004H,D5
    2CH        6710                     BEQ     [10H] = 0000003EH
    2EH        7A00                     MOVEQ   #00H,D5
    30H        3A2C 0040                MOVE.W  0040(A4),D5
    34H        266E 0008                MOVE.L  0008(A6),A3
    38H        1685                     MOVE.B  D5,(A3)
    3AH        4EFA 0016                JMP     [0016H] = 00000052H
    3EH        2F0C                     MOVE.L  A4,-(A7)
    40H        266E 000C                MOVE.L  000C(A6),A3
    44H        4853                     PEA     (A3)
    46H        1F3C 0001                MOVE.B  #01H,-(A7)
    4AH        6100 0000                BSR     [0000H] = 0000004CH
    4EH        5C8F                     ADDQ.L  #6,A7
    50H        285F                     MOVE.L  (A7)+,A4
    52H        4EFA 002A                JMP     [002AH] = 0000007EH
    56H        2F0C                     MOVE.L  A4,-(A7)
    58H        266E 000C                MOVE.L  000C(A6),A3
    5CH        4853                     PEA     (A3)
    5EH        266E 0008                MOVE.L  0008(A6),A3
    62H        4853                     PEA     (A3)
    64H        6100 0000                BSR     [0000H] = 00000066H
    68H        508F                     ADDQ.L  #8,A7
    6AH        285F                     MOVE.L  (A7)+,A4
    6CH        08EC 0004 0006           BSET    #0004H,0006(A4)
    72H        7A00                     MOVEQ   #00H,D5
    74H        266E 0008                MOVE.L  0008(A6),A3
    78H        1A13                     MOVE.B  (A3),D5
    7AH        3945 0040                MOVE.W  D5,0040(A4)
    7EH        4EFA 0016                JMP     [0016H] = 00000096H
    82H        2F0C                     MOVE.L  A4,-(A7)
    84H        266E 000C                MOVE.L  000C(A6),A3
    88H        4853                     PEA     (A3)
    8AH        1F3C 0003                MOVE.B  #03H,-(A7)
    8EH        6100 0000                BSR     [0000H] = 00000090H
    92H        5C8F                     ADDQ.L  #6,A7
    94H        285F                     MOVE.L  (A7)+,A4
    96H        4E5E                     UNLK    A6
    98H        4E75                     RTS
  checksum: o.k.

ref own quick call at    4CH, procnum = 26  checksum: o.k.

ref own quick call at    66H, procnum = 22  checksum: o.k.

ref own quick call at    90H, procnum = 26  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 86
PROCEDURE WriteWord(VAR File; SYSTEM.WORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        422C 0007                CLR.B   0007(A4)
     EH        1A2C 0006                MOVE.B  0006(A4),D5
    12H        0805 0003                BTST    #0003H,D5
    16H        6726                     BEQ     [26H] = 0000003EH
    18H        2F0C                     MOVE.L  A4,-(A7)
    1AH        266E 000A                MOVE.L  000A(A6),A3
    1EH        4853                     PEA     (A3)
    20H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    24H        1A2C 0006                MOVE.B  0006(A4),D5
    28H        0805 0002                BTST    #0002H,D5
    2CH        56C5                     SNE     D5
    2EH        4405                     NEG.B   D5
    30H        1F05                     MOVE.B  D5,-(A7)
    32H        6100 0000                BSR     [0000H] = 00000034H
    36H        508F                     ADDQ.L  #8,A7
    38H        285F                     MOVE.L  (A7)+,A4
    3AH        4EFA 0016                JMP     [0016H] = 00000052H
    3EH        2F0C                     MOVE.L  A4,-(A7)
    40H        266E 000A                MOVE.L  000A(A6),A3
    44H        4853                     PEA     (A3)
    46H        1F3C 0003                MOVE.B  #03H,-(A7)
    4AH        6100 0000                BSR     [0000H] = 0000004CH
    4EH        5C8F                     ADDQ.L  #6,A7
    50H        285F                     MOVE.L  (A7)+,A4
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref own quick call at    34H, procnum = 25  checksum: o.k.

ref own quick call at    4CH, procnum = 26  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 86
PROCEDURE WriteChar(VAR File; CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000A                MOVE.L  000A(A6),A4
     8H        4214                     CLR.B   (A4)
     AH        422C 0007                CLR.B   0007(A4)
     EH        1A2C 0006                MOVE.B  0006(A4),D5
    12H        0805 0003                BTST    #0003H,D5
    16H        6726                     BEQ     [26H] = 0000003EH
    18H        2F0C                     MOVE.L  A4,-(A7)
    1AH        266E 000A                MOVE.L  000A(A6),A3
    1EH        4853                     PEA     (A3)
    20H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    24H        1A2C 0006                MOVE.B  0006(A4),D5
    28H        0805 0002                BTST    #0002H,D5
    2CH        56C5                     SNE     D5
    2EH        4405                     NEG.B   D5
    30H        1F05                     MOVE.B  D5,-(A7)
    32H        6100 0000                BSR     [0000H] = 00000034H
    36H        508F                     ADDQ.L  #8,A7
    38H        285F                     MOVE.L  (A7)+,A4
    3AH        4EFA 0016                JMP     [0016H] = 00000052H
    3EH        2F0C                     MOVE.L  A4,-(A7)
    40H        266E 000A                MOVE.L  000A(A6),A3
    44H        4853                     PEA     (A3)
    46H        1F3C 0003                MOVE.B  #03H,-(A7)
    4AH        6100 0000                BSR     [0000H] = 0000004CH
    4EH        5C8F                     ADDQ.L  #6,A7
    50H        285F                     MOVE.L  (A7)+,A4
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref own quick call at    34H, procnum = 24  checksum: o.k.

ref own quick call at    4CH, procnum = 26  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 24
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        4279 0000 0000           CLR.W   00000000H
    10H        4E5E                     UNLK    A6
    12H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref ext init call at    12H  checksum: o.k.

string data:, number of bytes = 12
NO DECODE -------- DATA

     0H         2E54     4D50     0000     2E54     4D50     
     AH         0000       checksum: o.k.

scmod end  checksum: o.k.
