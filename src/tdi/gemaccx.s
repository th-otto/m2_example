link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMX, key =  2102H  CABEH  345EH  checksum: o.k.

data size, number of bytes = 574  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 8
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4E5E                     UNLK    A6
     6H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0003                MOVE.W  #0003H,-(A7)
     8H        4879 0000 0000           PEA     00000000H
     EH        4EB9 0000 0000           JSR     00000000H
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3F3C 0040                MOVE.W  #0040H,-(A7)
    1AH        4879 0000 0006           PEA     00000006H
    20H        4EB9 0000 0000           JSR     00000000H
    26H        5C8F                     ADDQ.L  #6,A7
    28H        3F3C 002F                MOVE.W  #002FH,-(A7)
    2CH        4879 0000 0048           PEA     00000048H
    32H        4EB9 0000 0000           JSR     00000000H
    38H        5C8F                     ADDQ.L  #6,A7
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref own string: at     AH  checksum: o.k.

ref own proc call at    10H, procnum = 31  checksum: o.k.

ref own string: at    1CH  checksum: o.k.

ref own proc call at    22H, procnum = 31  checksum: o.k.

ref own string: at    2EH  checksum: o.k.

ref own proc call at    34H, procnum = 31  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 30
 DECODE --------                        INSTRUCTION
     0H        205F                     MOVE.L  (A7)+,A0
     2H        9090                     SUB.L   (A0),D0
     4H        B0A8 0004                CMP.L   0004(A0),D0
     8H        620C                     BHI     [0CH] = 00000016H
     AH        E380                     ASL.L   #1,D0
     CH        D0A8 0008                ADD.L   0008(A0),D0
    10H        D0F0 0800                ADDA.W  00H(A0,D0.L),A0
    14H        4ED0                     JMP     (A0)
    16H        D1E8 0008                ADDA.L  0008(A0),A0
    1AH        5988                     SUBQ.L  #4,A0
    1CH        4ED0                     JMP     (A0)
  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 8
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4E5E                     UNLK    A6
     6H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E73                     RTE
  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 34, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E73                     RTE
  checksum: o.k.

proc code, procnum = 35, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E73                     RTE
  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 76
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 7C00                MOVEM.L #7C00H,-(A7)
     8H        222E 0008                MOVE.L  0008(A6),D1
     CH        242E 000C                MOVE.L  000C(A6),D2
    10H        2601                     MOVE.L  D1,D3
    12H        2801                     MOVE.L  D1,D4
    14H        2A02                     MOVE.L  D2,D5
    16H        4844                     SWAP    D4
    18H        4845                     SWAP    D5
    1AH        C2C2                     MULU    D2,D1
    1CH        C4C4                     MULU    D4,D2
    1EH        C6C5                     MULU    D5,D3
    20H        C8C5                     MULU    D5,D4
    22H        4841                     SWAP    D1
    24H        D242                     ADD.W   D2,D1
    26H        4285                     CLR.L   D5
    28H        D985                     ADDX.L  D5,D4
    2AH        D243                     ADD.W   D3,D1
    2CH        D985                     ADDX.L  D5,D4
    2EH        4841                     SWAP    D1
    30H        4242                     CLR.W   D2
    32H        4243                     CLR.W   D3
    34H        4842                     SWAP    D2
    36H        4843                     SWAP    D3
    38H        D483                     ADD.L   D3,D2
    3AH        D484                     ADD.L   D4,D2
    3CH        2D41 000C                MOVE.L  D1,000C(A6)
    40H        2D42 0008                MOVE.L  D2,0008(A6)
    44H        4CDF 003E                MOVEM.L (A7)+,#003EH
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 100
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 7800                MOVEM.L #7800H,-(A7)
     8H        222E 000C                MOVE.L  000C(A6),D1
     CH        242E 0008                MOVE.L  0008(A6),D2
    10H        B4BC 0000 FFFF           CMP.L   #0000FFFFH,D2
    16H        621E                     BHI     [1EH] = 00000036H
    18H        4243                     CLR.W   D3
    1AH        82C2                     DIVU    D2,D1
    1CH        680E                     BVC     [0EH] = 0000002CH
    1EH        3801                     MOVE.W  D1,D4
    20H        4241                     CLR.W   D1
    22H        4841                     SWAP    D1
    24H        82C2                     DIVU    D2,D1
    26H        3601                     MOVE.W  D1,D3
    28H        3204                     MOVE.W  D4,D1
    2AH        82C2                     DIVU    D2,D1
    2CH        4843                     SWAP    D3
    2EH        3601                     MOVE.W  D1,D3
    30H        4241                     CLR.W   D1
    32H        4841                     SWAP    D1
    34H        601E                     BRA     [1EH] = 00000054H
    36H        4283                     CLR.L   D3
    38H        3601                     MOVE.W  D1,D3
    3AH        4843                     SWAP    D3
    3CH        4241                     CLR.W   D1
    3EH        4841                     SWAP    D1
    40H        383C 000F                MOVE.W  #000FH,D4
    44H        E38B                     LSL.L   #1,D3
    46H        E391                     ROXL.L  #1,D1
    48H        B282                     CMP.L   D2,D1
    4AH        6504                     BCS     [04H] = 00000050H
    4CH        9282                     SUB.L   D2,D1
    4EH        5243                     ADDQ.W  #1,D3
    50H        51CC FFF2                DBRA    D4,[FFF2H] = 00000044H
    54H        2D43 000C                MOVE.L  D3,000C(A6)
    58H        2D41 0008                MOVE.L  D1,0008(A6)
    5CH        4CDF 001E                MOVEM.L (A7)+,#001EH
    60H        4E5E                     UNLK    A6
    62H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 92
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        222E 0008                MOVE.L  0008(A6),D1
     CH        242E 000C                MOVE.L  000C(A6),D2
    10H        2601                     MOVE.L  D1,D3
    12H        2801                     MOVE.L  D1,D4
    14H        2A02                     MOVE.L  D2,D5
    16H        2C01                     MOVE.L  D1,D6
    18H        4287                     CLR.L   D7
    1AH        4844                     SWAP    D4
    1CH        4845                     SWAP    D5
    1EH        C2C2                     MULU    D2,D1
    20H        C4C4                     MULU    D4,D2
    22H        C6C5                     MULU    D5,D3
    24H        C8C5                     MULU    D5,D4
    26H        4841                     SWAP    D1
    28H        D242                     ADD.W   D2,D1
    2AH        D987                     ADDX.L  D7,D4
    2CH        D243                     ADD.W   D3,D1
    2EH        D987                     ADDX.L  D7,D4
    30H        4841                     SWAP    D1
    32H        4242                     CLR.W   D2
    34H        4243                     CLR.W   D3
    36H        4842                     SWAP    D2
    38H        4843                     SWAP    D3
    3AH        D483                     ADD.L   D3,D2
    3CH        D484                     ADD.L   D4,D2
    3EH        4845                     SWAP    D5
    40H        4A86                     TST.L   D6
    42H        6A02                     BPL     [02H] = 00000046H
    44H        9485                     SUB.L   D5,D2
    46H        4A85                     TST.L   D5
    48H        6A02                     BPL     [02H] = 0000004CH
    4AH        9486                     SUB.L   D6,D2
    4CH        2D41 000C                MOVE.L  D1,000C(A6)
    50H        2D42 0008                MOVE.L  D2,0008(A6)
    54H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 62
 DECODE --------                        INSTRUCTION
     0H        201F                     MOVE.L  (A7)+,D0
     2H        2E2F 0000                MOVE.L  0000(A7),D7
     6H        2C2F 0004                MOVE.L  0004(A7),D6
     AH        BF86                     EOR.L   D7,D6
     CH        5BC6                     SMI     D6
     EH        4AAF 0004                TST.L   0004(A7)
    12H        6A04                     BPL     [04H] = 00000018H
    14H        44AF 0004                NEG.L   0004(A7)
    18H        4A87                     TST.L   D7
    1AH        5BC7                     SMI     D7
    1CH        6A04                     BPL     [04H] = 00000022H
    1EH        44AF 0000                NEG.L   0000(A7)
    22H        207C 0000 0000           MOVE.L  #00000000H,A0
    28H        4E90                     JSR     (A0)
    2AH        4A07                     TST.B   D7
    2CH        6704                     BEQ     [04H] = 00000032H
    2EH        44AF 0004                NEG.L   0004(A7)
    32H        4A06                     TST.B   D6
    34H        6704                     BEQ     [04H] = 0000003AH
    36H        44AF 0000                NEG.L   0000(A7)
    3AH        2F00                     MOVE.L  D0,-(A7)
    3CH        4E75                     RTS
  checksum: o.k.

