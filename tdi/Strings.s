link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  Strings, key =  2102H  F1D3H  5C23H  checksum: o.k.

data size, number of bytes = 2  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 14
PROCEDURE InitStringModule();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4239 0000 0000           CLR.B   terminator
     AH        4E5E                     UNLK    A6
     CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 54
PROCEDURE Length(VAR Str: ARRAY OF CHAR): CARDINAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        621A                     BHI     [1AH] = 0000002CH
    12H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    16H        286E 0008                MOVE.L  0008(A6),A4
    1AH        1834 5000                MOVE.B  00H(A4,D5.W),D4
    1EH        B839 0000 0000           CMP.B   terminator,D4
    24H        6706                     BEQ     [06H] = 0000002CH
    26H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    2AH        60DC                     BRA     [DCH] = 00000008H
    2CH        3D6E FFFE 000E           MOVE.W  FFFE(A6),000E(A6)
    32H        4E5E                     UNLK    A6
    34H        4E75                     RTS
  checksum: o.k.

ref own data at    20H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 106
PROCEDURE Assign(VAR Dest: ARRAY OF CHAR; VAR Source: ARRAY OF CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000C                CMP.W   000C(A6),D5
    10H        623A                     BHI     [3AH] = 0000004CH
    12H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    16H        BA6E 0012                CMP.W   0012(A6),D5
    1AH        6230                     BHI     [30H] = 0000004CH
    1CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    20H        286E 0008                MOVE.L  0008(A6),A4
    24H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    28H        B839 0000 0000           CMP.B   terminator,D4
    2EH        671C                     BEQ     [1CH] = 0000004CH
    30H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    34H        286E 0008                MOVE.L  0008(A6),A4
    38H        382E FFFE                MOVE.W  FFFE(A6),D4
    3CH        266E 000E                MOVE.L  000E(A6),A3
    40H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    46H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    4AH        60BC                     BRA     [BCH] = 00000008H
    4CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    50H        BA6E 0012                CMP.W   0012(A6),D5
    54H        6210                     BHI     [10H] = 00000066H
    56H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    5AH        286E 000E                MOVE.L  000E(A6),A4
    5EH        19B9 0000 0000 5000      MOVE.B  terminator,00H(A4,D5.W)
    66H        4E5E                     UNLK    A6
    68H        4E75                     RTS
  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    60H  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 224
PROCEDURE Insert(VAR SubStr: ARRAY OF CHAR; VAR Str: ARRAY OF CHAR; Index: CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        558F                     SUBQ.L  #2,A7
     6H        3F2E 0014                MOVE.W  0014(A6),-(A7)
     AH        286E 0010                MOVE.L  0010(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     Length
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3D5F FFFC                MOVE.W  (A7)+,FFFC(A6)
    1AH        558F                     SUBQ.L  #2,A7
    1CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    20H        286E 000A                MOVE.L  000A(A6),A4
    24H        4854                     PEA     (A4)
    26H        6100 0000                BSR     Length
    2AH        5C8F                     ADDQ.L  #6,A7
    2CH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    30H        4A6E FFFC                TST.W   FFFC(A6)
    34H        670A                     BEQ     [0AH] = 00000040H
    36H        3A2E 0008                MOVE.W  0008(A6),D5
    3AH        BA6E FFFE                CMP.W   FFFE(A6),D5
    3EH        6304                     BLS     [04H] = 00000044H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
    44H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    48H        DA6E FFFC                ADD.W   FFFC(A6),D5
    4CH        3D45 FFFA                MOVE.W  D5,FFFA(A6)
    50H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    54H        BA6E 000E                CMP.W   000E(A6),D5
    58H        6312                     BLS     [12H] = 0000006CH
    5AH        536E FFFA                SUBQ.W  #1,FFFA(A6)
    5EH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    62H        BA6E 000E                CMP.W   000E(A6),D5
    66H        6304                     BLS     [04H] = 0000006CH
    68H        4E5E                     UNLK    A6
    6AH        4E75                     RTS
    6CH        3A2E 0008                MOVE.W  0008(A6),D5
    70H        DA6E FFFC                ADD.W   FFFC(A6),D5
    74H        BA6E FFFA                CMP.W   FFFA(A6),D5
    78H        6220                     BHI     [20H] = 0000009AH
    7AH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    7EH        9A6E FFFC                SUB.W   FFFC(A6),D5
    82H        286E 000A                MOVE.L  000A(A6),A4
    86H        382E FFFA                MOVE.W  FFFA(A6),D4
    8AH        266E 000A                MOVE.L  000A(A6),A3
    8EH        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    94H        536E FFFA                SUBQ.W  #1,FFFA(A6)
    98H        60D2                     BRA     [D2H] = 0000006CH
    9AH        426E FFFA                CLR.W   FFFA(A6)
    9EH        3A2E FFFC                MOVE.W  FFFC(A6),D5
    A2H        5345                     SUBQ.W  #1,D5
    A4H        3F05                     MOVE.W  D5,-(A7)
    A6H        302E FFFA                MOVE.W  FFFA(A6),D0
    AAH        B057                     CMP.W   (A7),D0
    ACH        6304                     BLS     [04H] = 000000B2H
    AEH        4EFA 002A                JMP     [002AH] = 000000DAH
    B2H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    B6H        286E 0010                MOVE.L  0010(A6),A4
    BAH        382E FFFA                MOVE.W  FFFA(A6),D4
    BEH        D86E 0008                ADD.W   0008(A6),D4
    C2H        266E 000A                MOVE.L  000A(A6),A3
    C6H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    CCH        302E FFFA                MOVE.W  FFFA(A6),D0
    D0H        B057                     CMP.W   (A7),D0
    D2H        6406                     BCC     [06H] = 000000DAH
    D4H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    D8H        60D8                     BRA     [D8H] = 000000B2H
    DAH        548F                     ADDQ.L  #2,A7
    DCH        4E5E                     UNLK    A6
    DEH        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum =  7  checksum: o.k.

ref own quick call at    28H, procnum =  7  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 118
PROCEDURE Delete(VAR Str: ARRAY OF CHAR; Index: CARDINAL; Len: CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        558F                     SUBQ.L  #2,A7
     6H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     AH        286E 000C                MOVE.L  000C(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     Length
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    1AH        4A6E 0008                TST.W   0008(A6)
    1EH        670A                     BEQ     [0AH] = 0000002AH
    20H        3A2E 000A                MOVE.W  000A(A6),D5
    24H        BA6E FFFE                CMP.W   FFFE(A6),D5
    28H        6504                     BCS     [04H] = 0000002EH
    2AH        4E5E                     UNLK    A6
    2CH        4E75                     RTS
    2EH        3D6E 000A FFFC           MOVE.W  000A(A6),FFFC(A6)
    34H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    38H        9A6E 0008                SUB.W   0008(A6),D5
    3CH        BA6E FFFC                CMP.W   FFFC(A6),D5
    40H        6320                     BLS     [20H] = 00000062H
    42H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    46H        DA6E 0008                ADD.W   0008(A6),D5
    4AH        286E 000C                MOVE.L  000C(A6),A4
    4EH        382E FFFC                MOVE.W  FFFC(A6),D4
    52H        266E 000C                MOVE.L  000C(A6),A3
    56H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    5CH        526E FFFC                ADDQ.W  #1,FFFC(A6)
    60H        60D2                     BRA     [D2H] = 00000034H
    62H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    66H        286E 000C                MOVE.L  000C(A6),A4
    6AH        19B9 0000 0000 5000      MOVE.B  terminator,00H(A4,D5.W)
    72H        4E5E                     UNLK    A6
    74H        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum =  7  checksum: o.k.

ref own data at    6CH  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 120
PROCEDURE Copy(VAR Str: ARRAY OF CHAR; Index: CARDINAL; Len: CARDINAL; VAR Result: ARRAY OF CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        BA6E 000E                CMP.W   000E(A6),D5
    10H        6448                     BCC     [48H] = 0000005AH
    12H        558F                     SUBQ.L  #2,A7
    14H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    18H        286E 0012                MOVE.L  0012(A6),A4
    1CH        4854                     PEA     (A4)
    1EH        6100 0000                BSR     Length
    22H        5C8F                     ADDQ.L  #6,A7
    24H        3A1F                     MOVE.W  (A7)+,D5
    26H        9A6E 0010                SUB.W   0010(A6),D5
    2AH        BA6E FFFE                CMP.W   FFFE(A6),D5
    2EH        632A                     BLS     [2AH] = 0000005AH
    30H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    34H        BA6E 000C                CMP.W   000C(A6),D5
    38H        6220                     BHI     [20H] = 0000005AH
    3AH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    3EH        DA6E 0010                ADD.W   0010(A6),D5
    42H        286E 0012                MOVE.L  0012(A6),A4
    46H        382E FFFE                MOVE.W  FFFE(A6),D4
    4AH        266E 0008                MOVE.L  0008(A6),A3
    4EH        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    54H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    58H        60AE                     BRA     [AEH] = 00000008H
    5AH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    5EH        BA6E 000C                CMP.W   000C(A6),D5
    62H        6210                     BHI     [10H] = 00000074H
    64H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    68H        286E 0008                MOVE.L  0008(A6),A4
    6CH        19B9 0000 0000 5000      MOVE.B  terminator,00H(A4,D5.W)
    74H        4E5E                     UNLK    A6
    76H        4E75                     RTS
  checksum: o.k.

ref own quick call at    20H, procnum =  7  checksum: o.k.

ref own data at    6EH  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 236
PROCEDURE Concat(VAR S1: ARRAY OF CHAR; VAR S2: ARRAY OF CHAR; VAR Result: ARRAY OF CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        426E FFFA                CLR.W   FFFA(A6)
     8H        558F                     SUBQ.L  #2,A7
     AH        3F2E 0018                MOVE.W  0018(A6),-(A7)
     EH        286E 0014                MOVE.L  0014(A6),A4
    12H        4854                     PEA     (A4)
    14H        6100 0000                BSR     Length
    18H        5C8F                     ADDQ.L  #6,A7
    1AH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    1EH        558F                     SUBQ.L  #2,A7
    20H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    24H        286E 000E                MOVE.L  000E(A6),A4
    28H        4854                     PEA     (A4)
    2AH        6100 0000                BSR     Length
    2EH        5C8F                     ADDQ.L  #6,A7
    30H        3D5F FFFC                MOVE.W  (A7)+,FFFC(A6)
    34H        286E 000E                MOVE.L  000E(A6),A4
    38H        2A0C                     MOVE.L  A4,D5
    3AH        286E 0008                MOVE.L  0008(A6),A4
    3EH        280C                     MOVE.L  A4,D4
    40H        B885                     CMP.L   D5,D4
    42H        6622                     BNE     [22H] = 00000066H
    44H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    48H        286E 0014                MOVE.L  0014(A6),A4
    4CH        4854                     PEA     (A4)
    4EH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    52H        286E 000E                MOVE.L  000E(A6),A4
    56H        4854                     PEA     (A4)
    58H        4267                     CLR.W   -(A7)
    5AH        6100 0000                BSR     Insert
    5EH        4FEF 000E                LEA     000E(A7),A7
    62H        4E5E                     UNLK    A6
    64H        4E75                     RTS
    66H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    6AH        BA6E FFFE                CMP.W   FFFE(A6),D5
    6EH        6426                     BCC     [26H] = 00000096H
    70H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    74H        BA6E 000C                CMP.W   000C(A6),D5
    78H        621C                     BHI     [1CH] = 00000096H
    7AH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    7EH        286E 0014                MOVE.L  0014(A6),A4
    82H        382E FFFA                MOVE.W  FFFA(A6),D4
    86H        266E 0008                MOVE.L  0008(A6),A3
    8AH        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    90H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    94H        60D0                     BRA     [D0H] = 00000066H
    96H        426E FFF8                CLR.W   FFF8(A6)
    9AH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    9EH        BA6E 000C                CMP.W   000C(A6),D5
    A2H        622A                     BHI     [2AH] = 000000CEH
    A4H        3A2E FFF8                MOVE.W  FFF8(A6),D5
    A8H        BA6E FFFC                CMP.W   FFFC(A6),D5
    ACH        6420                     BCC     [20H] = 000000CEH
    AEH        3A2E FFF8                MOVE.W  FFF8(A6),D5
    B2H        286E 000E                MOVE.L  000E(A6),A4
    B6H        382E FFFA                MOVE.W  FFFA(A6),D4
    BAH        266E 0008                MOVE.L  0008(A6),A3
    BEH        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    C4H        526E FFFA                ADDQ.W  #1,FFFA(A6)
    C8H        526E FFF8                ADDQ.W  #1,FFF8(A6)
    CCH        60CC                     BRA     [CCH] = 0000009AH
    CEH        3A2E FFFA                MOVE.W  FFFA(A6),D5
    D2H        BA6E 000C                CMP.W   000C(A6),D5
    D6H        6210                     BHI     [10H] = 000000E8H
    D8H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    DCH        286E 0008                MOVE.L  0008(A6),A4
    E0H        19B9 0000 0000 5000      MOVE.B  terminator,00H(A4,D5.W)
    E8H        4E5E                     UNLK    A6
    EAH        4E75                     RTS
  checksum: o.k.

ref own quick call at    16H, procnum =  7  checksum: o.k.

ref own quick call at    2CH, procnum =  7  checksum: o.k.

ref own quick call at    5CH, procnum =  3  checksum: o.k.

ref own data at    E2H  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 238
PROCEDURE Compare(VAR S1: ARRAY OF CHAR; VAR S2: ARRAY OF CHAR): CompareResults;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
     CH        286E 000E                MOVE.L  000E(A6),A4
    10H        1D74 5000 FFFD           MOVE.B  00H(A4,D5.W),FFFD(A6)
    16H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        1D74 5000 FFFC           MOVE.B  00H(A4,D5.W),FFFC(A6)
    24H        1A2E FFFD                MOVE.B  FFFD(A6),D5
    28H        BA2E FFFC                CMP.B   FFFC(A6),D5
    2CH        6602                     BNE     [02H] = 00000030H
    2EH        6004                     BRA     [04H] = 00000034H
    30H        4EFA 0098                JMP     [0098H] = 000000CAH
    34H        1A2E FFFD                MOVE.B  FFFD(A6),D5
    38H        BA39 0000 0000           CMP.B   terminator,D5
    3EH        660A                     BNE     [0AH] = 0000004AH
    40H        1D7C 0001 0014           MOVE.B  #01H,0014(A6)
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
    4AH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    4EH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    52H        BA6E 0012                CMP.W   0012(A6),D5
    56H        633A                     BLS     [3AH] = 00000092H
    58H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    5CH        BA6E 000C                CMP.W   000C(A6),D5
    60H        6214                     BHI     [14H] = 00000076H
    62H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    66H        286E 0008                MOVE.L  0008(A6),A4
    6AH        1834 5000                MOVE.B  00H(A4,D5.W),D4
    6EH        B839 0000 0000           CMP.B   terminator,D4
    74H        660E                     BNE     [0EH] = 00000084H
    76H        1D7C 0001 0014           MOVE.B  #01H,0014(A6)
    7CH        4E5E                     UNLK    A6
    7EH        4E75                     RTS
    80H        4EFA 000C                JMP     [000CH] = 0000008EH
    84H        1D7C 0002 0014           MOVE.B  #02H,0014(A6)
    8AH        4E5E                     UNLK    A6
    8CH        4E75                     RTS
    8EH        4EFA 0036                JMP     [0036H] = 000000C6H
    92H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    96H        BA6E 000C                CMP.W   000C(A6),D5
    9AH        632A                     BLS     [2AH] = 000000C6H
    9CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    A0H        286E 000E                MOVE.L  000E(A6),A4
    A4H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    A8H        B839 0000 0000           CMP.B   terminator,D4
    AEH        660E                     BNE     [0EH] = 000000BEH
    B0H        1D7C 0001 0014           MOVE.B  #01H,0014(A6)
    B6H        4E5E                     UNLK    A6
    B8H        4E75                     RTS
    BAH        4EFA 000A                JMP     [000AH] = 000000C6H
    BEH        422E 0014                CLR.B   0014(A6)
    C2H        4E5E                     UNLK    A6
    C4H        4E75                     RTS
    C6H        4EFA 0022                JMP     [0022H] = 000000EAH
    CAH        1A2E FFFD                MOVE.B  FFFD(A6),D5
    CEH        BA2E FFFC                CMP.B   FFFC(A6),D5
    D2H        630C                     BLS     [0CH] = 000000E0H
    D4H        422E 0014                CLR.B   0014(A6)
    D8H        4E5E                     UNLK    A6
    DAH        4E75                     RTS
    DCH        4EFA 000C                JMP     [000CH] = 000000EAH
    E0H        1D7C 0002 0014           MOVE.B  #02H,0014(A6)
    E6H        4E5E                     UNLK    A6
    E8H        4E75                     RTS
    EAH        6000 FF1C                BRA     [FF1CH] = 00000008H
  checksum: o.k.

ref own data at    3AH  checksum: o.k.

ref own data at    70H  checksum: o.k.

ref own data at    AAH  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 180
PROCEDURE Pos(VAR Source: ARRAY OF CHAR; VAR Match: ARRAY OF CHAR; Start: CARDINAL; VAR Where: CARDINAL): BOOLEAN;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        558F                     SUBQ.L  #2,A7
     6H        3F2E 0018                MOVE.W  0018(A6),-(A7)
     AH        286E 0014                MOVE.L  0014(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     Length
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3D5F FFFC                MOVE.W  (A7)+,FFFC(A6)
    1AH        286E 0008                MOVE.L  0008(A6),A4
    1EH        38AE 000C                MOVE.W  000C(A6),(A4)
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        3A14                     MOVE.W  (A4),D5
    28H        BA6E FFFC                CMP.W   FFFC(A6),D5
    2CH        6402                     BCC     [02H] = 00000030H
    2EH        6004                     BRA     [04H] = 00000034H
    30H        4EFA 007A                JMP     [007AH] = 000000ACH
    34H        426E FFFE                CLR.W   FFFE(A6)
    38H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    3CH        BA6E 0012                CMP.W   0012(A6),D5
    40H        6214                     BHI     [14H] = 00000056H
    42H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    46H        286E 000E                MOVE.L  000E(A6),A4
    4AH        1834 5000                MOVE.B  00H(A4,D5.W),D4
    4EH        B839 0000 0000           CMP.B   terminator,D4
    54H        660E                     BNE     [0EH] = 00000064H
    56H        1D7C 0001 001A           MOVE.B  #01H,001A(A6)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
    60H        4EFA 003E                JMP     [003EH] = 000000A0H
    64H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    68H        286E 0008                MOVE.L  0008(A6),A4
    6CH        DA54                     ADD.W   (A4),D5
    6EH        BA6E FFFC                CMP.W   FFFC(A6),D5
    72H        6428                     BCC     [28H] = 0000009CH
    74H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    78H        286E 0008                MOVE.L  0008(A6),A4
    7CH        DA54                     ADD.W   (A4),D5
    7EH        286E 0014                MOVE.L  0014(A6),A4
    82H        382E FFFE                MOVE.W  FFFE(A6),D4
    86H        266E 000E                MOVE.L  000E(A6),A3
    8AH        1634 5000                MOVE.B  00H(A4,D5.W),D3
    8EH        B633 4000                CMP.B   00H(A3,D4.W),D3
    92H        6608                     BNE     [08H] = 0000009CH
    94H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    98H        4EFA 0006                JMP     [0006H] = 000000A0H
    9CH        4EFA 0004                JMP     [0004H] = 000000A2H
    A0H        6096                     BRA     [96H] = 00000038H
    A2H        286E 0008                MOVE.L  0008(A6),A4
    A6H        5254                     ADDQ.W  #1,(A4)
    A8H        6000 FF78                BRA     [FF78H] = 00000022H
    ACH        422E 001A                CLR.B   001A(A6)
    B0H        4E5E                     UNLK    A6
    B2H        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum =  7  checksum: o.k.

ref own data at    50H  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 16
PROCEDURE SetTerminator(Ch: CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        13EE 0008 0000 0000      MOVE.B  0008(A6),terminator
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 16
PROCEDURE GetTerminator(): CHAR;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        1D79 0000 0000 0008      MOVE.B  terminator,0008(A6)
     CH        4E5E                     UNLK    A6
     EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        6100 0000                BSR     InitStringModule
     EH        4E5E                     UNLK    A6
    10H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own quick call at     CH, procnum =  1  checksum: o.k.

ref ext init call at    10H  checksum: o.k.

scmod end  checksum: o.k.
