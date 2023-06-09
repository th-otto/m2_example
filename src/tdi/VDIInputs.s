link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIInputs, key =  2102H  CB0DH  3586H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 8  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000A 0000 0018      MOVE.W  000A(A6),00000018H
     CH        33EE 0008 0000 001A      MOVE.W  0008(A6),0000001AH
    14H        3F3C 0021                MOVE.W  #0021H,-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0016 0000 0118      MOVE.W  0016(A6),00000118H
     CH        33EE 0014 0000 011A      MOVE.W  0014(A6),0000011AH
    14H        3F3C 001C                MOVE.W  #001CH,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        286E 0010                MOVE.L  0010(A6),A4
    38H        38B9 0000 0318           MOVE.W  00000318H,(A4)
    3EH        286E 000C                MOVE.L  000C(A6),A4
    42H        38B9 0000 031A           MOVE.W  0000031AH,(A4)
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        38B9 0000 0218           MOVE.W  00000218H,(A4)
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 94
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0016 0000 0118      MOVE.W  0016(A6),00000118H
     CH        33EE 0014 0000 011A      MOVE.W  0014(A6),0000011AH
    14H        3F3C 001C                MOVE.W  #001CH,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 0018                MOVE.W  0018(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        286E 0010                MOVE.L  0010(A6),A4
    38H        38B9 0000 0318           MOVE.W  00000318H,(A4)
    3EH        286E 000C                MOVE.L  000C(A6),A4
    42H        38B9 0000 031A           MOVE.W  0000031AH,(A4)
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        38B9 0000 0218           MOVE.W  00000218H,(A4)
    52H        3D79 0000 0004 001A      MOVE.W  00000004H,001A(A6)
    5AH        4E5E                     UNLK    A6
    5CH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref ext data at    54H, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0010 0000 0018      MOVE.W  0010(A6),00000018H
     CH        3F3C 001D                MOVE.W  #001DH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        286E 000C                MOVE.L  000C(A6),A4
    30H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    36H        286E 0008                MOVE.L  0008(A6),A4
    3AH        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 78
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0014 0000 0018      MOVE.W  0014(A6),00000018H
     CH        3F3C 001D                MOVE.W  #001DH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        286E 0010                MOVE.L  0010(A6),A4
    30H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    36H        286E 000C                MOVE.L  000C(A6),A4
    3AH        38B9 0000 021A           MOVE.W  0000021AH,(A4)
    40H        286E 0008                MOVE.L  0008(A6),A4
    44H        38B9 0000 0008           MOVE.W  00000008H,(A4)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 58
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0018      MOVE.W  000C(A6),00000018H
     CH        3F3C 001E                MOVE.W  #001EH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 001E                MOVE.W  #001EH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2CH        3D79 0000 0008 000E      MOVE.W  00000008H,000E(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    2EH, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 190
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0014 0000 0018      MOVE.W  0014(A6),00000018H
     CH        33EE 0012 0000 001A      MOVE.W  0012(A6),0000001AH
    14H        286E 000E                MOVE.L  000E(A6),A4
    18H        33D4 0000 0118           MOVE.W  (A4),00000118H
    1EH        286E 000E                MOVE.L  000E(A6),A4
    22H        33EC 0002 0000 011A      MOVE.W  0002(A4),0000011AH
    2AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        3F3C 0002                MOVE.W  #0002H,-(A7)
    36H        4267                     CLR.W   -(A7)
    38H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        4FEF 000A                LEA     000A(A7),A7
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        3A39 0000 0008           MOVE.W  00000008H,D5
    52H        5345                     SUBQ.W  #1,D5
    54H        33C5 0000 0002           MOVE.W  D5,00000002H
    5AH        4279 0000 0000           CLR.W   00000000H
    60H        3A39 0000 0002           MOVE.W  00000002H,D5
    66H        3F05                     MOVE.W  D5,-(A7)
    68H        3039 0000 0000           MOVE.W  00000000H,D0
    6EH        B057                     CMP.W   (A7),D0
    70H        6F04                     BLE     [04H] = 00000076H
    72H        4EFA 0034                JMP     [0034H] = 000000A8H
    76H        3A39 0000 0000           MOVE.W  00000000H,D5
    7CH        DA45                     ADD.W   D5,D5
    7EH        49F9 0000 0218           LEA     00000218H,A4
    84H        3834 5000                MOVE.W  00H(A4,D5.W),D4
    88H        3A39 0000 0000           MOVE.W  00000000H,D5
    8EH        286E 0008                MOVE.L  0008(A6),A4
    92H        1984 5000                MOVE.B  D4,00H(A4,D5.W)
    96H        3039 0000 0000           MOVE.W  00000000H,D0
    9CH        B057                     CMP.W   (A7),D0
    9EH        6C08                     BGE     [08H] = 000000A8H
    A0H        5279 0000 0000           ADDQ.W  #1,00000000H
    A6H        60CE                     BRA     [CEH] = 00000076H
    A8H        548F                     ADDQ.L  #2,A7
    AAH        3A39 0000 0002           MOVE.W  00000002H,D5
    B0H        5245                     ADDQ.W  #1,D5
    B2H        286E 0008                MOVE.L  0008(A6),A4
    B6H        4234 5000                CLR.B   00H(A4,D5.W)
    BAH        4E5E                     UNLK    A6
    BCH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext data at    1AH, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    3EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    48H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    62H  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own data at    78H  checksum: o.k.

