link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  InOut, key =  2102H  F1DDH  20A4H  checksum: o.k.

import Conversions, key =  2102H  F1E3H  6E1CH, modnum =  2  checksum: o.k.

import FileSystem, key =  2102H  F1EBH  157DH, modnum =  3  checksum: o.k.

import Terminal, key =  2102H  F1D6H  424CH, modnum =  4  checksum: o.k.

import GEMDOS, key =  2102H  CAC6H  6EBFH, modnum =  5  checksum: o.k.

data size, number of bytes = 138  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 48
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

proc code, procnum = 20, entrypoint =     0H, number of bytes = 80
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

proc code, procnum = 21, entrypoint =     0H, number of bytes = 242
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFA                LINK    A6,#FFFAH
     4H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     8H        286E 000E                MOVE.L  000E(A6),A4
     CH        4854                     PEA     (A4)
     EH        4EB9 0000 0000           JSR     Terminal.Write
    14H        5C8F                     ADDQ.L  #6,A7
    16H        13F9 0000 0000 0000 0001 MOVE.B  00000000H,00000001H
    20H        558F                     SUBQ.L  #2,A7
    22H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4854                     PEA     (A4)
    2CH        6100 0000                BSR     [0000H] = 0000002EH
    30H        5C8F                     ADDQ.L  #6,A7
    32H        3D5F FFFC                MOVE.W  (A7)+,FFFC(A6)
    36H        558F                     SUBQ.L  #2,A7
    38H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    3CH        286E 000E                MOVE.L  000E(A6),A4
    40H        4854                     PEA     (A4)
    42H        6100 0000                BSR     [0000H] = 00000044H
    46H        5C8F                     ADDQ.L  #6,A7
    48H        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    4CH        4A6E FFFE                TST.W   FFFE(A6)
    50H        52C5                     SHI     D5
    52H        4405                     NEG.B   D5
    54H        13C5 0000 0000           MOVE.B  D5,00000000H
    5AH        4A39 0000 0000           TST.B   00000000H
    60H        6702                     BEQ     [02H] = 00000064H
    62H        6004                     BRA     [04H] = 00000068H
    64H        4EFA 0088                JMP     [0088H] = 000000EEH
    68H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    6CH        5345                     SUBQ.W  #1,D5
    6EH        286E 000E                MOVE.L  000E(A6),A4
    72H        0C34 002E 5000           CMPI.B  #2EH,00H(A4,D5.W)
    78H        6602                     BNE     [02H] = 0000007CH
    7AH        6004                     BRA     [04H] = 00000080H
    7CH        4EFA 0070                JMP     [0070H] = 000000EEH
    80H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    84H        DA6E FFFC                ADD.W   FFFC(A6),D5
    88H        BA6E 0012                CMP.W   0012(A6),D5
    8CH        620C                     BHI     [0CH] = 0000009AH
    8EH        0C6E 0001 FFFE           CMPI.W  #0001H,FFFE(A6)
    94H        6304                     BLS     [04H] = 0000009AH
    96H        7A01                     MOVEQ   #01H,D5
    98H        6002                     BRA     [02H] = 0000009CH
    9AH        7A00                     MOVEQ   #00H,D5
    9CH        13C5 0000 0000           MOVE.B  D5,00000000H
    A2H        4A39 0000 0000           TST.B   00000000H
    A8H        6744                     BEQ     [44H] = 000000EEH
    AAH        426E FFFA                CLR.W   FFFA(A6)
    AEH        4A6E FFFC                TST.W   FFFC(A6)
    B2H        6324                     BLS     [24H] = 000000D8H
    B4H        3A2E FFFA                MOVE.W  FFFA(A6),D5
    B8H        286E 0008                MOVE.L  0008(A6),A4
    BCH        382E FFFE                MOVE.W  FFFE(A6),D4
    C0H        266E 000E                MOVE.L  000E(A6),A3
    C4H        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    CAH        526E FFFA                ADDQ.W  #1,FFFA(A6)
    CEH        526E FFFE                ADDQ.W  #1,FFFE(A6)
    D2H        536E FFFC                SUBQ.W  #1,FFFC(A6)
    D6H        60D6                     BRA     [D6H] = 000000AEH
    D8H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    DCH        BA6E 0012                CMP.W   0012(A6),D5
    E0H        620C                     BHI     [0CH] = 000000EEH
    E2H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    E6H        286E 000E                MOVE.L  000E(A6),A4
    EAH        4234 5000                CLR.B   00H(A4,D5.W)
    EEH        4E5E                     UNLK    A6
    F0H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    10H, procnum =  7, modnum =  4  checksum: o.k.

ref ext data at    18H, modnum =  4  checksum: o.k.

ref own data at    1CH  checksum: o.k.

ref own quick call at    2EH, procnum = 19  checksum: o.k.

ref own quick call at    44H, procnum = 19  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    9EH  checksum: o.k.

