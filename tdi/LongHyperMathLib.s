link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  LongHyperMathLib, key =  2111H  2D01H  5FCCH  checksum: o.k.

import LongMathLib0, key =  2102H  F1EDH  6243H, modnum =  2  checksum: o.k.

data size, number of bytes = 24  checksum: o.k.

proc code, procnum =  7, entrypoint =     0H, number of bytes = 94
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        598F                     SUBQ.L  #4,A7
     6H        7A01                     MOVEQ   #01H,D5
     8H        2F05                     MOVE.L  D5,-(A7)
     AH        4EB9 0000 0000           JSR     00000000H
    10H        49F9 0000 0008           LEA     00000008H,A4
    16H        28DF                     MOVE.L  (A7)+,(A4)+
    18H        28DF                     MOVE.L  (A7)+,(A4)+
    1AH        598F                     SUBQ.L  #4,A7
    1CH        7A02                     MOVEQ   #02H,D5
    1EH        2F05                     MOVE.L  D5,-(A7)
    20H        4EB9 0000 0000           JSR     00000000H
    26H        49F9 0000 0010           LEA     00000010H,A4
    2CH        28DF                     MOVE.L  (A7)+,(A4)+
    2EH        28DF                     MOVE.L  (A7)+,(A4)+
    30H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    36H        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    3CH        2F39 0000 0014           MOVE.L  00000014H,-(A7)
    42H        2F39 0000 0010           MOVE.L  00000010H,-(A7)
    48H        4EB9 0000 0000           JSR     00000000H
    4EH        508F                     ADDQ.L  #8,A7
    50H        49F9 0000 0000           LEA     00000000H,A4
    56H        28DF                     MOVE.L  (A7)+,(A4)+
    58H        28DF                     MOVE.L  (A7)+,(A4)+
    5AH        4E5E                     UNLK    A6
    5CH        4E75                     RTS
  checksum: o.k.

ref util: at     CH, procnum = 26  checksum: o.k.

ref own data at    12H  checksum: o.k.

ref util: at    22H, procnum = 26  checksum: o.k.

ref own data at    28H  checksum: o.k.

ref own data at    32H  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref own data at    44H  checksum: o.k.

ref util: at    4AH, procnum = 23  checksum: o.k.

ref own data at    52H  checksum: o.k.

proc code, procnum =  1, entrypoint =     0H, number of bytes = 110
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        518F                     SUBQ.L  #8,A7
     8H        49EE 0008                LEA     0008(A6),A4
     CH        47D7                     LEA     (A7),A3
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        26DC                     MOVE.L  (A4)+,(A3)+
    12H        4EB9 0000 0000           JSR     00000000H
    18H        508F                     ADDQ.L  #8,A7
    1AH        49EE 0008                LEA     0008(A6),A4
    1EH        28DF                     MOVE.L  (A7)+,(A4)+
    20H        28DF                     MOVE.L  (A7)+,(A4)+
    22H        2F39 0000 0004           MOVE.L  00000004H,-(A7)
    28H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    2EH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    32H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        508F                     ADDQ.L  #8,A7
    3EH        2F39 0000 0004           MOVE.L  00000004H,-(A7)
    44H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    4AH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    4EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    52H        4EB9 0000 0000           JSR     00000000H
    58H        508F                     ADDQ.L  #8,A7
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        508F                     ADDQ.L  #8,A7
    62H        49EE 0010                LEA     0010(A6),A4
    66H        28DF                     MOVE.L  (A7)+,(A4)+
    68H        28DF                     MOVE.L  (A7)+,(A4)+
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum = 11, modnum =  2  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref util: at    38H, procnum = 22  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref util: at    54H, procnum = 23  checksum: o.k.

ref util: at    5CH, procnum = 21  checksum: o.k.