ref own proc ass at    24H, procnum =  9  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 188
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 9F00                MOVEM.L #9F00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        E39C                     ROL.L   #1,D4
    12H        E39E                     ROL.L   #1,D6
    14H        2004                     MOVE.L  D4,D0
    16H        9086                     SUB.L   D6,D0
    18H        6402                     BCC     [02H] = 0000001CH
    1AH        C946                     EXG     D4,D6
    1CH        1604                     MOVE.B  D4,D3
    1EH        C63C 0001                AND.B   #01H,D3
    22H        0800 0000                BTST    #0000H,D0
    26H        6704                     BEQ     [04H] = 0000002CH
    28H        08C3 0001                BSET    #0001H,D3
    2CH        E19C                     ROL.L   #8,D4
    2EH        4245                     CLR.W   D5
    30H        1A04                     MOVE.B  D4,D5
    32H        56C4                     SNE     D4
    34H        E29C                     ROR.L   #1,D4
    36H        4204                     CLR.B   D4
    38H        E19E                     ROL.L   #8,D6
    3AH        4247                     CLR.W   D7
    3CH        1E06                     MOVE.B  D6,D7
    3EH        56C6                     SNE     D6
    40H        E29E                     ROR.L   #1,D6
    42H        4206                     CLR.B   D6
    44H        3005                     MOVE.W  D5,D0
    46H        9047                     SUB.W   D7,D0
    48H        B07C 0018                CMP.W   #0018H,D0
    4CH        622E                     BHI     [2EH] = 0000007CH
    4EH        E0AE                     LSR.L   D0,D6
    50H        0803 0001                BTST    #0001H,D3
    54H        660A                     BNE     [0AH] = 00000060H
    56H        D886                     ADD.L   D6,D4
    58H        6404                     BCC     [04H] = 0000005EH
    5AH        E294                     ROXR.L  #1,D4
    5CH        5245                     ADDQ.W  #1,D5
    5EH        601C                     BRA     [1CH] = 0000007CH
    60H        9886                     SUB.L   D6,D4
    62H        6B18                     BMI     [18H] = 0000007CH
    64H        6716                     BEQ     [16H] = 0000007CH
    66H        B8BC 0000 FFFF           CMP.L   #0000FFFFH,D4
    6CH        6208                     BHI     [08H] = 00000076H
    6EH        9A7C 0010                SUB.W   #0010H,D5
    72H        4844                     SWAP    D4
    74H        6B06                     BMI     [06H] = 0000007CH
    76H        5345                     SUBQ.W  #1,D5
    78H        E38C                     LSL.L   #1,D4
    7AH        6AFA                     BPL     [FAH] = 00000076H
    7CH        D8BC 0000 0080           ADD.L   #00000080H,D4
    82H        6404                     BCC     [04H] = 00000088H
    84H        E294                     ROXR.L  #1,D4
    86H        5245                     ADDQ.W  #1,D5
    88H        4204                     CLR.B   D4
    8AH        4A84                     TST.L   D4
    8CH        6602                     BNE     [02H] = 00000090H
    8EH        4245                     CLR.W   D5
    90H        4A45                     TST.W   D5
    92H        6E04                     BGT     [04H] = 00000098H
    94H        4284                     CLR.L   D4
    96H        6018                     BRA     [18H] = 000000B0H
    98H        BA7C 00FF                CMP.W   #00FFH,D5
    9CH        6D08                     BLT     [08H] = 000000A6H
    9EH        7005                     MOVEQ   #05H,D0
    A0H        4EB9 0000 0000           JSR     00000000H
    A6H        E38C                     LSL.L   #1,D4
    A8H        1805                     MOVE.B  D5,D4
    AAH        E09C                     ROR.L   #8,D4
    ACH        E213                     ROXR.B  #1,D3
    AEH        E294                     ROXR.L  #1,D4
    B0H        2D44 000C                MOVE.L  D4,000C(A6)
    B4H        4CDF 00F9                MOVEM.L (A7)+,#00F9H
    B8H        4E5E                     UNLK    A6
    BAH        4E75                     RTS
  checksum: o.k.

ref own proc call at    A2H, procnum =  2  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        207C 0000 0000           MOVE.L  #00000000H,A0
     6H        086F 0007 0004           BCHG    #0007H,0004(A7)
     CH        4ED0                     JMP     (A0)
  checksum: o.k.

