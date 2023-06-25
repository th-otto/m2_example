link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  GEMX, key =  2102H  CABEH  345EH  checksum: o.k.

data size, number of bytes = 180  checksum: o.k.

proc code, procnum = 31, entrypoint =     0H, number of bytes = 8
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        4E5E                     UNLK    A6
     6H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 30, entrypoint =     0H, number of bytes = 80
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        3F3C 0003                MOVE.W  #0003H,-(A7)
     8H        4879 0000 0000           PEA     00000000H
     EH        4EB9 0000 0000           JSR     00000000H
    14H        5C8F                     ADDQ.L  #6,A7
    16H        3F3C 0040                MOVE.W  #0040H,-(A7)
    1AH        4879 0000 0006           PEA     00000006H
    20H        4EB9 0000 0000           JSR     00000000H
    26H        5C8F                     ADDQ.L  #6,A7
    28H        3F3C 002F                MOVE.W  #002FH,-(A7)
    2CH        4879 0000 0048           PEA     00000048H
    32H        4EB9 0000 0000           JSR     00000000H
    38H        5C8F                     ADDQ.L  #6,A7
    3AH        3F3C 0032                MOVE.W  #0032H,-(A7)
    3EH        4879 0000 007A           PEA     0000007AH
    44H        4EB9 0000 0000           JSR     00000000H
    4AH        5C8F                     ADDQ.L  #6,A7
    4CH        4E5E                     UNLK    A6
    4EH        4E75                     RTS
  checksum: o.k.

ref own string: at     AH  checksum: o.k.

ref own proc call at    10H, procnum = 31  checksum: o.k.

ref own string: at    1CH  checksum: o.k.

ref own proc call at    22H, procnum = 31  checksum: o.k.

ref own string: at    2EH  checksum: o.k.

ref own proc call at    34H, procnum = 31  checksum: o.k.

ref own string: at    40H  checksum: o.k.

ref own proc call at    46H, procnum = 31  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 30
PROCEDURE CASEX();
 DECODE --------                        INSTRUCTION
     0H        205F                     MOVE.L  (A7)+,A0
     2H        9090                     SUB.L   (A0),D0
     4H        B0A8 0004                CMP.L   0004(A0),D0
     8H        620C                     BHI     [0CH] = 00000016H
     AH        E380                     ASL.L   #1,D0
     CH        D0A8 0008                ADD.L   0008(A0),D0
    10H        D0F0 0800                ADDA.W  00H(A0,D0.L),A0
    14H        4ED0                     JMP     (A0)
    16H        D1E8 0008                ADDA.L  0008(A0),A0
    1AH        5988                     SUBQ.L  #4,A0
    1CH        4ED0                     JMP     (A0)
  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 8
PROCEDURE HALTX();
 DECODE --------                        INSTRUCTION
     0H        2200                     MOVE.L  D0,D1
     2H        7006                     MOVEQ   #06H,D0
     4H        4E47                     TRAP    #7
     6H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 32, entrypoint =     0H, number of bytes = 228
 DECODE --------                        INSTRUCTION
     0H        4E56 FFE8                LINK    A6,#FFE8H
     4H        2A00                     MOVE.L  D0,D5
     6H        7809                     MOVEQ   #09H,D4
     8H        DA84                     ADD.L   D4,D5
     AH        3D45 FFFE                MOVE.W  D5,FFFE(A6)
     EH        2A0E                     MOVE.L  A6,D5
    10H        5085                     ADDQ.L  #8,D5
    12H        2D45 FFE8                MOVE.L  D5,FFE8(A6)
    16H        40EE FFF8                MOVE    SR,FFF8(A6)
    1AH        2D4D FFF4                MOVE.L  A5,FFF4(A6)
    1EH        2D56 FFF0                MOVE.L  (A6),FFF0(A6)
    22H        4E68                     MOVE    USP,A0
    24H        2D48 FFEC                MOVE.L  A0,FFEC(A6)
    28H        0C6E 0007 FFFE           CMPI.W  #0007H,FFFE(A6)
    2EH        6708                     BEQ     [08H] = 00000038H
    30H        0C6E 0008 FFFE           CMPI.W  #0008H,FFFE(A6)
    36H        6614                     BNE     [14H] = 0000004CH
    38H        2D6E 0012 FFFA           MOVE.L  0012(A6),FFFA(A6)
    3EH        2A2E FFE8                MOVE.L  FFE8(A6),D5
    42H        5085                     ADDQ.L  #8,D5
    44H        2D45 FFE8                MOVE.L  D5,FFE8(A6)
    48H        4EFA 0042                JMP     [0042H] = 0000008CH
    4CH        0C6E 000F FFFE           CMPI.W  #000FH,FFFE(A6)
    52H        660C                     BNE     [0CH] = 00000060H
    54H        4E68                     MOVE    USP,A0
    56H        2D68 0008 FFFA           MOVE.L  0008(A0),FFFA(A6)
    5CH        4EFA 002E                JMP     [002EH] = 0000008CH
    60H        0C6E 0010 FFFE           CMPI.W  #0010H,FFFE(A6)
    66H        660C                     BNE     [0CH] = 00000074H
    68H        42AE FFFA                CLR.L   FFFA(A6)
    6CH        42AE FFF0                CLR.L   FFF0(A6)
    70H        4EFA 001A                JMP     [001AH] = 0000008CH
    74H        0C6E 0009 FFFE           CMPI.W  #0009H,FFFE(A6)
    7AH        650A                     BCS     [0AH] = 00000086H
    7CH        4E68                     MOVE    USP,A0
    7EH        2D50 FFFA                MOVE.L  (A0),FFFA(A6)
    82H        4EFA 0008                JMP     [0008H] = 0000008CH
    86H        2D6E 000A FFFA           MOVE.L  000A(A6),FFFA(A6)
    8CH        49F9 0000 0008           LEA     ErrorContext,A4
    92H        38AE FFFE                MOVE.W  FFFE(A6),(A4)
    96H        422C 0002                CLR.B   0002(A4)
    9AH        296E FFFA 0004           MOVE.L  FFFA(A6),0004(A4)
    A0H        396E FFF8 0008           MOVE.W  FFF8(A6),0008(A4)
    A6H        296E FFF4 000A           MOVE.L  FFF4(A6),000A(A4)
    ACH        296E FFF0 000E           MOVE.L  FFF0(A6),000E(A4)
    B2H        296E FFEC 0012           MOVE.L  FFEC(A6),0012(A4)
    B8H        296E FFF0 0016           MOVE.L  FFF0(A6),0016(A4)
    BEH        197C 0001 001A           MOVE.B  #01H,001A(A4)
    C4H        2E6E FFE8                MOVE.L  FFE8(A6),A7
    C8H        2039 0000 0004           MOVE.L  ErrorProcessor,D0
    CEH        2F40 0002                MOVE.L  D0,0002(A7)
    D2H        3EBC 0000                MOVE.W  #0000H,(A7)
    D6H        2C56                     MOVE.L  (A6),A6
    D8H        4E68                     MOVE    USP,A0
    DAH        5988                     SUBQ.L  #4,A0
    DCH        4E60                     MOVE    A0,USP
    DEH        4E73                     RTE
    E0H        4E5E                     UNLK    A6
    E2H        4E75                     RTS
  checksum: o.k.

ref own data at    8EH  checksum: o.k.

ref own data at    CAH  checksum: o.k.

proc code, procnum = 34, entrypoint =     0H, number of bytes = 312
 DECODE --------                        INSTRUCTION
     0H        4E56 FFB6                LINK    A6,#FFB6H
     4H        426E FFB6                CLR.W   FFB6(A6)
     8H        3A2E FFB6                MOVE.W  FFB6(A6),D5
     CH        DA45                     ADD.W   D5,D5
     EH        49EE FFE2                LEA     FFE2(A6),A4
    12H        4274 5000                CLR.W   00H(A4,D5.W)
    16H        526E FFB6                ADDQ.W  #1,FFB6(A6)
    1AH        0C6E 000F FFB6           CMPI.W  #000FH,FFB6(A6)
    20H        66E6                     BNE     [E6H] = 00000008H
    22H        49EE FFC0                LEA     FFC0(A6),A4
    26H        2A0C                     MOVE.L  A4,D5
    28H        2D45 FFCA                MOVE.L  D5,FFCA(A6)
    2CH        49EE FFE2                LEA     FFE2(A6),A4
    30H        2A0C                     MOVE.L  A4,D5
    32H        2D45 FFCE                MOVE.L  D5,FFCE(A6)
    36H        49EE FFBE                LEA     FFBE(A6),A4
    3AH        2A0C                     MOVE.L  A4,D5
    3CH        2D45 FFD2                MOVE.L  D5,FFD2(A6)
    40H        49EE FFBC                LEA     FFBC(A6),A4
    44H        2A0C                     MOVE.L  A4,D5
    46H        2D45 FFD6                MOVE.L  D5,FFD6(A6)
    4AH        49EE FFB8                LEA     FFB8(A6),A4
    4EH        2A0C                     MOVE.L  A4,D5
    50H        2D45 FFDA                MOVE.L  D5,FFDA(A6)
    54H        7AFF                     MOVEQ   #FFH,D5
    56H        2D45 FFDE                MOVE.L  D5,FFDE(A6)
    5AH        3D7C 000A FFC0           MOVE.W  #000AH,FFC0(A6)
    60H        426E FFC2                CLR.W   FFC2(A6)
    64H        3D7C 0001 FFC4           MOVE.W  #0001H,FFC4(A6)
    6AH        426E FFC6                CLR.W   FFC6(A6)
    6EH        426E FFC8                CLR.W   FFC8(A6)
    72H        203C 0000 00C8           MOVE.L  #000000C8H,D0
    78H        49EE FFCA                LEA     FFCA(A6),A4
    7CH        2A0C                     MOVE.L  A4,D5
    7EH        2205                     MOVE.L  D5,D1
    80H        4E42                     TRAP    #2
    82H        3D7C 004E FFC0           MOVE.W  #004EH,FFC0(A6)
    88H        3D7C 0001 FFC2           MOVE.W  #0001H,FFC2(A6)
    8EH        3D7C 0001 FFC4           MOVE.W  #0001H,FFC4(A6)
    94H        3D7C 0001 FFC6           MOVE.W  #0001H,FFC6(A6)
    9AH        426E FFC8                CLR.W   FFC8(A6)
    9EH        3D7C 0101 FFBE           MOVE.W  #0101H,FFBE(A6)
    A4H        7AFF                     MOVEQ   #FFH,D5
    A6H        2D45 FFB8                MOVE.L  D5,FFB8(A6)
    AAH        203C 0000 00C8           MOVE.L  #000000C8H,D0
    B0H        49EE FFCA                LEA     FFCA(A6),A4
    B4H        2A0C                     MOVE.L  A4,D5
    B6H        2205                     MOVE.L  D5,D1
    B8H        4E42                     TRAP    #2
    BAH        3D7C 0034 FFC0           MOVE.W  #0034H,FFC0(A6)
    C0H        3D7C 0001 FFC2           MOVE.W  #0001H,FFC2(A6)
    C6H        3D7C 0001 FFC4           MOVE.W  #0001H,FFC4(A6)
    CCH        3D7C 0001 FFC6           MOVE.W  #0001H,FFC6(A6)
    D2H        426E FFC8                CLR.W   FFC8(A6)
    D6H        3D7C 0001 FFBE           MOVE.W  #0001H,FFBE(A6)
    DCH        286D FFFC                MOVE.L  FFFC(A5),A4
    E0H        49EC FF9A                LEA     FF9A(A4),A4
    E4H        2A0C                     MOVE.L  A4,D5
    E6H        2D45 FFB8                MOVE.L  D5,FFB8(A6)
    EAH        203C 0000 00C8           MOVE.L  #000000C8H,D0
    F0H        49EE FFCA                LEA     FFCA(A6),A4
    F4H        2A0C                     MOVE.L  A4,D5
    F6H        2205                     MOVE.L  D5,D1
    F8H        4E42                     TRAP    #2
    FAH        3D7C 0013 FFC0           MOVE.W  #0013H,FFC0(A6)
   100H        426E FFC2                CLR.W   FFC2(A6)
   104H        3D7C 0001 FFC4           MOVE.W  #0001H,FFC4(A6)
   10AH        426E FFC6                CLR.W   FFC6(A6)
   10EH        426E FFC8                CLR.W   FFC8(A6)
   112H        203C 0000 00C8           MOVE.L  #000000C8H,D0
   118H        49EE FFCA                LEA     FFCA(A6),A4
   11CH        2A0C                     MOVE.L  A4,D5
   11EH        2205                     MOVE.L  D5,D1
   120H        4E42                     TRAP    #2
   122H        4EB9 0000 0000           JSR     00000000H
   128H        704C                     MOVEQ   #4CH,D0
   12AH        3F00                     MOVE.W  D0,-(A7)
   12CH        3039 0000 0008           MOVE.W  ErrorContext.Error,D0
   132H        4E41                     TRAP    #1
   134H        4E5E                     UNLK    A6
   136H        4E75                     RTS
  checksum: o.k.

