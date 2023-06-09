IMPLEMENTATION MODULE AESGraphics;


(*  MEGAMAX MODULA 2 GEM-Library :  Die AES Grafikfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0015
 *)

(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  15.02.90    | Anpassung an Compilerversion 4.0
 *  02.04.90    | Anpassung an public arrays
 *  30.05.23 THO| Port to gm2
 *)


FROM    SYSTEM  IMPORT CARDINAL32, SHIFT, ADR;
IMPORT GEMOps;

FROM    GrafBase        IMPORT Point, Rectangle, PtrMouseFormDef;

FROM    GEMGlobals      IMPORT MButtonSet, SpecialKeySet, OStateSet, PtrObjTree;

IMPORT  GEMShare;
IMPORT MOSGlobals;

PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;



PROCEDURE MouseKeyState (VAR mouseLoc : Point;
                         VAR mouseButs: MButtonSet;
                         VAR keys     : SpecialKeySet);
BEGIN
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_MKSTATE, 0, 5, 0));
  mouseLoc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  mouseLoc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  mouseButs := GEMShare.our_cb^.pubs.aINTOUT[3];
  keys := GEMShare.our_cb^.pubs.aINTOUT[4];
END MouseKeyState;


PROCEDURE GrafMouseKeyboardState(VAR x, y, mouseButs, key: INTEGER);
BEGIN
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_MKSTATE, 0, 5, 0));
  x := GEMShare.our_cb^.pubs.aINTOUT[1];
  y := GEMShare.our_cb^.pubs.aINTOUT[2];
  mouseButs := GEMShare.our_cb^.pubs.aINTOUT[3];
  key := GEMShare.our_cb^.pubs.aINTOUT[4];
END GrafMouseKeyboardState;


PROCEDURE MoveBox(origin:Rectangle;dest:Point);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := origin.w;
  GEMShare.our_cb^.pubs.aINTIN[1] := origin.h;
  GEMShare.our_cb^.pubs.aINTIN[2] := origin.x;
  GEMShare.our_cb^.pubs.aINTIN[3] := origin.y;
  GEMShare.our_cb^.pubs.aINTIN[4] := dest.x;
  GEMShare.our_cb^.pubs.aINTIN[5] := dest.y;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_MBOX, 6, 1, 0));
  GEMShare.testINTOUT0();
END MoveBox;


PROCEDURE GrafMoveBox(w, h, x, y: INTEGER; destx, desty: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := w;
  GEMShare.our_cb^.pubs.aINTIN[1] := h;
  GEMShare.our_cb^.pubs.aINTIN[2] := x;
  GEMShare.our_cb^.pubs.aINTIN[3] := y;
  GEMShare.our_cb^.pubs.aINTIN[4] := destx;
  GEMShare.our_cb^.pubs.aINTIN[5] := desty;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_MBOX, 6, 1, 0));
  GEMShare.testINTOUT0();
END GrafMoveBox;


PROCEDURE GrowBox(origin,dest:Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := origin.x;
  GEMShare.our_cb^.pubs.aINTIN[1] := origin.y;
  GEMShare.our_cb^.pubs.aINTIN[2] := origin.w;
  GEMShare.our_cb^.pubs.aINTIN[3] := origin.h;
  GEMShare.our_cb^.pubs.aINTIN[4] := dest.x;
  GEMShare.our_cb^.pubs.aINTIN[5] := dest.y;
  GEMShare.our_cb^.pubs.aINTIN[6] := dest.w;
  GEMShare.our_cb^.pubs.aINTIN[7] := dest.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_GROWBOX, 8, 1, 0));
  GEMShare.testINTOUT0();
END GrowBox;


PROCEDURE GrafGrowBox(startx, starty, startw, starth: INTEGER; destx, desty, destw, desth: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := startx;
  GEMShare.our_cb^.pubs.aINTIN[1] := starty;
  GEMShare.our_cb^.pubs.aINTIN[2] := startw;
  GEMShare.our_cb^.pubs.aINTIN[3] := starth;
  GEMShare.our_cb^.pubs.aINTIN[4] := destx;
  GEMShare.our_cb^.pubs.aINTIN[5] := desty;
  GEMShare.our_cb^.pubs.aINTIN[6] := destw;
  GEMShare.our_cb^.pubs.aINTIN[7] := desth;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_GROWBOX, 8, 1, 0));
  GEMShare.testINTOUT0();
END GrafGrowBox;


PROCEDURE ShrinkBox(origin,dest:Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := dest.x;
  GEMShare.our_cb^.pubs.aINTIN[1] := dest.y;
  GEMShare.our_cb^.pubs.aINTIN[2] := dest.w;
  GEMShare.our_cb^.pubs.aINTIN[3] := dest.h;
  GEMShare.our_cb^.pubs.aINTIN[4] := origin.x;
  GEMShare.our_cb^.pubs.aINTIN[5] := origin.y;
  GEMShare.our_cb^.pubs.aINTIN[6] := origin.w;
  GEMShare.our_cb^.pubs.aINTIN[7] := origin.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_SHRINKBOX, 8, 1, 0));
  GEMShare.testINTOUT0();
END ShrinkBox;