ref own data at    A4H  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 290
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD4                LINK    A6,#FFD4H
     4H        426E FFD4                CLR.W   FFD4(A6)
     8H        3A2E FFD4                MOVE.W  FFD4(A6),D5
     CH        BA6E 0016                CMP.W   0016(A6),D5
    10H        623C                     BHI     [3CH] = 0000004EH
    12H        3A2E FFD4                MOVE.W  FFD4(A6),D5
    16H        286E 0012                MOVE.L  0012(A6),A4
    1AH        4A34 5000                TST.B   00H(A4,D5.W)
    1EH        672E                     BEQ     [2EH] = 0000004EH
    20H        3A2E FFD4                MOVE.W  FFD4(A6),D5
    24H        286E 0012                MOVE.L  0012(A6),A4
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
    5AH        558F                     SUBQ.L  #2,A7
    5CH        3F3C 0029                MOVE.W  #0029H,-(A7)
    60H        486E FFD6                PEA     FFD6(A6)
    64H        3F3C 0003                MOVE.W  #0003H,-(A7)
    68H        4879 0000 0000           PEA     00000000H
    6EH        6100 0000                BSR     [0000H] = 00000070H
    72H        4FEF 000C                LEA     000C(A7),A7
    76H        4A1F                     TST.B   (A7)+
    78H        671A                     BEQ     [1AH] = 00000094H
    7AH        286E 000E                MOVE.L  000E(A6),A4
    7EH        4214                     CLR.B   (A4)
    80H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    88H        286E 000A                MOVE.L  000A(A6),A4
    8CH        18BC 0001                MOVE.B  #01H,(A4)
    90H        4EFA 008C                JMP     [008CH] = 0000011EH
    94H        558F                     SUBQ.L  #2,A7
    96H        3F3C 0029                MOVE.W  #0029H,-(A7)
    9AH        486E FFD6                PEA     FFD6(A6)
    9EH        3F3C 0003                MOVE.W  #0003H,-(A7)
    A2H        4879 0000 0006           PEA     00000006H
    A8H        6100 0000                BSR     [0000H] = 000000AAH
    ACH        4FEF 000C                LEA     000C(A7),A7
    B0H        4A1F                     TST.B   (A7)+
    B2H        6726                     BEQ     [26H] = 000000DAH
    B4H        286E 000E                MOVE.L  000E(A6),A4
    B8H        18BC 0002                MOVE.B  #02H,(A4)
    BCH        0C2E 0001 0008           CMPI.B  #01H,0008(A6)
    C2H        57C5                     SEQ     D5
    C4H        4405                     NEG.B   D5
    C6H        13C5 0000 0000           MOVE.B  D5,00000000H
    CCH        286E 000A                MOVE.L  000A(A6),A4
    D0H        18B9 0000 0000           MOVE.B  00000000H,(A4)
    D6H        4EFA 0046                JMP     [0046H] = 0000011EH
    DAH        558F                     SUBQ.L  #2,A7
    DCH        3F3C 0029                MOVE.W  #0029H,-(A7)
    E0H        486E FFD6                PEA     FFD6(A6)
    E4H        3F3C 0003                MOVE.W  #0003H,-(A7)
    E8H        4879 0000 000C           PEA     0000000CH
    EEH        6100 0000                BSR     [0000H] = 000000F0H
    F2H        4FEF 000C                LEA     000C(A7),A7
    F6H        4A1F                     TST.B   (A7)+
    F8H        671C                     BEQ     [1CH] = 00000116H
    FAH        286E 000E                MOVE.L  000E(A6),A4
    FEH        18BC 0001                MOVE.B  #01H,(A4)
   102H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
   10AH        286E 000A                MOVE.L  000A(A6),A4
   10EH        18BC 0001                MOVE.B  #01H,(A4)
   112H        4EFA 000A                JMP     [000AH] = 0000011EH
   116H        286E 000E                MOVE.L  000E(A6),A4
   11AH        18BC 0003                MOVE.B  #03H,(A4)
   11EH        4E5E                     UNLK    A6
   120H        4E75                     RTS
  checksum: o.k.

ref own string: at    6AH  checksum: o.k.

ref own quick call at    70H, procnum = 20  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref own string: at    A4H  checksum: o.k.

ref own quick call at    AAH, procnum = 20  checksum: o.k.

ref own data at    C8H  checksum: o.k.

ref own data at    D2H  checksum: o.k.

ref own string: at    EAH  checksum: o.k.

ref own quick call at    F0H, procnum = 20  checksum: o.k.

ref own data at   106H  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 200
OpenInput(VAR ARRAY CHAR)
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE0                LINK    A6,#FFE0H
     4H        6100 0000                BSR     [0000H] = 00000006H
     8H        3F3C 0015                MOVE.W  #0015H,-(A7)
     CH        4879 0000 0012           PEA     00000012H
    12H        4EB9 0000 0000           JSR     Terminal.WriteString
    18H        5C8F                     ADDQ.L  #6,A7
    1AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    1EH        486E FFE0                PEA     FFE0(A6)
    22H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4854                     PEA     (A4)
    2CH        6100 0000                BSR     [0000H] = 0000002EH
    30H        4FEF 000C                LEA     000C(A7),A7
    34H        4EB9 0000 0000           JSR     Terminal.WriteLn
    3AH        4A39 0000 0000           TST.B   00000000H
    40H        6702                     BEQ     [02H] = 00000044H
    42H        6004                     BRA     [04H] = 00000048H
    44H        4EFA 007E                JMP     [007EH] = 000000C4H
    48H        3F3C 001F                MOVE.W  #001FH,-(A7)
    4CH        486E FFE0                PEA     FFE0(A6)
    50H        4879 0000 0088           PEA     00000088H
    56H        4879 0000 0086           PEA     00000086H
    5CH        4227                     CLR.B   -(A7)
    5EH        6100 0000                BSR     [0000H] = 00000060H
    62H        4FEF 0010                LEA     0010(A7),A7
    66H        0C39 0003 0000 0088      CMPI.B  #03H,00000088H
    6EH        6654                     BNE     [54H] = 000000C4H
    70H        4879 0000 0002           PEA     00000002H
    76H        3F3C 001F                MOVE.W  #001FH,-(A7)
    7AH        486E FFE0                PEA     FFE0(A6)
    7EH        4227                     CLR.B   -(A7)
    80H        4EB9 0000 0000           JSR     FileSystem.Lookup
    86H        4FEF 000C                LEA     000C(A7),A7
    8AH        4A39 0000 0002           TST.B   00000002H
    90H        57C5                     SEQ     D5
    92H        4405                     NEG.B   D5
    94H        13C5 0000 0000           MOVE.B  D5,00000000H
    9AH        13F9 0000 0000 0000 0086 MOVE.B  00000000H,00000086H
    A4H        4A39 0000 0000           TST.B   00000000H
    AAH        660A                     BNE     [0AH] = 000000B6H
    ACH        4239 0000 0088           CLR.B   00000088H
    B2H        4EFA 0010                JMP     [0010H] = 000000C4H
    B6H        4879 0000 0002           PEA     00000002H
    BCH        4EB9 0000 0000           JSR     FileSystem.SetRead
    C2H        588F                     ADDQ.L  #4,A7
    C4H        4E5E                     UNLK    A6
    C6H        4E75                     RTS
  checksum: o.k.

ref own quick call at     6H, procnum =  5  checksum: o.k.

ref own string: at     EH  checksum: o.k.

ref ext proc call at    14H, procnum =  6, modnum =  4  checksum: o.k.

ref own quick call at    2EH, procnum = 21  checksum: o.k.

ref ext proc call at    36H, procnum =  5, modnum =  4  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own quick call at    60H, procnum = 22  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref ext proc call at    82H, procnum =  3, modnum =  3  checksum: o.k.

ref own data at    8CH  checksum: o.k.

ref own data at    96H  checksum: o.k.

ref own data at    9CH  checksum: o.k.

ref own data at    A0H  checksum: o.k.

ref own data at    A6H  checksum: o.k.

ref own data at    AEH  checksum: o.k.

ref own data at    B8H  checksum: o.k.

