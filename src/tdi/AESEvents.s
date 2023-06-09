link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESEvents, key =  2102H  CB1FH  369CH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 38
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        558F                     SUBQ.L  #2,A7
     6H        3F3C 0014                MOVE.W  #0014H,-(A7)
     AH        4267                     CLR.W   -(A7)
     CH        3F3C 0001                MOVE.W  #0001H,-(A7)
    10H        4267                     CLR.W   -(A7)
    12H        4267                     CLR.W   -(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        4FEF 000A                LEA     000A(A7),A7
    1EH        3D5F 0008                MOVE.W  (A7)+,0008(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 100
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        3F2E 001C                MOVE.W  001C(A6),-(A7)
     8H        3F2E 001A                MOVE.W  001A(A6),-(A7)
     CH        3F2E 0018                MOVE.W  0018(A6),-(A7)
    10H        4EB9 0000 0000           JSR     00000000H
    16H        5C8F                     ADDQ.L  #6,A7
    18H        558F                     SUBQ.L  #2,A7
    1AH        3F3C 0015                MOVE.W  #0015H,-(A7)
    1EH        3F3C 0003                MOVE.W  #0003H,-(A7)
    22H        3F3C 0005                MOVE.W  #0005H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4267                     CLR.W   -(A7)
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        4FEF 000A                LEA     000A(A7),A7
    34H        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    38H        286E 0014                MOVE.L  0014(A6),A4
    3CH        4854                     PEA     (A4)
    3EH        286E 0010                MOVE.L  0010(A6),A4
    42H        4854                     PEA     (A4)
    44H        286E 000C                MOVE.L  000C(A6),A4
    48H        4854                     PEA     (A4)
    4AH        286E 0008                MOVE.L  0008(A6),A4
    4EH        4854                     PEA     (A4)
    50H        4EB9 0000 0000           JSR     00000000H
    56H        4FEF 0010                LEA     0010(A7),A7
    5AH        3D6E FFFE 001E           MOVE.W  FFFE(A6),001E(A6)
    60H        4E5E                     UNLK    A6
    62H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    12H, procnum =  3, modnum =  2  checksum: o.k.

ref ext proc call at    2CH, procnum =  1, modnum =  2  checksum: o.k.

ref ext proc call at    52H, procnum =  7, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 108
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        3F2E 0020                MOVE.W  0020(A6),-(A7)
     8H        3F2E 001E                MOVE.W  001E(A6),-(A7)
     CH        3F2E 001C                MOVE.W  001C(A6),-(A7)
    10H        3F2E 001A                MOVE.W  001A(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 0018 0000 0048      MOVE.W  0018(A6),00000048H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 0016                MOVE.W  #0016H,-(A7)
    2AH        3F3C 0005                MOVE.W  #0005H,-(A7)
    2EH        3F3C 0005                MOVE.W  #0005H,-(A7)
    32H        4267                     CLR.W   -(A7)
    34H        4267                     CLR.W   -(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 000A                LEA     000A(A7),A7
    40H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    46H        286E 0014                MOVE.L  0014(A6),A4
    4AH        4854                     PEA     (A4)
    4CH        286E 0010                MOVE.L  0010(A6),A4
    50H        4854                     PEA     (A4)
    52H        286E 000C                MOVE.L  000C(A6),A4
    56H        4854                     PEA     (A4)
    58H        286E 0008                MOVE.L  0008(A6),A4
    5CH        4854                     PEA     (A4)
    5EH        4EB9 0000 0000           JSR     00000000H
    64H        4FEF 0010                LEA     0010(A7),A7
    68H        4E5E                     UNLK    A6
    6AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    42H, modnum =  2  checksum: o.k.

ref ext proc call at    60H, procnum =  7, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 50
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0008 0000 0072      MOVE.L  0008(A6),00000072H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0017                MOVE.W  #0017H,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F3C 0001                MOVE.W  #0001H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 58
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 0018                MOVE.W  #0018H,-(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        4267                     CLR.W   -(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        33DF 0000 0086           MOVE.W  (A7)+,00000086H
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 238
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFE                LINK    A6,#FFFEH
     4H        33EE 0042 0000 0040      MOVE.W  0042(A6),00000040H
     CH        33EE 0040 0000 0042      MOVE.W  0040(A6),00000042H
    14H        33EE 003E 0000 0044      MOVE.W  003E(A6),00000044H
    1CH        33EE 003C 0000 0046      MOVE.W  003C(A6),00000046H
    24H        33EE 003A 0000 0048      MOVE.W  003A(A6),00000048H
    2CH        33EE 0038 0000 004A      MOVE.W  0038(A6),0000004AH
    34H        33EE 0036 0000 004C      MOVE.W  0036(A6),0000004CH
    3CH        33EE 0034 0000 004E      MOVE.W  0034(A6),0000004EH
    44H        33EE 0032 0000 0050      MOVE.W  0032(A6),00000050H
    4CH        33EE 0030 0000 0052      MOVE.W  0030(A6),00000052H
    54H        33EE 002E 0000 0054      MOVE.W  002E(A6),00000054H
    5CH        33EE 002C 0000 0056      MOVE.W  002C(A6),00000056H
    64H        33EE 002A 0000 0058      MOVE.W  002A(A6),00000058H
    6CH        33EE 0028 0000 005A      MOVE.W  0028(A6),0000005AH
    74H        33EE 0022 0000 005C      MOVE.W  0022(A6),0000005CH
    7CH        33EE 0020 0000 005E      MOVE.W  0020(A6),0000005EH
    84H        23EE 0024 0000 0072      MOVE.L  0024(A6),00000072H
    8CH        558F                     SUBQ.L  #2,A7
    8EH        3F3C 0019                MOVE.W  #0019H,-(A7)
    92H        3F3C 0010                MOVE.W  #0010H,-(A7)
    96H        3F3C 0007                MOVE.W  #0007H,-(A7)
    9AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    9EH        4267                     CLR.W   -(A7)
    A0H        4EB9 0000 0000           JSR     00000000H
    A6H        4FEF 000A                LEA     000A(A7),A7
    AAH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    AEH        286E 001C                MOVE.L  001C(A6),A4
    B2H        4854                     PEA     (A4)
    B4H        286E 0018                MOVE.L  0018(A6),A4
    B8H        4854                     PEA     (A4)
    BAH        286E 0014                MOVE.L  0014(A6),A4
    BEH        4854                     PEA     (A4)
    C0H        286E 0010                MOVE.L  0010(A6),A4
    C4H        4854                     PEA     (A4)
    C6H        4EB9 0000 0000           JSR     00000000H
    CCH        4FEF 0010                LEA     0010(A7),A7
    D0H        286E 000C                MOVE.L  000C(A6),A4
    D4H        38B9 0000 006C           MOVE.W  0000006CH,(A4)
    DAH        286E 0008                MOVE.L  0008(A6),A4
    DEH        38B9 0000 006E           MOVE.W  0000006EH,(A4)
    E4H        3D6E FFFE 0044           MOVE.W  FFFE(A6),0044(A6)
    EAH        4E5E                     UNLK    A6
    ECH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext data at    18H, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext data at    30H, modnum =  2  checksum: o.k.

ref ext data at    38H, modnum =  2  checksum: o.k.

ref ext data at    40H, modnum =  2  checksum: o.k.

ref ext data at    48H, modnum =  2  checksum: o.k.

ref ext data at    50H, modnum =  2  checksum: o.k.

ref ext data at    58H, modnum =  2  checksum: o.k.

ref ext data at    60H, modnum =  2  checksum: o.k.

ref ext data at    68H, modnum =  2  checksum: o.k.

ref ext data at    70H, modnum =  2  checksum: o.k.

ref ext data at    78H, modnum =  2  checksum: o.k.

ref ext data at    80H, modnum =  2  checksum: o.k.

ref ext data at    88H, modnum =  2  checksum: o.k.

ref ext proc call at    A2H, procnum =  1, modnum =  2  checksum: o.k.

ref ext proc call at    C8H, procnum =  7, modnum =  2  checksum: o.k.

ref ext data at    D6H, modnum =  2  checksum: o.k.

ref ext data at    E0H, modnum =  2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 56
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 001A                MOVE.W  #001AH,-(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        4267                     CLR.W   -(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        3D5F 000C                MOVE.W  (A7)+,000C(A6)
    34H        4E5E                     UNLK    A6
    36H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