ref own proc ass at     2H, procnum = 12  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 164
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 CF00                MOVEM.L #CF00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        2E04                     MOVE.L  D4,D7
    12H        BD87                     EOR.L   D6,D7
    14H        4844                     SWAP    D4
    16H        3A04                     MOVE.W  D4,D5
    18H        CA7C 7F80                AND.W   #7F80H,D5
    1CH        676C                     BEQ     [6CH] = 0000008AH
    1EH        EE4D                     LSR.W   #7,D5
    20H        C87C 007F                AND.W   #007FH,D4
    24H        887C 0080                OR.W    #0080H,D4
    28H        4846                     SWAP    D6
    2AH        3E06                     MOVE.W  D6,D7
    2CH        CE7C 7F80                AND.W   #7F80H,D7
    30H        6758                     BEQ     [58H] = 0000008AH
    32H        EE4F                     LSR.W   #7,D7
    34H        CC7C 007F                AND.W   #007FH,D6
    38H        8C7C 0080                OR.W    #0080H,D6
    3CH        DA47                     ADD.W   D7,D5
    3EH        9A7C 007E                SUB.W   #007EH,D5
    42H        6D46                     BLT     [46H] = 0000008AH
    44H        2004                     MOVE.L  D4,D0
    46H        4840                     SWAP    D0
    48H        4846                     SWAP    D6
    4AH        C0C6                     MULU    D6,D0
    4CH        4240                     CLR.W   D0
    4EH        4840                     SWAP    D0
    50H        3204                     MOVE.W  D4,D1
    52H        C2C6                     MULU    D6,D1
    54H        D081                     ADD.L   D1,D0
    56H        2204                     MOVE.L  D4,D1
    58H        4841                     SWAP    D1
    5AH        4846                     SWAP    D6
    5CH        C2C6                     MULU    D6,D1
    5EH        D081                     ADD.L   D1,D0
    60H        C8C6                     MULU    D6,D4
    62H        4844                     SWAP    D4
    64H        D880                     ADD.L   D0,D4
    66H        6B04                     BMI     [04H] = 0000006CH
    68H        E38C                     LSL.L   #1,D4
    6AH        5345                     SUBQ.W  #1,D5
    6CH        D8BC 0000 0080           ADD.L   #00000080H,D4
    72H        6404                     BCC     [04H] = 00000078H
    74H        E294                     ROXR.L  #1,D4
    76H        5245                     ADDQ.W  #1,D5
    78H        4A45                     TST.W   D5
    7AH        6B0E                     BMI     [0EH] = 0000008AH
    7CH        BA7C 00FF                CMP.W   #00FFH,D5
    80H        6D0C                     BLT     [0CH] = 0000008EH
    82H        7005                     MOVEQ   #05H,D0
    84H        4EB9 0000 0000           JSR     00000000H
    8AH        4284                     CLR.L   D4
    8CH        600A                     BRA     [0AH] = 00000098H
    8EH        E38C                     LSL.L   #1,D4
    90H        1805                     MOVE.B  D5,D4
    92H        E09C                     ROR.L   #8,D4
    94H        E397                     ROXL.L  #1,D7
    96H        E294                     ROXR.L  #1,D4
    98H        2D44 000C                MOVE.L  D4,000C(A6)
    9CH        4CDF 00F3                MOVEM.L (A7)+,#00F3H
    A0H        4E5E                     UNLK    A6
    A2H        4E75                     RTS
  checksum: o.k.

ref own proc call at    86H, procnum =  2  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 158
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 8F00                MOVEM.L #8F00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        2E04                     MOVE.L  D4,D7
    12H        BD87                     EOR.L   D6,D7
    14H        E38E                     LSL.L   #1,D6
    16H        E19E                     ROL.L   #8,D6
    18H        4247                     CLR.W   D7
    1AH        1E06                     MOVE.B  D6,D7
    1CH        675E                     BEQ     [5EH] = 0000007CH
    1EH        1C3C 0001                MOVE.B  #01H,D6
    22H        E29E                     ROR.L   #1,D6
    24H        E38C                     LSL.L   #1,D4
    26H        E19C                     ROL.L   #8,D4
    28H        4245                     CLR.W   D5
    2AH        1A04                     MOVE.B  D4,D5
    2CH        6756                     BEQ     [56H] = 00000084H
    2EH        183C 0001                MOVE.B  #01H,D4
    32H        E29C                     ROR.L   #1,D4
    34H        9A47                     SUB.W   D7,D5
    36H        DA7C 007F                ADD.W   #007FH,D5
    3AH        4846                     SWAP    D6
    3CH        E28C                     LSR.L   #1,D4
    3EH        88C6                     DIVU    D6,D4
    40H        3004                     MOVE.W  D4,D0
    42H        4244                     CLR.W   D4
    44H        88C6                     DIVU    D6,D4
    46H        4844                     SWAP    D4
    48H        3800                     MOVE.W  D0,D4
    4AH        2006                     MOVE.L  D6,D0
    4CH        4840                     SWAP    D0
    4EH        C0C4                     MULU    D4,D0
    50H        E288                     LSR.L   #1,D0
    52H        80C6                     DIVU    D6,D0
    54H        C0BC 0000 FFFF           AND.L   #0000FFFFH,D0
    5AH        E388                     LSL.L   #1,D0
    5CH        4844                     SWAP    D4
    5EH        9880                     SUB.L   D0,D4
    60H        6B04                     BMI     [04H] = 00000066H
    62H        E38C                     LSL.L   #1,D4
    64H        5345                     SUBQ.W  #1,D5
    66H        D8BC 0000 0080           ADD.L   #00000080H,D4
    6CH        6404                     BCC     [04H] = 00000072H
    6EH        E294                     ROXR.L  #1,D4
    70H        5245                     ADDQ.W  #1,D5
    72H        4A45                     TST.W   D5
    74H        6B0E                     BMI     [0EH] = 00000084H
    76H        BA7C 00FF                CMP.W   #00FFH,D5
    7AH        6D0C                     BLT     [0CH] = 00000088H
    7CH        7005                     MOVEQ   #05H,D0
    7EH        4EB9 0000 0000           JSR     00000000H
    84H        4284                     CLR.L   D4
    86H        600A                     BRA     [0AH] = 00000092H
    88H        E39C                     ROL.L   #1,D4
    8AH        1805                     MOVE.B  D5,D4
    8CH        E09C                     ROR.L   #8,D4
    8EH        E397                     ROXL.L  #1,D7
    90H        E294                     ROXR.L  #1,D4
    92H        2D44 000C                MOVE.L  D4,000C(A6)
    96H        4CDF 00F1                MOVEM.L (A7)+,#00F1H
    9AH        4E5E                     UNLK    A6
    9CH        4E75                     RTS
  checksum: o.k.