PROCEDURE GrafShrinkBox(destx, desty, destw, desth: INTEGER; startx, starty, startw, starth: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := destx;
  GEMShare.our_cb^.pubs.aINTIN[1] := desty;
  GEMShare.our_cb^.pubs.aINTIN[2] := destw;
  GEMShare.our_cb^.pubs.aINTIN[3] := desth;
  GEMShare.our_cb^.pubs.aINTIN[4] := startx;
  GEMShare.our_cb^.pubs.aINTIN[5] := starty;
  GEMShare.our_cb^.pubs.aINTIN[6] := startw;
  GEMShare.our_cb^.pubs.aINTIN[7] := starth;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_SHRINKBOX, 8, 1, 0));
  GEMShare.testINTOUT0();
END GrafShrinkBox;


PROCEDURE DragBox(start,bound:Rectangle; VAR loc:Point);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := start.x;
  GEMShare.our_cb^.pubs.aINTIN[1] := start.y;
  GEMShare.our_cb^.pubs.aINTIN[2] := start.w;
  GEMShare.our_cb^.pubs.aINTIN[3] := start.h;
  GEMShare.our_cb^.pubs.aINTIN[4] := bound.x;
  GEMShare.our_cb^.pubs.aINTIN[5] := bound.y;
  GEMShare.our_cb^.pubs.aINTIN[6] := bound.w;
  GEMShare.our_cb^.pubs.aINTIN[7] := bound.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_DRAGBOX, 8, 3, 0));
  GEMShare.testINTOUT0();
  loc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  loc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
END DragBox;


PROCEDURE GrafDragBox(startx, starty, startw, starth: INTEGER; boundx, boundy, boundw, boundh: INTEGER; VAR destx, desty: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := startx;
  GEMShare.our_cb^.pubs.aINTIN[1] := starty;
  GEMShare.our_cb^.pubs.aINTIN[2] := startw;
  GEMShare.our_cb^.pubs.aINTIN[3] := starth;
  GEMShare.our_cb^.pubs.aINTIN[4] := boundx;
  GEMShare.our_cb^.pubs.aINTIN[5] := boundy;
  GEMShare.our_cb^.pubs.aINTIN[6] := boundw;
  GEMShare.our_cb^.pubs.aINTIN[7] := boundh;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_DRAGBOX, 8, 3, 0));
  GEMShare.testINTOUT0();
  destx := GEMShare.our_cb^.pubs.aINTOUT[1];
  desty := GEMShare.our_cb^.pubs.aINTOUT[2];
END GrafDragBox;


PROCEDURE RubberBox(start:Rectangle; VAR loc:Point);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := start.x;
  GEMShare.our_cb^.pubs.aINTIN[1] := start.y;
  GEMShare.our_cb^.pubs.aINTIN[2] := start.w;
  GEMShare.our_cb^.pubs.aINTIN[3] := start.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_RUBBOX, 4, 3, 0));
  GEMShare.testINTOUT0();
  loc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  loc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
END RubberBox;


PROCEDURE GrafRubberBox(x, y, w, h: INTEGER; VAR destx, desty: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := x;
  GEMShare.our_cb^.pubs.aINTIN[1] := y;
  GEMShare.our_cb^.pubs.aINTIN[2] := w;
  GEMShare.our_cb^.pubs.aINTIN[3] := h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_RUBBOX, 4, 3, 0));
  GEMShare.testINTOUT0();
  destx := GEMShare.our_cb^.pubs.aINTOUT[1];
  desty := GEMShare.our_cb^.pubs.aINTOUT[2];
END GrafRubberBox;


PROCEDURE SlideBox(tree:PtrObjTree;parent,child:CARDINAL;dir:SlideDirection;
                 VAR newPos:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := parent;
  GEMShare.our_cb^.pubs.aINTIN[1] := child;
  GEMShare.our_cb^.pubs.aINTIN[2] := ORD(dir);
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_SLIDEBOX, 3, 1, 1));
  newPos := GEMShare.our_cb^.pubs.aINTOUT[0];
END SlideBox;


PROCEDURE GrafSlideBox(tree: PtrObjTree; parent, child: INTEGER; dir: INTEGER): INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := parent;
  GEMShare.our_cb^.pubs.aINTIN[1] := child;
  GEMShare.our_cb^.pubs.aINTIN[2] := dir;
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_SLIDEBOX, 3, 1, 1));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END GrafSlideBox;


PROCEDURE WatchBox (    tree    : PtrObjTree;
                      index   : CARDINAL;
                      inState,
                      outState: OStateSet;
                  VAR inside  : BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := 0;
  GEMShare.our_cb^.pubs.aINTIN[1] := index;
  GEMShare.our_cb^.pubs.aINTIN[2] := ORD(inState);
  GEMShare.our_cb^.pubs.aINTIN[3] := ORD(outState);
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_WATCHBOX, 4, 1, 1));
  inside := GEMShare.our_cb^.pubs.aINTOUT[0];
END WatchBox;


PROCEDURE GrafWatchBox(tree: PtrObjTree; index: INTEGER; inState, outState: INTEGER): INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := 0;
  GEMShare.our_cb^.pubs.aINTIN[1] := index;
  GEMShare.our_cb^.pubs.aINTIN[2] := inState;
  GEMShare.our_cb^.pubs.aINTIN[3] := outState;
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.GRAF_WATCHBOX, 4, 1, 1));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END GrafWatchBox;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESGraphics.