ref own proc call at   124H, procnum = 47  checksum: o.k.

ref own data at   12EH  checksum: o.k.

proc code, procnum = 33, entrypoint =     0H, number of bytes = 244
 DECODE --------                        INSTRUCTION
     0H        4E56 FF88                LINK    A6,#-120
     4H        2F2D FFFC                MOVE.L  -4(A5),-(A7)
     8H        2B4E FFFC                MOVE.L  A6,-4(A5)
     CH        49F9 0000 00AE           LEA     000000AEH,A4 '[3][Modula-2 Run Time Error : | |         #'
    12H        47EE FF9A                LEA     -102(A6),A3
    16H        7A2B                     MOVEQ   #2BH,D5
    18H        16DC                     MOVE.B  (A4)+,(A3)+
    1AH        57CD FFFC                DBEQ    D5,[FFFCH] = 00000018H
    1EH        426E FF8C                CLR.W   -116(A6)
    22H        3A2E FF8C                MOVE.W  -116(A6),D5
    26H        49EE FF9A                LEA     -102(A6),A4
    2AH        4A34 5000                TST.B   00H(A4,D5.W)
    2EH        6706                     BEQ     [06H] = 00000036H
    30H        526E FF8C                ADDQ.W  #1,-116(A6)
    34H        60EC                     BRA     [ECH] = 00000022H
    36H        3D79 0000 0008 FF88      MOVE.W  ErrorContext.Error,-120(A6)
    3EH        0C6E 000A FF88           CMPI.W  #10,-120(A6)
    44H        6412                     BCC     [12H] = 00000058H
    46H        3A2E FF8C                MOVE.W  -116(A6),D5
    4AH        49EE FF9A                LEA     -102(A6),A4
    4EH        19BC 0030 5000           MOVE.B  #30H,00H(A4,D5.W)
    54H        4EFA 0028                JMP     [0028H] = 0000007EH
    58H        7A00                     MOVEQ   #00H,D5
    5AH        3A2E FF88                MOVE.W  -120(A6),D5
    5EH        8AFC 000A                DIVU    #10,D5
    62H        4845                     SWAP    D5
    64H        4245                     CLR.W   D5
    66H        4845                     SWAP    D5
    68H        8AFC 000A                DIVU    #10,D5
    6CH        4845                     SWAP    D5
    6EH        0645 0030                ADDI.W  #0030H,D5
    72H        382E FF8C                MOVE.W  -116(A6),D4
    76H        49EE FF9A                LEA     -102(A6),A4
    7AH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    7EH        526E FF8C                ADDQ.W  #1,-116(A6)
    82H        7A00                     MOVEQ   #00H,D5
    84H        3A2E FF88                MOVE.W  -120(A6),D5
    88H        8AFC 000A                DIVU    #000AH,D5
    8CH        4845                     SWAP    D5
    8EH        0645 0030                ADDI.W  #0030H,D5
    92H        382E FF8C                MOVE.W  -116(A6),D4
    96H        49EE FF9A                LEA     -102(A6),A4
    9AH        1985 4000                MOVE.B  D5,00H(A4,D4.W)
    9EH        526E FF8C                ADDQ.W  #1,-116(A6)
    A2H        49F9 0000 00DA           LEA     000000DAH,A4 '][OK]'
    A8H        47EE FF8E                LEA     -114(A6),A3
    ACH        7A05                     MOVEQ   #05H,D5
    AEH        16DC                     MOVE.B  (A4)+,(A3)+
    B0H        57CD FFFC                DBEQ    D5,[FFFCH] = 000000AEH
    B4H        426E FF8A                CLR.W   -118(A6)
    B8H        3A2E FF8A                MOVE.W  -118(A6),D5
    BCH        49EE FF8E                LEA     -114(A6),A4
    C0H        382E FF8C                MOVE.W  -116(A6),D4
    C4H        D86E FF8A                ADD.W   -118(A6),D4
    C8H        47EE FF9A                LEA     -102(A6),A3
    CCH        17B4 5000 4000           MOVE.B  00H(A4,D5.W),00H(A3,D4.W)
    D2H        526E FF8A                ADDQ.W  #1,-118(A6)
    D6H        3A2E FF8A                MOVE.W  -118(A6),D5
    DAH        49EE FF8E                LEA     -114(A6),A4
    DEH        4A34 5000                TST.B   00H(A4,D5.W)
    E2H        6702                     BEQ     [02H] = 000000E6H
    E4H        60D2                     BRA     [D2H] = 000000B8H
    E6H        4EB9 0000 0000           JSR     00000000H
    ECH        2B5F FFFC                MOVE.L  (A7)+,FFFC(A5)
    F0H        4E5E                     UNLK    A6
    F2H        4E75                     RTS
  checksum: o.k.

ref own string: at     EH  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own string: at    A4H  checksum: o.k.

ref own proc call at    E8H, procnum = 34  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 22
PROCEDURE STACKTEST();
 DECODE --------                        INSTRUCTION
     0H        204F                     MOVE.L  A7,A0
     2H        41E8 FF80                LEA     FF80(A0),A0
     6H        91C0                     SUBA.L  D0,A0
     8H        B1ED 0004                CMPA.L  0004(A5),A0
     CH        6206                     BHI     [06H] = 00000014H
     EH        7203                     MOVEQ   #03H,D1
    10H        7006                     MOVEQ   #06H,D0
    12H        4E47                     TRAP    #7
    14H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 35, entrypoint =     0H, number of bytes = 6
 DECODE --------                        INSTRUCTION
     0H        7207                     MOVEQ   #07H,D1
     2H        7006                     MOVEQ   #06H,D0
     4H        4E47                     TRAP    #7
  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 110
