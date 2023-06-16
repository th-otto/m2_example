IMPLEMENTATION MODULE LineA;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM GEMFont IMPORT GEMFontType;
FROM SYSTEM IMPORT CODE, ADR, PUSH, REGISTER, ADDRESS, SETREG, BYTE;


PROCEDURE InitialiseLineA();
BEGIN
  CODE(Init);
  LineAVars := REGISTER(8);
  LineAFonts := REGISTER(9);
  LineAVectors := REGISTER(10);
END InitialiseLineA;


PROCEDURE DoPutPixel ( x, y : CARDINAL; value : CARDINAL );
BEGIN
  WITH LineAVars^ DO
    IntIn^[0] := value;
    PtsIn^[0] := x;
    PtsIn^[1] := y;
  END;
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(PutPixel);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoPutPixel;


PROCEDURE DoGetPixel ( x, y : CARDINAL ) : CARDINAL;
BEGIN
  WITH LineAVars^ DO
    PtsIn^[0] := x;
    PtsIn^[1] := y;
  END;
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(GetPixel);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
  RETURN CARDINAL(REGISTER(0));
END DoGetPixel;


PROCEDURE DoLine ( x1, y1, x2, y2 : CARDINAL;
                   bp1, bp2, bp3, bp4 : CARDINAL;
                   style : StyleSet;
                   mode : WritingMode );
BEGIN
  WITH LineAVars^ DO
    X1 := x1;
    Y1 := y1;
    X2 := x2;
    Y2 := y2;
    FGBp1 := bp1;
    FGBp2 := bp2;
    FGBp3 := bp3;
    FGBp4 := bp4;
    Style := BITSET(style);
    WriteMode := ORD(mode);
  END;
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(Line);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoLine;


PROCEDURE DoHorizLine ( x1, y1, x2 : CARDINAL;
                        bp1, bp2, bp3, bp4 : CARDINAL;
                        mode : WritingMode;
                        pattern : ADDRESS; patternMask : BITSET;
                        multiFill : BOOLEAN );
BEGIN
  WITH LineAVars^ DO
    X1 := x1;
    Y1 := y1;
    X2 := x2;
    (* Y2 := y1; *)
    FGBp1 := bp1;
    FGBp2 := bp2;
    FGBp3 := bp3;
    FGBp4 := bp4;
    WriteMode := ORD(mode);
    PatPtr := pattern;
    PatMask := patternMask;
    MultiFill := ORD(multiFill);
  END;
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(HorizLine);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoHorizLine;


PROCEDURE DoShowMouse();
BEGIN
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(ShowMouse);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoShowMouse;


PROCEDURE DoHideMouse();
BEGIN
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(HideMouse);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoHideMouse;


PROCEDURE DoUnSprite ( saveBlock : ADDRESS );
BEGIN
  SETREG(10, saveBlock); (* saveBlock -> A2 *)
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(UnSprite);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoUnSprite;


PROCEDURE DoSprite ( xHot, yHot : CARDINAL;
                     VAR spriteDefinition : SpriteDefinitionBlock;
                     saveBlock : ADDRESS );
BEGIN
  SETREG(0, xHot);
  SETREG(1, yHot);
  SETREG(8, ADR(spriteDefinition)); (* spriteDefinition -> A2 *)
  SETREG(10, saveBlock); (* saveBlock -> A2 *)
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(Sprite);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoSprite;


PROCEDURE DoChar(ch: CHAR; x, y: CARDINAL; Font: ADDRESS);
VAR unused: CARDINAL;
    FontPtr: POINTER TO GEMFontType;
    scratchbuf: ARRAY[0..399] OF BYTE;
VAR idx: CARDINAL;
BEGIN
  FontPtr := Font;
  WITH LineAVars^ DO
    WriteMode := 1;
    TextFG := 1;
    TextBG := 0;
    WITH FontPtr^ DO
      FontBase := FontData;
      FontWidth := FormWidth;
      IF (ORD(ch) > HighADE) OR (ORD(ch) < LowADE) THEN RETURN END;
      idx := ORD(ch) - LowADE;
      SourceX := CharOffsetTab^[CHR(idx)];
      SourceY := 0;
      DeltaX := CharOffsetTab^[CHR(idx + 1)] - SourceX;
      DeltaY := FormHeight;
      DestX := x;
      DestY := y;
      Style := BITSET{};
      LineAVars^.LightMask := FontPtr^.LightMask;
      LineAVars^.SkewMask := FontPtr^.SkewMask;
      Weight := Thickening;
      ROff := 0;
      LOff := 0;
      Scale := 0;
      XAccData := 8000H;
      DDAInc := 0;
      ScaleDir := 0;
      CharUp := 0;
      MonoStatus := ORD(3 IN Flags);
      Scrtchp := ADR(scratchbuf);
      Scrpt2 := 30;
    END;
  END;
  CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
  CODE(TextBlt);
  CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
END DoChar;


PROCEDURE DoString(str: ADDRESS; n, x, y: INTEGER; Font: ADDRESS);
VAR FontPtr: POINTER TO GEMFontType;
    scratchbuf: ARRAY[0..399] OF BYTE;
VAR idx: CARDINAL;
    strptr: POINTER TO CHAR;
    ch: CHAR;
    i: INTEGER;
BEGIN
  FontPtr := Font;
  strptr := str;
  LineAVars^.LightMask := FontPtr^.LightMask;
  LineAVars^.SkewMask := FontPtr^.SkewMask;
  WITH LineAVars^ DO
    WriteMode := 0;
    TextFG := 1;
    TextBG := 0;
    LstLin := -1;
    WITH FontPtr^ DO
      FontBase := FontData;
      FontWidth := FormWidth;
      Clip := 0;
      DeltaY := FormHeight;
      DestX := x;
      DestY := y;
      Style := BITSET{};
      Weight := 0;
      ROff := 0;
      LOff := 0;
      Scale := 0;
      DDAInc := 0;
      ScaleDir := 0;
      CharUp := 0;
      CopyTran := 0;
      MonoStatus := ORD(3 IN Flags);
      Scrtchp := ADR(scratchbuf);
      Scrpt2 := 30;
    END;
    i := 0;
    WHILE i < n DO
      WITH FontPtr^ DO
        ch := strptr^;
        INC(strptr);
        idx := ORD(ch) - LowADE;
        SourceX := CharOffsetTab^[CHR(idx)];
        SourceY := 0;
        DeltaX := CharOffsetTab^[CHR(idx + 1)] - SourceX;
        CODE(48E7H, 0006H); (* movem.l a5/a6,-(a7) *)
        XAccData := 8000H;
        CODE(TextBlt);
        CODE(4CDFH, 6000H); (* movem.l (a7)+,a5/a6 *)
        DEC(DestX);
        INC(i);
      END;
    END;
  END;
END DoString;


END LineA.
