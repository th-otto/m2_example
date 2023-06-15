IMPLEMENTATION MODULE AESForms;
#define REF


(*  Megamax Modula-2 GEM-Library :  Die AES Formularfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0018
 *)

(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  22.02.89    | Stack wird von 'FormButton' und 'FormKeyboard' jetzt
 *                richtig abgeraeumt.
 *  27.06.89    | Schoenheitsoperationen
 *  ???????? TT | REF-Parm.
 *  02.04.90    | Anpassung an public arrays
 *  01.02.91 TT | FormAlert: Null-Terminierung raus, da unnoetig.
 *  08.04.91 TT | FormKeyboard: 'ch' & 'nextObj' endlich vertauscht.
 *  07.06.23 THO| Port to gm2
 *)


FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR;

FROM    GrafBase        IMPORT Rectangle;

FROM    GEMGlobals      IMPORT PtrObjTree, GemChar;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;



PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE FormCenter(tree: PtrObjTree): Rectangle;
VAR r: Rectangle;
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_CENTER, 0, 5, 1));
  r.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  r.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  r.w := GEMShare.our_cb^.pubs.aINTOUT[3];
  r.h := GEMShare.our_cb^.pubs.aINTOUT[4];
  RETURN r;
END FormCenter;


PROCEDURE FormDial(flag: FormDialMode; little, big: Rectangle);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(flag);
  GEMShare.our_cb^.pubs.aINTIN[1] := little.x;
  GEMShare.our_cb^.pubs.aINTIN[2] := little.y;
  GEMShare.our_cb^.pubs.aINTIN[3] := little.w;
  GEMShare.our_cb^.pubs.aINTIN[4] := little.h;
  GEMShare.our_cb^.pubs.aINTIN[5] := big.x;
  GEMShare.our_cb^.pubs.aINTIN[6] := big.y;
  GEMShare.our_cb^.pubs.aINTIN[7] := big.w;
  GEMShare.our_cb^.pubs.aINTIN[8] := big.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_DIAL, 9, 1, 0));
  (* GEMShare.testINTOUT0(); GEM bringt immer aINTOUT[0]=1 *)
END FormDial;


PROCEDURE FormDialogue(flag: INTEGER; littlex, littley, littlew, littleh: INTEGER; bigx, bigy, bigw, bigh: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(flag);
  GEMShare.our_cb^.pubs.aINTIN[1] := littlex;
  GEMShare.our_cb^.pubs.aINTIN[2] := littley;
  GEMShare.our_cb^.pubs.aINTIN[3] := littlew;
  GEMShare.our_cb^.pubs.aINTIN[4] := littleh;
  GEMShare.our_cb^.pubs.aINTIN[5] := bigx;
  GEMShare.our_cb^.pubs.aINTIN[6] := bigy;
  GEMShare.our_cb^.pubs.aINTIN[7] := bigw;
  GEMShare.our_cb^.pubs.aINTIN[8] := bigh;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_DIAL, 9, 1, 0));
  (* GEMShare.testINTOUT0(); GEM bringt immer aINTOUT[0]=1 *)
END FormDialogue;


PROCEDURE FormDo(tree: PtrObjTree; first: CARDINAL; VAR retBut: CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := first;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_DO, 1, 1, 1));
  retBut := GEMShare.our_cb^.pubs.aINTOUT[0];
END FormDo;


PROCEDURE FormAlert(defBut: CARDINAL; REF str: ARRAY OF CHAR; VAR retBut: CARDINAL);
BEGIN
  (* nicht noetig: stringIntoCFormat(str, s)   ; schiebe string mit #0 auf den A7-Stack *)
  (* stattdessen: *)
  GEMShare.our_cb^.pubs.ADDRIN[0] := ADR(str);
  GEMShare.our_cb^.pubs.aINTIN[0] := defBut;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_ALERT, 1, 1, 1));
  retBut := GEMShare.our_cb^.pubs.aINTOUT[0];
END FormAlert;


PROCEDURE FormError(errNo: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := errNo;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_ERROR, 1, 1, 0));
END FormError;


PROCEDURE FormKeyboard(tree: PtrObjTree; index: CARDINAL; VAR nextObj: CARDINAL; VAR ch: GemChar; VAR cont: BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.our_cb^.pubs.aINTIN[1] := VAL(INTEGER, SHIFT(VAL(BITSET, ch.scan), 8) + VAL(BITSET, ch.ascii));
  GEMShare.our_cb^.pubs.aINTIN[2] := nextObj;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_KEYBD, 3, 3, 1));
  nextObj := GEMShare.our_cb^.pubs.aINTOUT[1];
  ch.scan := VAL(CHAR, SHIFT(VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[2]), -8));
  ch.ascii := VAL(CHAR, VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[2]) * BITSET(255));
  cont := GEMShare.our_cb^.pubs.aINTOUT[0] <> 0;
END FormKeyboard;


PROCEDURE FormButton(tree: PtrObjTree; index: CARDINAL; clicks: CARDINAL; VAR nextObj: CARDINAL; VAR cont: BOOLEAN);
BEGIN
  GEMShare.our_cb^.pubs.ADDRIN[0] := tree;
  GEMShare.our_cb^.pubs.aINTIN[0] := index;
  GEMShare.our_cb^.pubs.aINTIN[1] := clicks;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.FORM_BUTTON, 2, 2, 1));
  nextObj := GEMShare.our_cb^.pubs.aINTOUT[1];
  cont := GEMShare.our_cb^.pubs.aINTOUT[0] <> 0;
END FormButton;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESForms.