ref own proc call at    80H, procnum =  2  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 66
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        202E 000C                MOVE.L  000C(A6),D0
     CH        2400                     MOVE.L  D0,D2
     EH        6A06                     BPL     [06H] = 00000016H
    10H        0A80 7FFF FFFF           EORI.L  #7FFFFFFFH,D0
    16H        C4BC 7F80 0000           AND.L   #7F800000H,D2
    1CH        6602                     BNE     [02H] = 00000020H
    1EH        4280                     CLR.L   D0
    20H        222E 0008                MOVE.L  0008(A6),D1
    24H        2401                     MOVE.L  D1,D2
    26H        6A06                     BPL     [06H] = 0000002EH
    28H        0A81 7FFF FFFF           EORI.L  #7FFFFFFFH,D1
    2EH        C4BC 7F80 0000           AND.L   #7F800000H,D2
    34H        6602                     BNE     [02H] = 00000038H
    36H        4281                     CLR.L   D1
    38H        B081                     CMP.L   D1,D0
    3AH        4CDF 0007                MOVEM.L (A7)+,#0007H
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 34
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 A000                MOVEM.L #A000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        2400                     MOVE.L  D0,D2
     EH        C4BC 7F80 0000           AND.L   #7F800000H,D2
    14H        6602                     BNE     [02H] = 00000018H
    16H        4280                     CLR.L   D0
    18H        4A80                     TST.L   D0
    1AH        4CDF 0005                MOVEM.L (A7)+,#0005H
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        672A                     BEQ     [2AH] = 00000038H
     EH        323C 009E                MOVE.W  #009EH,D1
    12H        B0BC 0000 FFFF           CMP.L   #0000FFFFH,D0
    18H        6206                     BHI     [06H] = 00000020H
    1AH        4840                     SWAP    D0
    1CH        927C 0010                SUB.W   #0010H,D1
    20H        B0BC 00FF FFFF           CMP.L   #00FFFFFFH,D0
    26H        6204                     BHI     [04H] = 0000002CH
    28H        E188                     LSL.L   #8,D0
    2AH        5141                     SUBQ.W  #8,D1
    2CH        E388                     LSL.L   #1,D0
    2EH        55C9 FFFC                DBCS    D1,[FFFCH] = 0000002CH
    32H        1001                     MOVE.B  D1,D0
    34H        E098                     ROR.L   #8,D0
    36H        E288                     LSR.L   #1,D0
    38H        2D40 0008                MOVE.L  D0,0008(A6)
    3CH        4CDF 0003                MOVEM.L (A7)+,#0003H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        6A0A                     BPL     [0AH] = 00000018H
     EH        C0BC 7F80 0000           AND.L   #7F800000H,D0
    14H        6716                     BEQ     [16H] = 0000002CH
    16H        6020                     BRA     [20H] = 00000038H
    18H        E388                     LSL.L   #1,D0
    1AH        E198                     ROL.L   #8,D0
    1CH        4241                     CLR.W   D1
    1EH        1200                     MOVE.B  D0,D1
    20H        103C 0001                MOVE.B  #01H,D0
    24H        E298                     ROR.L   #1,D0
    26H        927C 007F                SUB.W   #007FH,D1
    2AH        6C04                     BGE     [04H] = 00000030H
    2CH        4280                     CLR.L   D0
    2EH        601A                     BRA     [1AH] = 0000004AH
    30H        927C 001F                SUB.W   #001FH,D1
    34H        4441                     NEG.W   D1
    36H        6C08                     BGE     [08H] = 00000040H
    38H        7005                     MOVEQ   #05H,D0
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        E2A8                     LSR.L   D1,D0
    42H        B0BC 0000 FFFF           CMP.L   #0000FFFFH,D0
    48H        62EE                     BHI     [EEH] = 00000038H
    4AH        2D40 0008                MOVE.L  D0,0008(A6)
    4EH        4CDF 0003                MOVEM.L (A7)+,#0003H
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref own proc call at    3CH, procnum =  2  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 306
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        7400                     MOVEQ   #00H,D2
    10H        DA85                     ADD.L   D5,D5
    12H        D984                     ADDX.L  D4,D4
    14H        DB82                     ADDX.L  D2,D5
    16H        DE87                     ADD.L   D7,D7
    18H        DD86                     ADDX.L  D6,D6
    1AH        DF82                     ADDX.L  D2,D7
    1CH        2004                     MOVE.L  D4,D0
    1EH        2205                     MOVE.L  D5,D1
    20H        9287                     SUB.L   D7,D1
    22H        9186                     SUBX.L  D6,D0
    24H        6404                     BCC     [04H] = 0000002AH
    26H        CB47                     EXG     D5,D7
    28H        C946                     EXG     D4,D6
    2AH        7600                     MOVEQ   #00H,D3
    2CH        1605                     MOVE.B  D5,D3
    2EH        BF03                     EOR.B   D7,D3
    30H        0505                     BTST    D2,D5
    32H        6704                     BEQ     [04H] = 00000038H
    34H        700F                     MOVEQ   #0FH,D0
    36H        01C3                     BSET    D0,D3
    38H        E28C                     LSR.L   #1,D4
    3AH        E295                     ROXR.L  #1,D5
    3CH        4844                     SWAP    D4
    3EH        3204                     MOVE.W  D4,D1
    40H        E28E                     LSR.L   #1,D6
    42H        E297                     ROXR.L  #1,D7
    44H        0241 7FF0                ANDI.W  #7FF0H,D1
    48H        6612                     BNE     [12H] = 0000005CH
    4AH        2806                     MOVE.L  D6,D4
    4CH        2A07                     MOVE.L  D7,D5
    4EH        48EE 0030 0010           MOVEM.L #0030H,0010(A6)
    54H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
    5CH        4844                     SWAP    D4
    5EH        4846                     SWAP    D6
    60H        3006                     MOVE.W  D6,D0
    62H        0240 7FF0                ANDI.W  #7FF0H,D0
    66H        67E6                     BEQ     [E6H] = 0000004EH
    68H        4844                     SWAP    D4
    6AH        0244 000F                ANDI.W  #000FH,D4
    6EH        08C4 0004                BSET    #0004H,D4
    72H        4844                     SWAP    D4
    74H        0246 000F                ANDI.W  #000FH,D6
    78H        08C6 0004                BSET    #0004H,D6
    7CH        4846                     SWAP    D6
    7EH        3401                     MOVE.W  D1,D2
    80H        9240                     SUB.W   D0,D1
    82H        6736                     BEQ     [36H] = 000000BAH
    84H        E849                     LSR.W   #4,D1
    86H        0C41 0035                CMPI.W  #0035H,D1
    8AH        64C2                     BCC     [C2H] = 0000004EH
    8CH        0C01 0020                CMPI.B  #20H,D1
    90H        6D08                     BLT     [08H] = 0000009AH
    92H        2E06                     MOVE.L  D6,D7
    94H        7C00                     MOVEQ   #00H,D6
    96H        0401 0020                SUBI.B  #20H,D1
    9AH        0C01 0010                CMPI.B  #10H,D1
    9EH        6D0C                     BLT     [0CH] = 000000ACH
    A0H        0401 0010                SUBI.B  #10H,D1
    A4H        3E06                     MOVE.W  D6,D7
    A6H        4246                     CLR.W   D6
    A8H        4846                     SWAP    D6
    AAH        4847                     SWAP    D7
    ACH        7000                     MOVEQ   #00H,D0
    AEH        3006                     MOVE.W  D6,D0
    B0H        E2AE                     LSR.L   D1,D6
    B2H        E2AF                     LSR.L   D1,D7
    B4H        E2B8                     ROR.L   D1,D0
    B6H        4240                     CLR.W   D0
    B8H        8E80                     OR.L    D0,D7
    BAH        0803 0000                BTST    #0000H,D3
    BEH        662E                     BNE     [2EH] = 000000EEH
    C0H        DA87                     ADD.L   D7,D5
    C2H        D986                     ADDX.L  D6,D4
    C4H        7015                     MOVEQ   #15H,D0
    C6H        0104                     BTST    D0,D4
    C8H        670A                     BEQ     [0AH] = 000000D4H
    CAH        E28C                     LSR.L   #1,D4
    CCH        E295                     ROXR.L  #1,D5
    CEH        0642 0010                ADDI.W  #0010H,D2
    D2H        6B12                     BMI     [12H] = 000000E6H
    D4H        4844                     SWAP    D4
    D6H        0244 000F                ANDI.W  #000FH,D4
    DAH        8842                     OR.W    D2,D4
    DCH        4203                     CLR.B   D3
    DEH        8843                     OR.W    D3,D4
    E0H        4844                     SWAP    D4
    E2H        6000 FF6A                BRA     [FF6AH] = 0000004EH
    E6H        7005                     MOVEQ   #05H,D0
    E8H        4EB9 0000 0000           JSR     00000000H
    EEH        9A87                     SUB.L   D7,D5
    F0H        9986                     SUBX.L  D6,D4
    F2H        660E                     BNE     [0EH] = 00000102H
    F4H        4A85                     TST.L   D5
    F6H        6700 FF56                BEQ     [FF56H] = 0000004EH
    FAH        0442 0200                SUBI.W  #0200H,D2
    FEH        6B2A                     BMI     [2AH] = 0000012AH
   100H        C945                     EXG     D4,D5
   102H        0C84 0000 000F           CMPI.L  #0000000FH,D4
   108H        620E                     BHI     [0EH] = 00000118H
   10AH        4844                     SWAP    D4
   10CH        4845                     SWAP    D5
   10EH        3805                     MOVE.W  D5,D4
   110H        4245                     CLR.W   D5
   112H        0442 0100                SUBI.W  #0100H,D2
   116H        6B12                     BMI     [12H] = 0000012AH
   118H        7014                     MOVEQ   #14H,D0
   11AH        0104                     BTST    D0,D4
   11CH        66B6                     BNE     [B6H] = 000000D4H
   11EH        0442 0010                SUBI.W  #0010H,D2
   122H        6B06                     BMI     [06H] = 0000012AH
   124H        DA85                     ADD.L   D5,D5
   126H        D984                     ADDX.L  D4,D4
   128H        60F0                     BRA     [F0H] = 0000011AH
   12AH        7800                     MOVEQ   #00H,D4
   12CH        7A00                     MOVEQ   #00H,D5
   12EH        6000 FF1E                BRA     [FF1EH] = 0000004EH
  checksum: o.k.

