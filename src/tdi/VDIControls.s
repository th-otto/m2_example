link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIControls, key =  2102H  CB2DH  78D7H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 218
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0001                MOVE.W  #0001H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        286E 000C                MOVE.L  000C(A6),A4
    12H        3F14                     MOVE.W  (A4),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4279 0000 0000           CLR.W   00000000H
    24H        3A39 0000 0000           MOVE.W  00000000H,D5
    2AH        286E 0010                MOVE.L  0010(A6),A4
    2EH        DA45                     ADD.W   D5,D5
    30H        3839 0000 0000           MOVE.W  00000000H,D4
    36H        D844                     ADD.W   D4,D4
    38H        47F9 0000 0018           LEA     00000018H,A3
    3EH        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    44H        5279 0000 0000           ADDQ.W  #1,00000000H
    4AH        0C79 000B 0000 0000      CMPI.W  #000BH,00000000H
    52H        66D0                     BNE     [D0H] = 00000024H
    54H        4EB9 0000 0000           JSR     00000000H
    5AH        286E 000C                MOVE.L  000C(A6),A4
    5EH        38B9 0000 000C           MOVE.W  0000000CH,(A4)
    64H        4279 0000 0000           CLR.W   00000000H
    6AH        3A39 0000 0000           MOVE.W  00000000H,D5
    70H        DA45                     ADD.W   D5,D5
    72H        49F9 0000 0218           LEA     00000218H,A4
    78H        3839 0000 0000           MOVE.W  00000000H,D4
    7EH        266E 0008                MOVE.L  0008(A6),A3
    82H        D844                     ADD.W   D4,D4
    84H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    8AH        5279 0000 0000           ADDQ.W  #1,00000000H
    90H        0C79 002D 0000 0000      CMPI.W  #002DH,00000000H
    98H        66D0                     BNE     [D0H] = 0000006AH
    9AH        33FC 002D 0000 0000      MOVE.W  #002DH,00000000H
    A2H        3A39 0000 0000           MOVE.W  00000000H,D5
    A8H        0445 002D                SUBI.W  #002DH,D5
    ACH        DA45                     ADD.W   D5,D5
    AEH        49F9 0000 0318           LEA     00000318H,A4
    B4H        3839 0000 0000           MOVE.W  00000000H,D4
    BAH        266E 0008                MOVE.L  0008(A6),A3
    BEH        D844                     ADD.W   D4,D4
    C0H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    C6H        5279 0000 0000           ADDQ.W  #1,00000000H
    CCH        0C79 0039 0000 0000      CMPI.W  #0039H,00000000H
    D4H        66CC                     BNE     [CCH] = 000000A2H
    D6H        4E5E                     UNLK    A6
    D8H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref own data at    4EH  checksum: o.k.

ref ext proc call at    56H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    60H, modnum =  1  checksum: o.k.

ref own data at    66H  checksum: o.k.

ref own data at    6CH  checksum: o.k.

ref ext data at    74H, modnum =  1  checksum: o.k.

ref own data at    7AH  checksum: o.k.

ref own data at    8CH  checksum: o.k.

ref own data at    94H  checksum: o.k.

ref own data at    9EH  checksum: o.k.

ref own data at    A4H  checksum: o.k.

ref ext data at    B0H, modnum =  1  checksum: o.k.

ref own data at    B6H  checksum: o.k.

ref own data at    C8H  checksum: o.k.

ref own data at    D0H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0002                MOVE.W  #0002H,-(A7)
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