ref ext data at    80H, modnum =  1  checksum: o.k.

ref own data at    8AH  checksum: o.k.

ref own data at    98H  checksum: o.k.

ref own data at    A2H  checksum: o.k.

ref own data at    ACH  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 216
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0014 0000 0018      MOVE.W  0014(A6),00000018H
     CH        33EE 0012 0000 001A      MOVE.W  0012(A6),0000001AH
    14H        286E 000E                MOVE.L  000E(A6),A4
    18H        33D4 0000 0118           MOVE.W  (A4),00000118H
    1EH        286E 000E                MOVE.L  000E(A6),A4
    22H        33EC 0002 0000 011A      MOVE.W  0002(A4),0000011AH
    2AH        3F3C 001F                MOVE.W  #001FH,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        3F3C 0002                MOVE.W  #0002H,-(A7)
    36H        4267                     CLR.W   -(A7)
    38H        3F2E 0016                MOVE.W  0016(A6),-(A7)
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        4FEF 000A                LEA     000A(A7),A7
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        33F9 0000 0008 0000 0002 MOVE.W  00000008H,00000002H
    56H        4A79 0000 0002           TST.W   00000002H
    5CH        6608                     BNE     [08H] = 00000066H
    5EH        426E 0018                CLR.W   0018(A6)
    62H        4E5E                     UNLK    A6
    64H        4E75                     RTS
    66H        5379 0000 0002           SUBQ.W  #1,00000002H
    6CH        4279 0000 0000           CLR.W   00000000H
    72H        3A39 0000 0002           MOVE.W  00000002H,D5
    78H        3F05                     MOVE.W  D5,-(A7)
    7AH        3039 0000 0000           MOVE.W  00000000H,D0
    80H        B057                     CMP.W   (A7),D0
    82H        6F04                     BLE     [04H] = 00000088H
    84H        4EFA 0034                JMP     [0034H] = 000000BAH
    88H        3A39 0000 0000           MOVE.W  00000000H,D5
    8EH        DA45                     ADD.W   D5,D5
    90H        49F9 0000 0218           LEA     00000218H,A4
    96H        3834 5000                MOVE.W  00H(A4,D5.W),D4
    9AH        3A39 0000 0000           MOVE.W  00000000H,D5
    A0H        286E 0008                MOVE.L  0008(A6),A4
    A4H        1984 5000                MOVE.B  D4,00H(A4,D5.W)
    A8H        3039 0000 0000           MOVE.W  00000000H,D0
    AEH        B057                     CMP.W   (A7),D0
    B0H        6C08                     BGE     [08H] = 000000BAH
    B2H        5279 0000 0000           ADDQ.W  #1,00000000H
    B8H        60CE                     BRA     [CEH] = 00000088H
    BAH        548F                     ADDQ.L  #2,A7
    BCH        3A39 0000 0002           MOVE.W  00000002H,D5
    C2H        5245                     ADDQ.W  #1,D5
    C4H        286E 0008                MOVE.L  0008(A6),A4
    C8H        4234 5000                CLR.B   00H(A4,D5.W)
    CCH        3D79 0000 0008 0018      MOVE.W  00000008H,0018(A6)
    D4H        4E5E                     UNLK    A6
    D6H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext data at    1AH, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

ref ext proc call at    3EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    48H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    4EH, modnum =  1  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    68H  checksum: o.k.

ref own data at    6EH  checksum: o.k.

ref own data at    74H  checksum: o.k.

ref own data at    7CH  checksum: o.k.

ref own data at    8AH  checksum: o.k.

ref ext data at    92H, modnum =  1  checksum: o.k.

ref own data at    9CH  checksum: o.k.

ref own data at    AAH  checksum: o.k.

ref own data at    B4H  checksum: o.k.

