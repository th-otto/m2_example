IMPLEMENTATION MODULE AESResources;
#define REF


(*  Megamax Modula-2 GEM-Library :  Die AES Resourcefunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0001
 *)

(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  ???????? TT | REF-Parameter
 *  02.04.90    | Anpassung an public arrays
 *  09.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;

FROM    GEMGlobals      IMPORT PtrObjTree;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;



PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE LoadResource(REF pathname:ARRAY OF CHAR): [ BOOLEAN ];
VAR s: GEMShare.MaxStr;
BEGIN
  GEMShare.stringIntoCFormat(pathname, s);
  GEMShare.our_cb^.pubs.ADDRIN[0] := ADR(s);
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_LOAD, 0, 1, 1));
  GEMShare.testINTOUT0();
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0] <> 0;
END LoadResource;


PROCEDURE FreeResource;
BEGIN
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_FREE, 0, 1, 0));
  GEMShare.testINTOUT0();
END FreeResource;


PROCEDURE ResourceAddr(typ:ResourcePart;index:CARDINAL):ADDRESS;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(typ);
  GEMShare.our_cb^.pubs.aINTIN[1] := index;
  (* This is (currently) the only function that needs naddrout to be set *)
  GEMShare.our_cb^.A_CONTRL.naddrout := 1;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_GADDR, 2, 1, 0));
  GEMShare.our_cb^.A_CONTRL.naddrout := 0;
  GEMShare.testINTOUT0();
  RETURN GEMShare.our_cb^.pubs.ADDROUT[0];
END ResourceAddr;


PROCEDURE ResourceGetAddr(typ: INTEGER; index: INTEGER; VAR addr: ADDRESS);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(typ);
  GEMShare.our_cb^.pubs.aINTIN[1] := index;
  (* This is (currently) the only function that needs naddrout to be set *)
  GEMShare.our_cb^.A_CONTRL.naddrout := 1;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_GADDR, 2, 1, 0));
  GEMShare.our_cb^.A_CONTRL.naddrout := 0;
  GEMShare.testINTOUT0();
  addr := GEMShare.our_cb^.pubs.ADDROUT[0];
END ResourceGetAddr;


PROCEDURE SetResourceAddr(typ:ResourcePart;index:CARDINAL;objAddr:ADDRESS);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := objAddr;
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(typ);
  GEMShare.our_cb^.pubs.aINTIN[1] := index;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_SADDR, 2, 1, 1));
END SetResourceAddr;


PROCEDURE ConvertCoor(tree:PtrObjTree;index:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_OBFIX, 1, 1, 1));
END ConvertCoor;


PROCEDURE ResourceFix(hdr: PtrRSHDR): [ BOOLEAN ];
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := hdr;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.RSRC_RCFIX, 0, 1, 1));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0] <> 0;
END ResourceFix;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESResources.
