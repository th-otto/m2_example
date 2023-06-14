link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  RealInOut, key =  2102H  F1CEH   57BH  checksum: o.k.

import InOut, key =  2102H  F1DDH  20A4H, modnum =  2  checksum: o.k.

import Conversions, key =  2102H  F1E3H  6E1CH, modnum =  3  checksum: o.k.

data size, number of bytes = 2  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 54
PROCEDURE ReadReal(VAR x: REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD8                LINK    A6,#FFD8H
     4H        3F3C 0027                MOVE.W  #0027H,-(A7)
     8H        486E FFD8                PEA     FFD8(A6)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        286E 0008                MOVE.L  0008(A6),A4
    18H        4854                     PEA     (A4)
    1AH        3F3C 0027                MOVE.W  #0027H,-(A7)
    1EH        486E FFD8                PEA     FFD8(A6)
    22H        4879 0000 0000           PEA     00000000H
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000E                LEA     000E(A7),A7
    32H        4E5E                     UNLK    A6
    34H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  8, modnum =  2  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext proc call at    2AH, procnum =  4, modnum =  3  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 62
PROCEDURE WriteRealOct(x: REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFEC                LINK    A6,#FFECH
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        3F3C 0013                MOVE.W  #0013H,-(A7)
     CH        486E FFEC                PEA     FFEC(A6)
    10H        4879 0000 0000           PEA     00000000H
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        4FEF 000E                LEA     000E(A7),A7
    20H        3F3C 0013                MOVE.W  #0013H,-(A7)
    24H        486E FFEC                PEA     FFEC(A6)
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        5C8F                     ADDQ.L  #6,A7
    30H        13F9 0000 0000 0000 0000 MOVE.B  00000000H,00000000H
    3AH        4E5E                     UNLK    A6
    3CH        4E75                     RTS
  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref ext proc call at    18H, procnum =  5, modnum =  3  checksum: o.k.

ref ext proc call at    2AH, procnum = 13, modnum =  2  checksum: o.k.

ref ext data at    32H, modnum =  2  checksum: o.k.

ref own data at    36H  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 70
PROCEDURE WriteReal(x: REAL; n: CARDINAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFEC                LINK    A6,#FFECH
     4H        0C6E 0013 0008           CMPI.W  #0013H,0008(A6)
     AH        6506                     BCS     [06H] = 00000012H
     CH        3D7C 0012 0008           MOVE.W  #0012H,0008(A6)
    12H        2F2E 000A                MOVE.L  000A(A6),-(A7)
    16H        3F3C 0013                MOVE.W  #0013H,-(A7)
    1AH        486E FFEC                PEA     FFEC(A6)
    1EH        3F2E 0008                MOVE.W  0008(A6),-(A7)
    22H        4879 0000 0000           PEA     00000000H
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 0010                LEA     0010(A7),A7
    32H        3F3C 0013                MOVE.W  #0013H,-(A7)
    36H        486E FFEC                PEA     FFEC(A6)
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        5C8F                     ADDQ.L  #6,A7
    42H        4E5E                     UNLK    A6
    44H        4E75                     RTS
  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext proc call at    2AH, procnum =  3, modnum =  3  checksum: o.k.

ref ext proc call at    3CH, procnum = 13, modnum =  2  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 78
PROCEDURE WriteLongReal(x: LONGREAL ; n: CARDINAL) ;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE6                LINK    A6,#FFE6H
     4H        0C6E 0019 0008           CMPI.W  #0019H,0008(A6)
     AH        6506                     BCS     [06H] = 00000012H
     CH        3D7C 0018 0008           MOVE.W  #0018H,0008(A6)
    12H        518F                     SUBQ.L  #8,A7
    14H        49EE 000A                LEA     000A(A6),A4
    18H        47D7                     LEA     (A7),A3
    1AH        26DC                     MOVE.L  (A4)+,(A3)+
    1CH        26DC                     MOVE.L  (A4)+,(A3)+
    1EH        3F3C 0019                MOVE.W  #0019H,-(A7)
    22H        486E FFE6                PEA     FFE6(A6)
    26H        3F2E 0008                MOVE.W  0008(A6),-(A7)
    2AH        4879 0000 0000           PEA     00000000H
    30H        4EB9 0000 0000           JSR     00000000H
    36H        4FEF 0014                LEA     0014(A7),A7
    3AH        3F3C 0019                MOVE.W  #0019H,-(A7)
    3EH        486E FFE6                PEA     FFE6(A6)
    42H        4EB9 0000 0000           JSR     00000000H
    48H        5C8F                     ADDQ.L  #6,A7
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref ext proc call at    32H, procnum =  6, modnum =  3  checksum: o.k.

ref ext proc call at    44H, procnum = 13, modnum =  2  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 54
PROCEDURE ReadLongReal(VAR x: LONGREAL) ;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFD8                LINK    A6,#FFD8H
     4H        3F3C 0027                MOVE.W  #0027H,-(A7)
     8H        486E FFD8                PEA     FFD8(A6)
     CH        4EB9 0000 0000           JSR     00000000H
    12H        5C8F                     ADDQ.L  #6,A7
    14H        286E 0008                MOVE.L  0008(A6),A4
    18H        4854                     PEA     (A4)
    1AH        3F3C 0027                MOVE.W  #0027H,-(A7)
    1EH        486E FFD8                PEA     FFD8(A6)
    22H        4879 0000 0000           PEA     00000000H
    28H        4EB9 0000 0000           JSR     00000000H
    2EH        4FEF 000E                LEA     000E(A7),A7
    32H        4E5E                     UNLK    A6
    34H        4E75                     RTS
  checksum: o.k.

ref ext proc call at     EH, procnum =  8, modnum =  2  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext proc call at    2AH, procnum =  7, modnum =  3  checksum: o.k.

scmod end  checksum: o.k.