ref own proc call at    EAH, procnum =  2  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        207C 0000 0000           MOVE.L  #00000000H,A0
     6H        086F 0007 0004           BCHG    #0007H,0004(A7)
     CH        4ED0                     JMP     (A0)
  checksum: o.k.

ref own proc ass at     2H, procnum = 20  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 320
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        4844                     SWAP    D4
    10H        3604                     MOVE.W  D4,D3
    12H        4846                     SWAP    D6
    14H        BD43                     EOR.W   D6,D3
    16H        5BE7                     SMI     -(A7)
    18H        3404                     MOVE.W  D4,D2
    1AH        303C 7FF0                MOVE.W  #7FF0H,D0
    1EH        C440                     AND.W   D0,D2
    20H        6700 0110                BEQ     [0110H] = 00000132H
    24H        3606                     MOVE.W  D6,D3
    26H        C640                     AND.W   D0,D3
    28H        6700 0108                BEQ     [0108H] = 00000132H
    2CH        D642                     ADD.W   D2,D3
    2EH        0443 3FF0                SUBI.W  #3FF0H,D3
    32H        6300 00FE                BLS     [00FEH] = 00000132H
    36H        6B00 0100                BMI     [0100H] = 00000138H
    3AH        700F                     MOVEQ   #0FH,D0
    3CH        C840                     AND.W   D0,D4
    3EH        08C4 0004                BSET    #0004H,D4
    42H        CC40                     AND.W   D0,D6
    44H        08C6 0004                BSET    #0004H,D6
    48H        7400                     MOVEQ   #00H,D2
    4AH        3F03                     MOVE.W  D3,-(A7)
    4CH        3004                     MOVE.W  D4,D0
    4EH        C0C6                     MULU    D6,D0
    50H        4840                     SWAP    D0
    52H        3204                     MOVE.W  D4,D1
    54H        C2C7                     MULU    D7,D1
    56H        3604                     MOVE.W  D4,D3
    58H        4846                     SWAP    D6
    5AH        C6C6                     MULU    D6,D3
    5CH        D083                     ADD.L   D3,D0
    5EH        3604                     MOVE.W  D4,D3
    60H        4847                     SWAP    D7
    62H        C6C7                     MULU    D7,D3
    64H        4841                     SWAP    D1
    66H        D243                     ADD.W   D3,D1
    68H        4243                     CLR.W   D3
    6AH        4843                     SWAP    D3
    6CH        D183                     ADDX.L  D3,D0
    6EH        4844                     SWAP    D4
    70H        3604                     MOVE.W  D4,D3
    72H        C6C6                     MULU    D6,D3
    74H        D243                     ADD.W   D3,D1
    76H        4841                     SWAP    D1
    78H        4243                     CLR.W   D3
    7AH        4843                     SWAP    D3
    7CH        D183                     ADDX.L  D3,D0
    7EH        3604                     MOVE.W  D4,D3
    80H        4846                     SWAP    D6
    82H        C6C6                     MULU    D6,D3
    84H        D083                     ADD.L   D3,D0
    86H        3604                     MOVE.W  D4,D3
    88H        C6C7                     MULU    D7,D3
    8AH        D283                     ADD.L   D3,D1
    8CH        D182                     ADDX.L  D2,D0
    8EH        3604                     MOVE.W  D4,D3
    90H        4847                     SWAP    D7
    92H        C8C7                     MULU    D7,D4
    94H        4244                     CLR.W   D4
    96H        4844                     SWAP    D4
    98H        D284                     ADD.L   D4,D1
    9AH        D182                     ADDX.L  D2,D0
    9CH        3605                     MOVE.W  D5,D3
    9EH        C6C6                     MULU    D6,D3
    A0H        D283                     ADD.L   D3,D1
    A2H        D182                     ADDX.L  D2,D0
    A4H        3605                     MOVE.W  D5,D3
    A6H        4846                     SWAP    D6
    A8H        C6C6                     MULU    D6,D3
    AAH        4243                     CLR.W   D3
    ACH        4843                     SWAP    D3
    AEH        D243                     ADD.W   D3,D1
    B0H        D182                     ADDX.L  D2,D0
    B2H        4845                     SWAP    D5
    B4H        3605                     MOVE.W  D5,D3
    B6H        C6C6                     MULU    D6,D3
    B8H        D283                     ADD.L   D3,D1
    BAH        D182                     ADDX.L  D2,D0
    BCH        4846                     SWAP    D6
    BEH        CCC5                     MULU    D5,D6
    C0H        4841                     SWAP    D1
    C2H        D246                     ADD.W   D6,D1
    C4H        4841                     SWAP    D1
    C6H        4246                     CLR.W   D6
    C8H        4846                     SWAP    D6
    CAH        D186                     ADDX.L  D6,D0
    CCH        4847                     SWAP    D7
    CEH        CAC7                     MULU    D7,D5
    D0H        4245                     CLR.W   D5
    D2H        4845                     SWAP    D5
    D4H        D285                     ADD.L   D5,D1
    D6H        D182                     ADDX.L  D2,D0
    D8H        5081                     ADDQ.L  #8,D1
    DAH        D182                     ADDX.L  D2,D0
    DCH        361F                     MOVE.W  (A7)+,D3
    DEH        7804                     MOVEQ   #04H,D4
    E0H        7A19                     MOVEQ   #19H,D5
    E2H        0B00                     BTST    D5,D0
    E4H        6706                     BEQ     [06H] = 000000ECH
    E6H        5244                     ADDQ.W  #1,D4
    E8H        0643 0010                ADDI.W  #0010H,D3
    ECH        1400                     MOVE.B  D0,D2
    EEH        E8BA                     ROR.L   D4,D2
    F0H        4202                     CLR.B   D2
    F2H        E8A8                     LSR.L   D4,D0
    F4H        E8A9                     LSR.L   D4,D1
    F6H        8282                     OR.L    D2,D1
    F8H        5B05                     SUBQ.B  #5,D5
    FAH        0B00                     BTST    D5,D0
    FCH        660C                     BNE     [0CH] = 0000010AH
    FEH        D482                     ADD.L   D2,D2
   100H        D381                     ADDX.L  D1,D1
   102H        D180                     ADDX.L  D0,D0
   104H        0443 000A                SUBI.W  #000AH,D3
   108H        6326                     BLS     [26H] = 00000130H
   10AH        4A43                     TST.W   D3
   10CH        6B2A                     BMI     [2AH] = 00000138H
   10EH        4840                     SWAP    D0
   110H        0240 000F                ANDI.W  #000FH,D0
   114H        8043                     OR.W    D3,D0
   116H        4840                     SWAP    D0
   118H        4A1F                     TST.B   (A7)+
   11AH        6704                     BEQ     [04H] = 00000120H
   11CH        761F                     MOVEQ   #1FH,D3
   11EH        07C0                     BSET    D3,D0
   120H        2D40 0010                MOVE.L  D0,0010(A6)
   124H        2D41 0014                MOVE.L  D1,0014(A6)
   128H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
   12CH        4E5E                     UNLK    A6
   12EH        4E75                     RTS
   130H        544F                     ADDQ.W  #2,A7
   132H        7000                     MOVEQ   #00H,D0
   134H        7200                     MOVEQ   #00H,D1
   136H        60E8                     BRA     [E8H] = 00000120H
   138H        7005                     MOVEQ   #05H,D0
   13AH        4EB9 0000 0000           JSR     00000000H
  checksum: o.k.

