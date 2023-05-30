IMPLEMENTATION MODULE LineA;
(*$L-, N+, Y+*)


(*  Implementierung der Line-A-Routinen fuer MEGAMAX Modula-2
 *
 *  Autor: Manuel Chakravarty
 *
 *  Created: 7.4.1987           Version 2.1     V#0100
 *)

(*  18.08.89 MCH V2.0   | 'NegLineAVariables' def. + impl.
 *  ???????? TT  V2.1   | REF-Parm.
 *  17.02.90 TT         | A6 wird nun gerettet, weil LineA das Reg u.U. zerstoert
 *  24.11.90 TT         | BREAK aus PutPixel entfernt!
 *  25.05.23 THO V3.0   | Port to gm2
 *)
 
 
FROM    SYSTEM          IMPORT ADDRESS, ADR, INTEGER32, CARDINAL32;

FROM    GrafBase        IMPORT Point, Rectangle, PtrMouseFormDef,
                               PtrMemFormDef;
 
 
VAR     jmpTable        : POINTER TO ARRAY[0..15] OF PROC;
        sysFontHeader   : PtrSysFontHeader;
        lineAVars       : PtrLineAVars;

TYPE INTEGERP = CARDINAL32;

       
PROCEDURE SystemFonts (): PtrSysFontHeader;
BEGIN
  RETURN sysFontHeader;
END SystemFonts;


PROCEDURE LineAVariables (): PtrLineAVars;
BEGIN
  RETURN lineAVars;
END LineAVariables;


PROCEDURE NegLineAVariables (): PtrNegLineAVars;
BEGIN
  RETURN PtrNegLineAVars(CARDINAL(lineAVars) - SIZE(NegLineAVars));
END NegLineAVariables;


#define IMPROVED 0

(*
 * must resort to C preprocessor here,
 * because passing an operand for dc.w would also emit '#'
 *)
#if IMPROVED
#define DECLARE_LINEA(func, dcs) \
PROCEDURE CallLinea(): INTEGER32; \
VAR \
    retvalue: INTEGER32; \
VAR p: PROC; \
BEGIN \
  (* will only work when executed from supervisor *) \
  p := jmpTable^[func]; \
  ASM VOLATILE( \
      "jsr (%1); move.l %%d0,%0" \
    : "=r"(retvalue) \
    : "a"(p) \
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  ); \
  RETURN retvalue; \
END CallLinea;
#define DECLARE_LINEA_VOID(func, dcs) \
PROCEDURE CallLinea(); \
VAR p: PROC; \
BEGIN \
  (* will only work when executed from supervisor *) \
  p := jmpTable^[func]; \
  ASM VOLATILE( \
      "jsr (%0)" \
    : \
    : "a"(p) \
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  ); \
END CallLinea;

#else

#define DECLARE_LINEA(func, dcs) \
PROCEDURE CallLinea(): INTEGER32; \
VAR \
    retvalue: INTEGER32; \
BEGIN \
  ASM VOLATILE( \
      dcs \
    : \
    : \
    :\
  ); \
  ASM VOLATILE( \
      "move.l %%d0,%0" \
    : "=r"(retvalue) \
    : \
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  ); \
  RETURN retvalue; \
END CallLinea;
#define DECLARE_LINEA_VOID(func, dcs) \
PROCEDURE CallLinea(); \
BEGIN \
  ASM VOLATILE( \
      dcs \
    : \
    : \
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  ); \
END CallLinea;
#endif /* IMPROVED */



(* Normaller Aufruf 117 microsec, 'ImprovedCall' 86 microsec *)
PROCEDURE PutPixel(p:Point;color:CARDINAL);
  DECLARE_LINEA_VOID(1, "dc.w 0xa001")
BEGIN
  lineAVars^.ptsin^[0] := p.x;
  lineAVars^.ptsin^[1] := p.y;
  lineAVars^.intin^[0] := color;
  CallLinea();
END PutPixel;


PROCEDURE PixelColor(p:Point):CARDINAL;
  DECLARE_LINEA(2, "dc.w 0xa002")
BEGIN
  lineAVars^.ptsin^[0] := p.x;
  lineAVars^.ptsin^[1] := p.y;
  RETURN CallLinea();
END PixelColor;


PROCEDURE Line(p,q:Point);
  DECLARE_LINEA_VOID(3, "dc.w 0xa003")
BEGIN
  lineAVars^.p := p;
  lineAVars^.q := q;
  CallLinea();
END Line;


PROCEDURE HorizontalLine(x1,x2,y:INTEGER);
  DECLARE_LINEA_VOID(4, "dc.w 0xa004")
BEGIN
  lineAVars^.p.y := y;
  lineAVars^.p.x := x1;
  lineAVars^.q.x := x2;
  CallLinea();
END HorizontalLine;


PROCEDURE FilledRectangle(p,q:Point);
  DECLARE_LINEA_VOID(5, "dc.w 0xa005")
BEGIN
  lineAVars^.p := p;
  lineAVars^.q := q;
  CallLinea();
END FilledRectangle;
 

PROCEDURE FilledPolygon(pts:ARRAY OF Point;noPts:CARDINAL;y:INTEGER);
  DECLARE_LINEA_VOID(6, "dc.w 0xa006")
BEGIN
  lineAVars^.p.y := y;
  IF ((noPts = 0) OR (noPts > HIGH(pts))) THEN noPts := HIGH(pts) END;
  lineAVars^.contrl^.nptsin := noPts;
  lineAVars^.ptsin := ADR(pts);
  CallLinea();
END FilledPolygon;
 

