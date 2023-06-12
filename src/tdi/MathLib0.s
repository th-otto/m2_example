link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  MathLib0, key =  2102H  F1D2H  6A6CH  checksum: o.k.

data size, number of bytes = 0  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 72
PROCEDURE real(x: INTEGER): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3A2E 0008                MOVE.W  0008(A6),D5
     8H        0805 000F                BTST    #000FH,D5
     CH        6616                     BNE     [16H] = 00000024H
     EH        7A00                     MOVEQ   #00H,D5
    10H        3A2E 0008                MOVE.W  0008(A6),D5
    14H        2F05                     MOVE.L  D5,-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        2D5F 000A                MOVE.L  (A7)+,000A(A6)
    20H        4E5E                     UNLK    A6
    22H        4E75                     RTS
    24H        7A00                     MOVEQ   #00H,D5
    26H        3A2E 0008                MOVE.W  0008(A6),D5
    2AH        2F05                     MOVE.L  D5,-(A7)
    2CH        4EB9 0000 0000           JSR     00000000H
    32H        2F3C 4780 0000           MOVE.L  #47800000H,-(A7)
    38H        4EB9 0000 0000           JSR     00000000H
    3EH        588F                     ADDQ.L  #4,A7
    40H        2D5F 000A                MOVE.L  (A7)+,000A(A6)
    44H        4E5E                     UNLK    A6
    46H        4E75                     RTS
  checksum: o.k.

ref util: at    18H, procnum = 18  checksum: o.k.

ref util: at    2EH, procnum = 18  checksum: o.k.

ref util: at    3AH, procnum = 13  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 68
PROCEDURE entier(x: REAL): INTEGER;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        2D6E 0008 FFFC           MOVE.L  0008(A6),FFFC(A6)
     AH        3A2E FFFC                MOVE.W  FFFC(A6),D5
     EH        0805 000F                BTST    #000FH,D5
    12H        6614                     BNE     [14H] = 00000028H
    14H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    18H        4EB9 0000 0000           JSR     00000000H
    1EH        2A1F                     MOVE.L  (A7)+,D5
    20H        3D45 000C                MOVE.W  D5,000C(A6)
    24H        4E5E                     UNLK    A6
    26H        4E75                     RTS
    28H        08AE 0007 FFFC           BCLR    #0007H,FFFC(A6)
    2EH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    32H        4EB9 0000 0000           JSR     00000000H
    38H        2A1F                     MOVE.L  (A7)+,D5
    3AH        4445                     NEG.W   D5
    3CH        3D45 000C                MOVE.W  D5,000C(A6)
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

ref util: at    1AH, procnum = 19  checksum: o.k.

