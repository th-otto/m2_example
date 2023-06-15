IMPLEMENTATION MODULE AESMenus;
#define REF


(*  MEGAMAX MODULA 2 GEM-Library :  Die AES Menufunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.3     V#0022
 *)

(*  05.11.87    | Uebernahme von 'GEMBase'
 *  ???????? TT | REF-Parm.
 *  02.04.90    | Anpassung auf public arrays
 *  22.05.93    | Anpassung MenuBar f. MultiTOS
 *  07.06.23 THO| Port to gm2
 *)

FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;

FROM    GEMGlobals      IMPORT PtrObjTree, PtrMaxStr;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;



PROCEDURE MenuBar(tree:PtrObjTree;show:BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := show;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_BAR, 1, 1, 1));
    (*
      Result ignorieren, da unter MultiTOS evtl. Fehler gemeldet wird, wenn
      noch eine fremde menubar aktiv (z.B. nach Rueckkehr von gestartetem
      Prg in der Shell):
      GEMShare.testINTOUT0();
     *)
END MenuBar;


PROCEDURE CheckItem(tree:PtrObjTree;item:CARDINAL;check:BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := item;
  GEMShare.our_cb^.pubs.aINTIN[1] := check;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_ICHECK, 2, 1, 1));
  GEMShare.testINTOUT0();
END CheckItem;


PROCEDURE EnableItem(tree:PtrObjTree;item:CARDINAL;enable:BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := item;
  GEMShare.our_cb^.pubs.aINTIN[1] := enable;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_IENABLE, 2, 1, 1));
  GEMShare.testINTOUT0();
END EnableItem;


PROCEDURE NormalTitle(tree:PtrObjTree;title:CARDINAL;normal:BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := title;
  GEMShare.our_cb^.pubs.aINTIN[1] := normal;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_TNORMAL, 2, 1, 1));
  GEMShare.testINTOUT0();
END NormalTitle;


PROCEDURE MenuText(tree:PtrObjTree;item:CARDINAL;REF text:ARRAY OF CHAR);
VAR s: GEMShare.MaxStr;
BEGIN
  GEMShare.stringIntoCFormat(text, s);
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.ADDRIN[1] := ADR(s);
  GEMShare.our_cb^.pubs.aINTIN[0] := item;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_TEXT, 1, 1, 2));
  GEMShare.testINTOUT0();
END MenuText;


PROCEDURE RegisterAcc(title:PtrMaxStr;VAR id:CARDINAL;VAR success:BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := title;
  GEMShare.our_cb^.pubs.aINTIN[0] := GEMShare.our_cb^.GLOBAL.ap_id;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_REGISTER, 1, 1, 1));
  id := GEMShare.our_cb^.pubs.aINTOUT[0];
  success := GEMShare.our_cb^.pubs.aINTOUT[0] >= 0;
END RegisterAcc;


PROCEDURE MenuRegister(id:INTEGER; VAR title: ARRAY OF CHAR): INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := ADR(title);
  GEMShare.our_cb^.pubs.aINTIN[0] := id;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.MENU_REGISTER, 1, 1, 1));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END MenuRegister;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESMenus.
