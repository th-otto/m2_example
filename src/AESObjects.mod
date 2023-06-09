IMPLEMENTATION MODULE AESObjects;


(*  MEGAMAX MODULA 2 GEM-Library :  Die AES Objektfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0020
 *)
 
(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  15.02.90    | Anpassung auf Compilerversion 4.0
 *  02.04.90    | Anpassung auf public arrays
 *  05.10.90    | Keine verdrehten SETs mehr
 *  07.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;

FROM    GrafBase        IMPORT Point, Rectangle;

FROM    GEMGlobals      IMPORT PtrObjTree, OStateSet, GemChar;
 
IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;

 
PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE DrawObject(tree:PtrObjTree;start,depth:CARDINAL;frame:Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := start;
  GEMShare.our_cb^.pubs.aINTIN[1] := depth;
  GEMShare.our_cb^.pubs.aINTIN[2] := frame.x;
  GEMShare.our_cb^.pubs.aINTIN[3] := frame.y;
  GEMShare.our_cb^.pubs.aINTIN[4] := frame.w;
  GEMShare.our_cb^.pubs.aINTIN[5] := frame.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_DRAW, 6, 1, 1));
  GEMShare.testINTOUT0();
END DrawObject;
        

PROCEDURE ChangeObjState(tree: PtrObjTree; index: CARDINAL; frame: Rectangle; newState: OStateSet; redraw: BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.our_cb^.pubs.aINTIN[1] := 0;
  GEMShare.our_cb^.pubs.aINTIN[2] := frame.x;
  GEMShare.our_cb^.pubs.aINTIN[3] := frame.y;
  GEMShare.our_cb^.pubs.aINTIN[4] := frame.w;
  GEMShare.our_cb^.pubs.aINTIN[5] := frame.h;
  GEMShare.our_cb^.pubs.aINTIN[6] := VAL(INTEGER, newState);
  GEMShare.our_cb^.pubs.aINTIN[7] := redraw;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_CHANGE, 8, 1, 1));
  GEMShare.testINTOUT0();
END ChangeObjState;


PROCEDURE FindObject(tree:PtrObjTree;start,depth:CARDINAL;spot:Point):CARDINAL;
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := start;
  GEMShare.our_cb^.pubs.aINTIN[1] := depth;
  GEMShare.our_cb^.pubs.aINTIN[2] := spot.x;
  GEMShare.our_cb^.pubs.aINTIN[3] := spot.y;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_FIND, 4, 1, 1));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END FindObject;


PROCEDURE ObjectOffset(tree:PtrObjTree;index:CARDINAL):Point;
VAR p: Point;
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_OFFSET, 1, 3, 1));
  p.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  p.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  GEMShare.testINTOUT0();
  RETURN p;
END ObjectOffset;
        

PROCEDURE AddObject(tree:PtrObjTree;parent,child:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := parent;
  GEMShare.our_cb^.pubs.aINTIN[1] := child;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_ADD, 1, 2, 1));
  GEMShare.testINTOUT0();
END AddObject;
        

PROCEDURE DeleteObject(tree:PtrObjTree;index:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_DELETE, 1, 1, 1));
  GEMShare.testINTOUT0();
END DeleteObject;


PROCEDURE ObjectOrder(tree:PtrObjTree;index:CARDINAL;newPos:INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.our_cb^.pubs.aINTIN[1] := newPos;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_ORDER, 2, 1, 1));
  GEMShare.testINTOUT0();
END ObjectOrder;


PROCEDURE EditObjText(tree:PtrObjTree;index:CARDINAL;ch:GemChar; VAR charPos:CARDINAL;edKind:EditObjMode);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.our_cb^.pubs.aINTIN[1] := VAL(INTEGER, SHIFT(VAL(BITSET, ch.scan), 8) + VAL(BITSET, ch.ascii));
  GEMShare.our_cb^.pubs.aINTIN[2] := charPos;
  GEMShare.our_cb^.pubs.aINTIN[3] := ORD(edKind);
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.OBJC_EDIT, 4, 2, 1));
  GEMShare.testINTOUT0();
  charPos := GEMShare.our_cb^.pubs.aINTIN[1];
END EditObjText;
        

BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESObjects.