ref own data at    BEH  checksum: o.k.

ref ext data at    CEH, modnum =  1  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 78
 DECODE --------                        INSTRUCTION
     0H        4E56 FFB2                LINK    A6,#FFB2H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFB2                LEA     FFB2(A6),A3
     CH        7A26                     MOVEQ   #26H,D5
     EH        36DC                     MOVE.W  (A4)+,(A3)+
    10H        51CD FFFC                DBRA    D5,[FFFCH] = 0000000EH
    14H        49EE FFB2                LEA     FFB2(A6),A4
    18H        2A0C                     MOVE.L  A4,D5
    1AH        23C5 0000 0434           MOVE.L  D5,00000434H
    20H        3F3C 006F                MOVE.W  #006FH,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        3F3C 0025                MOVE.W  #0025H,-(A7)
    2AH        4267                     CLR.W   -(A7)
    2CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 000A                LEA     000A(A7),A7
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        23F9 0000 041C 0000 0434 MOVE.L  0000041CH,00000434H
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref ext data at    1CH, modnum =  1  checksum: o.k.

ref ext proc call at    32H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    3CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    42H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 96
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0076                MOVE.W  #0076H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        49F9 0000 0004           LEA     00000004H,A4
    22H        28AE 0010                MOVE.L  0010(A6),(A4)
    26H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    2CH        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    34H        2F0C                     MOVE.L  A4,-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        285F                     MOVE.L  (A7)+,A4
    3EH        266E 0008                MOVE.L  0008(A6),A3
    42H        36B9 0000 0218           MOVE.W  00000218H,(A3)
    48H        38B9 0000 0012           MOVE.W  00000012H,(A4)
    4EH        3979 0000 0014 0002      MOVE.W  00000014H,0002(A4)
    56H        266E 000C                MOVE.L  000C(A6),A3
    5AH        2694                     MOVE.L  (A4),(A3)
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
     CH        3F3C 007A                MOVE.W  #007AH,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 007B                MOVE.W  #007BH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 68
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 007C                MOVE.W  #007CH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        286E 0010                MOVE.L  0010(A6),A4
    26H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2CH        286E 000C                MOVE.L  000C(A6),A4
    30H        38B9 0000 0318           MOVE.W  00000318H,(A4)
    36H        286E 0008                MOVE.L  0008(A6),A4
    3AH        38B9 0000 031A           MOVE.W  0000031AH,(A4)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 007D                MOVE.W  #007DH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        49F9 0000 0004           LEA     00000004H,A4
    22H        28AE 000C                MOVE.L  000C(A6),(A4)
    26H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    2CH        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    34H        2F0C                     MOVE.L  A4,-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        285F                     MOVE.L  (A7)+,A4
    3EH        38B9 0000 0012           MOVE.W  00000012H,(A4)
    44H        3979 0000 0014 0002      MOVE.W  00000014H,0002(A4)
    4CH        266E 0008                MOVE.L  0008(A6),A3
    50H        2694                     MOVE.L  (A4),(A3)
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 007E                MOVE.W  #007EH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        49F9 0000 0004           LEA     00000004H,A4
    22H        28AE 000C                MOVE.L  000C(A6),(A4)
    26H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    2CH        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    34H        2F0C                     MOVE.L  A4,-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        285F                     MOVE.L  (A7)+,A4
    3EH        38B9 0000 0012           MOVE.W  00000012H,(A4)
    44H        3979 0000 0014 0002      MOVE.W  00000014H,0002(A4)
    4CH        266E 0008                MOVE.L  0008(A6),A3
    50H        2694                     MOVE.L  (A4),(A3)
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 86
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 007F                MOVE.W  #007FH,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 0010                MOVE.W  0010(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        49F9 0000 0004           LEA     00000004H,A4
    22H        28AE 000C                MOVE.L  000C(A6),(A4)
    26H        33D4 0000 000E           MOVE.W  (A4),0000000EH
    2CH        33EC 0002 0000 0010      MOVE.W  0002(A4),00000010H
    34H        2F0C                     MOVE.L  A4,-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        285F                     MOVE.L  (A7)+,A4
    3EH        38B9 0000 0012           MOVE.W  00000012H,(A4)
    44H        3979 0000 0014 0002      MOVE.W  00000014H,0002(A4)
    4CH        266E 0008                MOVE.L  0008(A6),A3
    50H        2694                     MOVE.L  (A4),(A3)
    52H        4E5E                     UNLK    A6
    54H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    30H, modnum =  1  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0080                MOVE.W  #0080H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     00000000H
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        38B9 0000 0218           MOVE.W  00000218H,(A4)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
