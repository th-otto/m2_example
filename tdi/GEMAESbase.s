link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMAESbase, key =  2102H  CAD6H  2E6DH  checksum: o.k.

data size, number of bytes = 136  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 78
PROCEDURE GemCall(opcode: INTEGER; nintin: INTEGER; nintout: INTEGER; naddrin: INTEGER; naddrout: INTEGER): INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        49F9 0000 0036           LEA     00000036H,A4
     AH        38AE 0010                MOVE.W  0010(A6),(A4)
     EH        396E 000E 0002           MOVE.W  000E(A6),0002(A4)
    14H        396E 000C 0004           MOVE.W  000C(A6),0004(A4)
    1AH        396E 000A 0006           MOVE.W  000A(A6),0006(A4)
    20H        396E 0008 0008           MOVE.W  0008(A6),0008(A4)
    26H        203C 0000 00C8           MOVE.L  #000000C8H,D0
    2CH        49F9 0000 0000           LEA     00000000H,A4
    32H        2A0C                     MOVE.L  A4,D5
    34H        2205                     MOVE.L  D5,D1
    36H        4E42                     TRAP    #2
    38H        33F9 0000 0062 0000 0086 MOVE.W  00000062H,GEMAESbase.AESCallResult
    42H        3D79 0000 0086 0012      MOVE.W  GEMAESbase.AESCallResult,0012(A6)
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own data at    2EH  checksum: o.k.

ref own data at    3AH  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    44H  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 24
PROCEDURE IntIn2(intin0, intin1: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000A 0000 0040      MOVE.W  000A(A6),00000040H
     CH        33EE 0008 0000 0042      MOVE.W  0008(A6),00000042H
    14H        4E5E                     UNLK    A6
    16H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    10H  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 32
 DECODE --------                        INSTRUCTION
PROCEDURE IntIn3(intin0, intin1, intin2: INTEGER);
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000C 0000 0040      MOVE.W  000C(A6),00000040H
     CH        33EE 000A 0000 0042      MOVE.W  000A(A6),00000042H
    14H        33EE 0008 0000 0044      MOVE.W  0008(A6),00000044H
    1CH        4E5E                     UNLK    A6
    1EH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 40
PROCEDURE IntIn4(intin0, intin1, intin2, intin3: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 000E 0000 0040      MOVE.W  000E(A6),00000040H
     CH        33EE 000C 0000 0042      MOVE.W  000C(A6),00000042H
    14H        33EE 000A 0000 0044      MOVE.W  000A(A6),00000044H
    1CH        33EE 0008 0000 0046      MOVE.W  0008(A6),00000046H
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    20H  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 72
PROCEDURE IntIn8(intin0, intin1, intin2, intin3, intin4, intin5, intin6, intin7: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        33EE 0016 0000 0040      MOVE.W  0016(A6),00000040H
     CH        33EE 0014 0000 0042      MOVE.W  0014(A6),00000042H
    14H        33EE 0012 0000 0044      MOVE.W  0012(A6),00000044H
    1CH        33EE 0010 0000 0046      MOVE.W  0010(A6),00000046H
    24H        33EE 000E 0000 0048      MOVE.W  000E(A6),00000048H
    2CH        33EE 000C 0000 004A      MOVE.W  000C(A6),0000004AH
    34H        33EE 000A 0000 004C      MOVE.W  000A(A6),0000004CH
    3CH        33EE 0008 0000 004E      MOVE.W  0008(A6),0000004EH
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own data at    20H  checksum: o.k.

ref own data at    28H  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    40H  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 28
PROCEDURE IntOut2(VAR intout0: INTEGER; VAR intout1: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 000C                MOVE.L  000C(A6),A4
     8H        38B9 0000 0064           MOVE.W  00000064H,(A4)
     EH        286E 0008                MOVE.L  0008(A6),A4
    12H        38B9 0000 0066           MOVE.W  00000066H,(A4)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
  checksum: o.k.

ref own data at     AH  checksum: o.k.

ref own data at    14H  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 48
PROCEDURE IntOut4(VAR intout0: INTEGER; VAR intout1: INTEGER; VAR intout2: INTEGER; VAR intout3: INTEGER);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        286E 0014                MOVE.L  0014(A6),A4
     8H        38B9 0000 0064           MOVE.W  00000064H,(A4)
     EH        286E 0010                MOVE.L  0010(A6),A4
    12H        38B9 0000 0066           MOVE.W  00000066H,(A4)
    18H        286E 000C                MOVE.L  000C(A6),A4
    1CH        38B9 0000 0068           MOVE.W  00000068H,(A4)
    22H        286E 0008                MOVE.L  0008(A6),A4
    26H        38B9 0000 006A           MOVE.W  0000006AH,(A4)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own data at     AH  checksum: o.k.

ref own data at    14H  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref own data at    28H  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 120
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        49F9 0000 0018           LEA     00000018H,A4
    10H        42AC 000A                CLR.L   000A(A4)
    14H        42AC 000E                CLR.L   000E(A4)
    18H        42AC 0012                CLR.L   0012(A4)
    1CH        42AC 0016                CLR.L   0016(A4)
    20H        42AC 001A                CLR.L   001A(A4)
    24H        49F9 0000 0000           LEA     00000000H,A4
    2AH        47F9 0000 0036           LEA     00000036H,A3
    30H        2A0B                     MOVE.L  A3,D5
    32H        2885                     MOVE.L  D5,(A4)
    34H        47F9 0000 0018           LEA     00000018H,A3
    3AH        2A0B                     MOVE.L  A3,D5
    3CH        2945 0004                MOVE.L  D5,0004(A4)
    40H        47F9 0000 0040           LEA     00000040H,A3
    46H        2A0B                     MOVE.L  A3,D5
    48H        2945 0008                MOVE.L  D5,0008(A4)
    4CH        47F9 0000 0062           LEA     00000062H,A3
    52H        2A0B                     MOVE.L  A3,D5
    54H        2945 000C                MOVE.L  D5,000C(A4)
    58H        47F9 0000 0072           LEA     00000072H,A3
    5EH        2A0B                     MOVE.L  A3,D5
    60H        2945 0010                MOVE.L  D5,0010(A4)
    64H        47F9 0000 007E           LEA     0000007EH,A3
    6AH        2A0B                     MOVE.L  A3,D5
    6CH        2945 0014                MOVE.L  D5,0014(A4)
    70H        4E5E                     UNLK    A6
    72H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    36H  checksum: o.k.

ref own data at    42H  checksum: o.k.

ref own data at    4EH  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref own data at    66H  checksum: o.k.

ref ext init call at    72H  checksum: o.k.

scmod end  checksum: o.k.
