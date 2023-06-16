link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  LineA, key =  2102H  CB64H  17F4H  checksum: o.k.

import GEMFont, key =  2102H  CB5AH  47FCH, modnum =  1  checksum: o.k.

data size, number of bytes = 16  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 34
InitialiseLineA
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        A000                     ILLEGAL
     6H        2A08                     MOVE.L  A0,D5
     8H        23C5 0000 0000           MOVE.L  D5,00000000H
     EH        2A09                     MOVE.L  A1,D5
    10H        23C5 0000 0004           MOVE.L  D5,00000004H
    16H        2A0A                     MOVE.L  A2,D5
    18H        23C5 0000 0008           MOVE.L  D5,00000008H
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

ref own data at     AH  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref own data at    1AH  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 50
DoPutPixel
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2879 0000 0000           MOVE.L  00000000H,A4
     AH        266C 0008                MOVE.L  0008(A4),A3
     EH        36AE 0008                MOVE.W  0008(A6),(A3)
    12H        266C 000C                MOVE.L  000C(A4),A3
    16H        36AE 000C                MOVE.W  000C(A6),(A3)
    1AH        266C 000C                MOVE.L  000C(A4),A3
    1EH        376E 000A 0002           MOVE.W  000A(A6),0002(A3)
    24H        48E7 0006                MOVEM.L #0006H,-(A7)
    28H        A001                     ILLEGAL
    2AH        4CDF 6000                MOVEM.L (A7)+,#6000H
    2EH        4E5E                     UNLK    A6
    30H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 48
DoGetPixel
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2879 0000 0000           MOVE.L  00000000H,A4
     AH        266C 000C                MOVE.L  000C(A4),A3
     EH        36AE 000A                MOVE.W  000A(A6),(A3)
    12H        266C 000C                MOVE.L  000C(A4),A3
    16H        376E 0008 0002           MOVE.W  0008(A6),0002(A3)
    1CH        48E7 0006                MOVEM.L #0006H,-(A7)
    20H        A002                     ILLEGAL
    22H        4CDF 6000                MOVEM.L (A7)+,#6000H
    26H        2A00                     MOVE.L  D0,D5
    28H        3D45 000C                MOVE.W  D5,000C(A6)
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 92
DoLine
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2879 0000 0000           MOVE.L  00000000H,A4
     AH        396E 001A 0026           MOVE.W  001A(A6),0026(A4)
    10H        396E 0018 0028           MOVE.W  0018(A6),0028(A4)
    16H        396E 0016 002A           MOVE.W  0016(A6),002A(A4)
    1CH        396E 0014 002C           MOVE.W  0014(A6),002C(A4)
    22H        396E 0012 0018           MOVE.W  0012(A6),0018(A4)
    28H        396E 0010 001A           MOVE.W  0010(A6),001A(A4)
    2EH        396E 000E 001C           MOVE.W  000E(A6),001C(A4)
    34H        396E 000C 001E           MOVE.W  000C(A6),001E(A4)
    3AH        7A00                     MOVEQ   #00H,D5
    3CH        1A2E 000A                MOVE.B  000A(A6),D5
    40H        3945 005A                MOVE.W  D5,005A(A4)
    44H        7A00                     MOVEQ   #00H,D5
    46H        1A2E 0008                MOVE.B  0008(A6),D5
    4AH        3945 0024                MOVE.W  D5,0024(A4)
    4EH        48E7 0006                MOVEM.L #0006H,-(A7)
    52H        A003                     ILLEGAL
    54H        4CDF 6000                MOVEM.L (A7)+,#6000H
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 98
DoHorizLine
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2879 0000 0000           MOVE.L  00000000H,A4
     AH        396E 001E 0026           MOVE.W  001E(A6),0026(A4)
    10H        396E 001C 0028           MOVE.W  001C(A6),0028(A4)
    16H        396E 001A 002A           MOVE.W  001A(A6),002A(A4)
    1CH        396E 0018 0018           MOVE.W  0018(A6),0018(A4)
    22H        396E 0016 001A           MOVE.W  0016(A6),001A(A4)
    28H        396E 0014 001C           MOVE.W  0014(A6),001C(A4)
    2EH        396E 0012 001E           MOVE.W  0012(A6),001E(A4)
    34H        7A00                     MOVEQ   #00H,D5
    36H        1A2E 0010                MOVE.B  0010(A6),D5
    3AH        3945 0024                MOVE.W  D5,0024(A4)
    3EH        296E 000C 002E           MOVE.L  000C(A6),002E(A4)
    44H        396E 000A 0032           MOVE.W  000A(A6),0032(A4)
    4AH        7A00                     MOVEQ   #00H,D5
    4CH        1A2E 0008                MOVE.B  0008(A6),D5
    50H        3945 0034                MOVE.W  D5,0034(A4)
    54H        48E7 0006                MOVEM.L #0006H,-(A7)
    58H        A004                     ILLEGAL
    5AH        4CDF 6000                MOVEM.L (A7)+,#6000H
    5EH        4E5E                     UNLK    A6
    60H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 18
