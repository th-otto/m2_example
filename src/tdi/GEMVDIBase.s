link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMVDIbase, key =  2102H  CAE1H  2388H  checksum: o.k.

data size, number of bytes = 1092  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 18
CallVDI
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        7073                     MOVEQ   #73H,D0
     6H        2239 0000 042C           MOVE.L  0000042CH,D1
     CH        4E42                     TRAP    #2
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 48
SetContrl
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0010 0000 0000      MOVE.W  0010(A6),00000000H
     CH        33EE 000E 0000 0002      MOVE.W  000E(A6),00000002H
    14H        33EE 000C 0000 0006      MOVE.W  000C(A6),00000006H
    1CH        33EE 000A 0000 000A      MOVE.W  000A(A6),0000000AH
    24H        33EE 0008 0000 000C      MOVE.W  0008(A6),0000000CH
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    28H  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 142
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        49F9 0000 0018           LEA     00000018H,A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        23C5 0000 041C           MOVE.L  D5,0000041CH ADRintin := ADR(intin)
    18H        49F9 0000 0118           LEA     00000118H,A4
    1EH        2A0C                     MOVE.L  A4,D5
    20H        23C5 0000 0420           MOVE.L  D5,00000420H ADRptsin := ADR(ptsin)
    26H        49F9 0000 0218           LEA     00000218H,A4
    2CH        2A0C                     MOVE.L  A4,D5
    2EH        23C5 0000 0424           MOVE.L  D5,00000424H ADRintout := ADR(intout)
    34H        49F9 0000 0318           LEA     00000318H,A4
    3AH        2A0C                     MOVE.L  A4,D5
    3CH        23C5 0000 0428           MOVE.L  D5,00000428H ADRptsout := ADR(ptsout)
    42H        49F9 0000 0000           LEA     00000000H,A4
    48H        2A0C                     MOVE.L  A4,D5
    4AH        23C5 0000 0430           MOVE.L  D5,00000430H parameterBlock[0] := ADR(contrl)
    50H        23F9 0000 041C 0000 0434 MOVE.L  0000041CH,00000434H parameterBlock[1] := ADRintin
    5AH        23F9 0000 0420 0000 0438 MOVE.L  00000420H,00000438H parameterBlock[2] := ADRptsin
    64H        23F9 0000 0424 0000 043C MOVE.L  00000424H,0000043CH parameterBlock[3] := ADRintout
    6EH        23F9 0000 0428 0000 0440 MOVE.L  00000428H,00000440H parameterBlock[4] := ADRptsout
    78H        49F9 0000 0430           LEA     00000430H,A4
    7EH        2A0C                     MOVE.L  A4,D5
    80H        23C5 0000 042C           MOVE.L  D5,0000042CH ADRParams := ADR(parameterBlock)
    86H        4E5E                     UNLK    A6
    88H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref own data at    22H  checksum: o.k.

ref own data at    28H  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    44H  checksum: o.k.

ref own data at    4CH  checksum: o.k.

ref own data at    52H  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref own data at    5CH  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref own data at    66H  checksum: o.k.

ref own data at    6AH  checksum: o.k.

ref own data at    70H  checksum: o.k.

ref own data at    74H  checksum: o.k.

ref own data at    7AH  checksum: o.k.

ref own data at    82H  checksum: o.k.

ref ext init call at    88H  checksum: o.k.

scmod end  checksum: o.k.
