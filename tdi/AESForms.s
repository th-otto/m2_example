link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  AESForms, key =  2102H  CB16H  5DF5H  checksum: o.k.

import GEMAESbase, key =  2102H  CAD6H  2E6DH, modnum =  2  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 58
PROCEDURE FormDo(SYSTEM.ADDRESS; INTEGER) : INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0040      MOVE.W  0008(A6),00000040H
     CH        23EE 000A 0000 0072      MOVE.L  000A(A6),00000072H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 0032                MOVE.W  #0032H,-(A7)
    1AH        3F3C 0001                MOVE.W  #0001H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        4267                     CLR.W   -(A7)
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000A                LEA     000A(A7),A7
    32H        3D5F 000E                MOVE.W  (A7)+,000E(A6)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    2AH, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 92
PROCEDURE FormDialogue(INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER; INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F2E 0018                MOVE.W  0018(A6),-(A7)
     8H        3F2E 0016                MOVE.W  0016(A6),-(A7)
     CH        3F2E 0014                MOVE.W  0014(A6),-(A7)
    10H        3F2E 0012                MOVE.W  0012(A6),-(A7)
    14H        3F2E 0010                MOVE.W  0010(A6),-(A7)
    18H        3F2E 000E                MOVE.W  000E(A6),-(A7)
    1CH        3F2E 000C                MOVE.W  000C(A6),-(A7)
    20H        3F2E 000A                MOVE.W  000A(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        4FEF 0010                LEA     0010(A7),A7
    2EH        33EE 0008 0000 0050      MOVE.W  0008(A6),00000050H
    36H        558F                     SUBQ.L  #2,A7
    38H        3F3C 0033                MOVE.W  #0033H,-(A7)
    3CH        3F3C 0009                MOVE.W  #0009H,-(A7)
    40H        3F3C 0001                MOVE.W  #0001H,-(A7)
    44H        4267                     CLR.W   -(A7)
    46H        4267                     CLR.W   -(A7)
    48H        4EB9 0000 0000           JSR     00000000H
    4EH        4FEF 000A                LEA     000A(A7),A7
    52H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    26H, procnum =  5, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

ref ext proc call at    4AH, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    54H, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 62
PROCEDURE FormAlert(INTEGER; VAR ARRAY CHAR) : INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000E 0000 0040      MOVE.W  000E(A6),00000040H
     CH        286E 0008                MOVE.L  0008(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        23C5 0000 0072           MOVE.L  D5,00000072H
    18H        558F                     SUBQ.L  #2,A7
    1AH        3F3C 0034                MOVE.W  #0034H,-(A7)
    1EH        3F3C 0001                MOVE.W  #0001H,-(A7)
    22H        3F3C 0001                MOVE.W  #0001H,-(A7)
    26H        3F3C 0001                MOVE.W  #0001H,-(A7)
    2AH        4267                     CLR.W   -(A7)
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        4FEF 000A                LEA     000A(A7),A7
    36H        3D5F 0010                MOVE.W  (A7)+,0010(A6)
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    14H, modnum =  2  checksum: o.k.

ref ext proc call at    2EH, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 48
PROCEDURE FormError(INTEGER) : INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0008 0000 0042      MOVE.W  0008(A6),00000042H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0035                MOVE.W  #0035H,-(A7)
    12H        3F3C 0001                MOVE.W  #0001H,-(A7)
    16H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        3D5F 000A                MOVE.W  (A7)+,000A(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 84
PROCEDURE FormCenter(SYSTEM.ADDRESS; VAR INTEGER; VAR INTEGER; VAR INTEGER; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0018 0000 0072      MOVE.L  0018(A6),00000072H
     CH        558F                     SUBQ.L  #2,A7
     EH        3F3C 0036                MOVE.W  #0036H,-(A7)
    12H        4267                     CLR.W   -(A7)
    14H        3F3C 0005                MOVE.W  #0005H,-(A7)
    18H        3F3C 0001                MOVE.W  #0001H,-(A7)
    1CH        4267                     CLR.W   -(A7)
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        4FEF 000A                LEA     000A(A7),A7
    28H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    2EH        286E 0014                MOVE.L  0014(A6),A4
    32H        4854                     PEA     (A4)
    34H        286E 0010                MOVE.L  0010(A6),A4
    38H        4854                     PEA     (A4)
    3AH        286E 000C                MOVE.L  000C(A6),A4
    3EH        4854                     PEA     (A4)
    40H        286E 0008                MOVE.L  0008(A6),A4
    44H        4854                     PEA     (A4)
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        4FEF 0010                LEA     0010(A7),A7
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext proc call at    20H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    2AH, modnum =  2  checksum: o.k.

ref ext proc call at    48H, procnum =  7, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 68
PROCEDURE FileSelectorInput(SYSTEM.ADDRESS; SYSTEM.ADDRESS; VAR INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        23EE 0010 0000 0072      MOVE.L  0010(A6),00000072H
     CH        23EE 000C 0000 0076      MOVE.L  000C(A6),00000076H
    14H        558F                     SUBQ.L  #2,A7
    16H        3F3C 005A                MOVE.W  #005AH,-(A7)
    1AH        4267                     CLR.W   -(A7)
    1CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    20H        3F3C 0002                MOVE.W  #0002H,-(A7)
    24H        4267                     CLR.W   -(A7)
    26H        4EB9 0000 0000           JSR     00000000H
    2CH        4FEF 000A                LEA     000A(A7),A7
    30H        33DF 0000 0086           MOVE.W  (A7)+,GEMAESbase.AESCallResult
    36H        286E 0008                MOVE.L  0008(A6),A4
    3AH        38B9 0000 0064           MOVE.W  00000064H,(A4)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref ext data at     8H, modnum =  2  checksum: o.k.

ref ext data at    10H, modnum =  2  checksum: o.k.

ref ext proc call at    28H, procnum =  1, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

ref ext data at    3CH, modnum =  2  checksum: o.k.

scmod end  checksum: o.k.