ref own proc call at   13CH, procnum =  2  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 236
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        4844                     SWAP    D4
    10H        3204                     MOVE.W  D4,D1
    12H        0241 7FF0                ANDI.W  #7FF0H,D1
    16H        6700 0090                BEQ     [0090H] = 000000A8H
    1AH        4846                     SWAP    D6
    1CH        3006                     MOVE.W  D6,D0
    1EH        0240 7FF0                ANDI.W  #7FF0H,D0
    22H        6700 0072                BEQ     [0072H] = 00000096H
    26H        9041                     SUB.W   D1,D0
    28H        0640 3FF0                ADDI.W  #3FF0H,D0
    2CH        6B00 007A                BMI     [007AH] = 000000A8H
    30H        3206                     MOVE.W  D6,D1
    32H        B941                     EOR.W   D4,D1
    34H        5BE7                     SMI     -(A7)
    36H        0246 000F                ANDI.W  #000FH,D6
    3AH        08C6 0004                BSET    #0004H,D6
    3EH        0244 000F                ANDI.W  #000FH,D4
    42H        08C4 0004                BSET    #0004H,D4
    46H        4846                     SWAP    D6
    48H        4844                     SWAP    D4
    4AH        721E                     MOVEQ   #1EH,D1
    4CH        7600                     MOVEQ   #00H,D3
    4EH        6124                     BSR     [24H] = 00000074H
    50H        2403                     MOVE.L  D3,D2
    52H        7217                     MOVEQ   #17H,D1
    54H        7600                     MOVEQ   #00H,D3
    56H        611C                     BSR     [1CH] = 00000074H
    58H        7209                     MOVEQ   #09H,D1
    5AH        E3AB                     LSL.L   D1,D3
    5CH        D683                     ADD.L   D3,D3
    5EH        D582                     ADDX.L  D2,D2
    60H        6B4E                     BMI     [4EH] = 000000B0H
    62H        0440 0010                SUBI.W  #0010H,D0
    66H        6B00 002C                BMI     [002CH] = 00000094H
    6AH        D683                     ADD.L   D3,D3
    6CH        D582                     ADDX.L  D2,D2
    6EH        6040                     BRA     [40H] = 000000B0H
    70H        DE87                     ADD.L   D7,D7
    72H        DD86                     ADDX.L  D6,D6
    74H        BC84                     CMP.L   D4,D6
    76H        5CC9 FFF8                DBGE    D1,[FFF8H] = 00000070H
    7AH        03C3                     BSET    D1,D3
    7CH        9E85                     SUB.L   D5,D7
    7EH        9D84                     SUBX.L  D4,D6
    80H        5BC9 FFEE                DBMI    D1,[FFEEH] = 00000070H
    84H        6A0C                     BPL     [0CH] = 00000092H
    86H        DE85                     ADD.L   D5,D7
    88H        DD84                     ADDX.L  D4,D6
    8AH        0383                     BCLR    D1,D3
    8CH        4A41                     TST.W   D1
    8EH        5DC9 FFE0                DBLT    D1,[FFE0H] = 00000070H
    92H        4E75                     RTS
    94H        548F                     ADDQ.L  #2,A7
    96H        7400                     MOVEQ   #00H,D2
    98H        7600                     MOVEQ   #00H,D3
    9AH        48EE 000C 0010           MOVEM.L #000CH,0010(A6)
    A0H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    A4H        4E5E                     UNLK    A6
    A6H        4E75                     RTS
    A8H        7005                     MOVEQ   #05H,D0
    AAH        4EB9 0000 0000           JSR     00000000H
    B0H        7C00                     MOVEQ   #00H,D6
    B2H        0683 0000 0800           ADDI.L  #00000800H,D3
    B8H        D586                     ADDX.L  D6,D2
    BAH        640A                     BCC     [0AH] = 000000C6H
    BCH        E292                     ROXR.L  #1,D2
    BEH        E293                     ROXR.L  #1,D3
    C0H        0640 0010                ADDI.W  #0010H,D0
    C4H        6BE2                     BMI     [E2H] = 000000A8H
    C6H        7200                     MOVEQ   #00H,D1
    C8H        3202                     MOVE.W  D2,D1
    CAH        7E0B                     MOVEQ   #0BH,D7
    CCH        EEAA                     LSR.L   D7,D2
    CEH        EEAB                     LSR.L   D7,D3
    D0H        EEB9                     ROR.L   D7,D1
    D2H        4201                     CLR.B   D1
    D4H        8681                     OR.L    D1,D3
    D6H        4842                     SWAP    D2
    D8H        0242 000F                ANDI.W  #000FH,D2
    DCH        8440                     OR.W    D0,D2
    DEH        4842                     SWAP    D2
    E0H        4A1F                     TST.B   (A7)+
    E2H        67B6                     BEQ     [B6H] = 0000009AH
    E4H        701F                     MOVEQ   #1FH,D0
    E6H        01C2                     BSET    D0,D2
    E8H        60B0                     BRA     [B0H] = 0000009AH
    EAH        60B0                     BRA     [B0H] = 0000009CH
  checksum: o.k.