proc code, procnum =  3, entrypoint =     0H, number of bytes = 220
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0064                MOVE.W  #0064H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        3F3C 000B                MOVE.W  #000BH,-(A7)
     EH        4267                     CLR.W   -(A7)
    10H        286E 000C                MOVE.L  000C(A6),A4
    14H        3F14                     MOVE.W  (A4),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        4279 0000 0000           CLR.W   00000000H
    26H        3A39 0000 0000           MOVE.W  00000000H,D5
    2CH        286E 0010                MOVE.L  0010(A6),A4
    30H        DA45                     ADD.W   D5,D5
    32H        3839 0000 0000           MOVE.W  00000000H,D4
    38H        D844                     ADD.W   D4,D4
    3AH        47F9 0000 0018           LEA     00000018H,A3
    40H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    46H        5279 0000 0000           ADDQ.W  #1,00000000H
    4CH        0C79 000B 0000 0000      CMPI.W  #000BH,00000000H
    54H        66D0                     BNE     [D0H] = 00000026H
    56H        4EB9 0000 0000           JSR     00000000H
    5CH        4279 0000 0000           CLR.W   00000000H
    62H        3A39 0000 0000           MOVE.W  00000000H,D5
    68H        DA45                     ADD.W   D5,D5
    6AH        49F9 0000 0218           LEA     00000218H,A4
    70H        3839 0000 0000           MOVE.W  00000000H,D4
    76H        266E 0008                MOVE.L  0008(A6),A3
    7AH        D844                     ADD.W   D4,D4
    7CH        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    82H        5279 0000 0000           ADDQ.W  #1,00000000H
    88H        0C79 002D 0000 0000      CMPI.W  #002DH,00000000H
    90H        66D0                     BNE     [D0H] = 00000062H
    92H        33FC 002D 0000 0000      MOVE.W  #002DH,00000000H
    9AH        3A39 0000 0000           MOVE.W  00000000H,D5
    A0H        0445 002D                SUBI.W  #002DH,D5
    A4H        DA45                     ADD.W   D5,D5
    A6H        49F9 0000 0318           LEA     00000318H,A4
    ACH        3839 0000 0000           MOVE.W  00000000H,D4
    B2H        266E 0008                MOVE.L  0008(A6),A3
    B6H        D844                     ADD.W   D4,D4
    B8H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    BEH        5279 0000 0000           ADDQ.W  #1,00000000H
    C4H        0C79 0039 0000 0000      CMPI.W  #0039H,00000000H
    CCH        66CC                     BNE     [CCH] = 0000009AH
    CEH        286E 000C                MOVE.L  000C(A6),A4
    D2H        38B9 0000 000C           MOVE.W  0000000CH,(A4)
    D8H        4E5E                     UNLK    A6
    DAH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own data at    28H  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref ext proc call at    58H, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    5EH  checksum: o.k.

ref own data at    64H  checksum: o.k.

ref ext data at    6CH, modnum =  1  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref own data at    8CH  checksum: o.k.

ref own data at    96H  checksum: o.k.

ref own data at    9CH  checksum: o.k.

ref ext data at    A8H, modnum =  1  checksum: o.k.

ref own data at    AEH  checksum: o.k.

ref own data at    C0H  checksum: o.k.

ref own data at    C8H  checksum: o.k.

ref ext data at    D4H, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0065                MOVE.W  #0065H,-(A7)
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

proc code, procnum =  5, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0003                MOVE.W  #0003H,-(A7)
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

proc code, procnum =  6, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0004                MOVE.W  #0004H,-(A7)
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

proc code, procnum =  7, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0077                MOVE.W  #0077H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        3F3C 0001                MOVE.W  #0001H,-(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        3D79 0000 0218 000C      MOVE.W  00000218H,000C(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    26H, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0078                MOVE.W  #0078H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        3F3C 0001                MOVE.W  #0001H,-(A7)
     EH        4267                     CLR.W   -(A7)
    10H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        33EE 0008 0000 0018      MOVE.W  0008(A6),00000018H
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    22H, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 104
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0081                MOVE.W  #0081H,-(A7)
     8H        3F3C 0002                MOVE.W  #0002H,-(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000A                LEA     000A(A7),A7
    20H        33EE 000C 0000 0018      MOVE.W  000C(A6),00000018H
    28H        4279 0000 0000           CLR.W   00000000H
    2EH        3A39 0000 0000           MOVE.W  00000000H,D5
    34H        286E 0008                MOVE.L  0008(A6),A4
    38H        DA45                     ADD.W   D5,D5
    3AH        3839 0000 0000           MOVE.W  00000000H,D4
    40H        D844                     ADD.W   D4,D4
    42H        47F9 0000 0118           LEA     00000118H,A3
    48H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    4EH        5279 0000 0000           ADDQ.W  #1,00000000H
    54H        0C79 0004 0000 0000      CMPI.W  #0004H,00000000H
    5CH        66D0                     BNE     [D0H] = 0000002EH
    5EH        4EB9 0000 0000           JSR     00000000H
    64H        4E5E                     UNLK    A6
    66H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    18H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    24H, modnum =  1  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref ext proc call at    60H, procnum =  1, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