ref ext proc call at    BEH, procnum =  5, modnum =  3  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 140
OpenInputFile(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        6100 0000                BSR     [0000H] = 00000006H
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        4854                     PEA     (A4)
    12H        4879 0000 0088           PEA     00000088H
    18H        4879 0000 0086           PEA     00000086H
    1EH        4227                     CLR.B   -(A7)
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        4FEF 0010                LEA     0010(A7),A7
    28H        0C39 0003 0000 0088      CMPI.B  #03H,00000088H
    30H        6656                     BNE     [56H] = 00000088H
    32H        4879 0000 0002           PEA     00000002H
    38H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    3CH        286E 0008                MOVE.L  0008(A6),A4
    40H        4854                     PEA     (A4)
    42H        4227                     CLR.B   -(A7)
    44H        4EB9 0000 0000           JSR     FileSystem.Lookup
    4AH        4FEF 000C                LEA     000C(A7),A7
    4EH        4A39 0000 0002           TST.B   00000002H
    54H        57C5                     SEQ     D5
    56H        4405                     NEG.B   D5
    58H        13C5 0000 0000           MOVE.B  D5,00000000H
    5EH        13F9 0000 0000 0000 0086 MOVE.B  00000000H,00000086H
    68H        4A39 0000 0000           TST.B   00000000H
    6EH        660A                     BNE     [0AH] = 0000007AH
    70H        4239 0000 0088           CLR.B   00000088H
    76H        4EFA 0010                JMP     [0010H] = 00000088H
    7AH        4879 0000 0002           PEA     00000002H
    80H        4EB9 0000 0000           JSR     FileSystem.SetRead
    86H        588F                     ADDQ.L  #4,A7
    88H        4E5E                     UNLK    A6
    8AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     6H, procnum =  5  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own quick call at    22H, procnum = 22  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    46H, procnum =  3, modnum =  3  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref own data at    64H  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own data at    7CH  checksum: o.k.

ref ext proc call at    82H, procnum =  5, modnum =  3  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 200
OpenOutput(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE0                LINK    A6,#FFE0H
     4H        6100 0000                BSR     [0000H] = 00000006H
     8H        3F3C 0016                MOVE.W  #0016H,-(A7)
     CH        4879 0000 002A           PEA     0000002AH
    12H        4EB9 0000 0000           JSR     Terminal.WriteString
    18H        5C8F                     ADDQ.L  #6,A7
    1AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    1EH        486E FFE0                PEA     FFE0(A6)
    22H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4854                     PEA     (A4)
    2CH        6100 0000                BSR     [0000H] = 0000002EH
    30H        4FEF 000C                LEA     000C(A7),A7
    34H        4EB9 0000 0000           JSR     Terminal.WriteLn
    3AH        4A39 0000 0000           TST.B   00000000H
    40H        6702                     BEQ     [02H] = 00000044H
    42H        6004                     BRA     [04H] = 00000048H
    44H        4EFA 007E                JMP     [007EH] = 000000C4H
    48H        3F3C 001F                MOVE.W  #001FH,-(A7)
    4CH        486E FFE0                PEA     FFE0(A6)
    50H        4879 0000 0089           PEA     00000089H
    56H        4879 0000 0087           PEA     00000087H
    5CH        1F3C 0001                MOVE.B  #01H,-(A7)
    60H        6100 0000                BSR     [0000H] = 00000062H
    64H        4FEF 0010                LEA     0010(A7),A7
    68H        0C39 0003 0000 0089      CMPI.B  #03H,00000089H
    70H        6652                     BNE     [52H] = 000000C4H
    72H        4879 0000 0044           PEA     00000044H
    78H        3F3C 001F                MOVE.W  #001FH,-(A7)
    7CH        486E FFE0                PEA     FFE0(A6)
    80H        1F3C 0001                MOVE.B  #01H,-(A7)
    84H        4EB9 0000 0000           JSR     FileSystem.Lookup
    8AH        4FEF 000C                LEA     000C(A7),A7
    8EH        4A39 0000 0044           TST.B   00000044H
    94H        57C5                     SEQ     D5
    96H        4405                     NEG.B   D5
    98H        13C5 0000 0000           MOVE.B  D5,00000000H
    9EH        13F9 0000 0000 0000 0087 MOVE.B  00000000H,00000087H
    A8H        4A39 0000 0000           TST.B   00000000H
    AEH        6606                     BNE     [06H] = 000000B6H
    B0H        4239 0000 0089           CLR.B   00000089H
    B6H        4879 0000 0044           PEA     00000044H
    BCH        4EB9 0000 0000           JSR     FileSystem.SetWrite
    C2H        588F                     ADDQ.L  #4,A7
    C4H        4E5E                     UNLK    A6
    C6H        4E75                     RTS
  checksum: o.k.

ref own quick call at     6H, procnum =  6  checksum: o.k.

ref own string: at     EH  checksum: o.k.

ref ext proc call at    14H, procnum =  6, modnum =  4  checksum: o.k.

ref own quick call at    2EH, procnum = 21  checksum: o.k.

ref ext proc call at    36H, procnum =  5, modnum =  4  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own quick call at    62H, procnum = 22  checksum: o.k.

ref own data at    6CH  checksum: o.k.

ref own data at    74H  checksum: o.k.

ref ext proc call at    86H, procnum =  3, modnum =  3  checksum: o.k.

ref own data at    90H  checksum: o.k.

ref own data at    9AH  checksum: o.k.

ref own data at    A0H  checksum: o.k.

ref own data at    A4H  checksum: o.k.

ref own data at    AAH  checksum: o.k.

ref own data at    B2H  checksum: o.k.

ref own data at    B8H  checksum: o.k.

ref ext proc call at    BEH, procnum =  6, modnum =  3  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 140
OpenOutputFile(VAR ARRAY CHAR)
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        6100 0000                BSR     [0000H] = 00000006H
     8H        3F2E 000C                MOVE.W  000C(A6),-(A7)
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        4854                     PEA     (A4)
    12H        4879 0000 0089           PEA     00000089H
    18H        4879 0000 0087           PEA     00000087H
    1EH        1F3C 0001                MOVE.B  #01H,-(A7)
    22H        6100 0000                BSR     [0000H] = 00000024H
    26H        4FEF 0010                LEA     0010(A7),A7
    2AH        0C39 0003 0000 0089      CMPI.B  #03H,00000089H
    32H        6654                     BNE     [54H] = 00000088H
    34H        4879 0000 0044           PEA     00000044H
    3AH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    3EH        286E 0008                MOVE.L  0008(A6),A4
    42H        4854                     PEA     (A4)
    44H        1F3C 0001                MOVE.B  #01H,-(A7)
    48H        4EB9 0000 0000           JSR     FileSystem.Lookup
    4EH        4FEF 000C                LEA     000C(A7),A7
    52H        4A39 0000 0044           TST.B   00000044H
    58H        57C5                     SEQ     D5
    5AH        4405                     NEG.B   D5
    5CH        13C5 0000 0000           MOVE.B  D5,00000000H
    62H        13F9 0000 0000 0000 0087 MOVE.B  00000000H,00000087H
    6CH        4A39 0000 0000           TST.B   00000000H
    72H        6606                     BNE     [06H] = 0000007AH
    74H        4239 0000 0089           CLR.B   00000089H
    7AH        4879 0000 0044           PEA     00000044H
    80H        4EB9 0000 0000           JSR     FileSystem.SetWrite
    86H        588F                     ADDQ.L  #4,A7
    88H        4E5E                     UNLK    A6
    8AH        4E75                     RTS
  checksum: o.k.

ref own quick call at     6H, procnum =  6  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own quick call at    24H, procnum = 22  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref ext proc call at    4AH, procnum =  3, modnum =  3  checksum: o.k.

ref own data at    54H  checksum: o.k.

ref own data at    5EH  checksum: o.k.

ref own data at    64H  checksum: o.k.

ref own data at    68H  checksum: o.k.

ref own data at    6EH  checksum: o.k.

ref own data at    76H  checksum: o.k.

ref own data at    7CH  checksum: o.k.

ref ext proc call at    82H, procnum =  6, modnum =  3  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 80
CloseInput();
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A39 0000 0086           TST.B   00000086H
     AH        672C                     BEQ     [2CH] = 00000038H
     CH        0C39 0003 0000 0088      CMPI.B  #03H,00000088H
    14H        661E                     BNE     [1EH] = 00000034H
    16H        4879 0000 0002           PEA     00000002H
    1CH        4EB9 0000 0000           JSR     FileSystem.Close
    22H        588F                     ADDQ.L  #4,A7
    24H        4A39 0000 0002           TST.B   00000002H
    2AH        57C5                     SEQ     D5
    2CH        4405                     NEG.B   D5
    2EH        13C5 0000 0000           MOVE.B  D5,00000000H
    34H        4EFA 000A                JMP     [000AH] = 00000040H
    38H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    40H        4239 0000 0086           CLR.B   00000086H
    46H        4239 0000 0088           CLR.B   00000088H
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  3  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    48H  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 80
CloseOutput()
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A39 0000 0087           TST.B   00000087H
     AH        672C                     BEQ     [2CH] = 00000038H
     CH        0C39 0003 0000 0089      CMPI.B  #03H,00000089H
    14H        661E                     BNE     [1EH] = 00000034H
    16H        4879 0000 0044           PEA     00000044H
    1CH        4EB9 0000 0000           JSR     FileSystem.Close
    22H        588F                     ADDQ.L  #4,A7
    24H        4A39 0000 0044           TST.B   00000044H
    2AH        57C5                     SEQ     D5
    2CH        4405                     NEG.B   D5
    2EH        13C5 0000 0000           MOVE.B  D5,00000000H
    34H        4EFA 000A                JMP     [000AH] = 00000040H
    38H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    40H        4239 0000 0087           CLR.B   00000087H
    46H        4239 0000 0089           CLR.B   00000089H
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  3  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    48H  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 204
Read(VAR CHAR)
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A39 0000 0086           TST.B   00000086H
     AH        6758                     BEQ     [58H] = 00000064H
     CH        0C39 0003 0000 0088      CMPI.B  #03H,00000088H
    14H        664E                     BNE     [4EH] = 00000064H
    16H        4A39 0000 0009           TST.B   00000009H
    1CH        670A                     BEQ     [0AH] = 00000028H
    1EH        4239 0000 0000           CLR.B   00000000H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
    28H        4879 0000 0002           PEA     00000002H
    2EH        286E 0008                MOVE.L  0008(A6),A4
    32H        4854                     PEA     (A4)
    34H        4EB9 0000 0000           JSR     FileSystem.ReadChar
    3AH        508F                     ADDQ.L  #8,A7
    3CH        4A39 0000 0002           TST.B   00000002H
    42H        660C                     BNE     [0CH] = 00000050H
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        0C14 000A                CMPI.B  #0AH,(A4)
    4CH        6602                     BNE     [02H] = 00000050H
    4EH        60D8                     BRA     [D8H] = 00000028H
    50H        4A39 0000 0002           TST.B   00000002H
    56H        57C5                     SEQ     D5
    58H        4405                     NEG.B   D5
    5AH        13C5 0000 0000           MOVE.B  D5,00000000H
    60H        4EFA 0066                JMP     [0066H] = 000000C8H
    64H        7A00                     MOVEQ   #00H,D5
    66H        1A39 0000 0089           MOVE.B  00000089H,D5
    6CH        2005                     MOVE.L  D5,D0
    6EH        4EB9 0000 0000           JSR     00000000H
    74H        0000 0000                ORI.B   #00H,D0
    78H        0000 0002                ORI.B   #02H,D0
    7CH        0000 004E                ORI.B   #4EH,D0
    80H        4239 0000 0000           CLR.B   00000000H
    86H        4EFA 0040                JMP     [0040H] = 000000C8H
    8AH        286E 0008                MOVE.L  0008(A6),A4
    8EH        4854                     PEA     (A4)
    90H        4EB9 0000 0000           JSR     Terminal.Read
    96H        588F                     ADDQ.L  #4,A7
    98H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    A0H        4EFA 0026                JMP     [0026H] = 000000C8H
    A4H        286E 0008                MOVE.L  0008(A6),A4
    A8H        4854                     PEA     (A4)
    AAH        4EB9 0000 0000           JSR     GEMDOS.AuxIn
    B0H        588F                     ADDQ.L  #4,A7
    B2H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    BAH        4EFA 000C                JMP     [000CH] = 000000C8H
    BEH        4EFA 0008                JMP     [0008H] = 000000C8H
    C2H        0016 0030                ORI.B   #30H,(A6)
    C6H        000C
    C8H        4E5E                     UNLK    A6
    CAH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref ext proc call at    36H, procnum = 17, modnum =  3  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    68H  checksum: o.k.

ref util: at    70H, procnum =  1  checksum: o.k.

ref own data at    82H  checksum: o.k.

ref ext proc call at    92H, procnum =  1, modnum =  4  checksum: o.k.

ref own data at    9CH  checksum: o.k.

ref ext proc call at    ACH, procnum =  5, modnum =  5  checksum: o.k.

ref own data at    B6H  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 372
ReadString(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        4A39 0000 0086           TST.B   00000086H
     AH        670C                     BEQ     [0CH] = 00000018H
     CH        0C39 0003 0000 0088      CMPI.B  #03H,00000088H
    14H        6602                     BNE     [02H] = 00000018H
    16H        6004                     BRA     [04H] = 0000001CH
    18H        4EFA 008A                JMP     [008AH] = 000000A4H
    1CH        426E FFFE                CLR.W   FFFE(A6)
    20H        4879 0000 0001           PEA     00000001H
    26H        6100 0000                BSR     [0000H] = 00000028H
    2AH        588F                     ADDQ.L  #4,A7
    2CH        0C39 0020 0000 0001      CMPI.B  #20H,00000001H
    34H        6616                     BNE     [16H] = 0000004CH
    36H        4A39 0000 0000           TST.B   00000000H
    3CH        670E                     BEQ     [0EH] = 0000004CH
    3EH        4879 0000 0001           PEA     00000001H
    44H        6100 0000                BSR     [0000H] = 00000046H
    48H        588F                     ADDQ.L  #4,A7
    4AH        60E0                     BRA     [E0H] = 0000002CH
    4CH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    50H        BA6E 000C                CMP.W   000C(A6),D5
    54H        6234                     BHI     [34H] = 0000008AH
    56H        4A39 0000 0000           TST.B   00000000H
    5CH        672C                     BEQ     [2CH] = 0000008AH
    5EH        0C39 0020 0000 0001      CMPI.B  #20H,00000001H
    66H        6322                     BLS     [22H] = 0000008AH
    68H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    6CH        286E 0008                MOVE.L  0008(A6),A4
    70H        19B9 0000 0001 5000      MOVE.B  00000001H,00H(A4,D5.W)
    78H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    7CH        4879 0000 0001           PEA     00000001H
    82H        6100 0000                BSR     [0000H] = 00000084H
    86H        588F                     ADDQ.L  #4,A7
    88H        60C2                     BRA     [C2H] = 0000004CH
    8AH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    8EH        BA6E 000C                CMP.W   000C(A6),D5
    92H        620C                     BHI     [0CH] = 000000A0H
    94H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    98H        286E 0008                MOVE.L  0008(A6),A4
    9CH        4234 5000                CLR.B   00H(A4,D5.W)
    A0H        4EFA 00CE                JMP     [00CEH] = 00000170H
    A4H        7A00                     MOVEQ   #00H,D5
    A6H        1A39 0000 0089           MOVE.B  00000089H,D5
    ACH        2005                     MOVE.L  D5,D0
    AEH        4EB9 0000 0000           JSR     00000000H
    B4H        0000 0000                ORI.B   #00H,D0
    B8H        0000 0002                ORI.B   #02H,D0
    BCH        0000 00B6                ORI.B   #B6H,D0
    C0H        4239 0000 0000           CLR.B   00000000H
    C6H        4EFA 00A8                JMP     [00A8H] = 00000170H
    CAH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    CEH        286E 0008                MOVE.L  0008(A6),A4
    D2H        4854                     PEA     (A4)
    D4H        4EB9 0000 0000           JSR     Terminal.ReadString
    DAH        5C8F                     ADDQ.L  #6,A7
    DCH        13F9 0000 0000 0000 0001 MOVE.B  00000000H,00000001H
    E6H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    EEH        4EFA 0080                JMP     [0080H] = 00000170H
    F2H        426E FFFE                CLR.W   FFFE(A6)
    F6H        4879 0000 0001           PEA     00000001H
    FCH        4EB9 0000 0000           JSR     GEMDOS.AuxIn
   102H        588F                     ADDQ.L  #4,A7
   104H        3A2E FFFE                MOVE.W  FFFE(A6),D5
   108H        BA6E 000C                CMP.W   000C(A6),D5
   10CH        6236                     BHI     [36H] = 00000144H
   10EH        4A39 0000 0000           TST.B   00000000H
   114H        672E                     BEQ     [2EH] = 00000144H
   116H        0C39 0020 0000 0001      CMPI.B  #20H,00000001H
   11EH        6324                     BLS     [24H] = 00000144H
   120H        3A2E FFFE                MOVE.W  FFFE(A6),D5
   124H        286E 0008                MOVE.L  0008(A6),A4
   128H        19B9 0000 0001 5000      MOVE.B  00000001H,00H(A4,D5.W)
   130H        526E FFFE                ADDQ.W  #1,FFFE(A6)
   134H        4879 0000 0001           PEA     00000001H
   13AH        4EB9 0000 0000           JSR     GEMDOS.AuxIn
   140H        588F                     ADDQ.L  #4,A7
   142H        60C0                     BRA     [C0H] = 00000104H
   144H        3A2E FFFE                MOVE.W  FFFE(A6),D5
   148H        BA6E 000C                CMP.W   000C(A6),D5
   14CH        620C                     BHI     [0CH] = 0000015AH
   14EH        3A2E FFFE                MOVE.W  FFFE(A6),D5
   152H        286E 0008                MOVE.L  0008(A6),A4
   156H        4234 5000                CLR.B   00H(A4,D5.W)
   15AH        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
   162H        4EFA 000C                JMP     [000CH] = 00000170H
   166H        4EFA 0008                JMP     [0008H] = 00000170H
   16AH        0016 003E                ORI.B   #3EH,(A6)
   16EH        000C 4E5E                MOVEP.W 4E5EH(A4),D0
   172H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own quick call at    28H, procnum =  7  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref own quick call at    46H, procnum =  7  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    62H  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own data at    7EH  checksum: o.k.

ref own quick call at    84H, procnum =  7  checksum: o.k.

ref own data at    A8H  checksum: o.k.

ref util: at    B0H, procnum =  1  checksum: o.k.

ref own data at    C2H  checksum: o.k.

ref ext proc call at    D6H, procnum =  7, modnum =  4  checksum: o.k.

ref ext data at    DEH, modnum =  4  checksum: o.k.

ref own data at    E2H  checksum: o.k.

ref own data at    EAH  checksum: o.k.

ref own data at    F8H  checksum: o.k.

ref ext proc call at    FEH, procnum =  5, modnum =  5  checksum: o.k.

ref own data at   110H  checksum: o.k.

ref own data at   11AH  checksum: o.k.

ref own data at   12AH  checksum: o.k.

ref own data at   136H  checksum: o.k.

ref ext proc call at   13CH, procnum =  5, modnum =  5  checksum: o.k.

ref own data at   15EH  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 88
ReadInt(VAR INTEGER)
 DECODE --------                        INSTRUCTION
     0H        4E56 FFDA                LINK    A6,#FFDAH
     4H        3F3C 001F                MOVE.W  #001FH,-(A7)
     8H        486E FFDA                PEA     FFDA(A6)
     CH        6100 0000                BSR     [0000H] = 0000000EH
    10H        5C8F                     ADDQ.L  #6,A7
    12H        4A39 0000 0000           TST.B   00000000H
    18H        673A                     BEQ     [3AH] = 00000054H
    1AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    1EH        486E FFDA                PEA     FFDA(A6)
    22H        3F3C 000A                MOVE.W  #000AH,-(A7)
    26H        1F3C 0001                MOVE.B  #01H,-(A7)
    2AH        4878 7FFF                PEA     7FFFH
    2EH        486E FFFC                PEA     FFFC(A6)
    32H        4879 0000 0000           PEA     00000000H
    38H        4EB9 0000 0000           JSR     Conversions.ConvertFromString
    3EH        4FEF 0016                LEA     0016(A7),A7
    42H        4A39 0000 0000           TST.B   00000000H
    48H        670A                     BEQ     [0AH] = 00000054H
    4AH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    4EH        286E 0008                MOVE.L  0008(A6),A4
    52H        3885                     MOVE.W  D5,(A4)
    54H        4E5E                     UNLK    A6
    56H        4E75                     RTS
  checksum: o.k.

ref own quick call at     EH, procnum =  8  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    3AH, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    44H  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 88
ReadCard(VAR CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFDC                LINK    A6,#FFDCH
     4H        3F3C 001F                MOVE.W  #001FH,-(A7)
     8H        486E FFDC                PEA     FFDC(A6)
     CH        6100 0000                BSR     [0000H] = 0000000EH
    10H        5C8F                     ADDQ.L  #6,A7
    12H        4A39 0000 0000           TST.B   00000000H
    18H        673A                     BEQ     [3AH] = 00000054H
    1AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    1EH        486E FFDC                PEA     FFDC(A6)
    22H        3F3C 000A                MOVE.W  #000AH,-(A7)
    26H        4227                     CLR.B   -(A7)
    28H        2F3C 0000 FFFF           MOVE.L  #0000FFFFH,-(A7)
    2EH        486E FFFC                PEA     FFFC(A6)
    32H        4879 0000 0000           PEA     00000000H
    38H        4EB9 0000 0000           JSR     Conversions.ConvertFromString
    3EH        4FEF 0016                LEA     0016(A7),A7
    42H        4A39 0000 0000           TST.B   00000000H
    48H        670A                     BEQ     [0AH] = 00000054H
    4AH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    4EH        286E 0008                MOVE.L  0008(A6),A4
    52H        3885                     MOVE.W  D5,(A4)
    54H        4E5E                     UNLK    A6
    56H        4E75                     RTS
  checksum: o.k.

ref own quick call at     EH, procnum =  8  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext proc call at    3AH, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    44H  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 376
Write(CHAR)
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4A39 0000 0087           TST.B   00000087H
     AH        6768                     BEQ     [68H] = 00000074H
     CH        0C39 0003 0000 0089      CMPI.B  #03H,00000089H
    14H        665E                     BNE     [5EH] = 00000074H
    16H        0C2E 000D 0008           CMPI.B  #0DH,0008(A6)
    1CH        6630                     BNE     [30H] = 0000004EH
    1EH        4879 0000 0044           PEA     00000044H
    24H        1F3C 000D                MOVE.B  #0DH,-(A7)
    28H        4EB9 0000 0000           JSR     FileSystem.WriteChar
    2EH        5C8F                     ADDQ.L  #6,A7
    30H        4A39 0000 0044           TST.B   00000044H
    36H        6612                     BNE     [12H] = 0000004AH
    38H        4879 0000 0044           PEA     00000044H
    3EH        1F3C 000A                MOVE.B  #0AH,-(A7)
    42H        4EB9 0000 0000           JSR     FileSystem.WriteChar
    48H        5C8F                     ADDQ.L  #6,A7
    4AH        4EFA 0014                JMP     [0014H] = 00000060H
    4EH        4879 0000 0044           PEA     00000044H
    54H        1F2E 0008                MOVE.B  0008(A6),-(A7)
    58H        4EB9 0000 0000           JSR     FileSystem.WriteChar
    5EH        5C8F                     ADDQ.L  #6,A7
    60H        4A39 0000 0044           TST.B   00000044H
    66H        57C5                     SEQ     D5
    68H        4405                     NEG.B   D5
    6AH        13C5 0000 0000           MOVE.B  D5,00000000H
    70H        4EFA 0102                JMP     [0102H] = 00000174H
    74H        0C2E 000D 0008           CMPI.B  #0DH,0008(A6)
    7AH        6602                     BNE     [02H] = 0000007EH
    7CH        6004                     BRA     [04H] = 00000082H
    7EH        4EFA 0086                JMP     [0086H] = 00000106H
    82H        7A00                     MOVEQ   #00H,D5
    84H        1A39 0000 0089           MOVE.B  00000089H,D5
    8AH        2005                     MOVE.L  D5,D0
    8CH        4EB9 0000 0000           JSR     00000000H
    92H        0000 0000                ORI.B   #00H,D0
    96H        0000 0002                ORI.B   #02H,D0
    9AH        0000 006A                ORI.B   #6AH,D0
    9EH        1F3C 000D                MOVE.B  #0DH,-(A7)
    A2H        4EB9 0000 0000           JSR     GEMDOS.PrnOut
    A8H        548F                     ADDQ.L  #2,A7
    AAH        1F3C 000A                MOVE.B  #0AH,-(A7)
    AEH        4EB9 0000 0000           JSR     GEMDOS.PrnOut
    B4H        548F                     ADDQ.L  #2,A7
    B6H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    BEH        4EFA 0042                JMP     [0042H] = 00000102H
    C2H        4EB9 0000 0000           JSR     Terminal.WriteLn
    C8H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    D0H        4EFA 0030                JMP     [0030H] = 00000102H
    D4H        1F3C 000D                MOVE.B  #0DH,-(A7)
    D8H        4EB9 0000 0000           JSR     GEMDOS.AuxAout
    DEH        548F                     ADDQ.L  #2,A7
    E0H        1F3C 000A                MOVE.B  #0AH,-(A7)
    E4H        4EB9 0000 0000           JSR     GEMDOS.AuxAout
    EAH        548F                     ADDQ.L  #2,A7
    ECH        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    F4H        4EFA 000C                JMP     [000CH] = 00000102H
    F8H        4EFA 0008                JMP     [0008H] = 00000102H
    FCH        0030 0042 000C           ORI.B   #42H,0CH(A0,D0.W)
   102H        4EFA 0070                JMP     [0070H] = 00000174H
   106H        7A00                     MOVEQ   #00H,D5
   108H        1A39 0000 0089           MOVE.B  00000089H,D5
   10EH        2005                     MOVE.L  D5,D0
   110H        4EB9 0000 0000           JSR     00000000H
   116H        0000 0000                ORI.B   #00H,D0
   11AH        0000 0002                ORI.B   #02H,D0
   11EH        0000 0058                ORI.B   #58H,D0
   122H        1F2E 0008                MOVE.B  0008(A6),-(A7)
   126H        4EB9 0000 0000           JSR     GEMDOS.PrnOut
   12CH        548F                     ADDQ.L  #2,A7
   12EH        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
   136H        4EFA 003C                JMP     [003CH] = 00000174H
   13AH        1F2E 0008                MOVE.B  0008(A6),-(A7)
   13EH        4EB9 0000 0000           JSR     Terminal.Write
   144H        548F                     ADDQ.L  #2,A7
   146H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
   14EH        4EFA 0024                JMP     [0024H] = 00000174H
   152H        1F2E 0008                MOVE.B  0008(A6),-(A7)
   156H        4EB9 0000 0000           JSR     GEMDOS.AuxOut
   15CH        548F                     ADDQ.L  #2,A7
   15EH        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
   166H        4EFA 000C                JMP     [000CH] = 00000174H
   16AH        4EFA 0008                JMP     [0008H] = 00000174H
   16EH        0024 003C                ORI.B   #3CH,-(A4)
   172H        000C 4E5E                MOVEP.W 4E5EH(A4),D0
   176H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref ext proc call at    2AH, procnum = 18, modnum =  3  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own data at    3AH  checksum: o.k.

ref ext proc call at    44H, procnum = 18, modnum =  3  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref ext proc call at    5AH, procnum = 18, modnum =  3  checksum: o.k.

ref own data at    62H  checksum: o.k.

ref own data at    6CH  checksum: o.k.

ref own data at    86H  checksum: o.k.

ref util: at    8EH, procnum =  1  checksum: o.k.

ref ext proc call at    A4H, procnum =  7, modnum =  5  checksum: o.k.

ref ext proc call at    B0H, procnum =  7, modnum =  5  checksum: o.k.

ref own data at    BAH  checksum: o.k.

ref ext proc call at    C4H, procnum =  5, modnum =  4  checksum: o.k.

ref own data at    CCH  checksum: o.k.

ref ext proc call at    DAH, procnum =  6, modnum =  5  checksum: o.k.

ref ext proc call at    E6H, procnum =  6, modnum =  5  checksum: o.k.

ref own data at    F0H  checksum: o.k.

ref own data at   10AH  checksum: o.k.

ref util: at   112H, procnum =  1  checksum: o.k.

ref ext proc call at   128H, procnum =  7, modnum =  5  checksum: o.k.

ref own data at   132H  checksum: o.k.

ref ext proc call at   140H, procnum =  4, modnum =  4  checksum: o.k.

ref own data at   14AH  checksum: o.k.

ref ext proc call at   158H, procnum =  6, modnum =  5  checksum: o.k.

ref own data at   162H  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 18
WriteLn()
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        1F3C 000D                MOVE.B  #0DH,-(A7)
     8H        6100 0000                BSR Write
     CH        548F                     ADDQ.L  #2,A7
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

ref own quick call at     AH, procnum = 11  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 76
WriteString(VAR ARRAY CHAR);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        426E FFFE                CLR.W   FFFE(A6)
     8H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    10H        4A39 0000 0000           TST.B   00000000H
    16H        6730                     BEQ     [30H] = 00000048H
    18H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    1CH        BA6E 000C                CMP.W   000C(A6),D5
    20H        6226                     BHI     [26H] = 00000048H
    22H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    26H        286E 0008                MOVE.L  0008(A6),A4
    2AH        4A34 5000                TST.B   00H(A4,D5.W)
    2EH        6718                     BEQ     [18H] = 00000048H
    30H        3A2E FFFE                MOVE.W  FFFE(A6),D5
    34H        286E 0008                MOVE.L  0008(A6),A4
    38H        1F34 5000                MOVE.B  00H(A4,D5.W),-(A7)
    3CH        6100 0000                BSR     InOut.Write
    40H        548F                     ADDQ.L  #2,A7
    42H        526E FFFE                ADDQ.W  #1,FFFE(A6)
    46H        60C8                     BRA     [C8H] = 00000010H
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own quick call at    3EH, procnum = 11  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 90
WriteStringRight(VAR ARRAY CHAR; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        558F                     SUBQ.L  #2,A7
     6H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     AH        286E 000A                MOVE.L  000A(A6),A4
     EH        4854                     PEA     (A4)
    10H        6100 0000                BSR     [0000H] = 00000012H
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3A2E 0008                MOVE.W  0008(A6),D5
    1AH        9A5F                     SUB.W   (A7)+,D5
    1CH        3D45 FFFE                MOVE.W  D5,FFFE(A6)
    20H        13FC 0001 0000 0000      MOVE.B  #01H,00000000H
    28H        4A39 0000 0000           TST.B   00000000H
    2EH        6716                     BEQ     [16H] = 00000046H
    30H        4A6E FFFE                TST.W   FFFE(A6)
    34H        6F10                     BLE     [10H] = 00000046H
    36H        1F3C 0020                MOVE.B  #20H,-(A7)
    3AH        6100 0000                BSR     [0000H] = 0000003CH
    3EH        548F                     ADDQ.L  #2,A7
    40H        536E FFFE                SUBQ.W  #1,FFFE(A6)
    44H        60E2                     BRA     [E2H] = 00000028H
    46H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    4AH        286E 000A                MOVE.L  000A(A6),A4
    4EH        4854                     PEA     (A4)
    50H        6100 0000                BSR     [0000H] = 00000052H
    54H        5C8F                     ADDQ.L  #6,A7
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref own quick call at    12H, procnum = 19  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own quick call at    3CH, procnum = 11  checksum: o.k.

ref own quick call at    52H, procnum = 13  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 76
WriteInt(INTEGER; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD6                LINK    A6,#FFD6H
     4H        3A2E 000A                MOVE.W  000A(A6),D5
     8H        4A45                     TST.W   D5
     AH        6C02                     BGE     [02H] = 0000000EH
     CH        4445                     NEG.W   D5
     EH        48C5                     EXT.L   D5
    10H        2F05                     MOVE.L  D5,-(A7)
    12H        3F3C 000A                MOVE.W  #000AH,-(A7)
    16H        4A6E 000A                TST.W   000A(A6)
    1AH        5DC5                     SLT     D5
    1CH        4405                     NEG.B   D5
    1EH        1F05                     MOVE.B  D5,-(A7)
    20H        3F3C 0027                MOVE.W  #0027H,-(A7)
    24H        486E FFD8                PEA     FFD8(A6)
    28H        486E FFD7                PEA     FFD7(A6)
    2CH        4EB9 0000 0000           JSR     Conversions.ConvertToString
    32H        4FEF 0012                LEA     0012(A7),A7
    36H        3F3C 0027                MOVE.W  #0027H,-(A7)
    3AH        486E FFD8                PEA     FFD8(A6)
    3EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    42H        6100 0000                BSR     WriteStringRight
    46H        508F                     ADDQ.L  #8,A7
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    44H, procnum = 14  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 62
WriteCard(CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD6                LINK    A6,#FFD6H
     4H        7A00                     MOVEQ   #00H,D5
     6H        3A2E 000A                MOVE.W  000A(A6),D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F3C 000A                MOVE.W  #000AH,-(A7)
    10H        4227                     CLR.B   -(A7)
    12H        3F3C 0027                MOVE.W  #0027H,-(A7)
    16H        486E FFD8                PEA     FFD8(A6)
    1AH        486E FFD7                PEA     FFD7(A6)
    1EH        4EB9 0000 0000           JSR     Conversions,ConvertToString
    24H        4FEF 0012                LEA     0012(A7),A7
    28H        3F3C 0027                MOVE.W  #0027H,-(A7)
    2CH        486E FFD8                PEA     FFD8(A6)
    30H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    34H        6100 0000                BSR     [0000H] = 00000036H
    38H        508F                     ADDQ.L  #8,A7
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    36H, procnum = 14  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 110
WriteOct(CARDINAL; CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD4                LINK    A6,#FFD4H
     4H        7A00                     MOVEQ   #00H,D5
     6H        3A2E 000A                MOVE.W  000A(A6),D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F3C 0008                MOVE.W  #0008H,-(A7)
    10H        4227                     CLR.B   -(A7)
    12H        3F3C 0027                MOVE.W  #0027H,-(A7)
    16H        486E FFD8                PEA     FFD8(A6)
    1AH        486E FFD5                PEA     FFD5(A6)
    1EH        4EB9 0000 0000           JSR     Conversions.ConvertToString
    24H        4FEF 0012                LEA     0012(A7),A7
    28H        558F                     SUBQ.L  #2,A7
    2AH        3F3C 0027                MOVE.W  #0027H,-(A7)
    2EH        486E FFD8                PEA     FFD8(A6)
    32H        6100 0000                BSR     [0000H] = 00000034H
    36H        5C8F                     ADDQ.L  #6,A7
    38H        3D5F FFD6                MOVE.W  (A7)+,FFD6(A6)
    3CH        3A2E FFD6                MOVE.W  FFD6(A6),D5
    40H        49EE FFD8                LEA     FFD8(A6),A4
    44H        19BC 0042 5000           MOVE.B  #42H,00H(A4,D5.W)
    4AH        3A2E FFD6                MOVE.W  FFD6(A6),D5
    4EH        5245                     ADDQ.W  #1,D5
    50H        49EE FFD8                LEA     FFD8(A6),A4
    54H        4234 5000                CLR.B   00H(A4,D5.W)
    58H        3F3C 0027                MOVE.W  #0027H,-(A7)
    5CH        486E FFD8                PEA     FFD8(A6)
    60H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    64H        6100 0000                BSR     [0000H] = 00000066H
    68H        508F                     ADDQ.L  #8,A7
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    34H, procnum = 19  checksum: o.k.

ref own quick call at    66H, procnum = 14  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 110
WriteHex(CARDINAL; CARDINAL)
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD4                LINK    A6,#FFD4H
     4H        7A00                     MOVEQ   #00H,D5
     6H        3A2E 000A                MOVE.W  000A(A6),D5
     AH        2F05                     MOVE.L  D5,-(A7)
     CH        3F3C 0010                MOVE.W  #0010H,-(A7)
    10H        4227                     CLR.B   -(A7)
    12H        3F3C 0027                MOVE.W  #0027H,-(A7)
    16H        486E FFD8                PEA     FFD8(A6)
    1AH        486E FFD5                PEA     FFD5(A6)
    1EH        4EB9 0000 0000           JSR     Conversions.ConvertToString
    24H        4FEF 0012                LEA     0012(A7),A7
    28H        558F                     SUBQ.L  #2,A7
    2AH        3F3C 0027                MOVE.W  #0027H,-(A7)
    2EH        486E FFD8                PEA     FFD8(A6)
    32H        6100 0000                BSR     [0000H] = 00000034H
    36H        5C8F                     ADDQ.L  #6,A7
    38H        3D5F FFD6                MOVE.W  (A7)+,FFD6(A6)
    3CH        3A2E FFD6                MOVE.W  FFD6(A6),D5
    40H        49EE FFD8                LEA     FFD8(A6),A4
    44H        19BC 0048 5000           MOVE.B  #48H,00H(A4,D5.W)
    4AH        3A2E FFD6                MOVE.W  FFD6(A6),D5
    4EH        5245                     ADDQ.W  #1,D5
    50H        49EE FFD8                LEA     FFD8(A6),A4
    54H        4234 5000                CLR.B   00H(A4,D5.W)
    58H        3F3C 0027                MOVE.W  #0027H,-(A7)
    5CH        486E FFD8                PEA     FFD8(A6)
    60H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    64H        6100 0000                BSR     [0000H] = 00000066H
    68H        508F                     ADDQ.L  #8,A7
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref own quick call at    34H, procnum = 19  checksum: o.k.

ref own quick call at    66H, procnum = 14  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 42
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        4239 0000 0086           CLR.B   00000086H
    10H        4239 0000 0088           CLR.B   00000088H
    16H        4239 0000 0087           CLR.B   00000087H
    1CH        4239 0000 0089           CLR.B   00000089H
    22H        4E5E                     UNLK    A6
    24H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext init call at    24H  checksum: o.k.

string data:, number of bytes = 66
NO DECODE -------- DATA

     0H         434F     4E3A     0000     5052     4E3A     
     AH         0000     4155     583A     0000     456E     
    14H         7465     7220     2769     6E27     2066     
    1EH         696C     656E     616D     6520     3E20     
    28H         0000     456E     7465     7220     276F     
    32H         7574     2720     6669     6C65     6E61     
    3CH         6D65     203E     2000       checksum: o.k.

scmod end  checksum: o.k.