proc code, procnum =  2, entrypoint =     0H, number of bytes = 110
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        518F                     SUBQ.L  #8,A7
     8H        49EE 0008                LEA     0008(A6),A4
     CH        47D7                     LEA     (A7),A3
     EH        26DC                     MOVE.L  (A4)+,(A3)+
    10H        26DC                     MOVE.L  (A4)+,(A3)+
    12H        4EB9 0000 0000           JSR     00000000H
    18H        508F                     ADDQ.L  #8,A7
    1AH        49EE 0008                LEA     0008(A6),A4
    1EH        28DF                     MOVE.L  (A7)+,(A4)+
    20H        28DF                     MOVE.L  (A7)+,(A4)+
    22H        2F39 0000 0004           MOVE.L  00000004H,-(A7)
    28H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    2EH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    32H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        508F                     ADDQ.L  #8,A7
    3EH        2F39 0000 0004           MOVE.L  00000004H,-(A7)
    44H        2F39 0000 0000           MOVE.L  00000000H,-(A7)
    4AH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    4EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    52H        4EB9 0000 0000           JSR     00000000H
    58H        508F                     ADDQ.L  #8,A7
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        508F                     ADDQ.L  #8,A7
    62H        49EE 0010                LEA     0010(A6),A4
    66H        28DF                     MOVE.L  (A7)+,(A4)+
    68H        28DF                     MOVE.L  (A7)+,(A4)+
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref ext proc call at    14H, procnum = 11, modnum =  2  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref util: at    38H, procnum = 22  checksum: o.k.

ref own data at    40H  checksum: o.k.

ref own data at    46H  checksum: o.k.

ref util: at    54H, procnum = 23  checksum: o.k.

ref util: at    5CH, procnum = 20  checksum: o.k.

proc code, procnum =  3, entrypoint =     0H, number of bytes = 122
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
     EH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    12H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    16H        4EB9 0000 0000           JSR     00000000H
    1CH        508F                     ADDQ.L  #8,A7
    1EH        4EB9 0000 0000           JSR     00000000H
    24H        508F                     ADDQ.L  #8,A7
    26H        49EE 0008                LEA     0008(A6),A4
    2AH        28DF                     MOVE.L  (A7)+,(A4)+
    2CH        28DF                     MOVE.L  (A7)+,(A4)+
    2EH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    32H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    36H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    3CH        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    42H        4EB9 0000 0000           JSR     00000000H
    48H        508F                     ADDQ.L  #8,A7
    4AH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    4EH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    52H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    58H        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    5EH        4EB9 0000 0000           JSR     00000000H
    64H        508F                     ADDQ.L  #8,A7
    66H        4EB9 0000 0000           JSR     00000000H
    6CH        508F                     ADDQ.L  #8,A7
    6EH        49EE 0010                LEA     0010(A6),A4
    72H        28DF                     MOVE.L  (A7)+,(A4)+
    74H        28DF                     MOVE.L  (A7)+,(A4)+
    76H        4E5E                     UNLK    A6
    78H        4E75                     RTS
  checksum: o.k.

ref util: at    18H, procnum = 20  checksum: o.k.

ref ext proc call at    20H, procnum = 11, modnum =  2  checksum: o.k.

ref own data at    38H  checksum: o.k.

ref own data at    3EH  checksum: o.k.

ref util: at    44H, procnum = 21  checksum: o.k.

ref own data at    54H  checksum: o.k.

ref own data at    5AH  checksum: o.k.

ref util: at    60H, procnum = 20  checksum: o.k.

ref util: at    68H, procnum = 23  checksum: o.k.

proc code, procnum =  4, entrypoint =     0H, number of bytes = 96
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
     EH        518F                     SUBQ.L  #8,A7
    10H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    14H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    18H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    1CH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    20H        4EB9 0000 0000           JSR     00000000H
    26H        508F                     ADDQ.L  #8,A7
    28H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    2EH        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    34H        4EB9 0000 0000           JSR     00000000H
    3AH        508F                     ADDQ.L  #8,A7
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        508F                     ADDQ.L  #8,A7
    44H        4EB9 0000 0000           JSR     00000000H
    4AH        508F                     ADDQ.L  #8,A7
    4CH        4EB9 0000 0000           JSR     00000000H
    52H        508F                     ADDQ.L  #8,A7
    54H        49EE 0010                LEA     0010(A6),A4
    58H        28DF                     MOVE.L  (A7)+,(A4)+
    5AH        28DF                     MOVE.L  (A7)+,(A4)+
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref util: at    22H, procnum = 22  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref util: at    36H, procnum = 20  checksum: o.k.

ref ext proc call at    3EH, procnum = 16, modnum =  2  checksum: o.k.

ref util: at    46H, procnum = 20  checksum: o.k.

ref ext proc call at    4EH, procnum = 12, modnum =  2  checksum: o.k.