ref own proc call at    ACH, procnum =  2  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 76
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 F800                MOVEM.L #F800H,-(A7)
     8H        4CEE 000F 0008           MOVEM.L 0008(A6),#000FH
     EH        2800                     MOVE.L  D0,D4
    10H        6A08                     BPL     [08H] = 0000001AH
    12H        0A81 7FFF FFFF           EORI.L  #7FFFFFFFH,D1
    18H        4680                     NOT.L   D0
    1AH        0284 7FF0 0000           ANDI.L  #7FF00000H,D4
    20H        6604                     BNE     [04H] = 00000026H
    22H        7000                     MOVEQ   #00H,D0
    24H        7200                     MOVEQ   #00H,D1
    26H        2802                     MOVE.L  D2,D4
    28H        6A08                     BPL     [08H] = 00000032H
    2AH        0A83 7FFF FFFF           EORI.L  #7FFFFFFFH,D3
    30H        4682                     NOT.L   D2
    32H        0284 7FF0 0000           ANDI.L  #7FF00000H,D4
    38H        6604                     BNE     [04H] = 0000003EH
    3AH        7400                     MOVEQ   #00H,D2
    3CH        7200                     MOVEQ   #00H,D1
    3EH        B480                     CMP.L   D0,D2
    40H        6602                     BNE     [02H] = 00000044H
    42H        B681                     CMP.L   D1,D3
    44H        4CDF 001F                MOVEM.L (A7)+,#001FH
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 34
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        2200                     MOVE.L  D0,D1
     EH        0281 7FF0 0000           ANDI.L  #7FF00000H,D1
    14H        6602                     BNE     [02H] = 00000018H
    16H        7000                     MOVEQ   #00H,D0
    18H        4A80                     TST.L   D0
    1AH        4CDF 0003                MOVEM.L (A7)+,#0003H
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 104
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        7000                     MOVEQ   #00H,D0
     AH        222E 0008                MOVE.L  0008(A6),D1
     EH        6748                     BEQ     [48H] = 00000058H
    10H        343C 41E0                MOVE.W  #41E0H,D2
    14H        4841                     SWAP    D1
    16H        3001                     MOVE.W  D1,D0
    18H        660A                     BNE     [0AH] = 00000024H
    1AH        4841                     SWAP    D1
    1CH        3001                     MOVE.W  D1,D0
    1EH        7200                     MOVEQ   #00H,D1
    20H        0442 0100                SUBI.W  #0100H,D2
    24H        4241                     CLR.W   D1
    26H        0C40 00FF                CMPI.W  #00FFH,D0
    2AH        620C                     BHI     [0CH] = 00000038H
    2CH        E188                     LSL.L   #8,D0
    2EH        E199                     ROL.L   #8,D1
    30H        8001                     OR.B    D1,D0
    32H        4201                     CLR.B   D1
    34H        0442 0080                SUBI.W  #0080H,D2
    38H        4A40                     TST.W   D0
    3AH        6B0A                     BMI     [0AH] = 00000046H
    3CH        0442 0010                SUBI.W  #0010H,D2
    40H        D241                     ADD.W   D1,D1
    42H        D140                     ADDX.W  D0,D0
    44H        6AF6                     BPL     [F6H] = 0000003CH
    46H        EB88                     LSL.L   #5,D0
    48H        EB99                     ROL.L   #5,D1
    4AH        8001                     OR.B    D1,D0
    4CH        4201                     CLR.B   D1
    4EH        4840                     SWAP    D0
    50H        0240 000F                ANDI.W  #000FH,D0
    54H        8042                     OR.W    D2,D0
    56H        4840                     SWAP    D0
    58H        48EE 0003 0008           MOVEM.L #0003H,0008(A6)
    5EH        4CDF 0007                MOVEM.L (A7)+,#0007H
    62H        4E5E                     UNLK    A6
    64H        4E75                     RTS
    66H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 100
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        4CEE 0003 0008           MOVEM.L 0008(A6),#0003H
     EH        4840                     SWAP    D0
    10H        7400                     MOVEQ   #00H,D2
    12H        3400                     MOVE.W  D0,D2
    14H        6A0E                     BPL     [0EH] = 00000024H
    16H        0242 7FF0                ANDI.W  #7FF0H,D2
    1AH        6738                     BEQ     [38H] = 00000054H
    1CH        7005                     MOVEQ   #05H,D0
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        E84A                     LSR.W   #4,D2
    26H        672C                     BEQ     [2CH] = 00000054H
    28H        0442 03FF                SUBI.W  #03FFH,D2
    2CH        6D26                     BLT     [26H] = 00000054H
    2EH        0240 000F                ANDI.W  #000FH,D0
    32H        08C0 0004                BSET    #0004H,D0
    36H        4840                     SWAP    D0
    38H        0442 001F                SUBI.W  #001FH,D2
    3CH        4442                     NEG.W   D2
    3EH        6DDC                     BLT     [DCH] = 0000001CH
    40H        0442 000B                SUBI.W  #000BH,D2
    44H        6D12                     BLT     [12H] = 00000058H
    46H        E4A8                     LSR.L   D2,D0
    48H        2D40 000C                MOVE.L  D0,000C(A6)
    4CH        4CDF 0007                MOVEM.L (A7)+,#0007H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
    54H        7000                     MOVEQ   #00H,D0
    56H        60F0                     BRA     [F0H] = 00000048H
    58H        4442                     NEG.W   D2
    5AH        E5A8                     LSL.L   D2,D0
    5CH        4241                     CLR.W   D1
    5EH        E5B9                     ROL.L   D2,D1
    60H        8041                     OR.W    D1,D0
    62H        60E4                     BRA     [E4H] = 00000048H
  checksum: o.k.