DoShowMouse
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 0006                MOVEM.L #0006H,-(A7)
     8H        A009                     ILLEGAL
     AH        4CDF 6000                MOVEM.L (A7)+,#6000H
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 18
DoHideMouse
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 0006                MOVEM.L #0006H,-(A7)
     8H        A00A                     ILLEGAL
     AH        4CDF 6000                MOVEM.L (A7)+,#6000H
     EH        4E5E                     UNLK    A6
    10H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 22
DoUnSprite
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        246E 0008                MOVE.L  0008(A6),A2
     8H        48E7 0006                MOVEM.L #0006H,-(A7)
     CH        A00C                     ILLEGAL
     EH        4CDF 6000                MOVEM.L (A7)+,#6000H
    12H        4E5E                     UNLK    A6
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 38
DoSprite
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        302E 0012                MOVE.W  0012(A6),D0
     8H        322E 0010                MOVE.W  0010(A6),D1
     CH        286E 000C                MOVE.L  000C(A6),A4
    10H        2A0C                     MOVE.L  A4,D5
    12H        2045                     MOVE.L  D5,A0
    14H        246E 0008                MOVE.L  0008(A6),A2
    18H        48E7 0006                MOVEM.L #0006H,-(A7)
    1CH        A00D                     ILLEGAL
    1EH        4CDF 6000                MOVEM.L (A7)+,#6000H
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 282
DoChar
 DECODE --------                        INSTRUCTION
     0H        4E56 FE68                LINK    A6,#FE68H
     4H        2D6E 0008 FFFA           MOVE.L  0008(A6),FFFA(A6)
     AH        2879 0000 0000           MOVE.L  00000000H,A4
    10H        397C 0001 0024           MOVE.W  #0001H,0024(A4)
    16H        397C 0001 006A           MOVE.W  #0001H,006A(A4)
    1CH        426C 0072                CLR.W   0072(A4)
    20H        266E FFFA                MOVE.L  FFFA(A6),A3
    24H        296B 004C 0054           MOVE.L  004C(A3),0054(A4)
    2AH        396B 0050 0058           MOVE.W  0050(A3),0058(A4)
    30H        7A00                     MOVEQ   #00H,D5
    32H        1A2E 0010                MOVE.B  0010(A6),D5
    36H        BA6B 0026                CMP.W   0026(A3),D5
    3AH        620C                     BHI     [0CH] = 00000048H
    3CH        7A00                     MOVEQ   #00H,D5
    3EH        1A2E 0010                MOVE.B  0010(A6),D5
    42H        BA6B 0024                CMP.W   0024(A3),D5
    46H        6404                     BCC     [04H] = 0000004CH
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
    4CH        7A00                     MOVEQ   #00H,D5
    4EH        1A2E 0010                MOVE.B  0010(A6),D5
    52H        9A6B 0024                SUB.W   0024(A3),D5
    56H        3D45 FE68                MOVE.W  D5,FE68(A6)
    5AH        246B 0048                MOVE.L  0048(A3),A2
    5EH        3A2E FE68                MOVE.W  FE68(A6),D5
    62H        0245 00FF                ANDI.W  #00FFH,D5
    66H        DA45                     ADD.W   D5,D5
    68H        3972 5000 0048           MOVE.W  00H(A2,D5.W),0048(A4)
    6EH        426C 004A                CLR.W   004A(A4)
    72H        246B 0048                MOVE.L  0048(A3),A2
    76H        3A2E FE68                MOVE.W  FE68(A6),D5
    7AH        5245                     ADDQ.W  #1,D5
    7CH        0245 00FF                ANDI.W  #00FFH,D5
    80H        DA45                     ADD.W   D5,D5
    82H        3832 5000                MOVE.W  00H(A2,D5.W),D4
    86H        986C 0048                SUB.W   0048(A4),D4
    8AH        3944 0050                MOVE.W  D4,0050(A4)
    8EH        396B 0052 0052           MOVE.W  0052(A3),0052(A4)
    94H        396E 000E 004C           MOVE.W  000E(A6),004C(A4)
    9AH        396E 000C 004E           MOVE.W  000C(A6),004E(A4)
    A0H        426C 005A                CLR.W   005A(A4)
    A4H        246E FFFA                MOVE.L  FFFA(A6),A2
    A8H        2279 0000 0000           MOVE.L  00000000H,A1
    AEH        336A 003E 005C           MOVE.W  003E(A2),005C(A1)
    B4H        246E FFFA                MOVE.L  FFFA(A6),A2
    B8H        2279 0000 0000           MOVE.L  00000000H,A1
    BEH        336A 0040 005E           MOVE.W  0040(A2),005E(A1)
    C4H        396B 003A 0060           MOVE.W  003A(A3),0060(A4)
    CAH        426C 0062                CLR.W   0062(A4)
    CEH        426C 0064                CLR.W   0064(A4)
    D2H        426C 0066                CLR.W   0066(A4)
    D6H        397C 8000 0040           MOVE.W  #8000H,0040(A4)
    DCH        426C 0042                CLR.W   0042(A4)
    E0H        426C 0044                CLR.W   0044(A4)
    E4H        426C 0068                CLR.W   0068(A4)
    E8H        3A2B 0042                MOVE.W  0042(A3),D5
    ECH        0805 0003                BTST    #0003H,D5
    F0H        56C5                     SNE     D5
    F2H        4405                     NEG.B   D5
    F4H        0245 00FF                ANDI.W  #00FFH,D5
    F8H        3945 0046                MOVE.W  D5,0046(A4)
    FCH        45EE FE6A                LEA     FE6A(A6),A2
   100H        2A0A                     MOVE.L  A2,D5
   102H        2945 006C                MOVE.L  D5,006C(A4)
   106H        397C 001E 0070           MOVE.W  #001EH,0070(A4)
   10CH        48E7 0006                MOVEM.L #0006H,-(A7)
   110H        A008                     ILLEGAL
   112H        4CDF 6000                MOVEM.L (A7)+,#6000H
   116H        4E5E                     UNLK    A6
   118H        4E75                     RTS
  checksum: o.k.

