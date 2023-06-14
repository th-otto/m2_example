link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  VDIInquires, key =  2102H  CAEFH  1D77H  checksum: o.k.

import GEMVDIbase, key =  2102H  CAE1H  2388H, modnum =  1  checksum: o.k.

data size, number of bytes = 4  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 162
ExtendedInquire
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0018      MOVE.W  000C(A6),intin
     CH        3F3C 0066                MOVE.W  #0066H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    2CH        4279 0000 0000           CLR.W   00000000H
    32H        3A39 0000 0000           MOVE.W  00000000H,D5
    38H        DA45                     ADD.W   D5,D5
    3AH        49F9 0000 0218           LEA     intout,A4
    40H        3839 0000 0000           MOVE.W  00000000H,D4
    46H        266E 0008                MOVE.L  0008(A6),A3
    4AH        D844                     ADD.W   D4,D4
    4CH        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    52H        5279 0000 0000           ADDQ.W  #1,00000000H
    58H        0C79 002D 0000 0000      CMPI.W  #002DH,00000000H
    60H        66D0                     BNE     [D0H] = 00000032H
    62H        33FC 002D 0000 0000      MOVE.W  #002DH,00000000H
    6AH        3A39 0000 0000           MOVE.W  00000000H,D5
    70H        0445 002D                SUBI.W  #002DH,D5
    74H        DA45                     ADD.W   D5,D5
    76H        49F9 0000 0318           LEA     ptsout,A4
    7CH        3839 0000 0000           MOVE.W  00000000H,D4
    82H        266E 0008                MOVE.L  0008(A6),A3
    86H        D844                     ADD.W   D4,D4
    88H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    8EH        5279 0000 0000           ADDQ.W  #1,00000000H
    94H        0C79 0039 0000 0000      CMPI.W  #0039H,00000000H
    9CH        66CC                     BNE     [CCH] = 0000006AH
    9EH        4E5E                     UNLK    A6
    A0H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext data at    3CH, modnum =  1  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    54H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    66H  checksum: o.k.

ref own data at    6CH  checksum: o.k.

ref ext data at    78H, modnum =  1  checksum: o.k.

ref own data at    7EH  checksum: o.k.

ref own data at    90H  checksum: o.k.