ref own proc call at    20H, procnum =  2  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 134
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 F000                MOVEM.L #F000H,-(A7)
     8H        4CEE 0003 0008           MOVEM.L 0008(A6),#0003H
     EH        4840                     SWAP    D0
    10H        3400                     MOVE.W  D0,D2
    12H        0242 7FF0                ANDI.W  #7FF0H,D2
    16H        6762                     BEQ     [62H] = 0000007AH
    18H        0442 3800                SUBI.W  #3800H,D2
    1CH        6B00 005C                BMI     [005CH] = 0000007AH
    20H        0C42 07F0                CMPI.W  #07F0H,D2
    24H        6E00 0058                BGT     [0058H] = 0000007EH
    28H        E94A                     LSL.W   #4,D2
    2AH        760F                     MOVEQ   #0FH,D3
    2CH        0700                     BTST    D3,D0
    2EH        6704                     BEQ     [04H] = 00000034H
    30H        08C2 0000                BSET    #0000H,D2
    34H        0240 000F                ANDI.W  #000FH,D0
    38H        08C0 0004                BSET    #0004H,D0
    3CH        4840                     SWAP    D0
    3EH        0681 0010 0000           ADDI.L  #00100000H,D1
    44H        6412                     BCC     [12H] = 00000058H
    46H        5280                     ADDQ.L  #1,D0
    48H        7614                     MOVEQ   #14H,D3
    4AH        0700                     BTST    D3,D0
    4CH        660A                     BNE     [0AH] = 00000058H
    4EH        E288                     LSR.L   #1,D0
    50H        E291                     ROXR.L  #1,D1
    52H        0642 0100                ADDI.W  #0100H,D2
    56H        6526                     BCS     [26H] = 0000007EH
    58H        E788                     LSL.L   #3,D0
    5AH        E799                     ROL.L   #3,D1
    5CH        0201 0007                ANDI.B  #07H,D1
    60H        8001                     OR.B    D1,D0
    62H        4840                     SWAP    D0
    64H        0880 0007                BCLR    #0007H,D0
    68H        E25A                     ROR.W   #1,D2
    6AH        8042                     OR.W    D2,D0
    6CH        4840                     SWAP    D0
    6EH        3D40 000A                MOVE.W  D0,000A(A6)
    72H        4CDF 000F                MOVEM.L (A7)+,#000FH
    76H        4E5E                     UNLK    A6
    78H        4E75                     RTS
    7AH        7000                     MOVEQ   #00H,D0
    7CH        60F0                     BRA     [F0H] = 0000006EH
    7EH        7005                     MOVEQ   #05H,D0
    80H        4EB9 0000 0000           JSR     00000000H
  checksum: o.k.

ref own proc call at    82H, procnum =  2  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 76
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        E398                     ROL.L   #1,D0
     EH        2400                     MOVE.L  D0,D2
    10H        0280 00FF FFFF           ANDI.L  #00FFFFFFH,D0
    16H        0282 FF00 0000           ANDI.L  #FF000000H,D2
    1CH        6612                     BNE     [12H] = 00000030H
    1EH        7000                     MOVEQ   #00H,D0
    20H        7200                     MOVEQ   #00H,D1
    22H        48EE 0003 0008           MOVEM.L #0003H,0008(A6)
    28H        4CDF 0007                MOVEM.L (A7)+,#0007H
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
    30H        E68A                     LSR.L   #3,D2
    32H        E288                     LSR.L   #1,D0
    34H        E292                     ROXR.L  #1,D2
    36H        0682 3800 0000           ADDI.L  #38000000H,D2
    3CH        2200                     MOVE.L  D0,D1
    3EH        E688                     LSR.L   #3,D0
    40H        E699                     ROR.L   #3,D1
    42H        0281 7000 0000           ANDI.L  #70000000H,D1
    48H        8082                     OR.L    D2,D0
    4AH        60D6                     BRA     [D6H] = 00000022H
  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 54
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        49F9 0000 023C           LEA     0000023CH,A4
     CH        2A0C                     MOVE.L  A4,D5
     EH        2E45                     MOVE.L  D5,A7
    10H        204F                     MOVE.L  A7,A0
    12H        42A0                     CLR.L   -(A0)
    14H        42A0                     CLR.L   -(A0)
    16H        42A0                     CLR.L   -(A0)
    18H        213C 0000 1000           MOVE.L  #00001000H,-(A0)
    1EH        42A0                     CLR.L   -(A0)
    20H        2A48                     MOVE.L  A0,A5
    22H        90FC 0024                SUBA.W  #0024H,A0
    26H        43FA 0006                LEA     [0006H] = 0000002EH,A1
    2AH        2109                     MOVE.L  A1,-(A0)
    2CH        2E48                     MOVE.L  A0,A7
    2EH        9DCE                     SUBA.L  A6,A6
    30H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref ext init call at    30H  checksum: o.k.

string data:, number of bytes = 122
NO DECODE -------- DATA

     0H         4143     4358     0000     4D6F     6475     
     AH         6C61     2D32     2F53     5420     2863     
    14H         2920     436F     7079     7269     6768     
    1EH         7420     4D6F     6475     6C61     2032     
    28H         2053     6F66     7477     6172     6520     
    32H         4C74     642E     2031     3938     352C     
    3CH         3139     3836     2C31     3938     372E     
    46H         2000     2863     2920     436F     7079     
    50H         7269     6768     7420     5444     4920     
    5AH         536F     6674     7761     7265     2049     
    64H         6E63     2E20     3139     3835     2C31     
    6EH         3938     362C     3139     3837     2E20     
    78H         0000       checksum: o.k.

scmod end  checksum: o.k.