PROCEDURE NEWPROCESS(PROC; SYSTEM.ADDRESS; LONGCARD; VAR SYSTEM.PROCESS; LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFF8                LINK    A6,#FFF8H
     4H        2D7C 0000 0000 FFF8      MOVE.L  #00000000H,FFF8(A6)
     CH        2A2E 0014                MOVE.L  0014(A6),D5
    10H        0205 0001                ANDI.B  #01H,D5
    14H        4A05                     TST.B   D5
    16H        660A                     BNE     [0AH] = 00000022H
    18H        0CAE 0000 0100 0010      CMPI.L  #00000100H,0010(A6)
    20H        6406                     BCC     [06H] = 00000028H
    22H        7206                     MOVEQ   #06H,D1
    24H        7006                     MOVEQ   #06H,D0
    26H        4E47                     TRAP    #7
    28H        2D6E FFF8 FFFC           MOVE.L  FFF8(A6),FFFC(A6)
    2EH        206E 0014                MOVE.L  0014(A6),A0
    32H        D1EE 0010                ADDA.L  0010(A6),A0
    36H        42A0                     CLR.L   -(A0)
    38H        42A0                     CLR.L   -(A0)
    3AH        42A0                     CLR.L   -(A0)
    3CH        212E 0014                MOVE.L  0014(A6),-(A0)
    40H        42A0                     CLR.L   -(A0)
    42H        2248                     MOVE.L  A0,A1
    44H        90FC 0024                SUBA.W  #0024H,A0
    48H        212E FFFC                MOVE.L  FFFC(A6),-(A0)
    4CH        212E 0018                MOVE.L  0018(A6),-(A0)
    50H        40E0                     MOVE    SR,-(A0)
    52H        202E 0008                MOVE.L  0008(A6),D0
    56H        0250 F8FF                ANDI.W  #F8FFH,(A0)
    5AH        8150                     OR.W    D0,(A0)
    5CH        42A0                     CLR.L   -(A0)
    5EH        2109                     MOVE.L  A1,-(A0)
    60H        90FC 0034                SUBA.W  #0034H,A0
    64H        226E 000C                MOVE.L  000C(A6),A1
    68H        2288                     MOVE.L  A0,(A1)
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref own proc ass at     6H, procnum = 35  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 4
PROCEDURE TRANSFER();
 DECODE --------                        INSTRUCTION
     0H        4E46                     TRAP    #6
     2H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 36, entrypoint =     0H, number of bytes = 52
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        2F4E FFFC                MOVE.L  A6,FFFC(A7)
     8H        4E6E                     MOVE    USP,A6
     AH        2D2F 0002                MOVE.L  0002(A7),-(A6)
     EH        3D17                     MOVE.W  (A7),-(A6)
    10H        2D2F FFFC                MOVE.L  FFFC(A7),-(A6)
    14H        48E6 FFFC                MOVEM.L #FFFCH,-(A6)
    18H        2251                     MOVE.L  (A1),A1
    1AH        208E                     MOVE.L  A6,(A0)
    1CH        2C49                     MOVE.L  A1,A6
    1EH        4CDE 3FFF                MOVEM.L (A6)+,#3FFFH
    22H        2F5E FFFC                MOVE.L  (A6)+,FFFC(A7)
    26H        3E9E                     MOVE.W  (A6)+,(A7)
    28H        2F5E 0002                MOVE.L  (A6)+,0002(A7)
    2CH        4E66                     MOVE    A6,USP
    2EH        2C6F FFFC                MOVE.L  FFFC(A7),A6
    32H        4E73                     RTE
  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 12
PROCEDURE IOTRANSFER();
 DECODE --------                        INSTRUCTION
     0H        7011                     MOVEQ   #11H,D0
     2H        4EB9 0000 0000           JSR     00000000H
     8H        4E45                     TRAP    #5
     AH        4E75                     RTS
  checksum: o.k.

ref own proc call at     4H, procnum =  2  checksum: o.k.

proc code, procnum = 37, entrypoint =     0H, number of bytes = 2
 DECODE --------                        INSTRUCTION
     0H        4E71                     NOP
  checksum: o.k.

proc code, procnum = 38, entrypoint =     0H, number of bytes = 122
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        5300                     SUBQ.B  #1,D0
     6H        5300                     SUBQ.B  #1,D0
     8H        6608                     BNE     [08H] = 00000012H
     AH        0257 F8FF                ANDI.W  #F8FFH,(A7)
     EH        8357                     OR.W    D1,(A7)
    10H        4E73                     RTE
    12H        5300                     SUBQ.B  #1,D0
    14H        6604                     BNE     [04H] = 0000001AH
    16H        3E81                     MOVE.W  D1,(A7)
    18H        4E73                     RTE
    1AH        5300                     SUBQ.B  #1,D0
    1CH        6606                     BNE     [06H] = 00000024H
    1EH        46FC 2000                MOVE    #2000H,SR
    22H        4E73                     RTE
    24H        5300                     SUBQ.B  #1,D0
    26H        6604                     BNE     [04H] = 0000002CH
    28H        4E71                     NOP
    2AH        4E73                     RTE
    2CH        5300                     SUBQ.B  #1,D0
    2EH        660A                     BNE     [0AH] = 0000003AH
    30H        2001                     MOVE.L  D1,D0
    32H        4EB9 0000 0000           JSR     00000000H
    38H        4E73                     RTE
    3AH        4E68                     MOVE    USP,A0
    3CH        42A0                     CLR.L   -(A0)
    3EH        42A0                     CLR.L   -(A0)
    40H        42A0                     CLR.L   -(A0)
    42H        2039 0000 0040           MOVE.L  00000040H,D0
    48H        2100                     MOVE.L  D0,-(A0)
    4AH        42A0                     CLR.L   -(A0)
    4CH        2A48                     MOVE.L  A0,A5
    4EH        90FC 0024                SUBA.W  #0024H,A0
    52H        43FA 0006                LEA     [0006H] = 0000005AH,A1
    56H        2109                     MOVE.L  A1,-(A0)
    58H        6016                     BRA     [16H] = 00000070H
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        203C 0000 004C           MOVE.L  #0000004CH,D0
    66H        3F00                     MOVE.W  D0,-(A7)
    68H        203C 0000 0000           MOVE.L  #00000000H,D0
    6EH        4E41                     TRAP    #1
    70H        4E60                     MOVE    A0,USP
    72H        9DCE                     SUBA.L  A6,A6
    74H        0257 D8FF                ANDI.W  #D8FFH,(A7)
    78H        4E73                     RTE
  checksum: o.k.

ref own proc call at    34H, procnum = 32  checksum: o.k.

ref own data at    44H  checksum: o.k.

ref own proc call at    5CH, procnum = 47  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 36
PROCEDURE SYSCALL();
 DECODE --------                        INSTRUCTION
     0H        2A00                     MOVE.L  D0,D5
     2H        7809                     MOVEQ   #09H,D4
     4H        B885                     CMP.L   D5,D4
     6H        650C                     BCS     [0CH] = 00000014H
     8H        2208                     MOVE.L  A0,D1
     AH        5440                     ADDQ.W  #2,D0
     CH        4E47                     TRAP    #7
     EH        4E75                     RTS
    10H        4EFA 0012                JMP     [0012H] = 00000024H
    14H        2A00                     MOVE.L  D0,D5
    16H        780A                     MOVEQ   #0AH,D4
    18H        B885                     CMP.L   D5,D4
    1AH        6606                     BNE     [06H] = 00000022H
    1CH        4EB9 0000 0000           JSR     00000000H
    22H        4E75                     RTS
  checksum: o.k.

ref own proc call at    1EH, procnum = 47  checksum: o.k.

proc code, procnum =  8, entrypoint =     0H, number of bytes = 76
PROCEDURE MULU32(LONGCARD; LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 7C00                MOVEM.L #7C00H,-(A7)
     8H        222E 0008                MOVE.L  0008(A6),D1
     CH        242E 000C                MOVE.L  000C(A6),D2
    10H        2601                     MOVE.L  D1,D3
    12H        2801                     MOVE.L  D1,D4
    14H        2A02                     MOVE.L  D2,D5
    16H        4844                     SWAP    D4
    18H        4845                     SWAP    D5
    1AH        C2C2                     MULU    D2,D1
    1CH        C4C4                     MULU    D4,D2
    1EH        C6C5                     MULU    D5,D3
    20H        C8C5                     MULU    D5,D4
    22H        4841                     SWAP    D1
    24H        D242                     ADD.W   D2,D1
    26H        4285                     CLR.L   D5
    28H        D985                     ADDX.L  D5,D4
    2AH        D243                     ADD.W   D3,D1
    2CH        D985                     ADDX.L  D5,D4
    2EH        4841                     SWAP    D1
    30H        4242                     CLR.W   D2
    32H        4243                     CLR.W   D3
    34H        4842                     SWAP    D2
    36H        4843                     SWAP    D3
    38H        D483                     ADD.L   D3,D2
    3AH        D484                     ADD.L   D4,D2
    3CH        2D41 000C                MOVE.L  D1,000C(A6)
    40H        2D42 0008                MOVE.L  D2,0008(A6)
    44H        4CDF 003E                MOVEM.L (A7)+,#003EH
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

proc code, procnum =  9, entrypoint =     0H, number of bytes = 100
PROCEDURE DIVU32(LONGCARD; LONGCARD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 7800                MOVEM.L #7800H,-(A7)
     8H        222E 000C                MOVE.L  000C(A6),D1
     CH        242E 0008                MOVE.L  0008(A6),D2
    10H        B4BC 0000 FFFF           CMP.L   #0000FFFFH,D2
    16H        621E                     BHI     [1EH] = 00000036H
    18H        4243                     CLR.W   D3
    1AH        82C2                     DIVU    D2,D1
    1CH        680E                     BVC     [0EH] = 0000002CH
    1EH        3801                     MOVE.W  D1,D4
    20H        4241                     CLR.W   D1
    22H        4841                     SWAP    D1
    24H        82C2                     DIVU    D2,D1
    26H        3601                     MOVE.W  D1,D3
    28H        3204                     MOVE.W  D4,D1
    2AH        82C2                     DIVU    D2,D1
    2CH        4843                     SWAP    D3
    2EH        3601                     MOVE.W  D1,D3
    30H        4241                     CLR.W   D1
    32H        4841                     SWAP    D1
    34H        601E                     BRA     [1EH] = 00000054H
    36H        4283                     CLR.L   D3
    38H        3601                     MOVE.W  D1,D3
    3AH        4843                     SWAP    D3
    3CH        4241                     CLR.W   D1
    3EH        4841                     SWAP    D1
    40H        383C 000F                MOVE.W  #000FH,D4
    44H        E38B                     LSL.L   #1,D3
    46H        E391                     ROXL.L  #1,D1
    48H        B282                     CMP.L   D2,D1
    4AH        6504                     BCS     [04H] = 00000050H
    4CH        9282                     SUB.L   D2,D1
    4EH        5243                     ADDQ.W  #1,D3
    50H        51CC FFF2                DBRA    D4,[FFF2H] = 00000044H
    54H        2D43 000C                MOVE.L  D3,000C(A6)
    58H        2D41 0008                MOVE.L  D1,0008(A6)
    5CH        4CDF 001E                MOVEM.L (A7)+,#001EH
    60H        4E5E                     UNLK    A6
    62H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 10, entrypoint =     0H, number of bytes = 92
PROCEDURE MULS32(LONGINT; LONGINT);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        222E 0008                MOVE.L  0008(A6),D1
     CH        242E 000C                MOVE.L  000C(A6),D2
    10H        2601                     MOVE.L  D1,D3
    12H        2801                     MOVE.L  D1,D4
    14H        2A02                     MOVE.L  D2,D5
    16H        2C01                     MOVE.L  D1,D6
    18H        4287                     CLR.L   D7
    1AH        4844                     SWAP    D4
    1CH        4845                     SWAP    D5
    1EH        C2C2                     MULU    D2,D1
    20H        C4C4                     MULU    D4,D2
    22H        C6C5                     MULU    D5,D3
    24H        C8C5                     MULU    D5,D4
    26H        4841                     SWAP    D1
    28H        D242                     ADD.W   D2,D1
    2AH        D987                     ADDX.L  D7,D4
    2CH        D243                     ADD.W   D3,D1
    2EH        D987                     ADDX.L  D7,D4
    30H        4841                     SWAP    D1
    32H        4242                     CLR.W   D2
    34H        4243                     CLR.W   D3
    36H        4842                     SWAP    D2
    38H        4843                     SWAP    D3
    3AH        D483                     ADD.L   D3,D2
    3CH        D484                     ADD.L   D4,D2
    3EH        4845                     SWAP    D5
    40H        4A86                     TST.L   D6
    42H        6A02                     BPL     [02H] = 00000046H
    44H        9485                     SUB.L   D5,D2
    46H        4A85                     TST.L   D5
    48H        6A02                     BPL     [02H] = 0000004CH
    4AH        9486                     SUB.L   D6,D2
    4CH        2D41 000C                MOVE.L  D1,000C(A6)
    50H        2D42 0008                MOVE.L  D2,0008(A6)
    54H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    58H        4E5E                     UNLK    A6
    5AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 11, entrypoint =     0H, number of bytes = 62
PROCEDURE DIVS32(LONGINT; LONGINT);
 DECODE --------                        INSTRUCTION
     0H        201F                     MOVE.L  (A7)+,D0
     2H        2E2F 0000                MOVE.L  0000(A7),D7
     6H        2C2F 0004                MOVE.L  0004(A7),D6
     AH        BF86                     EOR.L   D7,D6
     CH        5BC6                     SMI     D6
     EH        4AAF 0004                TST.L   0004(A7)
    12H        6A04                     BPL     [04H] = 00000018H
    14H        44AF 0004                NEG.L   0004(A7)
    18H        4A87                     TST.L   D7
    1AH        5BC7                     SMI     D7
    1CH        6A04                     BPL     [04H] = 00000022H
    1EH        44AF 0000                NEG.L   0000(A7)
    22H        207C 0000 0000           MOVE.L  #00000000H,A0
    28H        4E90                     JSR     (A0)
    2AH        4A07                     TST.B   D7
    2CH        6704                     BEQ     [04H] = 00000032H
    2EH        44AF 0000                NEG.L   0000(A7)
    32H        4A06                     TST.B   D6
    34H        6704                     BEQ     [04H] = 0000003AH
    36H        44AF 0004                NEG.L   0004(A7)
    3AH        2F00                     MOVE.L  D0,-(A7)
    3CH        4E75                     RTS
  checksum: o.k.

ref own proc ass at    24H, procnum =  9  checksum: o.k.

proc code, procnum = 12, entrypoint =     0H, number of bytes = 188
PROCEDURE FADD(REAL; REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 9F00                MOVEM.L #9F00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        E39C                     ROL.L   #1,D4
    12H        E39E                     ROL.L   #1,D6
    14H        2004                     MOVE.L  D4,D0
    16H        9086                     SUB.L   D6,D0
    18H        6402                     BCC     [02H] = 0000001CH
    1AH        C946                     EXG     D4,D6
    1CH        1604                     MOVE.B  D4,D3
    1EH        C63C 0001                AND.B   #01H,D3
    22H        0800 0000                BTST    #0000H,D0
    26H        6704                     BEQ     [04H] = 0000002CH
    28H        08C3 0001                BSET    #0001H,D3
    2CH        E19C                     ROL.L   #8,D4
    2EH        4245                     CLR.W   D5
    30H        1A04                     MOVE.B  D4,D5
    32H        56C4                     SNE     D4
    34H        E29C                     ROR.L   #1,D4
    36H        4204                     CLR.B   D4
    38H        E19E                     ROL.L   #8,D6
    3AH        4247                     CLR.W   D7
    3CH        1E06                     MOVE.B  D6,D7
    3EH        56C6                     SNE     D6
    40H        E29E                     ROR.L   #1,D6
    42H        4206                     CLR.B   D6
    44H        3005                     MOVE.W  D5,D0
    46H        9047                     SUB.W   D7,D0
    48H        B07C 0018                CMP.W   #0018H,D0
    4CH        622E                     BHI     [2EH] = 0000007CH
    4EH        E0AE                     LSR.L   D0,D6
    50H        0803 0001                BTST    #0001H,D3
    54H        660A                     BNE     [0AH] = 00000060H
    56H        D886                     ADD.L   D6,D4
    58H        6404                     BCC     [04H] = 0000005EH
    5AH        E294                     ROXR.L  #1,D4
    5CH        5245                     ADDQ.W  #1,D5
    5EH        601C                     BRA     [1CH] = 0000007CH
    60H        9886                     SUB.L   D6,D4
    62H        6B18                     BMI     [18H] = 0000007CH
    64H        6716                     BEQ     [16H] = 0000007CH
    66H        B8BC 0000 FFFF           CMP.L   #0000FFFFH,D4
    6CH        6208                     BHI     [08H] = 00000076H
    6EH        9A7C 0010                SUB.W   #0010H,D5
    72H        4844                     SWAP    D4
    74H        6B06                     BMI     [06H] = 0000007CH
    76H        5345                     SUBQ.W  #1,D5
    78H        E38C                     LSL.L   #1,D4
    7AH        6AFA                     BPL     [FAH] = 00000076H
    7CH        D8BC 0000 0080           ADD.L   #00000080H,D4
    82H        6404                     BCC     [04H] = 00000088H
    84H        E294                     ROXR.L  #1,D4
    86H        5245                     ADDQ.W  #1,D5
    88H        4204                     CLR.B   D4
    8AH        4A84                     TST.L   D4
    8CH        6602                     BNE     [02H] = 00000090H
    8EH        4245                     CLR.W   D5
    90H        4A45                     TST.W   D5
    92H        6E04                     BGT     [04H] = 00000098H
    94H        4284                     CLR.L   D4
    96H        6018                     BRA     [18H] = 000000B0H
    98H        BA7C 00FF                CMP.W   #00FFH,D5
    9CH        6D08                     BLT     [08H] = 000000A6H
    9EH        7005                     MOVEQ   #05H,D0
    A0H        4EB9 0000 0000           JSR     00000000H
    A6H        E38C                     LSL.L   #1,D4
    A8H        1805                     MOVE.B  D5,D4
    AAH        E09C                     ROR.L   #8,D4
    ACH        E213                     ROXR.B  #1,D3
    AEH        E294                     ROXR.L  #1,D4
    B0H        2D44 000C                MOVE.L  D4,000C(A6)
    B4H        4CDF 00F9                MOVEM.L (A7)+,#00F9H
    B8H        4E5E                     UNLK    A6
    BAH        4E75                     RTS
  checksum: o.k.

ref own proc call at    A2H, procnum =  2  checksum: o.k.

proc code, procnum = 13, entrypoint =     0H, number of bytes = 14
PROCEDURE FSUB(REAL; REAL);
 DECODE --------                        INSTRUCTION
     0H        207C 0000 0000           MOVE.L  #00000000H,A0
     6H        086F 0007 0004           BCHG    #0007H,0004(A7)
     CH        4ED0                     JMP     (A0)
  checksum: o.k.

ref own proc ass at     2H, procnum = 12  checksum: o.k.

proc code, procnum = 14, entrypoint =     0H, number of bytes = 164
PROCEDURE FMUL(REAL; REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 CF00                MOVEM.L #CF00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        2E04                     MOVE.L  D4,D7
    12H        BD87                     EOR.L   D6,D7
    14H        4844                     SWAP    D4
    16H        3A04                     MOVE.W  D4,D5
    18H        CA7C 7F80                AND.W   #7F80H,D5
    1CH        676C                     BEQ     [6CH] = 0000008AH
    1EH        EE4D                     LSR.W   #7,D5
    20H        C87C 007F                AND.W   #007FH,D4
    24H        887C 0080                OR.W    #0080H,D4
    28H        4846                     SWAP    D6
    2AH        3E06                     MOVE.W  D6,D7
    2CH        CE7C 7F80                AND.W   #7F80H,D7
    30H        6758                     BEQ     [58H] = 0000008AH
    32H        EE4F                     LSR.W   #7,D7
    34H        CC7C 007F                AND.W   #007FH,D6
    38H        8C7C 0080                OR.W    #0080H,D6
    3CH        DA47                     ADD.W   D7,D5
    3EH        9A7C 007E                SUB.W   #007EH,D5
    42H        6D46                     BLT     [46H] = 0000008AH
    44H        2004                     MOVE.L  D4,D0
    46H        4840                     SWAP    D0
    48H        4846                     SWAP    D6
    4AH        C0C6                     MULU    D6,D0
    4CH        4240                     CLR.W   D0
    4EH        4840                     SWAP    D0
    50H        3204                     MOVE.W  D4,D1
    52H        C2C6                     MULU    D6,D1
    54H        D081                     ADD.L   D1,D0
    56H        2204                     MOVE.L  D4,D1
    58H        4841                     SWAP    D1
    5AH        4846                     SWAP    D6
    5CH        C2C6                     MULU    D6,D1
    5EH        D081                     ADD.L   D1,D0
    60H        C8C6                     MULU    D6,D4
    62H        4844                     SWAP    D4
    64H        D880                     ADD.L   D0,D4
    66H        6B04                     BMI     [04H] = 0000006CH
    68H        E38C                     LSL.L   #1,D4
    6AH        5345                     SUBQ.W  #1,D5
    6CH        D8BC 0000 0080           ADD.L   #00000080H,D4
    72H        6404                     BCC     [04H] = 00000078H
    74H        E294                     ROXR.L  #1,D4
    76H        5245                     ADDQ.W  #1,D5
    78H        4A45                     TST.W   D5
    7AH        6B0E                     BMI     [0EH] = 0000008AH
    7CH        BA7C 00FF                CMP.W   #00FFH,D5
    80H        6D0C                     BLT     [0CH] = 0000008EH
    82H        7005                     MOVEQ   #05H,D0
    84H        4EB9 0000 0000           JSR     00000000H
    8AH        4284                     CLR.L   D4
    8CH        600A                     BRA     [0AH] = 00000098H
    8EH        E38C                     LSL.L   #1,D4
    90H        1805                     MOVE.B  D5,D4
    92H        E09C                     ROR.L   #8,D4
    94H        E397                     ROXL.L  #1,D7
    96H        E294                     ROXR.L  #1,D4
    98H        2D44 000C                MOVE.L  D4,000C(A6)
    9CH        4CDF 00F3                MOVEM.L (A7)+,#00F3H
    A0H        4E5E                     UNLK    A6
    A2H        4E75                     RTS
  checksum: o.k.

ref own proc call at    86H, procnum =  2  checksum: o.k.

proc code, procnum = 15, entrypoint =     0H, number of bytes = 158
PROCEDURE FDIV(REAL; REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 8F00                MOVEM.L #8F00H,-(A7)
     8H        282E 000C                MOVE.L  000C(A6),D4
     CH        2C2E 0008                MOVE.L  0008(A6),D6
    10H        2E04                     MOVE.L  D4,D7
    12H        BD87                     EOR.L   D6,D7
    14H        E38E                     LSL.L   #1,D6
    16H        E19E                     ROL.L   #8,D6
    18H        4247                     CLR.W   D7
    1AH        1E06                     MOVE.B  D6,D7
    1CH        675E                     BEQ     [5EH] = 0000007CH
    1EH        1C3C 0001                MOVE.B  #01H,D6
    22H        E29E                     ROR.L   #1,D6
    24H        E38C                     LSL.L   #1,D4
    26H        E19C                     ROL.L   #8,D4
    28H        4245                     CLR.W   D5
    2AH        1A04                     MOVE.B  D4,D5
    2CH        6756                     BEQ     [56H] = 00000084H
    2EH        183C 0001                MOVE.B  #01H,D4
    32H        E29C                     ROR.L   #1,D4
    34H        9A47                     SUB.W   D7,D5
    36H        DA7C 007F                ADD.W   #007FH,D5
    3AH        4846                     SWAP    D6
    3CH        E28C                     LSR.L   #1,D4
    3EH        88C6                     DIVU    D6,D4
    40H        3004                     MOVE.W  D4,D0
    42H        4244                     CLR.W   D4
    44H        88C6                     DIVU    D6,D4
    46H        4844                     SWAP    D4
    48H        3800                     MOVE.W  D0,D4
    4AH        2006                     MOVE.L  D6,D0
    4CH        4840                     SWAP    D0
    4EH        C0C4                     MULU    D4,D0
    50H        E288                     LSR.L   #1,D0
    52H        80C6                     DIVU    D6,D0
    54H        C0BC 0000 FFFF           AND.L   #0000FFFFH,D0
    5AH        E388                     LSL.L   #1,D0
    5CH        4844                     SWAP    D4
    5EH        9880                     SUB.L   D0,D4
    60H        6B04                     BMI     [04H] = 00000066H
    62H        E38C                     LSL.L   #1,D4
    64H        5345                     SUBQ.W  #1,D5
    66H        D8BC 0000 0080           ADD.L   #00000080H,D4
    6CH        6404                     BCC     [04H] = 00000072H
    6EH        E294                     ROXR.L  #1,D4
    70H        5245                     ADDQ.W  #1,D5
    72H        4A45                     TST.W   D5
    74H        6B0E                     BMI     [0EH] = 00000084H
    76H        BA7C 00FF                CMP.W   #00FFH,D5
    7AH        6D0C                     BLT     [0CH] = 00000088H
    7CH        7005                     MOVEQ   #05H,D0
    7EH        4EB9 0000 0000           JSR     00000000H
    84H        4284                     CLR.L   D4
    86H        600A                     BRA     [0AH] = 00000092H
    88H        E39C                     ROL.L   #1,D4
    8AH        1805                     MOVE.B  D5,D4
    8CH        E09C                     ROR.L   #8,D4
    8EH        E397                     ROXL.L  #1,D7
    90H        E294                     ROXR.L  #1,D4
    92H        2D44 000C                MOVE.L  D4,000C(A6)
    96H        4CDF 00F1                MOVEM.L (A7)+,#00F1H
    9AH        4E5E                     UNLK    A6
    9CH        4E75                     RTS
  checksum: o.k.

ref own proc call at    80H, procnum =  2  checksum: o.k.

proc code, procnum = 16, entrypoint =     0H, number of bytes = 66
PROCEDURE FCMP(REAL; REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        202E 000C                MOVE.L  000C(A6),D0
     CH        2400                     MOVE.L  D0,D2
     EH        6A06                     BPL     [06H] = 00000016H
    10H        0A80 7FFF FFFF           EORI.L  #7FFFFFFFH,D0
    16H        C4BC 7F80 0000           AND.L   #7F800000H,D2
    1CH        6602                     BNE     [02H] = 00000020H
    1EH        4280                     CLR.L   D0
    20H        222E 0008                MOVE.L  0008(A6),D1
    24H        2401                     MOVE.L  D1,D2
    26H        6A06                     BPL     [06H] = 0000002EH
    28H        0A81 7FFF FFFF           EORI.L  #7FFFFFFFH,D1
    2EH        C4BC 7F80 0000           AND.L   #7F800000H,D2
    34H        6602                     BNE     [02H] = 00000038H
    36H        4281                     CLR.L   D1
    38H        B081                     CMP.L   D1,D0
    3AH        4CDF 0007                MOVEM.L (A7)+,#0007H
    3EH        4E5E                     UNLK    A6
    40H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 17, entrypoint =     0H, number of bytes = 34
PROCEDURE FTST(REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 A000                MOVEM.L #A000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        2400                     MOVE.L  D0,D2
     EH        C4BC 7F80 0000           AND.L   #7F800000H,D2
    14H        6602                     BNE     [02H] = 00000018H
    16H        4280                     CLR.L   D0
    18H        4A80                     TST.L   D0
    1AH        4CDF 0005                MOVEM.L (A7)+,#0005H
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 18, entrypoint =     0H, number of bytes = 68
PROCEDURE FLOATX(SYSTEM.LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        672A                     BEQ     [2AH] = 00000038H
     EH        323C 009E                MOVE.W  #009EH,D1
    12H        B0BC 0000 FFFF           CMP.L   #0000FFFFH,D0
    18H        6206                     BHI     [06H] = 00000020H
    1AH        4840                     SWAP    D0
    1CH        927C 0010                SUB.W   #0010H,D1
    20H        B0BC 00FF FFFF           CMP.L   #00FFFFFFH,D0
    26H        6204                     BHI     [04H] = 0000002CH
    28H        E188                     LSL.L   #8,D0
    2AH        5141                     SUBQ.W  #8,D1
    2CH        E388                     LSL.L   #1,D0
    2EH        55C9 FFFC                DBCS    D1,[FFFCH] = 0000002CH
    32H        1001                     MOVE.B  D1,D0
    34H        E098                     ROR.L   #8,D0
    36H        E288                     LSR.L   #1,D0
    38H        2D40 0008                MOVE.L  D0,0008(A6)
    3CH        4CDF 0003                MOVEM.L (A7)+,#0003H
    40H        4E5E                     UNLK    A6
    42H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 19, entrypoint =     0H, number of bytes = 78
PROCEDURE TRUNCX(REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        6A0A                     BPL     [0AH] = 00000018H
     EH        C0BC 7F80 0000           AND.L   #7F800000H,D0
    14H        6716                     BEQ     [16H] = 0000002CH
    16H        6020                     BRA     [20H] = 00000038H
    18H        E388                     LSL.L   #1,D0
    1AH        E198                     ROL.L   #8,D0
    1CH        4241                     CLR.W   D1
    1EH        1200                     MOVE.B  D0,D1
    20H        103C 0001                MOVE.B  #01H,D0
    24H        E298                     ROR.L   #1,D0
    26H        927C 007F                SUB.W   #007FH,D1
    2AH        6C04                     BGE     [04H] = 00000030H
    2CH        4280                     CLR.L   D0
    2EH        6012                     BRA     [12H] = 00000042H
    30H        927C 001F                SUB.W   #001FH,D1
    34H        4441                     NEG.W   D1
    36H        6C08                     BGE     [08H] = 00000040H
    38H        7005                     MOVEQ   #05H,D0
    3AH        4EB9 0000 0000           JSR     00000000H
    40H        E2A8                     LSR.L   D1,D0
    42H        2D40 0008                MOVE.L  D0,0008(A6)
    46H        4CDF 0003                MOVEM.L (A7)+,#0003H
    4AH        4E5E                     UNLK    A6
    4CH        4E75                     RTS
  checksum: o.k.

ref own proc call at    3CH, procnum =  2  checksum: o.k.

proc code, procnum = 20, entrypoint =     0H, number of bytes = 328
PROCEDURE LFADD(LONGREAL; LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        7400                     MOVEQ   #00H,D2
    10H        DA85                     ADD.L   D5,D5
    12H        D984                     ADDX.L  D4,D4
    14H        DB82                     ADDX.L  D2,D5
    16H        DE87                     ADD.L   D7,D7
    18H        DD86                     ADDX.L  D6,D6
    1AH        DF82                     ADDX.L  D2,D7
    1CH        2004                     MOVE.L  D4,D0
    1EH        2205                     MOVE.L  D5,D1
    20H        9287                     SUB.L   D7,D1
    22H        9186                     SUBX.L  D6,D0
    24H        6404                     BCC     [04H] = 0000002AH
    26H        CB47                     EXG     D5,D7
    28H        C946                     EXG     D4,D6
    2AH        7600                     MOVEQ   #00H,D3
    2CH        1605                     MOVE.B  D5,D3
    2EH        BF03                     EOR.B   D7,D3
    30H        0505                     BTST    D2,D5
    32H        6704                     BEQ     [04H] = 00000038H
    34H        700F                     MOVEQ   #0FH,D0
    36H        01C3                     BSET    D0,D3
    38H        701F                     MOVEQ   #1FH,D0
    3AH        E28C                     LSR.L   #1,D4
    3CH        E295                     ROXR.L  #1,D5
    3EH        6402                     BCC     [02H] = 00000042H
    40H        01C4                     BSET    D0,D4
    42H        4844                     SWAP    D4
    44H        3204                     MOVE.W  D4,D1
    46H        E28E                     LSR.L   #1,D6
    48H        E297                     ROXR.L  #1,D7
    4AH        6402                     BCC     [02H] = 0000004EH
    4CH        01C6                     BSET    D0,D6
    4EH        0241 7FF0                ANDI.W  #7FF0H,D1
    52H        6612                     BNE     [12H] = 00000066H
    54H        2806                     MOVE.L  D6,D4
    56H        2A07                     MOVE.L  D7,D5
    58H        48EE 0030 0010           MOVEM.L #0030H,0010(A6)
    5EH        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    62H        4E5E                     UNLK    A6
    64H        4E75                     RTS
    66H        4844                     SWAP    D4
    68H        4846                     SWAP    D6
    6AH        3006                     MOVE.W  D6,D0
    6CH        0240 7FF0                ANDI.W  #7FF0H,D0
    70H        67E6                     BEQ     [E6H] = 00000058H
    72H        4844                     SWAP    D4
    74H        0244 000F                ANDI.W  #000FH,D4
    78H        08C4 0004                BSET    #0004H,D4
    7CH        4844                     SWAP    D4
    7EH        0246 000F                ANDI.W  #000FH,D6
    82H        08C6 0004                BSET    #0004H,D6
    86H        4846                     SWAP    D6
    88H        3401                     MOVE.W  D1,D2
    8AH        9240                     SUB.W   D0,D1
    8CH        673A                     BEQ     [3AH] = 000000C8H
    8EH        E849                     LSR.W   #4,D1
    90H        0C41 0035                CMPI.W  #0035H,D1
    94H        644C                     BCC     [4CH] = 000000E2H
    96H        0C01 0020                CMPI.B  #20H,D1
    9AH        6D0A                     BLT     [0AH] = 000000A6H
    9CH        2E06                     MOVE.L  D6,D7
    9EH        7C00                     MOVEQ   #00H,D6
    A0H        0401 0020                SUBI.B  #20H,D1
    A4H        6722                     BEQ     [22H] = 000000C8H
    A6H        0C01 0010                CMPI.B  #10H,D1
    AAH        6D0E                     BLT     [0EH] = 000000BAH
    ACH        3E06                     MOVE.W  D6,D7
    AEH        4246                     CLR.W   D6
    B0H        4846                     SWAP    D6
    B2H        4847                     SWAP    D7
    B4H        0401 0010                SUBI.B  #10H,D1
    B8H        670E                     BEQ     [0EH] = 000000C8H
    BAH        7000                     MOVEQ   #00H,D0
    BCH        3006                     MOVE.W  D6,D0
    BEH        E2AE                     LSR.L   D1,D6
    C0H        E2AF                     LSR.L   D1,D7
    C2H        E2B8                     ROR.L   D1,D0
    C4H        4240                     CLR.W   D0
    C6H        8E80                     OR.L    D0,D7
    C8H        0803 0000                BTST    #0000H,D3
    CCH        662E                     BNE     [2EH] = 000000FCH
    CEH        DA87                     ADD.L   D7,D5
    D0H        D986                     ADDX.L  D6,D4
    D2H        7015                     MOVEQ   #15H,D0
    D4H        0104                     BTST    D0,D4
    D6H        670A                     BEQ     [0AH] = 000000E2H
    D8H        E28C                     LSR.L   #1,D4
    DAH        E295                     ROXR.L  #1,D5
    DCH        0642 0010                ADDI.W  #0010H,D2
    E0H        6B12                     BMI     [12H] = 000000F4H
    E2H        4844                     SWAP    D4
    E4H        0244 000F                ANDI.W  #000FH,D4
    E8H        8842                     OR.W    D2,D4
    EAH        4203                     CLR.B   D3
    ECH        8843                     OR.W    D3,D4
    EEH        4844                     SWAP    D4
    F0H        6000 FF66                BRA     [FF66H] = 00000058H
    F4H        7005                     MOVEQ   #05H,D0
    F6H        4EB9 0000 0000           JSR     00000000H
    FCH        9A87                     SUB.L   D7,D5
    FEH        9986                     SUBX.L  D6,D4
   100H        6612                     BNE     [12H] = 00000114H
   102H        4A85                     TST.L   D5
   104H        6700 FF52                BEQ     [FF52H] = 00000058H
   108H        4845                     SWAP    D5
   10AH        3805                     MOVE.W  D5,D4
   10CH        4245                     CLR.W   D5
   10EH        0442 0100                SUBI.W  #0100H,D2
   112H        6B28                     BMI     [28H] = 0000013CH
   114H        0C84 0000 000F           CMPI.L  #0000000FH,D4
   11AH        620E                     BHI     [0EH] = 0000012AH
   11CH        4844                     SWAP    D4
   11EH        4845                     SWAP    D5
   120H        3805                     MOVE.W  D5,D4
   122H        4245                     CLR.W   D5
   124H        0442 0100                SUBI.W  #0100H,D2
   128H        6B12                     BMI     [12H] = 0000013CH
   12AH        7014                     MOVEQ   #14H,D0
   12CH        0104                     BTST    D0,D4
   12EH        66B2                     BNE     [B2H] = 000000E2H
   130H        0442 0010                SUBI.W  #0010H,D2
   134H        6B06                     BMI     [06H] = 0000013CH
   136H        DA85                     ADD.L   D5,D5
   138H        D984                     ADDX.L  D4,D4
   13AH        60F0                     BRA     [F0H] = 0000012CH
   13CH        7800                     MOVEQ   #00H,D4
   13EH        7A00                     MOVEQ   #00H,D5
   140H        6000 FF16                BRA     [FF16H] = 00000058H
   144H        6000 FF16                BRA     [FF16H] = 0000005CH
  checksum: o.k.

ref own proc call at    F8H, procnum =  2  checksum: o.k.

proc code, procnum = 21, entrypoint =     0H, number of bytes = 14
PROCEDURE LFSUB(LONGREAL; LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        207C 0000 0000           MOVE.L  #00000000H,A0
     6H        086F 0007 0004           BCHG    #0007H,0004(A7)
     CH        4ED0                     JMP     (A0)
  checksum: o.k.

ref own proc ass at     2H, procnum = 20  checksum: o.k.

proc code, procnum = 22, entrypoint =     0H, number of bytes = 318
PROCEDURE LFMUL(LONGREAL; LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        4844                     SWAP    D4
    10H        3604                     MOVE.W  D4,D3
    12H        4846                     SWAP    D6
    14H        BD43                     EOR.W   D6,D3
    16H        5BE7                     SMI     -(A7)
    18H        3404                     MOVE.W  D4,D2
    1AH        303C 7FF0                MOVE.W  #7FF0H,D0
    1EH        C440                     AND.W   D0,D2
    20H        6700 010E                BEQ     [010EH] = 00000130H
    24H        3606                     MOVE.W  D6,D3
    26H        C640                     AND.W   D0,D3
    28H        6700 0106                BEQ     [0106H] = 00000130H
    2CH        D642                     ADD.W   D2,D3
    2EH        0443 3FF0                SUBI.W  #3FF0H,D3
    32H        6300 00FC                BLS     [00FCH] = 00000130H
    36H        6B00 00FE                BMI     [00FEH] = 00000136H
    3AH        700F                     MOVEQ   #0FH,D0
    3CH        C840                     AND.W   D0,D4
    3EH        08C4 0004                BSET    #0004H,D4
    42H        CC40                     AND.W   D0,D6
    44H        08C6 0004                BSET    #0004H,D6
    48H        7400                     MOVEQ   #00H,D2
    4AH        3F03                     MOVE.W  D3,-(A7)
    4CH        3004                     MOVE.W  D4,D0
    4EH        C0C6                     MULU    D6,D0
    50H        4840                     SWAP    D0
    52H        3204                     MOVE.W  D4,D1
    54H        C2C7                     MULU    D7,D1
    56H        3604                     MOVE.W  D4,D3
    58H        4846                     SWAP    D6
    5AH        C6C6                     MULU    D6,D3
    5CH        D083                     ADD.L   D3,D0
    5EH        3604                     MOVE.W  D4,D3
    60H        4847                     SWAP    D7
    62H        C6C7                     MULU    D7,D3
    64H        4841                     SWAP    D1
    66H        D243                     ADD.W   D3,D1
    68H        4243                     CLR.W   D3
    6AH        4843                     SWAP    D3
    6CH        D183                     ADDX.L  D3,D0
    6EH        4844                     SWAP    D4
    70H        3604                     MOVE.W  D4,D3
    72H        C6C6                     MULU    D6,D3
    74H        D243                     ADD.W   D3,D1
    76H        4841                     SWAP    D1
    78H        4243                     CLR.W   D3
    7AH        4843                     SWAP    D3
    7CH        D183                     ADDX.L  D3,D0
    7EH        3604                     MOVE.W  D4,D3
    80H        4846                     SWAP    D6
    82H        C6C6                     MULU    D6,D3
    84H        D083                     ADD.L   D3,D0
    86H        3604                     MOVE.W  D4,D3
    88H        C6C7                     MULU    D7,D3
    8AH        D283                     ADD.L   D3,D1
    8CH        D182                     ADDX.L  D2,D0
    8EH        3604                     MOVE.W  D4,D3
    90H        4847                     SWAP    D7
    92H        C8C7                     MULU    D7,D4
    94H        4244                     CLR.W   D4
    96H        4844                     SWAP    D4
    98H        D284                     ADD.L   D4,D1
    9AH        D182                     ADDX.L  D2,D0
    9CH        3605                     MOVE.W  D5,D3
    9EH        C6C6                     MULU    D6,D3
    A0H        D283                     ADD.L   D3,D1
    A2H        D182                     ADDX.L  D2,D0
    A4H        3605                     MOVE.W  D5,D3
    A6H        4846                     SWAP    D6
    A8H        C6C6                     MULU    D6,D3
    AAH        4243                     CLR.W   D3
    ACH        4843                     SWAP    D3
    AEH        D283                     ADD.L   D3,D1
    B0H        D182                     ADDX.L  D2,D0
    B2H        4845                     SWAP    D5
    B4H        3605                     MOVE.W  D5,D3
    B6H        C6C6                     MULU    D6,D3
    B8H        D283                     ADD.L   D3,D1
    BAH        D182                     ADDX.L  D2,D0
    BCH        4846                     SWAP    D6
    BEH        CCC5                     MULU    D5,D6
    C0H        4841                     SWAP    D1
    C2H        D246                     ADD.W   D6,D1
    C4H        4841                     SWAP    D1
    C6H        4246                     CLR.W   D6
    C8H        4846                     SWAP    D6
    CAH        D186                     ADDX.L  D6,D0
    CCH        4847                     SWAP    D7
    CEH        CAC7                     MULU    D7,D5
    D0H        4245                     CLR.W   D5
    D2H        4845                     SWAP    D5
    D4H        D285                     ADD.L   D5,D1
    D6H        D182                     ADDX.L  D2,D0
    D8H        5081                     ADDQ.L  #8,D1
    DAH        D182                     ADDX.L  D2,D0
    DCH        361F                     MOVE.W  (A7)+,D3
    DEH        7804                     MOVEQ   #04H,D4
    E0H        7A19                     MOVEQ   #19H,D5
    E2H        0B00                     BTST    D5,D0
    E4H        6706                     BEQ     [06H] = 000000ECH
    E6H        5244                     ADDQ.W  #1,D4
    E8H        0643 0010                ADDI.W  #0010H,D3
    ECH        1400                     MOVE.B  D0,D2
    EEH        E8BA                     ROR.L   D4,D2
    F0H        4202                     CLR.B   D2
    F2H        E8A8                     LSR.L   D4,D0
    F4H        E8A9                     LSR.L   D4,D1
    F6H        8282                     OR.L    D2,D1
    F8H        5B05                     SUBQ.B  #5,D5
    FAH        0B00                     BTST    D5,D0
    FCH        660C                     BNE     [0CH] = 0000010AH
    FEH        D482                     ADD.L   D2,D2
   100H        D381                     ADDX.L  D1,D1
   102H        D180                     ADDX.L  D0,D0
   104H        0443 000A                SUBI.W  #000AH,D3
   108H        6324                     BLS     [24H] = 0000012EH
   10AH        4A43                     TST.W   D3
   10CH        6B28                     BMI     [28H] = 00000136H
   10EH        4840                     SWAP    D0
   110H        0240 000F                ANDI.W  #000FH,D0
   114H        8043                     OR.W    D3,D0
   116H        4840                     SWAP    D0
   118H        4A1F                     TST.B   (A7)+
   11AH        6704                     BEQ     [04H] = 00000120H
   11CH        761F                     MOVEQ   #1FH,D3
   11EH        07C0                     BSET    D3,D0
   120H        48EE 0003 0010           MOVEM.L #0003H,0010(A6)
   126H        4CDF 00FF                MOVEM.L (A7)+,#00FFH
   12AH        4E5E                     UNLK    A6
   12CH        4E75                     RTS
   12EH        544F                     ADDQ.W  #2,A7
   130H        7000                     MOVEQ   #00H,D0
   132H        7200                     MOVEQ   #00H,D1
   134H        60EA                     BRA     [EAH] = 00000120H
   136H        7005                     MOVEQ   #05H,D0
   138H        4EB9 0000 0000           JSR     00000000H
  checksum: o.k.

ref own proc call at   13AH, procnum =  2  checksum: o.k.

proc code, procnum = 23, entrypoint =     0H, number of bytes = 232
PROCEDURE LFDIV(LONGREAL; LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 FF00                MOVEM.L #FF00H,-(A7)
     8H        4CEE 00F0 0008           MOVEM.L 0008(A6),#00F0H
     EH        4844                     SWAP    D4
    10H        3204                     MOVE.W  D4,D1
    12H        0241 7FF0                ANDI.W  #7FF0H,D1
    16H        6700 008E                BEQ     [008EH] = 000000A6H
    1AH        4846                     SWAP    D6
    1CH        3006                     MOVE.W  D6,D0
    1EH        0240 7FF0                ANDI.W  #7FF0H,D0
    22H        6700 0070                BEQ     [0070H] = 00000094H
    26H        9041                     SUB.W   D1,D0
    28H        0640 3FF0                ADDI.W  #3FF0H,D0
    2CH        6B00 0078                BMI     [0078H] = 000000A6H
    30H        3206                     MOVE.W  D6,D1
    32H        B941                     EOR.W   D4,D1
    34H        5BE7                     SMI     -(A7)
    36H        0246 000F                ANDI.W  #000FH,D6
    3AH        08C6 0004                BSET    #0004H,D6
    3EH        0244 000F                ANDI.W  #000FH,D4
    42H        08C4 0004                BSET    #0004H,D4
    46H        4846                     SWAP    D6
    48H        4844                     SWAP    D4
    4AH        721E                     MOVEQ   #1EH,D1
    4CH        7600                     MOVEQ   #00H,D3
    4EH        6122                     BSR     [22H] = 00000072H
    50H        2403                     MOVE.L  D3,D2
    52H        7217                     MOVEQ   #17H,D1
    54H        7600                     MOVEQ   #00H,D3
    56H        6116                     BSR     [16H] = 0000006EH
    58H        7209                     MOVEQ   #09H,D1
    5AH        E3AB                     LSL.L   D1,D3
    5CH        D582                     ADDX.L  D2,D2
    5EH        6B4E                     BMI     [4EH] = 000000AEH
    60H        0440 0010                SUBI.W  #0010H,D0
    64H        6B00 002C                BMI     [002CH] = 00000092H
    68H        D683                     ADD.L   D3,D3
    6AH        D582                     ADDX.L  D2,D2
    6CH        6040                     BRA     [40H] = 000000AEH
    6EH        DE87                     ADD.L   D7,D7
    70H        DD86                     ADDX.L  D6,D6
    72H        BC84                     CMP.L   D4,D6
    74H        5CC9 FFF8                DBGE    D1,[FFF8H] = 0000006EH
    78H        03C3                     BSET    D1,D3
    7AH        9E85                     SUB.L   D5,D7
    7CH        9D84                     SUBX.L  D4,D6
    7EH        5BC9 FFEE                DBMI    D1,[FFEEH] = 0000006EH
    82H        6A0C                     BPL     [0CH] = 00000090H
    84H        DE85                     ADD.L   D5,D7
    86H        DD84                     ADDX.L  D4,D6
    88H        0383                     BCLR    D1,D3
    8AH        4A41                     TST.W   D1
    8CH        5DC9 FFE0                DBLT    D1,[FFE0H] = 0000006EH
    90H        4E75                     RTS
    92H        548F                     ADDQ.L  #2,A7
    94H        7400                     MOVEQ   #00H,D2
    96H        7600                     MOVEQ   #00H,D3
    98H        48EE 000C 0010           MOVEM.L #000CH,0010(A6)
    9EH        4CDF 00FF                MOVEM.L (A7)+,#00FFH
    A2H        4E5E                     UNLK    A6
    A4H        4E75                     RTS
    A6H        7005                     MOVEQ   #05H,D0
    A8H        4EB9 0000 0000           JSR     00000000H
    AEH        7C00                     MOVEQ   #00H,D6
    B0H        0683 0000 0800           ADDI.L  #00000800H,D3
    B6H        D586                     ADDX.L  D6,D2
    B8H        640A                     BCC     [0AH] = 000000C4H
    BAH        E292                     ROXR.L  #1,D2
    BCH        E293                     ROXR.L  #1,D3
    BEH        0640 0010                ADDI.W  #0010H,D0
    C2H        6BE2                     BMI     [E2H] = 000000A6H
    C4H        7200                     MOVEQ   #00H,D1
    C6H        3202                     MOVE.W  D2,D1
    C8H        7E0B                     MOVEQ   #0BH,D7
    CAH        EEAA                     LSR.L   D7,D2
    CCH        EEAB                     LSR.L   D7,D3
    CEH        EEB9                     ROR.L   D7,D1
    D0H        4201                     CLR.B   D1
    D2H        8681                     OR.L    D1,D3
    D4H        4842                     SWAP    D2
    D6H        0242 000F                ANDI.W  #000FH,D2
    DAH        8440                     OR.W    D0,D2
    DCH        4842                     SWAP    D2
    DEH        4A1F                     TST.B   (A7)+
    E0H        67B6                     BEQ     [B6H] = 00000098H
    E2H        701F                     MOVEQ   #1FH,D0
    E4H        01C2                     BSET    D0,D2
    E6H        60B0                     BRA     [B0H] = 00000098H
  checksum: o.k.

ref own proc call at    AAH, procnum =  2  checksum: o.k.

proc code, procnum = 24, entrypoint =     0H, number of bytes = 76
PROCEDURE LFCMP(LONGREAL; LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 F800                MOVEM.L #F800H,-(A7)
     8H        4CEE 000F 0008           MOVEM.L 0008(A6),#000FH
     EH        2800                     MOVE.L  D0,D4
    10H        6A08                     BPL     [08H] = 0000001AH
    12H        0A80 7FFF FFFF           EORI.L  #7FFFFFFFH,D0
    18H        4681                     NOT.L   D1
    1AH        0284 7FF0 0000           ANDI.L  #7FF00000H,D4
    20H        6604                     BNE     [04H] = 00000026H
    22H        7000                     MOVEQ   #00H,D0
    24H        7200                     MOVEQ   #00H,D1
    26H        2802                     MOVE.L  D2,D4
    28H        6A08                     BPL     [08H] = 00000032H
    2AH        0A82 7FFF FFFF           EORI.L  #7FFFFFFFH,D2
    30H        4683                     NOT.L   D3
    32H        0284 7FF0 0000           ANDI.L  #7FF00000H,D4
    38H        6604                     BNE     [04H] = 0000003EH
    3AH        7400                     MOVEQ   #00H,D2
    3CH        7600                     MOVEQ   #00H,D3
    3EH        B480                     CMP.L   D0,D2
    40H        6602                     BNE     [02H] = 00000044H
    42H        B681                     CMP.L   D1,D3
    44H        4CDF 001F                MOVEM.L (A7)+,#001FH
    48H        4E5E                     UNLK    A6
    4AH        4E75                     RTS
  checksum: o.k.

proc code, procnum = 25, entrypoint =     0H, number of bytes = 34
PROCEDURE LFTST(LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 C000                MOVEM.L #C000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        2200                     MOVE.L  D0,D1
     EH        0281 7FF0 0000           ANDI.L  #7FF00000H,D1
    14H        6602                     BNE     [02H] = 00000018H
    16H        7000                     MOVEQ   #00H,D0
    18H        4A80                     TST.L   D0
    1AH        4CDF 0003                MOVEM.L (A7)+,#0003H
    1EH        4E5E                     UNLK    A6
    20H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 26, entrypoint =     0H, number of bytes = 104
PROCEDURE LFLOATX(SYSTEM.LONGWORD);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        7000                     MOVEQ   #00H,D0
     AH        222E 0008                MOVE.L  0008(A6),D1
     EH        6748                     BEQ     [48H] = 00000058H
    10H        343C 41E0                MOVE.W  #41E0H,D2
    14H        4841                     SWAP    D1
    16H        3001                     MOVE.W  D1,D0
    18H        660A                     BNE     [0AH] = 00000024H
    1AH        4841                     SWAP    D1
    1CH        3001                     MOVE.W  D1,D0
    1EH        7200                     MOVEQ   #00H,D1
    20H        0442 0100                SUBI.W  #0100H,D2
    24H        4241                     CLR.W   D1
    26H        0C40 00FF                CMPI.W  #00FFH,D0
    2AH        620C                     BHI     [0CH] = 00000038H
    2CH        E188                     LSL.L   #8,D0
    2EH        E199                     ROL.L   #8,D1
    30H        8001                     OR.B    D1,D0
    32H        4201                     CLR.B   D1
    34H        0442 0080                SUBI.W  #0080H,D2
    38H        4A40                     TST.W   D0
    3AH        6B0A                     BMI     [0AH] = 00000046H
    3CH        0442 0010                SUBI.W  #0010H,D2
    40H        D281                     ADD.L   D1,D1
    42H        D140                     ADDX.W  D0,D0
    44H        6AF6                     BPL     [F6H] = 0000003CH
    46H        EB88                     LSL.L   #5,D0
    48H        EB99                     ROL.L   #5,D1
    4AH        8001                     OR.B    D1,D0
    4CH        4201                     CLR.B   D1
    4EH        4840                     SWAP    D0
    50H        0240 000F                ANDI.W  #000FH,D0
    54H        8042                     OR.W    D2,D0
    56H        4840                     SWAP    D0
    58H        48EE 0003 0008           MOVEM.L #0003H,0008(A6)
    5EH        4CDF 0007                MOVEM.L (A7)+,#0007H
    62H        4E5E                     UNLK    A6
    64H        4E75                     RTS
    66H        4E75                     RTS
  checksum: o.k.

proc code, procnum = 27, entrypoint =     0H, number of bytes = 100
PROCEDURE LTRUNCX(LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        4CEE 0003 0008           MOVEM.L 0008(A6),#0003H
     EH        4840                     SWAP    D0
    10H        7400                     MOVEQ   #00H,D2
    12H        3400                     MOVE.W  D0,D2
    14H        6A0E                     BPL     [0EH] = 00000024H
    16H        0242 7FF0                ANDI.W  #7FF0H,D2
    1AH        6738                     BEQ     [38H] = 00000054H
    1CH        7005                     MOVEQ   #05H,D0
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        E84A                     LSR.W   #4,D2
    26H        672C                     BEQ     [2CH] = 00000054H
    28H        0442 03FF                SUBI.W  #03FFH,D2
    2CH        6D26                     BLT     [26H] = 00000054H
    2EH        0240 000F                ANDI.W  #000FH,D0
    32H        08C0 0004                BSET    #0004H,D0
    36H        4840                     SWAP    D0
    38H        0442 001F                SUBI.W  #001FH,D2
    3CH        4442                     NEG.W   D2
    3EH        6DDC                     BLT     [DCH] = 0000001CH
    40H        0442 000B                SUBI.W  #000BH,D2
    44H        6D12                     BLT     [12H] = 00000058H
    46H        E4A8                     LSR.L   D2,D0
    48H        2D40 000C                MOVE.L  D0,000C(A6)
    4CH        4CDF 0007                MOVEM.L (A7)+,#0007H
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
    54H        7000                     MOVEQ   #00H,D0
    56H        60F0                     BRA     [F0H] = 00000048H
    58H        4442                     NEG.W   D2
    5AH        E5A8                     LSL.L   D2,D0
    5CH        4241                     CLR.W   D1
    5EH        E5B9                     ROL.L   D2,D1
    60H        8041                     OR.W    D1,D0
    62H        60E4                     BRA     [E4H] = 00000048H
  checksum: o.k.

ref own proc call at    20H, procnum =  2  checksum: o.k.

proc code, procnum = 28, entrypoint =     0H, number of bytes = 76
PROCEDURE LENGTHEN(REAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 E000                MOVEM.L #E000H,-(A7)
     8H        202E 0008                MOVE.L  0008(A6),D0
     CH        E398                     ROL.L   #1,D0
     EH        2400                     MOVE.L  D0,D2
    10H        0280 00FF FFFF           ANDI.L  #00FFFFFFH,D0
    16H        0282 FF00 0000           ANDI.L  #FF000000H,D2
    1CH        6612                     BNE     [12H] = 00000030H
    1EH        7000                     MOVEQ   #00H,D0
    20H        7200                     MOVEQ   #00H,D1
    22H        48EE 0003 0008           MOVEM.L #0003H,0008(A6)
    28H        4CDF 0007                MOVEM.L (A7)+,#0007H
    2CH        4E5E                     UNLK    A6
    2EH        4E75                     RTS
    30H        E68A                     LSR.L   #3,D2
    32H        E288                     LSR.L   #1,D0
    34H        E292                     ROXR.L  #1,D2
    36H        0682 3800 0000           ADDI.L  #38000000H,D2
    3CH        2200                     MOVE.L  D0,D1
    3EH        E688                     LSR.L   #3,D0
    40H        E699                     ROR.L   #3,D1
    42H        0281 7000 0000           ANDI.L  #70000000H,D1
    48H        8082                     OR.L    D2,D0
    4AH        60D6                     BRA     [D6H] = 00000022H
  checksum: o.k.

proc code, procnum = 29, entrypoint =     0H, number of bytes = 134
PROCEDURE SHORTEN(LONGREAL);
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        48E7 F000                MOVEM.L #F000H,-(A7)
     8H        4CEE 0003 0008           MOVEM.L 0008(A6),#0003H
     EH        4840                     SWAP    D0
    10H        3400                     MOVE.W  D0,D2
    12H        0242 7FF0                ANDI.W  #7FF0H,D2
    16H        6762                     BEQ     [62H] = 0000007AH
    18H        0442 3800                SUBI.W  #3800H,D2
    1CH        6B00 005C                BMI     [005CH] = 0000007AH
    20H        0C42 0FFF                CMPI.W  #0FFFH,D2
    24H        6E00 0058                BGT     [0058H] = 0000007EH
    28H        E94A                     LSL.W   #4,D2
    2AH        760F                     MOVEQ   #0FH,D3
    2CH        0700                     BTST    D3,D0
    2EH        6704                     BEQ     [04H] = 00000034H
    30H        08C2 0000                BSET    #0000H,D2
    34H        0240 000F                ANDI.W  #000FH,D0
    38H        08C0 0004                BSET    #0004H,D0
    3CH        4840                     SWAP    D0
    3EH        0681 0010 0000           ADDI.L  #00100000H,D1
    44H        6412                     BCC     [12H] = 00000058H
    46H        5280                     ADDQ.L  #1,D0
    48H        7614                     MOVEQ   #14H,D3
    4AH        0700                     BTST    D3,D0
    4CH        660A                     BNE     [0AH] = 00000058H
    4EH        E288                     LSR.L   #1,D0
    50H        E291                     ROXR.L  #1,D1
    52H        0642 0100                ADDI.W  #0100H,D2
    56H        6526                     BCS     [26H] = 0000007EH
    58H        E788                     LSL.L   #3,D0
    5AH        E799                     ROL.L   #3,D1
    5CH        0201 0007                ANDI.B  #07H,D1
    60H        8001                     OR.B    D1,D0
    62H        4840                     SWAP    D0
    64H        0880 0007                BCLR    #0007H,D0
    68H        E25A                     ROR.W   #1,D2
    6AH        8042                     OR.W    D2,D0
    6CH        4840                     SWAP    D0
    6EH        2D40 000C                MOVE.L  D0,000C(A6)
    72H        4CDF 000F                MOVEM.L (A7)+,#000FH
    76H        4E5E                     UNLK    A6
    78H        4E75                     RTS
    7AH        7000                     MOVEQ   #00H,D0
    7CH        60F0                     BRA     [F0H] = 0000006EH
    7EH        7005                     MOVEQ   #05H,D0
    80H        4EB9 0000 0000           JSR     00000000H
  checksum: o.k.

ref own proc call at    82H, procnum =  2  checksum: o.k.

proc code, procnum = 39, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FF                     MOVEQ   #FFH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 40, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FE                     MOVEQ   #FEH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 41, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FD                     MOVEQ   #FDH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 42, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FC                     MOVEQ   #FCH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 43, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FB                     MOVEQ   #FBH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 44, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70FA                     MOVEQ   #FAH,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 45, entrypoint =     0H, number of bytes = 14
 DECODE --------                        INSTRUCTION
     0H        46FC 2700                MOVE    #2700H,SR
     4H        70F9                     MOVEQ   #F9H,D0
     6H        4EB9 0000 0000           JSR     00000000H
     CH        4E73                     RTE
  checksum: o.k.

ref own proc call at     8H, procnum = 32  checksum: o.k.

proc code, procnum = 46, entrypoint =     0H, number of bytes = 84
SetException(vec: CARDINAL; p: PROC);
 DECODE --------                        INSTRUCTION
     0H        4E56 FFFC                LINK    A6,#FFFCH
     4H        202E 000A                MOVE.L  000A(A6),D0
     8H        2F00                     MOVE.L  D0,-(A7)
     AH        322E 0008                MOVE.W  0008(A6),D1
     EH        3F01                     MOVE.W  D1,-(A7)
    10H        3F3C 0005                MOVE.W  #0005H,-(A7)
    14H        4E4D                     TRAP    #D
    16H        2A00                     MOVE.L  D0,D5
    18H        2D45 FFFC                MOVE.L  D5,FFFC(A6)
    1CH        0C6E 000B 0008           CMPI.W  #000BH,0008(A6)
    22H        6216                     BHI     [16H] = 0000003AH
    24H        3A2E 0008                MOVE.W  0008(A6),D5
    28H        E545                     ASL.W   #2,D5
    2AH        49F9 0000 0044           LEA     00000044H,A4
    30H        29AE FFFC 5000           MOVE.L  FFFC(A6),00H(A4,D5.W)
    36H        4EFA 0018                JMP     [0018H] = 00000050H
    3AH        3A2E 0008                MOVE.W  0008(A6),D5
    3EH        0445 0020                SUBI.W  #0020H,D5
    42H        E545                     ASL.W   #2,D5
    44H        49F9 0000 0074           LEA     00000074H,A4
    4AH        29AE FFFC 5000           MOVE.L  FFFC(A6),00H(A4,D5.W)
    50H        4E5E                     UNLK    A6
    52H        4E75                     RTS
  checksum: o.k.

ref own data at    2CH  checksum: o.k.

ref own data at    46H  checksum: o.k.

proc code, procnum = 47, entrypoint =     0H, number of bytes = 152
RestoreExceptions
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        2F39 0000 0050           MOVE.L  00000050H,-(A7)
     AH        3F3C 0003                MOVE.W  #0003H,-(A7)
     EH        4EB9 0000 0000           JSR     SetException
    14H        5C8F                     ADDQ.L  #6,A7
    16H        2F39 0000 004C           MOVE.L  0000004CH,-(A7)
    1CH        3F3C 0002                MOVE.W  #0002H,-(A7)
    20H        4EB9 0000 0000           JSR     SetException
    26H        5C8F                     ADDQ.L  #6,A7
    28H        2F39 0000 0058           MOVE.L  00000058H,-(A7)
    2EH        3F3C 0005                MOVE.W  #0005H,-(A7)
    32H        4EB9 0000 0000           JSR     SetException
    38H        5C8F                     ADDQ.L  #6,A7
    3AH        2F39 0000 005C           MOVE.L  0000005CH,-(A7)
    40H        3F3C 0006                MOVE.W  #0006H,-(A7)
    44H        4EB9 0000 0000           JSR     SetException
    4AH        5C8F                     ADDQ.L  #6,A7
    4CH        2F39 0000 0060           MOVE.L  00000060H,-(A7)
    52H        3F3C 0007                MOVE.W  #0007H,-(A7)
    56H        4EB9 0000 0000           JSR     SetException
    5CH        5C8F                     ADDQ.L  #6,A7
    5EH        2F39 0000 0064           MOVE.L  00000064H,-(A7)
    64H        3F3C 0008                MOVE.W  #0008H,-(A7)
    68H        4EB9 0000 0000           JSR     SetException
    6EH        5C8F                     ADDQ.L  #6,A7
    70H        2F39 0000 0090           MOVE.L  00000090H,-(A7)
    76H        3F3C 0027                MOVE.W  #0027H,-(A7)
    7AH        4EB9 0000 0000           JSR     SetException
    80H        5C8F                     ADDQ.L  #6,A7
    82H        2F39 0000 008C           MOVE.L  0000008CH,-(A7)
    88H        3F3C 0026                MOVE.W  #0026H,-(A7)
    8CH        4EB9 0000 0000           JSR     SetException
    92H        5C8F                     ADDQ.L  #6,A7
    94H        4E5E                     UNLK    A6
    96H        4E75                     RTS
  checksum: o.k.

ref own data at     6H  checksum: o.k.

ref own proc call at    10H, procnum = 46  checksum: o.k.

ref own data at    18H  checksum: o.k.

ref own proc call at    22H, procnum = 46  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own proc call at    34H, procnum = 46  checksum: o.k.

ref own data at    3CH  checksum: o.k.

ref own proc call at    46H, procnum = 46  checksum: o.k.

ref own data at    4EH  checksum: o.k.

ref own proc call at    58H, procnum = 46  checksum: o.k.

ref own data at    60H  checksum: o.k.

ref own proc call at    6AH, procnum = 46  checksum: o.k.

ref own data at    72H  checksum: o.k.

ref own proc call at    7CH, procnum = 46  checksum: o.k.

ref own data at    84H  checksum: o.k.

ref own proc call at    8EH, procnum = 46  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 278
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        204F                     MOVE.L  A7,A0
     8H        2068 0004                MOVE.L  0004(A0),A0
     CH        2A08                     MOVE.L  A0,D5
     EH        23C5 0000 0000           MOVE.L  D5,BasePageAddress
    14H        2879 0000 0000           MOVE.L  BasePageAddress,A4
    1AH        23EC 0008 0000 003C      MOVE.L  0008(A4),0000003CH
    22H        2028 000C                MOVE.L  000C(A0),D0
    26H        D0A8 0014                ADD.L   0014(A0),D0
    2AH        D0A8 001C                ADD.L   001C(A0),D0
    2EH        2879 0000 003C           MOVE.L  0000003CH,A4
    34H        2A2C 0006                MOVE.L  0006(A4),D5
    38H        D085                     ADD.L   D5,D0
    3AH        0680 0000 0100           ADDI.L  #00000100H,D0
    40H        2E40                     MOVE.L  D0,A7
    42H        DFC8                     ADDA.L  A0,A7
    44H        2F00                     MOVE.L  D0,-(A7)
    46H        2F08                     MOVE.L  A0,-(A7)
    48H        3F00                     MOVE.W  D0,-(A7)
    4AH        3F3C 004A                MOVE.W  #004AH,-(A7)
    4EH        4E41                     TRAP    #1
    50H        DFFC 0000 000C           ADDA.L  #0000000CH,A7
    56H        2879 0000 0000           MOVE.L  00000000H,A4
    5CH        2A2C 0008                MOVE.L  0008(A4),D5
    60H        DAAC 000C                ADD.L   000C(A4),D5
    64H        DAAC 0014                ADD.L   0014(A4),D5
    68H        DAAC 001C                ADD.L   001C(A4),D5
    6CH        23C5 0000 0040           MOVE.L  D5,00000040H

    72H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    78H        3F3C 0003                MOVE.W  #0003H,-(A7)
    7CH        4EB9 0000 0000           JSR     SetException
    82H        5C8F                     ADDQ.L  #6,A7

    84H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    8AH        3F3C 0002                MOVE.W  #0002H,-(A7)
    8EH        4EB9 0000 0000           JSR     SetException
    94H        5C8F                     ADDQ.L  #6,A7

    96H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    9CH        3F3C 0005                MOVE.W  #0005H,-(A7)
    A0H        4EB9 0000 0000           JSR     SetException
    A6H        5C8F                     ADDQ.L  #6,A7

    A8H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    AEH        3F3C 0006                MOVE.W  #0006H,-(A7)
    B2H        4EB9 0000 0000           JSR     SetException
    B8H        5C8F                     ADDQ.L  #6,A7
    BAH        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    C0H        3F3C 0007                MOVE.W  #0007H,-(A7)
    C4H        4EB9 0000 0000           JSR     SetException
    CAH        5C8F                     ADDQ.L  #6,A7
    CCH        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    D2H        3F3C 0008                MOVE.W  #0008H,-(A7)
    D6H        4EB9 0000 0000           JSR     SetException
    DCH        5C8F                     ADDQ.L  #6,A7
    DEH        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    E4H        3F3C 0027                MOVE.W  #0027H,-(A7)
    E8H        4EB9 0000 0000           JSR     SetException
    EEH        5C8F                     ADDQ.L  #6,A7
    F0H        2F3C 0000 0000           MOVE.L  #00000000H,-(A7)
    F6H        3F3C 0026                MOVE.W  #0026H,-(A7)
    FAH        4EB9 0000 0000           JSR     SetException
   100H        5C8F                     ADDQ.L  #6,A7
   102H        23FC 0000 0000 0000 0004 MOVE.L  #00000000H,00000004H
   10CH        7007                     MOVEQ   #07H,D0
   10EH        4E47                     TRAP    #7
   110H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref own data at    16H  checksum: o.k.

ref own data at    1EH  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref own data at    58H  checksum: o.k.

ref own data at    6EH  checksum: o.k.

ref own proc ass at    74H, procnum = 40  checksum: o.k.

ref own proc call at    7EH, procnum = 46  checksum: o.k.

ref own proc ass at    86H, procnum = 39  checksum: o.k.

ref own proc call at    90H, procnum = 46  checksum: o.k.

ref own proc ass at    98H, procnum = 42  checksum: o.k.

ref own proc call at    A2H, procnum = 46  checksum: o.k.

ref own proc ass at    AAH, procnum = 43  checksum: o.k.

ref own proc call at    B4H, procnum = 46  checksum: o.k.

ref own proc ass at    BCH, procnum = 44  checksum: o.k.

ref own proc call at    C6H, procnum = 46  checksum: o.k.

ref own proc ass at    CEH, procnum = 45  checksum: o.k.

ref own proc call at    D8H, procnum = 46  checksum: o.k.

ref own proc ass at    E0H, procnum = 38  checksum: o.k.

ref own proc call at    EAH, procnum = 46  checksum: o.k.

ref own proc ass at    F2H, procnum = 36  checksum: o.k.

ref own proc call at    FCH, procnum = 46  checksum: o.k.

ref own proc ass at   104H, procnum = 33  checksum: o.k.

ref own data at   108H  checksum: o.k.

ref ext init call at   110H  checksum: o.k.

string data:, number of bytes = 224
NO DECODE -------- DATA

     0H         4745     4D58     0000     4D6F     6475     
     AH         6C61     2D32     2F53     5420     2863     
    14H         2920     436F     7079     7269     6768     
    1EH         7420     4D6F     6475     6C61     2032     
    28H         2053     6F66     7477     6172     6520     
    32H         4C74     642E     2031     3938     352C     
    3CH         3139     3836     2C31     3938     372E     
    46H         2000     2863     2920     436F     7079     
    50H         7269     6768     7420     5444     4920     
    5AH         536F     6674     7761     7265     2049     
    64H         6E63     2E20     3139     3835     2C31     
    6EH         3938     362C     3139     3837     2E20     
    78H         0000     5468     6520     7465     616D     
    82H         203A     2043     6872     6973     2048     
    8CH         616C     6C2C     2050     6175     6C20     
    96H         4375     7274     6973     2C20     616E     
    A0H         6420     5068     696C     2043     616D     
    AAH         7020     2E00     5B33     5D5B     4D6F     
    B4H         6475     6C61     2D32     2052     756E     
    BEH         2054     696D     6520     4572     726F     
    C8H         7220     3A20     7C20     7C20     2020     
    D2H         2020     2020     2020     2300     5D5B     
    DCH         4F4B     5D00       checksum: o.k.

scmod end  checksum: o.k.
