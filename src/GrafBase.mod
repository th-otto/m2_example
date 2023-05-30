IMPLEMENTATION MODULE GrafBase;
(*$L-, R-, Y+*)


(*  Definition der grundlegenden Typen fuer die Grafikbibliotheken des
 *  Megamax Modula-2 Entwicklungspackets. Ausserdem Routinen zur Ver-
 *  arbeitung dieser Strukturen.
 *
 *  Autor: Manuel Chakravarty           Erstellt: 28.10.87
 *
 *  Version   2.1     V#0021
 *
 *)
 
(*  28.10.87    | Definitionen
 *  02.08.89    | 'FrameRects' korrigiert
 *  13.08.89    | 'LongPnt', 'LongRect' def.; 'LPnt', 'LRect' def. + impl.
 *  18.08.89    | 'Get...MemFormDef' benutzt jetzt Line-A (das Modul wird
 *                nicht importiert um Zyklen zu vermeiden). Ausserdem die
 *                'L...'-Funktionen
 *  01.02.90    | Angepasst auf Compilerversion 4.0 (verdrehte SET's)
 *  10.12.93    | LFramePoints korrigiert
 *  25.05.23    | Port to gm2
 *)


FROM SYSTEM IMPORT ADDRESS, CARDINAL16, SHIFT;
IMPORT XBIOS;
FROM LineA IMPORT LineAVariables, PtrLineAVars, NegLineAVariables, PtrNegLineAVars;

 
PROCEDURE Pnt (x, y: INTEGER16): Point;
VAR p: Point;
BEGIN
  p.x := x;
  p.y := y;
  RETURN p;
END Pnt;


PROCEDURE LPnt (x, y: INTEGER32): LongPnt;
VAR p: LongPnt;
BEGIN
  p.x := x;
  p.y := y;
  RETURN p;
END LPnt;


PROCEDURE Rect (x, y, w, h: INTEGER16): Rectangle;
VAR r: Rectangle;
BEGIN
  r.x := x;
  r.y := y;
  r.w := w;
  r.h := h;
  RETURN r;
END Rect;


PROCEDURE LRect (x, y, w, h: INTEGER32): LongRect;
VAR r: LongRect;
BEGIN
  r.x := x;
  r.y := y;
  r.w := w;
  r.h := h;
  RETURN r;
END LRect;


PROCEDURE ShortPoint (p: LongPnt): Point;
VAR sp: Point;
  BEGIN
    sp.x := p.x;
    sp.y := p.y;
    RETURN sp;
  END ShortPoint;
  

PROCEDURE LongPoint  (p: Point): LongPnt;
VAR lp: LongPnt;
  BEGIN
    lp.x := p.x;
    lp.y := p.y;
    RETURN lp;
  END LongPoint;

  
PROCEDURE ShortFrame (frame: LongRect): Rectangle;
VAR r: Rectangle;
  BEGIN
    r.x := frame.x;
    r.y := frame.y;
    r.w := frame.w;
    r.h := frame.h;
    RETURN r;
  END ShortFrame;

  
PROCEDURE LongFrame  (frame: Rectangle): LongRect;
VAR r: LongRect;
  BEGIN
    r.x := frame.x;
    r.y := frame.y;
    r.w := frame.w;
    r.h := frame.h;
    RETURN r;
  END LongFrame;
  

PROCEDURE AbsZoomRect(frame:Rectangle;xDelta,yDelta:INTEGER16):Rectangle;
  BEGIN
    frame.x:=frame.x-xDelta;frame.y:=frame.y-yDelta;
    frame.w:=frame.w+xDelta*2;frame.h:=frame.h+yDelta*2;
    RETURN frame;
  END AbsZoomRect;

PROCEDURE RelZoomRect(frame:Rectangle;xFactor,yFactor:INTEGER32):Rectangle;

  VAR     newW, newH      : INTEGER16;
  VAR wl: INTEGER32;
  VAR wh: INTEGER32;
  
  BEGIN
    wl := frame.w;
    newW := wl * xFactor DIV 1000;
    wh := frame.h;
    newH := wh * yFactor DIV 1000;
    frame.x:=frame.x+frame.w DIV 2 -newW DIV 2;
    frame.y:=frame.y+frame.h DIV 2 -newH DIV 2;
    frame.w:=newW;
    frame.h:=newH;
    RETURN frame;
  END RelZoomRect;


PROCEDURE TransRect (frame: Rectangle; p: Point): Rectangle;
  BEGIN
    RETURN Rect(p.x,p.y,frame.w,frame.h);
  END TransRect;

  
PROCEDURE LTransRect (frame: LongRect; p: LongPnt): LongRect;
  BEGIN
    RETURN LRect (p.x, p.y, frame.w, frame.h);
  END LTransRect;

  
PROCEDURE MinPoint (frame: Rectangle): Point;
  BEGIN
    RETURN Pnt(frame.x,frame.y);
  END MinPoint;

                         
PROCEDURE LMinPoint (frame: LongRect): LongPnt;
  BEGIN
    RETURN LPnt(frame.x, frame.y);
  END LMinPoint;

                         
PROCEDURE MaxPoint (frame: Rectangle): Point;
  BEGIN
    RETURN Pnt(frame.x+frame.w-1,frame.y+frame.h-1);
  END MaxPoint;

                         
PROCEDURE LMaxPoint (frame: LongRect): LongPnt;
  BEGIN
    RETURN LPnt (frame.x + frame.w - 1, frame.y + frame.h - 1);
  END LMaxPoint;

                         
PROCEDURE ClipRect (frame: Rectangle; clip: Rectangle): Rectangle;
  BEGIN
    WITH frame DO
      IF x<clip.x THEN w:=w-clip.x+x; x:=clip.x END;
      IF y<clip.y THEN h:=h-clip.y+y; y:=clip.y END;
      IF (w<=0) OR (h<=0) THEN w:=0;h:=0 END;
      IF (x+w)>(clip.x+clip.w) THEN w:=clip.x+clip.w-x END;
      IF (y+h)>(clip.y+clip.h) THEN h:=clip.y+clip.h-y END;
      IF (w<=0) OR (h<=0) THEN w:=0;h:=0 END;
    END;
    RETURN frame;
  END ClipRect;


PROCEDURE LClipRect (frame: LongRect; clip: LongRect): LongRect;
  BEGIN
    WITH frame DO
      IF x<clip.x THEN w:=w-clip.x+x; x:=clip.x END;
      IF y<clip.y THEN h:=h-clip.y+y; y:=clip.y END;
      IF (w<=0) OR (h<=0) THEN w:=0;h:=0 END;
      IF (x+w)>(clip.x+clip.w) THEN w:=clip.x+clip.w-x END;
      IF (y+h)>(clip.y+clip.h) THEN h:=clip.y+clip.h-y END;
      IF (w<=0) OR (h<=0) THEN w:=0;h:=0 END;
    END;
    RETURN frame;
  END LClipRect;


PROCEDURE FrameRects (r1, r2: Rectangle): Rectangle;
  VAR   r: Rectangle;
  BEGIN
    IF r1.x > r2.x THEN r.x := r2.x ELSE r.x := r1.x END;
    IF r1.y > r2.y THEN r.y := r2.y ELSE r.y := r1.y END;
    r1.w := r1.x + r1.w;
    r2.w := r2.x + r2.w;
    IF r1.w < r2.w THEN r.w := r2.w - r.x ELSE r.w := r1.w - r.x END;
    r1.h := r1.y + r1.h;
    r2.h := r2.y + r2.h;
    IF r1.h < r2.h THEN r.h := r2.h - r.y ELSE r.h := r1.h - r.y END;
    
    RETURN r
  END FrameRects;


PROCEDURE LFrameRects (r1, r2: LongRect): LongRect;
  VAR   r: LongRect;
  BEGIN
    IF r1.x > r2.x THEN r.x := r2.x ELSE r.x := r1.x END;
    IF r1.y > r2.y THEN r.y := r2.y ELSE r.y := r1.y END;
    r1.w := r1.x + r1.w;
    r2.w := r2.x + r2.w;
    IF r1.w < r2.w THEN r.w := r2.w - r.x ELSE r.w := r1.w - r.x END;
    r1.h := r1.y + r1.h;
    r2.h := r2.y + r2.h;
    IF r1.h < r2.h THEN r.h := r2.h - r.y ELSE r.h := r1.h - r.y END;
    
    RETURN r
  END LFrameRects;


PROCEDURE FramePoints (p1, p2: Point): Rectangle;
VAR r: Rectangle;
  BEGIN
    IF p1.x > p2.x THEN r.x := p2.x; r.w := p1.x - p2.x + 1 ELSE r.x := p1.x; r.w := p2.x - p1.x + 1 END;
    IF p1.y > p2.y THEN r.y := p2.y; r.h := p1.y - p2.y + 1 ELSE r.y := p1.y; r.h := p2.y - p1.y + 1 END;
    RETURN r;
  END FramePoints;


PROCEDURE LFramePoints (p1, p2: LongPnt): LongRect;
VAR r: LongRect;
  BEGIN
    IF p1.x > p2.x THEN r.x := p2.x; r.w := p1.x - p2.x + 1 ELSE r.x := p1.x; r.w := p2.x - p1.x + 1 END;
    IF p1.y > p2.y THEN r.y := p2.y; r.h := p1.y - p2.y + 1 ELSE r.y := p1.y; r.h := p2.y - p1.y + 1 END;
    RETURN r;
  END LFramePoints;


(*  calcFormSize -- Setzt eine MemFormDef auf ATARI-Screen Parameter *
 *                  (ohne screen address). Zeiger auf MemForm in A0  *)

PROCEDURE calcFormSize(VAR memForm:MemFormDef);
VAR LineA: PtrLineAVars;
    NegLineA: PtrNegLineAVars;
    bytesPerLine: CARDINAL;
  BEGIN
    LineA := LineAVariables();
    memForm.planes := LineA^.planes;
    bytesPerLine := LineA^.bytesPerLine;
    memForm.words := CARDINAL(SHIFT(BITSET(bytesPerLine), -1));
    NegLineA := NegLineAVariables();
    memForm.w := NegLineA^.screenWidth;
    memForm.h := NegLineA^.screenHeight;
    memForm.standardForm := ORD(FALSE);
    memForm.res1 := 0;
    memForm.res2 := 0;
    memForm.res3 := 0;
  END calcFormSize;


PROCEDURE GetPhysMemForm(VAR memForm:MemFormDef);
  BEGIN
    memForm.start := XBIOS.ScreenPhysicalBase();
    calcFormSize(memForm);
  END GetPhysMemForm;


PROCEDURE GetLogMemForm(VAR memForm:MemFormDef);
  BEGIN
    memForm.start := XBIOS.ScreenLogicalBase();
    calcFormSize(memForm);
  END GetLogMemForm;


PROCEDURE GetBlitterMode(VAR available,active:BOOLEAN);
VAR b: BITSET;
BEGIN
  b := XBIOS.BlitMode(-1);
  available := b * BITSET(2);
  active := b * BITSET(1);
END GetBlitterMode;


PROCEDURE SetBlitterMode(active:BOOLEAN);
BEGIN
  XBIOS.BlitMode(ORD(active));
END SetBlitterMode;


PROCEDURE GetScreen(VAR log,phys:ADDRESS;VAR rez:INTEGER16);
BEGIN
  log := XBIOS.ScreenLogicalBase();
  phys := XBIOS.ScreenPhysicalBase();
  rez := XBIOS.GetResolution();
END GetScreen;


PROCEDURE SetScreen(log,phys:ADDRESS;rez:INTEGER16);
BEGIN
  XBIOS.SetScreenBase(log, phys, rez);
END SetScreen;


PROCEDURE SetPalette(newPalette:PtrPalette);
BEGIN
  XBIOS.SetPalette(newPalette^);
END SetPalette;


PROCEDURE SetColor(colorNum,color:CARDINAL);
BEGIN
  XBIOS.SetColour(colorNum,color);
END SetColor;


PROCEDURE ColorNumber(colorNum:CARDINAL):CARDINAL;
BEGIN
  RETURN XBIOS.SetColour(colorNum, CARDINAL16(-1));
END ColorNumber;


END GrafBase.
