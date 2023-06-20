(****************************************
*                                       *
*     MODULA-2 Multi-Pass Compiler      *
*     ****************************      *
*                                       *
*     Implementation for Lilith         *
*                                       *
*                                       *
*     MCP2IO:                           *
*                                       *
*     input / output handling in Pass 2 *
*                                       *
*     Version C18 of 10.07.81           *
*                                       *
*     Institut fuer Informatik          *
*     ETH-Zuerich                       *
*     CH-8092 Zuerich                   *
*                                       *
****************************************)

IMPLEMENTATION MODULE MCP2IO;   (* LG *)

(* $T-,R- *)

IMPORT SYSTEM, NewStreams, MCBase, MCPublic;

FROM MCBase IMPORT Keyarr;
FROM MCPublic IMPORT Compilerstatus, compstat, comptime;
IMPORT MCErrors;

VAR lpos, lline: CARDINAL;

MODULE OutputSystem;
  FROM SYSTEM IMPORT WORD;
  FROM NewStreams IMPORT
    STREAM, Connect, Reset, WriteWord, EndWrite, Disconnect;
  FROM MCBase IMPORT Symbol;
  FROM MCPublic IMPORT il2File;
  IMPORT pos;

  EXPORT il2, PutSy, PutWord, StopOutput, RestartOutput, TermOutput, PutSyVal;

  VAR il2 : STREAM;
      output : BOOLEAN; (* output on il2 allowed *)

  PROCEDURE PutSy(s : Symbol);
    (* put Symbol and pos on il2-file *)
  BEGIN
    IF output THEN WriteWord(il2,ORD(s) * 400B + pos) END
  END PutSy;

  PROCEDURE PutSyVal(s: Symbol; hi, lo: CARDINAL);
  BEGIN
     PutWord(ORD(s) * 256 + pos); PutWord(hi); PutWord(lo);
  END PutSyVal;
    
  PROCEDURE PutWord(w : WORD);
    (* put word on il2-file *)
  BEGIN
    IF output THEN WriteWord(il2,w) END
  END PutWord;

  PROCEDURE WriteLong(l : LONGCARD);
  BEGIN
    PutWord(VAL(CARDINAL, l DIV 65536));
    PutWord(VAL(CARDINAL, l MOD 65536));
  END WriteLong;

  PROCEDURE StopOutput;
  BEGIN
    output := FALSE
  END StopOutput;

  PROCEDURE RestartOutput;
  BEGIN
    output := TRUE
  END RestartOutput;

  PROCEDURE TermOutput;
  BEGIN
    PutSy(eop);
    EndWrite(il2);
    Disconnect(il2,FALSE);
  END TermOutput;

BEGIN
  Connect(il2,il2File,TRUE);
  Reset(il2);
  output := TRUE;
END OutputSystem;


MODULE ErrorSystem;
  FROM NewStreams IMPORT WriteWord;
  FROM MCBase IMPORT Symbol;
  FROM MCPublic IMPORT Compilerstatus,  compstat;
  IMPORT line, pos, lline, lpos, OutputSystem;
  IMPORT MCErrors;

  EXPORT Error, ErrorLS;

  CONST errmax = 300;

  VAR errcount : CARDINAL;

  PROCEDURE Error(n: CARDINAL);
    (* no suppression of writing on il2 file *)
  BEGIN
    INC(errcount);
    INCL(compstat,passerrs);
    IF errcount < errmax THEN
      OutputSystem.PutSyVal(errorsy, n, 0);
    ELSIF errcount = errmax THEN
      OutputSystem.PutSyVal(errorsy, MCErrors.TooManyErrors, 0); (* too many errors *)
    END;
  END Error;

  PROCEDURE ErrorLS(n: CARDINAL);
    VAR hpos : CARDINAL;
  BEGIN
    hpos := pos;
    pos := lpos;
    IF lline <> line THEN
      OutputSystem.PutSyVal(eol, lline, 0);
      Error(n);
      OutputSystem.PutSyVal(eol, line, 0);
    ELSE Error(n);
    END;
    pos := hpos;
  END ErrorLS;

BEGIN
  errcount := 0;
  EXCL(compstat,passerrs);
END ErrorSystem;


