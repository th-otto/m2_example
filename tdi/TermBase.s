link code version:  4H 35H
  checksum: o.k.

scmod header: MODULE  TermBase, key =  2102H  F1DAH  5250H  checksum: o.k.

import Keyboard, key =  2102H  F1D9H  608AH, modnum =  2  checksum: o.k.

import Display, key =  2102H  F1E7H  6763H, modnum =  3  checksum: o.k.

data size, number of bytes = 12  checksum: o.k.

scmod init code, procnum =  0, entrypoint =     0H, number of bytes = 48
 DECODE --------                        INSTRUCTION
     0H        4EF9 0000 0000           JMP     00000000H
     6H        4E56 0000                LINK    A6,#0000H
     AH        23FC 0000 0000 0000 0000 MOVE.L  #Keyboard.Read,DoRead
    14H        23FC 0000 0000 0000 0004 MOVE.L  #Display.Write,DoWrite
    1EH        23FC 0000 0000 0000 0008 MOVE.L  #Keyboard.Status,DoStatus
    28H        4E5E                     UNLK    A6
    2AH        4EF9 0000 0000           JMP     00000000H
  checksum: o.k.

ref ext init call at     0H  checksum: o.k.

load util:, procnum =  0  checksum: o.k.

ref ext proc ass at     CH, procnum =  1, modnum =  2  checksum: o.k.

ref own data at    10H  checksum: o.k.

ref ext proc ass at    16H, procnum =  1, modnum =  3  checksum: o.k.

ref own data at    1AH  checksum: o.k.

ref ext proc ass at    20H, procnum =  2, modnum =  2  checksum: o.k.

ref own data at    24H  checksum: o.k.

ref ext init call at    2AH  checksum: o.k.

scmod end  checksum: o.k.