ref util: at    34H, procnum = 19  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 30
PROCEDURE RadToDeg(RadianAngle: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2F3C 3C8E FA35           MOVE.L  #3C8EFA35H,-(A7)
     EH        4EB9 0000 0000           JSR     00000000H
    14H        588F                     ADDQ.L  #4,A7
    16H        2D5F 000C                MOVE.L  (A7)+,000C(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref util: at    10H, procnum = 15  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 30
PROCEDURE DegToRad(DegreeAngle: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2F3C 3C8E FA35           MOVE.L  #3C8EFA35H,-(A7)
     EH        4EB9 0000 0000           JSR     00000000H
    14H        588F                     ADDQ.L  #4,A7
    16H        2D5F 000C                MOVE.L  (A7)+,000C(A6)
    1AH        4E5E                     UNLK    A6
    1CH        4E75                     RTS
  checksum: o.k.

ref util: at    10H, procnum = 14  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 226
PROCEDURE sqrt(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        2D6E 0008 FFF8           MOVE.L  0008(A6),FFF8(A6)
     AH        3A2E FFF8                MOVE.W  FFF8(A6),D5
     EH        0805 000F                BTST    #000FH,D5
    12H        670C                     BEQ     [0CH] = 00000020H
    14H        42AE 000C                CLR.L   000C(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
    1CH        4EFA 00C4                JMP     [00C4H] = 000000E2H
    20H        3A2E FFF8                MOVE.W  FFF8(A6),D5
    24H        0245 FF00                ANDI.W  #FF00H,D5
    28H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
    2CH        046E 3F00 FFFC           SUBI.W  #3F00H,FFFC(A6)
    32H        3A2E FFF8                MOVE.W  FFF8(A6),D5
    36H        0045 3F00                ORI.W   #3F00H,D5
    3AH        3D45 FFF8                MOVE.W  D5,FFF8(A6)
    3EH        08AE 0006 FFF8           BCLR    #0006H,FFF8(A6)
    44H        2D6E FFF8 0008           MOVE.L  FFF8(A6),0008(A6)
    4AH        2F3C 3EF8 8872           MOVE.L  #3EF88872H,-(A7)
    50H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    54H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        588F                     ADDQ.L  #4,A7
    62H        4EB9 0000 0000           JSR     00000000H
    68H        588F                     ADDQ.L  #4,A7
    6AH        2D5F FFF4                MOVE.L  (A7)+,FFF4(A6)
    6EH        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
    72H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    76H        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
    7AH        4EB9 0000 0000           JSR     00000000H
    80H        588F                     ADDQ.L  #4,A7
    82H        4EB9 0000 0000           JSR     00000000H
    88H        588F                     ADDQ.L  #4,A7
    8AH        2D5F FFF4                MOVE.L  (A7)+,FFF4(A6)
    8EH        2D6E FFF4 FFF8           MOVE.L  FFF4(A6),FFF8(A6)
    94H        3D6E FFF8 FFFE           MOVE.W  FFF8(A6),FFFE(A6)
    9AH        046E 0100 FFFE           SUBI.W  #0100H,FFFE(A6)
    A0H        3D6E FFFE FFF8           MOVE.W  FFFE(A6),FFF8(A6)
    A6H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    AAH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    AEH        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
    B2H        4EB9 0000 0000           JSR     00000000H
    B8H        588F                     ADDQ.L  #4,A7
    BAH        4EB9 0000 0000           JSR     00000000H
    C0H        588F                     ADDQ.L  #4,A7
    C2H        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    C6H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    CAH        48C5                     EXT.L   D5
    CCH        8BFC 0002                DIVS    #0002H,D5
    D0H        DA6E FFF8                ADD.W   FFF8(A6),D5
    D4H        3D45 FFF8                MOVE.W  D5,FFF8(A6)
    D8H        2D6E FFF8 000C           MOVE.L  FFF8(A6),000C(A6)
    DEH        4E5E                     UNLK    A6
    E0H        4E75                     RTS
  checksum: o.k.

ref util: at    5CH, procnum = 12  checksum: o.k.

ref util: at    64H, procnum = 14  checksum: o.k.

ref util: at    7CH, procnum = 15  checksum: o.k.

ref util: at    84H, procnum = 12  checksum: o.k.

ref util: at    B4H, procnum = 15  checksum: o.k.

ref util: at    BCH, procnum = 12  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 270
PROCEDURE ln(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        2D6E 0008 FFFC           MOVE.L  0008(A6),FFFC(A6)
     AH        3A2E FFFC                MOVE.W  FFFC(A6),D5
     EH        0805 000F                BTST    #000FH,D5
    12H        670C                     BEQ     [0CH] = 00000020H
    14H        42AE 000C                CLR.L   000C(A6)
    18H        4E5E                     UNLK    A6
    1AH        4E75                     RTS
    1CH        4EFA 00F0                JMP     [00F0H] = 0000010EH
    20H        598F                     SUBQ.L  #4,A7
    22H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    26H        48C5                     EXT.L   D5
    28H        8BFC 0080                DIVS    #0080H,D5
    2CH        0445 007F                SUBI.W  #007FH,D5
    30H        3F05                     MOVE.W  D5,-(A7)
    32H        6100 0000                BSR     [0000H] = 00000034H
    36H        548F                     ADDQ.L  #2,A7
    38H        2F3C 3F31 7218           MOVE.L  #3F317218H,-(A7)
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        588F                     ADDQ.L  #4,A7
    46H        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    4AH        3A2E FFFC                MOVE.W  FFFC(A6),D5
    4EH        0045 3F80                ORI.W   #3F80H,D5
    52H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
    56H        08AE 0006 FFFC           BCLR    #0006H,FFFC(A6)
    5CH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    60H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    66H        4EB9 0000 0000           JSR     00000000H
    6CH        588F                     ADDQ.L  #4,A7
    6EH        2D5F 0008                MOVE.L  (A7)+,0008(A6)
    72H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    76H        2F3C 33BF FC2B           MOVE.L  #33BFFC2BH,-(A7)
    7CH        4EB9 0000 0000           JSR     00000000H
    82H        588F                     ADDQ.L  #4,A7
    84H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    88H        2F3C 3F80 004C           MOVE.L  #3F80004CH,-(A7)
    8EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    92H        2F3C 4000 0999           MOVE.L  #40000999H,-(A7)
    98H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    9CH        2F3C 4041 FF12           MOVE.L  #4041FF12H,-(A7)
    A2H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    A6H        2F3C 3F8A 154B           MOVE.L  #3F8A154BH,-(A7)
    ACH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    B0H        2F3C 410E 530F           MOVE.L  #410E530FH,-(A7)
    B6H        4EB9 0000 0000           JSR     00000000H
    BCH        588F                     ADDQ.L  #4,A7
    BEH        4EB9 0000 0000           JSR     00000000H
    C4H        588F                     ADDQ.L  #4,A7
    C6H        4EB9 0000 0000           JSR     00000000H
    CCH        588F                     ADDQ.L  #4,A7
    CEH        4EB9 0000 0000           JSR     00000000H
    D4H        588F                     ADDQ.L  #4,A7
    D6H        4EB9 0000 0000           JSR     00000000H
    DCH        588F                     ADDQ.L  #4,A7
    DEH        4EB9 0000 0000           JSR     00000000H
    E4H        588F                     ADDQ.L  #4,A7
    E6H        4EB9 0000 0000           JSR     00000000H
    ECH        588F                     ADDQ.L  #4,A7
    EEH        4EB9 0000 0000           JSR     00000000H
    F4H        588F                     ADDQ.L  #4,A7
    F6H        4EB9 0000 0000           JSR     00000000H
    FCH        588F                     ADDQ.L  #4,A7
    FEH        4EB9 0000 0000           JSR     00000000H
   104H        588F                     ADDQ.L  #4,A7
   106H        2D5F 000C                MOVE.L  (A7)+,000C(A6)
   10AH        4E5E                     UNLK    A6
   10CH        4E75                     RTS
  checksum: o.k.

ref own quick call at    34H, procnum =  3  checksum: o.k.

ref util: at    40H, procnum = 14  checksum: o.k.

ref util: at    68H, procnum = 13  checksum: o.k.

ref util: at    7EH, procnum = 12  checksum: o.k.

ref util: at    B8H, procnum = 15  checksum: o.k.

ref util: at    C0H, procnum = 12  checksum: o.k.

ref util: at    C8H, procnum = 15  checksum: o.k.

ref util: at    D0H, procnum = 12  checksum: o.k.

ref util: at    D8H, procnum = 15  checksum: o.k.

ref util: at    E0H, procnum = 12  checksum: o.k.

ref util: at    E8H, procnum = 15  checksum: o.k.

ref util: at    F0H, procnum = 12  checksum: o.k.

ref util: at    F8H, procnum = 15  checksum: o.k.

ref util: at   100H, procnum = 12  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 38
PROCEDURE log(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        588F                     ADDQ.L  #4,A7
    10H        2F3C 4013 5D8E           MOVE.L  #40135D8EH,-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        588F                     ADDQ.L  #4,A7
    1EH        2D5F 000C                MOVE.L  (A7)+,000C(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref own quick call at     CH, procnum = 10  checksum: o.k.

ref util: at    18H, procnum = 15  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 342
PROCEDURE exp(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        558F                     SUBQ.L  #2,A7
     6H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     AH        2F3C 3F31 7218           MOVE.L  #3F317218H,-(A7)
    10H        4EB9 0000 0000           JSR     00000000H
    16H        588F                     ADDQ.L  #4,A7
    18H        6100 0000                BSR     [0000H] = 0000001AH
    1CH        588F                     ADDQ.L  #4,A7
    1EH        3D5F FFFE                MOVE.W  (A7)+,FFFE(A6)
    22H        2A2E 0008                MOVE.L  0008(A6),D5
    26H        0805 001F                BTST    #001FH,D5
    2AH        6704                     BEQ     [04H] = 00000030H
    2CH        536E FFFE                SUBQ.W  #1,FFFE(A6)
    30H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    34H        2F3C 3F31 7218           MOVE.L  #3F317218H,-(A7)
    3AH        598F                     SUBQ.L  #4,A7
    3CH        3F2E FFFE                MOVE.W  FFFE(A6),-(A7)
    40H        6100 0000                BSR     [0000H] = 00000042H
    44H        548F                     ADDQ.L  #2,A7
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        588F                     ADDQ.L  #4,A7
    4EH        4EB9 0000 0000           JSR     00000000H
    54H        588F                     ADDQ.L  #4,A7
    56H        2F3C 3EB1 7218           MOVE.L  #3EB17218H,-(A7)
    5CH        4EB9 0000 0000           JSR     00000000H
    62H        588F                     ADDQ.L  #4,A7
    64H        2D5F 0008                MOVE.L  (A7)+,0008(A6)
    68H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    6CH        4EB9 0000 0000           JSR     00000000H
    72H        588F                     ADDQ.L  #4,A7
    74H        661C                     BNE     [1CH] = 00000092H
    76H        42AE FFF8                CLR.L   FFF8(A6)
    7AH        3A2E FFFE                MOVE.W  FFFE(A6),D5
    7EH        0645 0082                ADDI.W  #0082H,D5
    82H        EF45                     ASL.W   #7,D5
    84H        3D45 FFF8                MOVE.W  D5,FFF8(A6)
    88H        2D6E FFF8 000C           MOVE.L  FFF8(A6),000C(A6)
    8EH        4E5E                     UNLK    A6
    90H        4E75                     RTS
    92H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    96H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    9AH        4EB9 0000 0000           JSR     00000000H
    A0H        588F                     ADDQ.L  #4,A7
    A2H        2D5F FFF4                MOVE.L  (A7)+,FFF4(A6)
    A6H        2D6E 0008 FFF8           MOVE.L  0008(A6),FFF8(A6)
    ACH        3D6E FFF8 FFFC           MOVE.W  FFF8(A6),FFFC(A6)
    B2H        046E 0080 FFFC           SUBI.W  #0080H,FFFC(A6)
    B8H        3D6E FFFC FFF8           MOVE.W  FFFC(A6),FFF8(A6)
    BEH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    C4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    C8H        2F3C 3DCC BF5A           MOVE.L  #3DCCBF5AH,-(A7)
    CEH        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
    D2H        4EB9 0000 0000           JSR     00000000H
    D8H        588F                     ADDQ.L  #4,A7
    DAH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    E0H        4EB9 0000 0000           JSR     00000000H
    E6H        588F                     ADDQ.L  #4,A7
    E8H        2F3C 3C88 5305           MOVE.L  #3C885305H,-(A7)
    EEH        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
    F2H        4EB9 0000 0000           JSR     00000000H
    F8H        588F                     ADDQ.L  #4,A7
    FAH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
   100H        4EB9 0000 0000           JSR     00000000H
   106H        588F                     ADDQ.L  #4,A7
   108H        4EB9 0000 0000           JSR     00000000H
   10EH        588F                     ADDQ.L  #4,A7
   110H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
   114H        4EB9 0000 0000           JSR     00000000H
   11AH        588F                     ADDQ.L  #4,A7
   11CH        4EB9 0000 0000           JSR     00000000H
   122H        588F                     ADDQ.L  #4,A7
   124H        4EB9 0000 0000           JSR     00000000H
   12AH        588F                     ADDQ.L  #4,A7
   12CH        2F3C 3FB5 04F3           MOVE.L  #3FB504F3H,-(A7)
   132H        4EB9 0000 0000           JSR     00000000H
   138H        588F                     ADDQ.L  #4,A7
   13AH        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
   13EH        3A2E FFFE                MOVE.W  FFFE(A6),D5
   142H        EF45                     ASL.W   #7,D5
   144H        DA6E FFF8                ADD.W   FFF8(A6),D5
   148H        3D45 FFF8                MOVE.W  D5,FFF8(A6)
   14CH        2D6E FFF8 000C           MOVE.L  FFF8(A6),000C(A6)
   152H        4E5E                     UNLK    A6
   154H        4E75                     RTS
  checksum: o.k.

ref util: at    12H, procnum = 15  checksum: o.k.

ref own quick call at    1AH, procnum =  4  checksum: o.k.

ref own quick call at    42H, procnum =  3  checksum: o.k.

ref util: at    48H, procnum = 14  checksum: o.k.

ref util: at    50H, procnum = 13  checksum: o.k.

ref util: at    5EH, procnum = 13  checksum: o.k.

ref util: at    6EH, procnum = 17  checksum: o.k.

ref util: at    9CH, procnum = 14  checksum: o.k.

ref util: at    D4H, procnum = 14  checksum: o.k.

ref util: at    E2H, procnum = 12  checksum: o.k.

ref util: at    F4H, procnum = 14  checksum: o.k.

ref util: at   102H, procnum = 12  checksum: o.k.

ref util: at   10AH, procnum = 15  checksum: o.k.

ref util: at   116H, procnum = 13  checksum: o.k.

ref util: at   11EH, procnum = 15  checksum: o.k.

ref util: at   126H, procnum = 12  checksum: o.k.

ref util: at   134H, procnum = 14  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 114
PROCEDURE power(x, y: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     8H        4EB9 0000 0000           JSR     00000000H
     EH        588F                     ADDQ.L  #4,A7
    10H        6E38                     BGT     [38H] = 0000004AH
    12H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        588F                     ADDQ.L  #4,A7
    1EH        6622                     BNE     [22H] = 00000042H
    20H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    24H        4EB9 0000 0000           JSR     00000000H
    2AH        588F                     ADDQ.L  #4,A7
    2CH        660C                     BNE     [0CH] = 0000003AH
    2EH        2D7C 3F80 0000 0010      MOVE.L  #3F800000H,0010(A6)
    36H        4E5E                     UNLK    A6
    38H        4E75                     RTS
    3AH        42AE 0010                CLR.L   0010(A6)
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
    42H        42AE 0010                CLR.L   0010(A6)
    46H        4E5E                     UNLK    A6
    48H        4E75                     RTS
    4AH        598F                     SUBQ.L  #4,A7
    4CH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    50H        598F                     SUBQ.L  #4,A7
    52H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    56H        6100 0000                BSR     [0000H] = 00000058H
    5AH        588F                     ADDQ.L  #4,A7
    5CH        4EB9 0000 0000           JSR     00000000H
    62H        588F                     ADDQ.L  #4,A7
    64H        6100 0000                BSR     [0000H] = 00000066H
    68H        588F                     ADDQ.L  #4,A7
    6AH        2D5F 0010                MOVE.L  (A7)+,0010(A6)
    6EH        4E5E                     UNLK    A6
    70H        4E75                     RTS
  checksum: o.k.

ref util: at     AH, procnum = 17  checksum: o.k.

ref util: at    18H, procnum = 17  checksum: o.k.

ref util: at    26H, procnum = 17  checksum: o.k.

ref own quick call at    58H, procnum = 10  checksum: o.k.

ref util: at    5EH, procnum = 14  checksum: o.k.

ref own quick call at    66H, procnum =  9  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 346
PROCEDURE cos(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF4                LINK    A6,#FFF4H
     4H        2D6E 0008 FFF8           MOVE.L  0008(A6),FFF8(A6)
     AH        08AE 0007 FFF8           BCLR    #0007H,FFF8(A6)
    10H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    14H        2F3C 40C9 0FDB           MOVE.L  #40C90FDBH,-(A7)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        588F                     ADDQ.L  #4,A7
    22H        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    26H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    2AH        4EB9 0000 0000           JSR     00000000H
    30H        2A1F                     MOVE.L  (A7)+,D5
    32H        3D45 FFF6                MOVE.W  D5,FFF6(A6)
    36H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    3AH        7A00                     MOVEQ   #00H,D5
    3CH        3A2E FFF6                MOVE.W  FFF6(A6),D5
    40H        2F05                     MOVE.L  D5,-(A7)
    42H        4EB9 0000 0000           JSR     00000000H
    48H        4EB9 0000 0000           JSR     00000000H
    4EH        588F                     ADDQ.L  #4,A7
    50H        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    54H        422E FFF5                CLR.B   FFF5(A6)
    58H        0C6E 3E80 FFF8           CMPI.W  #3E80H,FFF8(A6)
    5EH        653E                     BCS     [3EH] = 0000009EH
    60H        0C6E 3F40 FFF8           CMPI.W  #3F40H,FFF8(A6)
    66H        651A                     BCS     [1AH] = 00000082H
    68H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    6CH        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    72H        4EB9 0000 0000           JSR     00000000H
    78H        588F                     ADDQ.L  #4,A7
    7AH        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    7EH        4EFA 001E                JMP     [001EH] = 0000009EH
    82H        1D7C 0001 FFF5           MOVE.B  #01H,FFF5(A6)
    88H        2F3C 3F00 0000           MOVE.L  #3F000000H,-(A7)
    8EH        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    92H        4EB9 0000 0000           JSR     00000000H
    98H        588F                     ADDQ.L  #4,A7
    9AH        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    9EH        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    A2H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    A6H        4EB9 0000 0000           JSR     00000000H
    ACH        588F                     ADDQ.L  #4,A7
    AEH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    B2H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    B8H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    BCH        2F3C C19D E9E6           MOVE.L  #C19DE9E6H,-(A7)
    C2H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    C6H        2F3C 4281 E0F8           MOVE.L  #4281E0F8H,-(A7)
    CCH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    D0H        2F3C C2AA E9E0           MOVE.L  #C2AAE9E0H,-(A7)
    D6H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    DAH        2F3C 4270 F927           MOVE.L  #4270F927H,-(A7)
    E0H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    E4H        2F3C C1CF 6775           MOVE.L  #C1CF6775H,-(A7)
    EAH        4EB9 0000 0000           JSR     00000000H
    F0H        588F                     ADDQ.L  #4,A7
    F2H        4EB9 0000 0000           JSR     00000000H
    F8H        588F                     ADDQ.L  #4,A7
    FAH        4EB9 0000 0000           JSR     00000000H
   100H        588F                     ADDQ.L  #4,A7
   102H        4EB9 0000 0000           JSR     00000000H
   108H        588F                     ADDQ.L  #4,A7
   10AH        4EB9 0000 0000           JSR     00000000H
   110H        588F                     ADDQ.L  #4,A7
   112H        4EB9 0000 0000           JSR     00000000H
   118H        588F                     ADDQ.L  #4,A7
   11AH        4EB9 0000 0000           JSR     00000000H
   120H        588F                     ADDQ.L  #4,A7
   122H        4EB9 0000 0000           JSR     00000000H
   128H        588F                     ADDQ.L  #4,A7
   12AH        4EB9 0000 0000           JSR     00000000H
   130H        588F                     ADDQ.L  #4,A7
   132H        4EB9 0000 0000           JSR     00000000H
   138H        588F                     ADDQ.L  #4,A7
   13AH        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
   13EH        4A2E FFF5                TST.B   FFF5(A6)
   142H        670C                     BEQ     [0CH] = 00000150H
   144H        3A2E FFF8                MOVE.W  FFF8(A6),D5
   148H        0A45 8000                EORI.W  #8000H,D5
   14CH        3D45 FFF8                MOVE.W  D5,FFF8(A6)
   150H        2D6E FFF8 000C           MOVE.L  FFF8(A6),000C(A6)
   156H        4E5E                     UNLK    A6
   158H        4E75                     RTS
  checksum: o.k.

ref util: at    1CH, procnum = 15  checksum: o.k.

ref util: at    2CH, procnum = 19  checksum: o.k.

ref util: at    44H, procnum = 18  checksum: o.k.

ref util: at    4AH, procnum = 13  checksum: o.k.

ref util: at    74H, procnum = 13  checksum: o.k.

ref util: at    94H, procnum = 13  checksum: o.k.

ref util: at    A8H, procnum = 14  checksum: o.k.

ref util: at    ECH, procnum = 14  checksum: o.k.

ref util: at    F4H, procnum = 12  checksum: o.k.

ref util: at    FCH, procnum = 14  checksum: o.k.

ref util: at   104H, procnum = 12  checksum: o.k.

ref util: at   10CH, procnum = 14  checksum: o.k.

ref util: at   114H, procnum = 12  checksum: o.k.

ref util: at   11CH, procnum = 14  checksum: o.k.

ref util: at   124H, procnum = 12  checksum: o.k.

ref util: at   12CH, procnum = 14  checksum: o.k.

ref util: at   134H, procnum = 12  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 38
PROCEDURE sin(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        2F3C 3FC9 0FDB           MOVE.L  #3FC90FDBH,-(A7)
     CH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    10H        4EB9 0000 0000           JSR     00000000H
    16H        588F                     ADDQ.L  #4,A7
    18H        6100 0000                BSR     [0000H] = 0000001AH
    1CH        588F                     ADDQ.L  #4,A7
    1EH        2D5F 000C                MOVE.L  (A7)+,000C(A6)
    22H        4E5E                     UNLK    A6
    24H        4E75                     RTS
  checksum: o.k.

ref util: at    12H, procnum = 13  checksum: o.k.

ref own quick call at    1AH, procnum =  6  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 342
PROCEDURE tan(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFEC                LINK    A6,#FFECH
     4H        2F2E 0008                MOVE.L  0008(A6),-(A7)
     8H        2F3C 3FC9 0FDB           MOVE.L  #3FC90FDBH,-(A7)
     EH        4EB9 0000 0000           JSR     00000000H
    14H        588F                     ADDQ.L  #4,A7
    16H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    1AH        558F                     SUBQ.L  #2,A7
    1CH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    20H        6100 0000                BSR     [0000H] = 00000022H
    24H        588F                     ADDQ.L  #4,A7
    26H        3D5F FFEE                MOVE.W  (A7)+,FFEE(A6)
    2AH        2A2E FFFC                MOVE.L  FFFC(A6),D5
    2EH        0805 001F                BTST    #001FH,D5
    32H        6704                     BEQ     [04H] = 00000038H
    34H        536E FFEE                SUBQ.W  #1,FFEE(A6)
    38H        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    3CH        598F                     SUBQ.L  #4,A7
    3EH        3F2E FFEE                MOVE.W  FFEE(A6),-(A7)
    42H        6100 0000                BSR     [0000H] = 00000044H
    46H        548F                     ADDQ.L  #2,A7
    48H        4EB9 0000 0000           JSR     00000000H
    4EH        588F                     ADDQ.L  #4,A7
    50H        2D5F FFF0                MOVE.L  (A7)+,FFF0(A6)
    54H        3A2E FFF0                MOVE.W  FFF0(A6),D5
    58H        0645 0080                ADDI.W  #0080H,D5
    5CH        3D45 FFF0                MOVE.W  D5,FFF0(A6)
    60H        3A2E FFEE                MOVE.W  FFEE(A6),D5
    64H        0805 0000                BTST    #0000H,D5
    68H        56C5                     SNE     D5
    6AH        4405                     NEG.B   D5
    6CH        1D45 FFED                MOVE.B  D5,FFED(A6)
    70H        1D6E FFED FFEC           MOVE.B  FFED(A6),FFEC(A6)
    76H        3A2E FFF0                MOVE.W  FFF0(A6),D5
    7AH        0245 7FFF                ANDI.W  #7FFFH,D5
    7EH        0C45 3F80                CMPI.W  #3F80H,D5
    82H        6522                     BCS     [22H] = 000000A6H
    84H        4A2E FFEC                TST.B   FFEC(A6)
    88H        57C5                     SEQ     D5
    8AH        4405                     NEG.B   D5
    8CH        1D45 FFEC                MOVE.B  D5,FFEC(A6)
    90H        2F3C 4000 0000           MOVE.L  #40000000H,-(A7)
    96H        2F2E FFF0                MOVE.L  FFF0(A6),-(A7)
    9AH        4EB9 0000 0000           JSR     00000000H
    A0H        588F                     ADDQ.L  #4,A7
    A2H        2D5F FFF0                MOVE.L  (A7)+,FFF0(A6)
    A6H        4A2E FFED                TST.B   FFED(A6)
    AAH        670C                     BEQ     [0CH] = 000000B8H
    ACH        3A2E FFF0                MOVE.W  FFF0(A6),D5
    B0H        0A45 8000                EORI.W  #8000H,D5
    B4H        3D45 FFF0                MOVE.W  D5,FFF0(A6)
    B8H        2F2E FFF0                MOVE.L  FFF0(A6),-(A7)
    BCH        2F2E FFF0                MOVE.L  FFF0(A6),-(A7)
    C0H        4EB9 0000 0000           JSR     00000000H
    C6H        588F                     ADDQ.L  #4,A7
    C8H        2D5F FFF8                MOVE.L  (A7)+,FFF8(A6)
    CCH        2F2E FFF0                MOVE.L  FFF0(A6),-(A7)
    D0H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    D4H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    D8H        2F2E FFF8                MOVE.L  FFF8(A6),-(A7)
    DCH        2F3C 43F5 802E           MOVE.L  #43F5802EH,-(A7)
    E2H        4EB9 0000 0000           JSR     00000000H
    E8H        588F                     ADDQ.L  #4,A7
    EAH        2F3C BF27 9321           MOVE.L  #BF279321H,-(A7)
    F0H        4EB9 0000 0000           JSR     00000000H
    F6H        588F                     ADDQ.L  #4,A7
    F8H        4EB9 0000 0000           JSR     00000000H
    FEH        588F                     ADDQ.L  #4,A7
   100H        2F3C 40C6 26C9           MOVE.L  #40C626C9H,-(A7)
   106H        4EB9 0000 0000           JSR     00000000H
   10CH        588F                     ADDQ.L  #4,A7
   10EH        4EB9 0000 0000           JSR     00000000H
   114H        588F                     ADDQ.L  #4,A7
   116H        2F3C 3F49 0FD8           MOVE.L  #3F490FD8H,-(A7)
   11CH        4EB9 0000 0000           JSR     00000000H
   122H        588F                     ADDQ.L  #4,A7
   124H        4EB9 0000 0000           JSR     00000000H
   12AH        588F                     ADDQ.L  #4,A7
   12CH        2D5F FFF4                MOVE.L  (A7)+,FFF4(A6)
   130H        4A2E FFEC                TST.B   FFEC(A6)
   134H        6716                     BEQ     [16H] = 0000014CH
   136H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
   13CH        2F2E FFF4                MOVE.L  FFF4(A6),-(A7)
   140H        4EB9 0000 0000           JSR     00000000H
   146H        588F                     ADDQ.L  #4,A7
   148H        2D5F FFF4                MOVE.L  (A7)+,FFF4(A6)
   14CH        2D6E FFF4 000C           MOVE.L  FFF4(A6),000C(A6)
   152H        4E5E                     UNLK    A6
   154H        4E75                     RTS
  checksum: o.k.

ref util: at    10H, procnum = 15  checksum: o.k.

ref own quick call at    22H, procnum =  4  checksum: o.k.

ref own quick call at    44H, procnum =  3  checksum: o.k.

ref util: at    4AH, procnum = 13  checksum: o.k.

ref util: at    9CH, procnum = 13  checksum: o.k.

ref util: at    C2H, procnum = 14  checksum: o.k.

ref util: at    E4H, procnum = 15  checksum: o.k.

ref util: at    F2H, procnum = 12  checksum: o.k.

ref util: at    FAH, procnum = 15  checksum: o.k.

ref util: at   108H, procnum = 12  checksum: o.k.

ref util: at   110H, procnum = 15  checksum: o.k.

ref util: at   11EH, procnum = 12  checksum: o.k.

ref util: at   126H, procnum = 14  checksum: o.k.

ref util: at   142H, procnum = 15  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 270
PROCEDURE arctan(x: REAL): REAL;
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF2                LINK    A6,#FFF2H
     4H        2D6E 0008 FFFC           MOVE.L  0008(A6),FFFC(A6)
     AH        3A2E FFFC                MOVE.W  FFFC(A6),D5
     EH        0245 7FFF                ANDI.W  #7FFFH,D5
    12H        0C45 3F80                CMPI.W  #3F80H,D5
    16H        54C5                     SCC     D5
    18H        4405                     NEG.B   D5
    1AH        1D45 FFFB                MOVE.B  D5,FFFB(A6)
    1EH        4A2E FFFB                TST.B   FFFB(A6)
    22H        6716                     BEQ     [16H] = 0000003AH
    24H        2F3C 3F80 0000           MOVE.L  #3F800000H,-(A7)
    2AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    2EH        4EB9 0000 0000           JSR     00000000H
    34H        588F                     ADDQ.L  #4,A7
    36H        2D5F 0008                MOVE.L  (A7)+,0008(A6)
    3AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    3EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    42H        4EB9 0000 0000           JSR     00000000H
    48H        588F                     ADDQ.L  #4,A7
    4AH        2D5F FFF2                MOVE.L  (A7)+,FFF2(A6)
    4EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    52H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    56H        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    5AH        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    5EH        2F2E FFF2                MOVE.L  FFF2(A6),-(A7)
    62H        2F3C BE52 80A0           MOVE.L  #BE5280A0H,-(A7)
    68H        4EB9 0000 0000           JSR     00000000H
    6EH        588F                     ADDQ.L  #4,A7
    70H        2F3C C188 4C1A           MOVE.L  #C1884C1AH,-(A7)
    76H        4EB9 0000 0000           JSR     00000000H
    7CH        588F                     ADDQ.L  #4,A7
    7EH        4EB9 0000 0000           JSR     00000000H
    84H        588F                     ADDQ.L  #4,A7
    86H        2F3C BF0E 9A1A           MOVE.L  #BF0E9A1AH,-(A7)
    8CH        4EB9 0000 0000           JSR     00000000H
    92H        588F                     ADDQ.L  #4,A7
    94H        4EB9 0000 0000           JSR     00000000H
    9AH        588F                     ADDQ.L  #4,A7
    9CH        2F3C C040 0A88           MOVE.L  #C0400A88H,-(A7)
    A2H        4EB9 0000 0000           JSR     00000000H
    A8H        588F                     ADDQ.L  #4,A7
    AAH        4EB9 0000 0000           JSR     00000000H
    B0H        588F                     ADDQ.L  #4,A7
    B2H        2F3C 3F7F FFD6           MOVE.L  #3F7FFFD6H,-(A7)
    B8H        4EB9 0000 0000           JSR     00000000H
    BEH        588F                     ADDQ.L  #4,A7
    C0H        4EB9 0000 0000           JSR     00000000H
    C6H        588F                     ADDQ.L  #4,A7
    C8H        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    CCH        4A2E FFFB                TST.B   FFFB(A6)
    D0H        6732                     BEQ     [32H] = 00000104H
    D2H        08AE 0007 FFFC           BCLR    #0007H,FFFC(A6)
    D8H        2F3C 3FC9 0FDB           MOVE.L  #3FC90FDBH,-(A7)
    DEH        2F2E FFFC                MOVE.L  FFFC(A6),-(A7)
    E2H        4EB9 0000 0000           JSR     00000000H
    E8H        588F                     ADDQ.L  #4,A7
    EAH        2D5F FFFC                MOVE.L  (A7)+,FFFC(A6)
    EEH        2A2E 0008                MOVE.L  0008(A6),D5
    F2H        0805 001F                BTST    #001FH,D5
    F6H        670C                     BEQ     [0CH] = 00000104H
    F8H        3A2E FFFC                MOVE.W  FFFC(A6),D5
    FCH        0A45 8000                EORI.W  #8000H,D5
   100H        3D45 FFFC                MOVE.W  D5,FFFC(A6)
   104H        2D6E FFFC 000C           MOVE.L  FFFC(A6),000C(A6)
   10AH        4E5E                     UNLK    A6
   10CH        4E75                     RTS
  checksum: o.k.

ref util: at    30H, procnum = 15  checksum: o.k.

ref util: at    44H, procnum = 14  checksum: o.k.

ref util: at    6AH, procnum = 15  checksum: o.k.

ref util: at    78H, procnum = 12  checksum: o.k.

ref util: at    80H, procnum = 15  checksum: o.k.

ref util: at    8EH, procnum = 12  checksum: o.k.

ref util: at    96H, procnum = 15  checksum: o.k.

ref util: at    A4H, procnum = 12  checksum: o.k.

ref util: at    ACH, procnum = 15  checksum: o.k.

ref util: at    BAH, procnum = 12  checksum: o.k.

ref util: at    C2H, procnum = 14  checksum: o.k.

ref util: at    E4H, procnum = 13  checksum: o.k.

scmod end  checksum: o.k.