proc code, procnum =  5, entrypoint =     0H, number of bytes = 96
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        2F2E 000C                MOVE.L  000C(A6),-(A7)
     AH        2F2E 0008                MOVE.L  0008(A6),-(A7)
     EH        518F                     SUBQ.L  #8,A7
    10H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    14H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    18H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    1CH        2F2E 0008                MOVE.L  0008(A6),-(A7)
    20H        4EB9 0000 0000           JSR     00000000H
    26H        508F                     ADDQ.L  #8,A7
    28H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    2EH        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    34H        4EB9 0000 0000           JSR     00000000H
    3AH        508F                     ADDQ.L  #8,A7
    3CH        4EB9 0000 0000           JSR     00000000H
    42H        508F                     ADDQ.L  #8,A7
    44H        4EB9 0000 0000           JSR     00000000H
    4AH        508F                     ADDQ.L  #8,A7
    4CH        4EB9 0000 0000           JSR     00000000H
    52H        508F                     ADDQ.L  #8,A7
    54H        49EE 0010                LEA     0010(A6),A4
    58H        28DF                     MOVE.L  (A7)+,(A4)+
    5AH        28DF                     MOVE.L  (A7)+,(A4)+
    5CH        4E5E                     UNLK    A6
    5EH        4E75                     RTS
  checksum: o.k.

ref util: at    22H, procnum = 22  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref own data at    30H  checksum: o.k.

ref util: at    36H, procnum = 21  checksum: o.k.

ref ext proc call at    3EH, procnum = 16, modnum =  2  checksum: o.k.

ref util: at    46H, procnum = 20  checksum: o.k.

ref ext proc call at    4EH, procnum = 12, modnum =  2  checksum: o.k.

proc code, procnum =  6, entrypoint =     0H, number of bytes = 110
 DECODE --------                        INSTRUCTION
     0H        4E56 0000                LINK    A6,#0000H
     4H        518F                     SUBQ.L  #8,A7
     6H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
     CH        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    12H        2F2E 000C                MOVE.L  000C(A6),-(A7)
    16H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    1AH        4EB9 0000 0000           JSR     00000000H
    20H        508F                     ADDQ.L  #8,A7
    22H        2F39 0000 000C           MOVE.L  0000000CH,-(A7)
    28H        2F39 0000 0008           MOVE.L  00000008H,-(A7)
    2EH        2F2E 000C                MOVE.L  000C(A6),-(A7)
    32H        2F2E 0008                MOVE.L  0008(A6),-(A7)
    36H        4EB9 0000 0000           JSR     00000000H
    3CH        508F                     ADDQ.L  #8,A7
    3EH        4EB9 0000 0000           JSR     00000000H
    44H        508F                     ADDQ.L  #8,A7
    46H        4EB9 0000 0000           JSR     00000000H
    4CH        508F                     ADDQ.L  #8,A7
    4EH        2F39 0000 0014           MOVE.L  00000014H,-(A7)
    54H        2F39 0000 0010           MOVE.L  00000010H,-(A7)
    5AH        4EB9 0000 0000           JSR     00000000H
    60H        508F                     ADDQ.L  #8,A7
    62H        49EE 0010                LEA     0010(A6),A4
    66H        28DF                     MOVE.L  (A7)+,(A4)+
    68H        28DF                     MOVE.L  (A7)+,(A4)+
    6AH        4E5E                     UNLK    A6
    6CH        4E75                     RTS
  checksum: o.k.

ref own data at     8H  checksum: o.k.

ref own data at     EH  checksum: o.k.

ref util: at    1CH, procnum = 20  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref own data at    2AH  checksum: o.k.

ref util: at    38H, procnum = 21  checksum: o.k.

ref util: at    40H, procnum = 23  checksum: o.k.

ref ext proc call at    48H, procnum = 12, modnum =  2  checksum: o.k.

ref own data at    50H  checksum: o.k.

ref own data at    56H  checksum: o.k.

ref util: at    5CH, procnum = 23  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 22
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        6100 0000                BSR     [0000H] = 0000000CH
     EH        4E5E                     UNLK    A6
    10H        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref own quick call at     CH, procnum =  7  checksum: o.k.

ref ext init call at    10H  checksum: o.k.

scmod end  checksum: o.k.