ref own data at    98H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 90
InquireColour
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000E 0000 0018      MOVE.W  000E(A6),intin
     CH        33EE 000C 0000 001A      MOVE.W  000C(A6),intin+2
    14H        3F3C 001A                MOVE.W  #001AH,-(A7)
    18H        4267                     CLR.W   -(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        4267                     CLR.W   -(A7)
    20H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    24H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    2AH        4FEF 000A                LEA     000A(A7),A7
    2EH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    34H        286E 0008                MOVE.L  0008(A6),A4
    38H        38B9 0000 021A           MOVE.W  intout+2,(A4)
    3EH        286E 0008                MOVE.L  0008(A6),A4
    42H        3979 0000 021C 0002      MOVE.W  intout+4,0002(A4)
    4AH        286E 0008                MOVE.L  0008(A6),A4
    4EH        3979 0000 021E 0004      MOVE.W  intout+6,0004(A4)
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext data at    10H, modnum =  1  checksum: o.k.

ref ext proc call at    26H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    30H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    3AH, modnum =  1  checksum: o.k.

ref ext data at    44H, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 84
InquireLineAttributes
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0023                MOVE.W  #0023H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        38B9 0000 0218           MOVE.W  intout,(A4)
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        3979 0000 021A 0002      MOVE.W  intout+2,0002(A4)
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        3979 0000 021C 0004      MOVE.W  intout+4,0004(A4)
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        3979 0000 0318 0006      MOVE.W  ptsout,0006(A4)
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 84
InquireMarkerAttributes
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0024                MOVE.W  #0024H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        38B9 0000 0218           MOVE.W  intout,(A4)
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        3979 0000 021A 0002      MOVE.W  intout+2,0002(A4)
    38H        286E 0008                MOVE.L  0008(A6),A4
    3CH        3979 0000 021C 0004      MOVE.W  intout+4,0004(A4)
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        3979 0000 031A 0006      MOVE.W  ptsout+2,0006(A4)
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 92
InquireFillAttributes
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0025                MOVE.W  #0025H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    22H        4279 0000 0000           CLR.W   00000000H
    28H        3A39 0000 0000           MOVE.W  00000000H,D5
    2EH        DA45                     ADD.W   D5,D5
    30H        49F9 0000 0218           LEA     intout,A4
    36H        3839 0000 0000           MOVE.W  00000000H,D4
    3CH        266E 0008                MOVE.L  0008(A6),A3
    40H        D844                     ADD.W   D4,D4
    42H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    48H        5279 0000 0000           ADDQ.W  #1,00000000H
    4EH        0C79 0004 0000 0000      CMPI.W  #0004H,00000000H
    56H        66D0                     BNE     [D0H] = 00000028H
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own data at    52H  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 150
InquireTextAttributes
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0026                MOVE.W  #0026H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    22H        4279 0000 0000           CLR.W   00000000H
    28H        3A39 0000 0000           MOVE.W  00000000H,D5
    2EH        DA45                     ADD.W   D5,D5
    30H        49F9 0000 0218           LEA     intout,A4
    36H        3839 0000 0000           MOVE.W  00000000H,D4
    3CH        266E 0008                MOVE.L  0008(A6),A3
    40H        D844                     ADD.W   D4,D4
    42H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    48H        5279 0000 0000           ADDQ.W  #1,00000000H
    4EH        0C79 0006 0000 0000      CMPI.W  #0006H,00000000H
    56H        66D0                     BNE     [D0H] = 00000028H
    58H        33FC 0006 0000 0000      MOVE.W  #0006H,00000000H
    60H        3A39 0000 0000           MOVE.W  00000000H,D5
    66H        5D45                     SUBQ.W  #6,D5
    68H        DA45                     ADD.W   D5,D5
    6AH        49F9 0000 0318           LEA     ptsout,A4
    70H        3839 0000 0000           MOVE.W  00000000H,D4
    76H        266E 0008                MOVE.L  0008(A6),A3
    7AH        D844                     ADD.W   D4,D4
    7CH        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    82H        5279 0000 0000           ADDQ.W  #1,00000000H
    88H        0C79 000A 0000 0000      CMPI.W  #000AH,00000000H
    90H        66CE                     BNE     [CEH] = 00000060H
    92H        4E5E                     UNLK    A6
    94H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    4AH  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    62H  checksum: o.k.

ref ext data at    6CH, modnum =  1  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref own data at    8CH  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 170
InquireTextExtent
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF0                LINK    A6,#FFF0H
     4H        286E 0008                MOVE.L  0008(A6),A4
     8H        47EE FFF0                LEA     FFF0(A6),A3
     CH        26DC                     MOVE.L  (A4)+,(A3)+
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        26DC                     MOVE.L  (A4)+,(A3)+
    12H        26DC                     MOVE.L  (A4)+,(A3)+
    14H        4279 0000 0000           CLR.W   00000000H
    1AH        33EE 0010 0000 0002      MOVE.W  0010(A6),00000002H
    22H        3A39 0000 0000           MOVE.W  00000000H,D5
    28H        BA79 0000 0002           CMP.W   00000002H,D5
    2EH        6E10                     BGT     [10H] = 00000040H
    30H        3A39 0000 0000           MOVE.W  00000000H,D5
    36H        286E 000C                MOVE.L  000C(A6),A4
    3AH        4A34 5000                TST.B   00H(A4,D5.W)
    3EH        6604                     BNE     [04H] = 00000044H
    40H        4EFA 002C                JMP     [002CH] = 0000006EH
    44H        3A39 0000 0000           MOVE.W  00000000H,D5
    4AH        286E 000C                MOVE.L  000C(A6),A4
    4EH        7800                     MOVEQ   #00H,D4
    50H        1834 5000                MOVE.B  00H(A4,D5.W),D4
    54H        3A39 0000 0000           MOVE.W  00000000H,D5
    5AH        DA45                     ADD.W   D5,D5
    5CH        49F9 0000 0018           LEA     intin,A4
    62H        3984 5000                MOVE.W  D4,00H(A4,D5.W)
    66H        5279 0000 0000           ADDQ.W  #1,00000000H
    6CH        60B4                     BRA     [B4H] = 00000022H
    6EH        3F3C 0074                MOVE.W  #0074H,-(A7)
    72H        4267                     CLR.W   -(A7)
    74H        3F39 0000 0000           MOVE.W  00000000H,-(A7)
    7AH        4267                     CLR.W   -(A7)
    7CH        3F2E 0012                MOVE.W  0012(A6),-(A7)
    80H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    86H        4FEF 000A                LEA     000A(A7),A7
    8AH        49EE FFF0                LEA     FFF0(A6),A4
    8EH        2A0C                     MOVE.L  A4,D5
    90H        23C5 0000 0440           MOVE.L  D5,00000440H
    96H        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    9CH        23F9 0000 0428 0000 0440 MOVE.L  00000428H,00000440H
    A6H        4E5E                     UNLK    A6
    A8H        4E75                     RTS
  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref ext data at    5EH, modnum =  1  checksum: o.k.

ref own data at    68H  checksum: o.k.

ref own data at    76H  checksum: o.k.

ref ext proc call at    82H, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    92H, modnum =  1  checksum: o.k.

ref ext proc call at    98H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    9EH, modnum =  1  checksum: o.k.

ref ext data at    A2H, modnum =  1  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 90
InquireCharWidth
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7A00                     MOVEQ   #00H,D5
     6H        1A2E 0014                MOVE.B  0014(A6),D5
     AH        33C5 0000 0018           MOVE.W  D5,intin
    10H        3F3C 0075                MOVE.W  #0075H,-(A7)
    14H        4267                     CLR.W   -(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        3F2E 0016                MOVE.W  0016(A6),-(A7)
    20H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    26H        4FEF 000A                LEA     000A(A7),A7
    2AH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    30H        286E 0010                MOVE.L  0010(A6),A4
    34H        38B9 0000 0318           MOVE.W  ptsout,(A4)
    3AH        286E 000C                MOVE.L  000C(A6),A4
    3EH        38B9 0000 031C           MOVE.W  ptsout+4,(A4)
    44H        286E 0008                MOVE.L  0008(A6),A4
    48H        38B9 0000 0320           MOVE.W  ptsout+8,(A4)
    4EH        3D79 0000 0218 0018      MOVE.W  intout,0018(A6)
    56H        4E5E                     UNLK    A6
    58H        4E75                     RTS
  checksum: o.k.

ref ext data at     CH, modnum =  1  checksum: o.k.

ref ext proc call at    22H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    36H, modnum =  1  checksum: o.k.

ref ext data at    40H, modnum =  1  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref ext data at    50H, modnum =  1  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 114
InquireFaceName
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0018      MOVE.W  000C(A6),intin
     CH        3F3C 0082                MOVE.W  #0082H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    2CH        33FC 0001 0000 0000      MOVE.W  #0001H,00000000H
    34H        3A39 0000 0000           MOVE.W  00000000H,D5
    3AH        DA45                     ADD.W   D5,D5
    3CH        49F9 0000 0218           LEA     intout,A4
    42H        3834 5000                MOVE.W  00H(A4,D5.W),D4
    46H        3A39 0000 0000           MOVE.W  00000000H,D5
    4CH        5345                     SUBQ.W  #1,D5
    4EH        286E 0008                MOVE.L  0008(A6),A4
    52H        1984 5000                MOVE.B  D4,00H(A4,D5.W)
    56H        5279 0000 0000           ADDQ.W  #1,00000000H
    5CH        0C79 0021 0000 0000      CMPI.W  #0021H,00000000H
    64H        66CE                     BNE     [CEH] = 00000034H
    66H        3D79 0000 0218 0010      MOVE.W  intout,0010(A6)
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref own data at    48H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref ext data at    68H, modnum =  1  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 162
InquireCellArray
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4279 0000 0000           CLR.W   00000000H
     AH        3A39 0000 0000           MOVE.W  00000000H,D5
    10H        286E 001E                MOVE.L  001E(A6),A4
    14H        DA45                     ADD.W   D5,D5
    16H        3839 0000 0000           MOVE.W  00000000H,D4
    1CH        D844                     ADD.W   D4,D4
    1EH        47F9 0000 0118           LEA     00000118H,A3
    24H        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    2AH        5279 0000 0000           ADDQ.W  #1,00000000H
    30H        0C79 0004 0000 0000      CMPI.W  #0004H,00000000H
    38H        66D0                     BNE     [D0H] = 0000000AH
    3AH        33EE 001C 0000 000E      MOVE.W  001C(A6),0000000EH
    42H        33EE 001A 0000 0010      MOVE.W  001A(A6),00000010H
    4AH        3F3C 001B                MOVE.W  #001BH,-(A7)
    4EH        3F3C 0002                MOVE.W  #0002H,-(A7)
    52H        4267                     CLR.W   -(A7)
    54H        4267                     CLR.W   -(A7)
    56H        3F2E 0022                MOVE.W  0022(A6),-(A7)
    5AH        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    60H        4FEF 000A                LEA     000A(A7),A7
    64H        286E 0008                MOVE.L  0008(A6),A4
    68H        2A0C                     MOVE.L  A4,D5
    6AH        23C5 0000 043C           MOVE.L  D5,0000043CH
    70H        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    76H        23F9 0000 0424 0000 043C MOVE.L  00000424H,0000043CH
    80H        286E 0016                MOVE.L  0016(A6),A4
    84H        38B9 0000 0012           MOVE.W  00000012H,(A4)
    8AH        286E 0012                MOVE.L  0012(A6),A4
    8EH        38B9 0000 0014           MOVE.W  00000014H,(A4)
    94H        286E 000E                MOVE.L  000E(A6),A4
    98H        38B9 0000 0016           MOVE.W  00000016H,(A4)
    9EH        4E5E                     UNLK    A6
    A0H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref ext data at    20H, modnum =  1  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    34H  checksum: o.k.

ref ext data at    3EH, modnum =  1  checksum: o.k.

ref ext data at    46H, modnum =  1  checksum: o.k.

ref ext proc call at    5CH, procnum =  2, modnum =  1  checksum: o.k.

ref ext data at    6CH, modnum =  1  checksum: o.k.

ref ext proc call at    72H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    78H, modnum =  1  checksum: o.k.

ref ext data at    7CH, modnum =  1  checksum: o.k.

ref ext data at    86H, modnum =  1  checksum: o.k.

ref ext data at    90H, modnum =  1  checksum: o.k.

ref ext data at    9AH, modnum =  1  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 58
InquireInputMode
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0018      MOVE.W  000C(A6),intin
     CH        3F3C 0073                MOVE.W  #0073H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        4267                     CLR.W   -(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    22H        4FEF 000A                LEA     000A(A7),A7
    26H        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    2CH        286E 0008                MOVE.L  0008(A6),A4
    30H        38B9 0000 0218           MOVE.W  intout,(A4)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 160
InquireFaceInfo
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0083                MOVE.W  #0083H,-(A7)
     8H        4267                     CLR.W   -(A7)
     AH        4267                     CLR.W   -(A7)
     CH        4267                     CLR.W   -(A7)
     EH        3F2E 001C                MOVE.W  001C(A6),-(A7)
    12H        4EB9 0000 0000           JSR     GEMVDIbase.SetContrl
    18H        4FEF 000A                LEA     000A(A7),A7
    1CH        4EB9 0000 0000           JSR     GEMVDIbase.CallVDI
    22H        286E 0018                MOVE.L  0018(A6),A4
    26H        38B9 0000 0218           MOVE.W  intout,(A4)
    2CH        286E 0014                MOVE.L  0014(A6),A4
    30H        38B9 0000 021A           MOVE.W  intout+2,(A4)
    36H        4279 0000 0000           CLR.W   00000000H
    3CH        7A02                     MOVEQ   #02H,D5
    3EH        CAF9 0000 0000           MULU    00000000H,D5
    44H        5245                     ADDQ.W  #1,D5
    46H        DA45                     ADD.W   D5,D5
    48H        49F9 0000 0318           LEA     ptsout,A4
    4EH        3839 0000 0000           MOVE.W  00000000H,D4
    54H        266E 0010                MOVE.L  0010(A6),A3
    58H        D844                     ADD.W   D4,D4
    5AH        37B4 5000 4000           MOVE.W  00H(A4,D5.W),00H(A3,D4.W)
    60H        5279 0000 0000           ADDQ.W  #1,00000000H
    66H        0C79 0005 0000 0000      CMPI.W  #0005H,00000000H
    6EH        66CC                     BNE     [CCH] = 0000003CH
    70H        286E 000C                MOVE.L  000C(A6),A4
    74H        38B9 0000 0318           MOVE.W  ptsout,(A4)
    7AH        286E 0008                MOVE.L  0008(A6),A4
    7EH        38B9 0000 031C           MOVE.W  0000031CH,(A4)
    84H        286E 0008                MOVE.L  0008(A6),A4
    88H        3979 0000 0320 0002      MOVE.W  00000320H,0002(A4)
    90H        286E 0008                MOVE.L  0008(A6),A4
    94H        3979 0000 0324 0004      MOVE.W  00000324H,0004(A4)
    9CH        4E5E                     UNLK    A6
    9EH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum =  2, modnum =  1  checksum: o.k.

ref ext proc call at    1EH, procnum =  1, modnum =  1  checksum: o.k.

ref ext data at    28H, modnum =  1  checksum: o.k.

ref ext data at    32H, modnum =  1  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref ext data at    4AH, modnum =  1  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref own data at    62H  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref ext data at    76H, modnum =  1  checksum: o.k.

ref ext data at    80H, modnum =  1  checksum: o.k.

ref ext data at    8AH, modnum =  1  checksum: o.k.

ref ext data at    96H, modnum =  1  checksum: o.k.

scmod end  checksum: o.k.