PROCEDURE BitBlockTransfer(deskriptor:PtrBBTDeskriptor);
BEGIN
  ASM VOLATILE( \
      "move.l %%a6,-(%%a7); move.l %0,%%a6; dc.w 0xa007; move.l (%%a7)+,%%a6"
    :
    : "a"(deskriptor)
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  );
END BitBlockTransfer;


PROCEDURE TextBlockTransfer(font:PtrFontHeader;ch:CHAR;spot:Point);
  DECLARE_LINEA_VOID(8, "dc.w 0xa008")
CONST   horOffFlag      = 1;
VAR c: CARDINAL16;
VAR x: INTEGER16;
BEGIN
  lineAVars^.dest := spot;
  c := ORD(ch);
  DEC(c, font^.minADE);
  x := font^.charOffsetTab^[c];
  IF horOffFlag IN font^.flags THEN
    DEC(lineAVars^.dest.x, x);
  END;
  lineAVars^.source.x := x;
  lineAVars^.source.y := 0;
  lineAVars^.width := font^.charOffsetTab^[c + 1] - x;
  lineAVars^.height := font^.formHeight;
  lineAVars^.formBase := font^.fontData;
  lineAVars^.formWidth := font^.formWidth;
  lineAVars^.leftOff := font^.leftOffset;
  lineAVars^.rightOff := font^.rightOffset;
  lineAVars^.lightMask := font^.lightMask;
  lineAVars^.skewMask := font^.skewMask;
  lineAVars^.weight := font^.thickening;
  CallLinea();
END TextBlockTransfer;


PROCEDURE ShowMouse(force:BOOLEAN);
  DECLARE_LINEA_VOID(9, "dc.w 0xa009")
BEGIN
  lineAVars^.intin^[0] := INTEGER(BITSET(ORD(force)) / BITSET(1));
  CallLinea();
END ShowMouse;


PROCEDURE HideMouse;
  DECLARE_LINEA_VOID(10, "dc.w 0xa00a")
BEGIN
  CallLinea();
END HideMouse;


PROCEDURE TransformMouse(newForm:PtrMouseFormDef);
  DECLARE_LINEA_VOID(11, "dc.w 0xa00b")
BEGIN
  lineAVars^.intin := INTEGER32(newForm);
  CallLinea();
END TransformMouse;
 

PROCEDURE UndrawSprite(buffer:PtrSpriteBuffer);
  DECLARE_LINEA_VOID(12, "dc.w 0xa00c")
BEGIN
  ASM VOLATILE( \
      "move.l %0,%%a2; dc.w 0xa00c"
    :
    : "a"(buffer)
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  );
END UndrawSprite;


PROCEDURE DrawSprite(hotSpot:Point;sprite:PtrSpriteDef;buffer:PtrSpriteBuffer);
  DECLARE_LINEA_VOID(13, "dc.w 0xa00d")
BEGIN
  ASM VOLATILE( \
      "move.w %0,%%d0; move.w %1,%%d1; move.l %2,%%a0; move.l %3,%%a2; dc.w 0xa00d"
    :
    : "r"(hotSpot.x), "r"(hotSpot.y), "a"(sprite), "a"(buffer)
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory" \
  );
END DrawSprite;


PROCEDURE CopyRasterForm (sourceMem,destMem:PtrMemFormDef;
                          sourceStart,sourceEnd, destStart,destEnd:Point;
                          mode:RasterMode; setCol,unsetCol:CARDINAL);
  DECLARE_LINEA_VOID(14, "dc.w 0xa00e")
BEGIN
  lineAVars^.intin^[0] := ORD(mode.opaque);
  lineAVars^.intin^[1] := setCol;
  lineAVars^.intin^[2] := unsetCol;
  lineAVars^.ptsin^[0] := sourceStart.x;
  lineAVars^.ptsin^[1] := sourceStart.y;
  lineAVars^.ptsin^[2] := sourceEnd.x;
  lineAVars^.ptsin^[3] := sourceEnd.y;
  lineAVars^.ptsin^[4] := destStart.x;
  lineAVars^.ptsin^[5] := destStart.y;
  lineAVars^.ptsin^[6] := destEnd.x;
  lineAVars^.ptsin^[7] := destEnd.y;
  lineAVars^.contrl^.ptr1.ptr := sourceMem;
  lineAVars^.contrl^.ptr1.ptr := destMem;
  CallLinea();
END CopyRasterForm;
 

PROCEDURE ContourFill (p:Point; color:CARDINAL; useColor:BOOLEAN);
  DECLARE_LINEA_VOID(15, "dc.w 0xa00f")
BEGIN
  IF NOT useColor THEN color := 0FFFFH; END;
  lineAVars^.intin^[0] := color;
  lineAVars^.ptsin^[0] := p.x;
  lineAVars^.ptsin^[1] := p.y;
END ContourFill;
 

BEGIN
  ASM VOLATILE(
#ifdef __mcoldfire__
    (*
     On ColdFire V4e, the standard Line A opcodes
	 conflict with some valid MAC instructions.
	 Fortunately, the following range is always invalid
	 and triggers the standard Line A exception.
	 The ColdFire OS will keep only the last 4 bits
	*)
      "dc.w 0xa920; move.l %%a0,%0; ; move.l %%a1,%1; ; move.l %%a2,%2"
#else
      "dc.w 0xa000; move.l %%a0,%0; ; move.l %%a1,%1; ; move.l %%a2,%2"
#endif
    :
    : "m"(lineAVars), "m"(sysFontHeader), "m"(jmpTable)
    : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
END LineA.