ref own data at     CH  checksum: o.k.

ref own data at    AAH  checksum: o.k.

ref own data at    BAH  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 310
DoString
 DECODE --------                        INSTRUCTION
     0H        4E56 FE62                LINK    A6,#FE62H
     4H        2D6E 0008 FFFC           MOVE.L  0008(A6),FFFC(A6)
     AH        2D6E 0012 FE66           MOVE.L  0012(A6),FE66(A6)
    10H        286E FFFC                MOVE.L  FFFC(A6),A4
    14H        2679 0000 0000           MOVE.L  00000000H,A3
    1AH        376C 003E 005C           MOVE.W  003E(A4),005C(A3)
    20H        286E FFFC                MOVE.L  FFFC(A6),A4
    24H        2679 0000 0000           MOVE.L  00000000H,A3
    2AH        376C 0040 005E           MOVE.W  0040(A4),005E(A3)
    30H        2879 0000 0000           MOVE.L  00000000H,A4
    36H        426C 0024                CLR.W   0024(A4)
    3AH        397C 0001 006A           MOVE.W  #0001H,006A(A4)
    40H        426C 0072                CLR.W   0072(A4)
    44H        397C FFFF 0020           MOVE.W  #FFFFH,0020(A4)
    4AH        266E FFFC                MOVE.L  FFFC(A6),A3
    4EH        296B 004C 0054           MOVE.L  004C(A3),0054(A4)
    54H        396B 0050 0058           MOVE.W  0050(A3),0058(A4)
    5AH        426C 0036                CLR.W   0036(A4)
    5EH        396B 0052 0052           MOVE.W  0052(A3),0052(A4)
    64H        396E 000E 004C           MOVE.W  000E(A6),004C(A4)
    6AH        396E 000C 004E           MOVE.W  000C(A6),004E(A4)
    70H        426C 005A                CLR.W   005A(A4)
    74H        426C 0060                CLR.W   0060(A4)
    78H        426C 0062                CLR.W   0062(A4)
    7CH        426C 0064                CLR.W   0064(A4)
    80H        426C 0066                CLR.W   0066(A4)
    84H        426C 0042                CLR.W   0042(A4)
    88H        426C 0044                CLR.W   0044(A4)
    8CH        426C 0068                CLR.W   0068(A4)
    90H        426C 0074                CLR.W   0074(A4)
    94H        3A2B 0042                MOVE.W  0042(A3),D5
    98H        0805 0003                BTST    #0003H,D5
    9CH        56C5                     SNE     D5
    9EH        4405                     NEG.B   D5
    A0H        0245 00FF                ANDI.W  #00FFH,D5
    A4H        3945 0046                MOVE.W  D5,0046(A4)
    A8H        45EE FE6C                LEA     FE6C(A6),A2
    ACH        2A0A                     MOVE.L  A2,D5
    AEH        2945 006C                MOVE.L  D5,006C(A4)
    B2H        397C 001E 0070           MOVE.W  #001EH,0070(A4)
    B8H        426E FE62                CLR.W   FE62(A6)
    BCH        3A2E FE62                MOVE.W  FE62(A6),D5
    C0H        BA6E 0010                CMP.W   0010(A6),D5
    C4H        6C6C                     BGE     [6CH] = 00000132H
    C6H        266E FFFC                MOVE.L  FFFC(A6),A3
    CAH        246E FE66                MOVE.L  FE66(A6),A2
    CEH        1D52 FE65                MOVE.B  (A2),FE65(A6)
    D2H        52AE FE66                ADDQ.L  #1,FE66(A6)
    D6H        7A00                     MOVEQ   #00H,D5
    D8H        1A2E FE65                MOVE.B  FE65(A6),D5
    DCH        9A6B 0024                SUB.W   0024(A3),D5
    E0H        3D45 FE6A                MOVE.W  D5,FE6A(A6)
    E4H        246B 0048                MOVE.L  0048(A3),A2
    E8H        3A2E FE6A                MOVE.W  FE6A(A6),D5
    ECH        0245 00FF                ANDI.W  #00FFH,D5
    F0H        DA45                     ADD.W   D5,D5
    F2H        3972 5000 0048           MOVE.W  00H(A2,D5.W),0048(A4)
    F8H        426C 004A                CLR.W   004A(A4)
    FCH        246B 0048                MOVE.L  0048(A3),A2
   100H        3A2E FE6A                MOVE.W  FE6A(A6),D5
   104H        5245                     ADDQ.W  #1,D5
   106H        0245 00FF                ANDI.W  #00FFH,D5
   10AH        DA45                     ADD.W   D5,D5
   10CH        3832 5000                MOVE.W  00H(A2,D5.W),D4
   110H        986C 0048                SUB.W   0048(A4),D4
   114H        3944 0050                MOVE.W  D4,0050(A4)
   118H        48E7 0006                MOVEM.L #0006H,-(A7)
   11CH        397C 8000 0040           MOVE.W  #8000H,0040(A4)
   122H        A008                     ILLEGAL
   124H        4CDF 6000                MOVEM.L (A7)+,#6000H
   128H        536C 004C                SUBQ.W  #1,004C(A4)
   12CH        526E FE62                ADDQ.W  #1,FE62(A6)
   130H        608A                     BRA     [8AH] = 000000BCH
   132H        4E5E                     UNLK    A6
   134H        4E75                     RTS
  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref own data at    26H  checksum: o.k.

ref own data at    32H  checksum: o.k.

scmod end  checksum: o.k.
