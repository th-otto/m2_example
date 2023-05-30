IMPLEMENTATION MODULE GEMFile;
#define REF

(*      Megamax Modula-2 GEM Library: ripped of from GEMShare
 *
 *)

PROCEDURE selectFile0 (VAR path, name: ARRAY OF CHAR;
                       VAR ok        : BOOLEAN;
                           opcode    : CARDINAL);
  BEGIN
path[0] := 0C;
name[0] := 0C;
ok := FALSE;
opcode := 0;
(*
    assembler
        LINK    A5, #0
        MOVEM.L D3/A4-A5,-(A7)
        MOVE.W  -(A3), D3
        
        MOVE.L  -(A3),-(A7)
        MOVE.L  A3,A1
        MOVE.L  -(A1),-(A7)
        MOVE.L  -(A1),-(A7)
        MOVE.L  -(A1),-(A7)
        CMPI.W  #11,-2   (A3)
        BCC     ok1
        TRAP    #noErrorTrap
        DC.W    StringOverflow
        MOVE.W  #11,-2   (A3)
ok1
        CMPI.W  #31,-8(A3)
        BCC     ok2
        TRAP    #noErrorTrap
        DC.W    StringOverflow
        MOVE.W  #31,-8(A3)
ok2
        JSR     stringIntoCFormat   ; ADR(name) -> D2
        MOVE.L  pubs,A0
        MOVE.L  D2,pubArrays.ADDRIN+4(A0)
        MOVE.L  D2,A4               ; ADR(path) -> A4
        JSR     stringIntoCFormat   ; ADR(path) -> D2
        MOVE.L  pubs,A0
        MOVE.L  D2,pubArrays.ADDRIN(A0)
        MOVE.L  D2,A5               ; ADR(path) -> A5
        MOVE.W  D3,(A3)+
        JSR     aes_if
        
        MOVE.L  (A7),A0
        MOVE.L  (A0),A0
        MOVE.L  (A0)+,A1
        MOVE.W  (A0)+,D0
loop1
        MOVE.B  (A5)+,(A1)+
        DBF     D0,loop1
        MOVE.L  (A0)+,A1
        MOVE.W  (A0)+,D0
loop2
        MOVE.B  (A4)+,(A1)+
        DBF     D0,loop2
        MOVE.L  (A7),A7             ; Strings wieder vom Stack loeschen
        MOVE.L  (A7),A7
        ADDA.W  #12,A7
        
        MOVE.L  pubs,A0
        MOVE.L  (A7)+,A1
        MOVE.W  pubArrays.aINTOUT+2(A0),(A1)
        JSR     testINTOUT0
        
        MOVEM.L (A7)+,D3/A4-A5
        UNLK    A5
    END;
*)
  END selectFile0;

PROCEDURE selectFile (VAR path, name: ARRAY OF CHAR; VAR ok: BOOLEAN);
  BEGIN
path[0] := 0C;
name[0] := 0C;
ok := FALSE;
(*
    assembler
        MOVE.W  #FSEL_INPUT,(A3)+
        JMP     selectFile0
    END;
*)
  END selectFile;

PROCEDURE selectFileExtended (REF label     : ARRAY OF CHAR;
                              VAR path, name: ARRAY OF CHAR;
                              VAR ok        : BOOLEAN);
  BEGIN
label[0] := 0C;
path[0] := 0C;
name[0] := 0C;
ok := FALSE;
(*
    assembler
        MOVE.L  -22(A3), (A3)+
        MOVE.W  -22(A3), (A3)+          ;  don't forget the 4 byte of the prev.
        JSR     stringIntoCFormat
        MOVE.L  pubs, A0
        MOVE.L  D2, pubArrays.ADDRIN+8(A0)     ; 'label' an AES
        
        MOVE.W  #FSEL_EX_INPUT,(A3)+
        JSR     selectFile0
        
        MOVE.L  (A7), A7
        SUBQ.L  #6, A3
    END;
*)
  END selectFileExtended;

END GEMFile.