MODULE Scanner;
  FROM NewStreams IMPORT
    STREAM, Connect, Reset, ReadWord, WriteWord, Disconnect;
  FROM MCBase IMPORT Symbol, Spellix;
  FROM MCPublic IMPORT il1File;
  IMPORT
    ErrorSystem, OutputSystem,
    sy, spix, maxspix, val, length,
    pos, line, lpos, lline;

  EXPORT GetSy, PutGetSy, TermInput;

  VAR
    card : CARDINAL;
    il1 : STREAM;
    issy : BOOLEAN;

  PROCEDURE GetLong(VAR w: LONGCARD);
  VAR hi, lo: CARDINAL;
  BEGIN
     ReadWord(il1, hi);
     ReadWord(il1, lo);
     w := hi * 65536 + lo;
  END GetLong;
    
  PROCEDURE GetSy;
  VAR w: CARDINAL;
  BEGIN (* get next Symbol *)
    lpos := pos;
    lline := line;
    REPEAT
      issy := TRUE;
      ReadWord(il1,card);
      pos := card MOD 400B;
      sy := VAL(Symbol,card DIV 400B);
      CASE sy OF
        ident: ReadWord(il1,spix);
       |definitionsy,proceduresy,modulesy,symbolsy,namesy:
        (* TODO *)
       |intcon,cardcon,intcarcon,charcon: GetLong(val);
       |stringcon: GetLong(val); ReadWord(il1,length);
       |option:
          ReadWord(il1,w);
          ReadWord(il1,card);
          OutputSystem.PutSyVal(sy, w, card);
          issy := FALSE;
       |errorsy,eol:
          ReadWord(il1,w);
          IF sy = eol THEN line := w END;
          OutputSystem.PutSyVal(sy, w, 0);
          issy := FALSE;
        ELSE (* no activity *)
      END; (* case *)
    UNTIL issy;
  END GetSy;

  PROCEDURE PutGetSy;
  BEGIN (* put last Symbol, get next Symbol *)
    OutputSystem.PutSy(sy);
    CASE sy OF
     ident: OutputSystem.PutWord(spix);
    | proceduresy,modulesy,namesy:
       (* TODO *)
    | intcon,cardcon,intcarcon,charcon: 
      OutputSystem.WriteLong(val);
    | stringcon:
      OutputSystem.WriteLong(val);
      OutputSystem.PutWord(length);
    | anycon:
    | ELSE
    END;
    GetSy;
  END PutGetSy;

  PROCEDURE TermInput;
  BEGIN
    Disconnect(il1,FALSE);
  END TermInput;

BEGIN
  Connect(il1,il1File,TRUE);
  Reset(il1);
  line := 1;
  pos := 1;
END Scanner;


MODULE AsciiHandling;  (* $T- *)
  (* handling with the identifier-file ASCII *)
  FROM NewStreams IMPORT
    STREAM, Connect, Reset, ReadChar, SetPos, Disconnect;
  FROM MCBase IMPORT Spellix;
  FROM MCPublic IMPORT ascFile;

  EXPORT AsciiSetPos, AsciiRead, TermAscii;

  VAR asc : STREAM;

  PROCEDURE AsciiSetPos(spx: Spellix);
    (* set position on ASCII file *)
  BEGIN
    SetPos(asc,0,spx);
  END AsciiSetPos;

  PROCEDURE AsciiRead(VAR ch: CHAR);
    (* read character from ASCII file *)
  BEGIN
    ReadChar(asc,ch);
  END AsciiRead;

  PROCEDURE TermAscii;
  BEGIN
    Disconnect(asc,FALSE);
  END TermAscii;

BEGIN (* AsciiHandling *)
  Connect(asc,ascFile,FALSE);
  Reset(asc);
END AsciiHandling; (* $T= *)


MODULE SkipInSymbolModule;
  FROM MCBase IMPORT Symbol;
  IMPORT Scanner;
  IMPORT sy;

  EXPORT SkipConstant, SkipType;

  PROCEDURE Skip(s: Symbol);
  BEGIN
    WHILE sy <> s DO Scanner.GetSy END;
    Scanner.GetSy;
  END Skip;

  PROCEDURE SkipQualIdent;
  BEGIN
    IF sy = ident THEN
      Scanner.GetSy;
      WHILE sy = period DO Scanner.GetSy; Scanner.GetSy END;
    END;
  END SkipQualIdent;

  PROCEDURE SkipConstant;
    (* skip constant in a symbol module *)
  BEGIN
    IF sy = cardcon THEN Scanner.GetSy; SkipQualIdent;
    ELSIF (sy = stringcon) OR (sy = realcon) THEN Scanner.GetSy;
    END;
  END SkipConstant;

  PROCEDURE SkipType;
    (* skip type structures in a symbol module *)

    PROCEDURE SkipVariants;
      (* skip variant structures *)
    BEGIN
      IF sy = casesy THEN
        Skip(colon);
        SkipQualIdent;
        WHILE sy = ofsy DO
          Skip(colon);
          SkipVariants;
          Scanner.GetSy; (* size *)
        END;
        IF sy = elsesy THEN
          Scanner.GetSy;
          SkipVariants;
          Scanner.GetSy; (* size *)
        END;
        Scanner.GetSy; (* endsy *)
      END;
    END SkipVariants;

  BEGIN (* SkipType *)
    CASE sy OF
      arraysy: Skip(ofsy); SkipType;
     |recordsy:
        Scanner.GetSy;
        WHILE sy = ident DO Skip(colon); SkipType END;
        SkipVariants;
        Scanner.GetSy; (* endsy *)
        Scanner.GetSy; (* size *)
     |setsy,pointersy: Scanner.GetSy; SkipType;
     |proceduresy:
        Skip(rparent);
        IF sy = colon THEN Scanner.GetSy; SkipType END;
     |hidden: Scanner.GetSy;
     |lparent: Skip(rparent);
     |ident: SkipQualIdent;
     |lbrack: Skip(rbrack);
    END;
  END SkipType;

END SkipInSymbolModule;


PROCEDURE GetModuleKey(VAR modkey: Keyarr);
  VAR ix : CARDINAL;
BEGIN
  FOR ix := 0 TO 2 DO modkey[ix] := comptime[ix] END;
END GetModuleKey;


PROCEDURE DefModStatus;
BEGIN
  INCL(compstat,defs);
END DefModStatus;


PROCEDURE TermInOut;
BEGIN
  TermInput;
  TermOutput;
  TermAscii;
END TermInOut;

END MCP2IO.
