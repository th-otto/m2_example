link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESWindows, key =  2102H  CB29H  798FH  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 72
PROCEDURE WindowCreate(INTEGER; INTEGER; INTEGER; INTEGER; INTEGER) : INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 0008 0000 0048      MOVE.W  0008(A6),00000048H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 0064                MOVE.W  #0064H,-(A7)
    2AH        3F3C 0005                MOVE.W  #0005H,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        4267                     CLR.W   -(A7)
    34H        4267                     CLR.W   -(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 000A                LEA     000A(A7),A7
    40H        3D5F 0012                MOVE.W  (A7)+,0012(A6)
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 74
PROCEDURE WindowOpen(INTEGER; INTEGER; INTEGER; INTEGER; INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     8H        3F2E 000E                MOVE.W  000E(A6),-(A7)
     CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    10H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 0008 0000 0048      MOVE.W  0008(A6),00000048H
    24H        558F                     SUBQ.L  #2,A7
    26H        3F3C 0065                MOVE.W  #0065H,-(A7)
    2AH        3F3C 0005                MOVE.W  #0005H,-(A7)
    2EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    32H        4267                     CLR.W   -(A7)
    34H        4267                     CLR.W   -(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        4FEF 000A                LEA     000A(A7),A7
    40H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext proc call at    38H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    42H, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 50
PROCEDURE WindowClose(INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0066                MOVE.W  #0066H,-(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 50
PROCEDURE WindowDelete(INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0067                MOVE.W  #0067H,-(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 92
PROCEDURE WindowGet(INTEGER; INTEGER; VAR INTEGER; VAR INTEGER; VAR INTEGER; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 001A                MOVE.W  001A(A6),-(A7)
     8H        3F2E 0018                MOVE.W  0018(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 0068                MOVE.W  #0068H,-(A7)
    1AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    1EH        3F3C 0005                MOVE.W  #0005H,-(A7)
    22H        4267                     CLR.W   -(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    36H        286E 0014                MOVE.L  0014(A6),A4
    3AH        4854                     PEA     (A4)
    3CH        286E 0010                MOVE.L  0010(A6),A4
    40H        4854                     PEA     (A4)
    42H        286E 000C                MOVE.L  000C(A6),A4
    46H        4854                     PEA     (A4)
    48H        286E 0008                MOVE.L  0008(A6),A4
    4CH        4854                     PEA     (A4)
    4EH        4EB9 0000 0000           JSR     00000000H
    54H        4FEF 0010                LEA     0010(A7),A7
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  2, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

ref ext proc call at    50H, procnum =  7, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 82
PROCEDURE WindowSet(INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0012                MOVE.W  0012(A6),-(A7)
     8H        3F2E 0010                MOVE.W  0010(A6),-(A7)
     CH        3F2E 000E                MOVE.W  000E(A6),-(A7)
    10H        3F2E 000C                MOVE.W  000C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 000A 0000 0048      MOVE.W  000A(A6),00000048H
    24H        33EE 0008 0000 004A      MOVE.W  0008(A6),0000004AH
    2CH        558F                     SUBQ.L  #2,A7
    2EH        3F3C 0069                MOVE.W  #0069H,-(A7)
    32H        3F3C 0006                MOVE.W  #0006H,-(A7)
    36H        3F3C 0001                MOVE.W  #0001H,-(A7)
    3AH        4267                     CLR.W   -(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000A                LEA     000A(A7),A7
    48H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    4EH        4E5E                     UNLK    A6
    50H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext proc call at    40H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4AH, modnum =  2  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 56
PROCEDURE WindowFind(INTEGER; INTEGER) : INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 000A                MOVE.W  000A(A6),-(A7)
     8H        3F2E 0008                MOVE.W  0008(A6),-(A7)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        588F                     ADDQ.L  #4,A7
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 006A                MOVE.W  #006AH,-(A7)
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

proc code, procnum =  8, entrypoint =     0H, number of bytes = 50
PROCEDURE WindowUpdate(INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 006B                MOVE.W  #006BH,-(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 116
PROCEDURE WindowCalc(INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; VAR INTEGER; VAR INTEGER; VAR INTEGER; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0022                MOVE.W  0022(A6),-(A7)
     8H        3F2E 0020                MOVE.W  0020(A6),-(A7)
     CH        3F2E 001E                MOVE.W  001E(A6),-(A7)
    10H        3F2E 001C                MOVE.W  001C(A6),-(A7)
    14H        4EB9 0000 0000           JSR     00000000H
    1AH        508F                     ADDQ.L  #8,A7
    1CH        33EE 001A 0000 0048      MOVE.W  001A(A6),00000048H
    24H        33EE 0018 0000 004A      MOVE.W  0018(A6),0000004AH
    2CH        558F                     SUBQ.L  #2,A7
    2EH        3F3C 006C                MOVE.W  #006CH,-(A7)
    32H        3F3C 0006                MOVE.W  #0006H,-(A7)
    36H        3F3C 0005                MOVE.W  #0005H,-(A7)
    3AH        4267                     CLR.W   -(A7)
    3CH        4267                     CLR.W   -(A7)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        4FEF 000A                LEA     000A(A7),A7
    48H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    4EH        286E 0014                MOVE.L  0014(A6),A4
    52H        4854                     PEA     (A4)
    54H        286E 0010                MOVE.L  0010(A6),A4
    58H        4854                     PEA     (A4)
    5AH        286E 000C                MOVE.L  000C(A6),A4
    5EH        4854                     PEA     (A4)
    60H        286E 0008                MOVE.L  0008(A6),A4
    64H        4854                     PEA     (A4)
    66H        4EB9 0000 0000           JSR     00000000H
    6CH        4FEF 0010                LEA     0010(A7),A7
    70H        4E5E                     UNLK    A6
    72H        4E75                     RTS
  checksum: o.k.

ref ext proc call at    16H, procnum =  4, modnum =  2  checksum: o.k.

ref ext data at    20H, modnum =  2  checksum: o.k.

ref ext data at    28H, modnum =  2  checksum: o.k.

ref ext proc call at    40H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    4AH, modnum =  2  checksum: o.k.

ref ext proc call at    68H, procnum =  7, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
