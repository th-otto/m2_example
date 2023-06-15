IMPLEMENTATION MODULE AESEvents;


(*  Megamax Modula-2 GEM-Library :  Die AES Ereignisfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  05.11.87
 *
 *  Version   2.2     V#0040
 *)
 
(*  05.11.87    | Uebernahme von 'GEMBase' und 'GEMExt'
 *  15.05.88    | Stack wird bei 'TimerEvent' und 'MessageEvent' richtig
 *                berichtigt.
 *  27.06.89    | Schoenheitskorrekturen (Keine Def. oder Impl. aenderungen)
 *  12.01.90 TT | ROL -> LSR teilw. ersetzt, weil bei Byte-Sets MSByte
 *                undefiniert ist
 *  11.02.90    | Anpassung auf Compilerversion 4.0 (angefangen)
 *  15.02.90    | A3-Stackbehandlung jetzt bei 'ButtonEvent' hoffentlich
 *                immer richtig + Anpassung auf Compilerversion 4.0 (beendet)
 *  02.04.90    | Anpassung auf public arrays
 *  23.11.90    | Def-Text: MessageBuffer um 'int' erweitert, Doku korrigiert.
 *  06.12.90    | Def-Text: MessageBuffer korrigiert.
 *  10.03.91 TT | A3-Stackbehandlung bei 'ButtonEvent' nochmal korrigiert.
 *  07.06.23 THO| Port to gm2
 *)

FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR, ADDRESS;

FROM    GrafBase        IMPORT Point, Rectangle;
 
FROM    GEMGlobals      IMPORT GemChar, MButtonSet, SpecialKeySet;
 
IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;


PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;


PROCEDURE keyboardEvent (): GemChar;
VAR ch: GemChar;
BEGIN
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_KEYBD, 0, 1, 0));
  ch.scan := VAL(CHAR, SHIFT(VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[0]), -8));
  ch.ascii := VAL(CHAR, VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[0]) * BITSET(255));
  RETURN ch;
END keyboardEvent;


PROCEDURE KeyboardEvent (VAR ch: GemChar);
VAR   keys: SpecialKeySet;
BEGIN
  LOOP
    ch := keyboardEvent();
    (* watch-dog plug *)
    IF GEMShare.keyboardPlug = GEMShare.keyboardPlugProc(0) THEN EXIT END;
    keys := SpecialKeySet{};
    IF GEMShare.keyboardPlug(ch, keys) THEN EXIT END;
  END;
END KeyboardEvent;


PROCEDURE EventKeyboard(): INTEGER;
BEGIN
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_KEYBD, 0, 1, 0));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END EventKeyboard;


PROCEDURE buttonEvent (    clicks     : CARDINAL;
                           mask, state: MButtonSet;
                       VAR mouseLoc   : Point;
                       VAR buttons    : MButtonSet;
                       VAR keyState   : SpecialKeySet): CARDINAL;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := clicks;
  GEMShare.our_cb^.pubs.aINTIN[1] := VAL(INTEGER, mask);
  GEMShare.our_cb^.pubs.aINTIN[2] := VAL(INTEGER, state);
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_BUTTON, 3, 5, 0));
  mouseLoc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  mouseLoc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  buttons := VAL(MButtonSet, GEMShare.our_cb^.pubs.aINTOUT[3]);
  keyState := VAL(SpecialKeySet, GEMShare.our_cb^.pubs.aINTOUT[4]);
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END buttonEvent;


PROCEDURE ButtonEvent (    clicks     : CARDINAL;
                           mask, state: MButtonSet;
                       VAR mouseLoc   : Point;
                       VAR buttons    : MButtonSet;
                       VAR keyState   : SpecialKeySet;
                       VAR doneClicks : CARDINAL);

VAR   clickResult: CARDINAL;
BEGIN
  LOOP
    clickResult := buttonEvent(clicks, mask, state, mouseLoc, buttons, keyState);
    (* watch-dog plug *)
    IF GEMShare.buttonPlug = GEMShare.buttonPlugProc(0) THEN EXIT END;
    IF GEMShare.buttonPlug(clickResult, mouseLoc, buttons, keyState) THEN EXIT END;
  END;
  doneClicks := clickResult;
END ButtonEvent;


PROCEDURE EventButton(clicks, mask, state: INTEGER; VAR mox, moy, buttons, keyState: INTEGER): INTEGER;
VAR loc: Point;
    doneClicks: INTEGER;
    buttonset: MButtonSet;
    keys: SpecialKeySet;
BEGIN
  doneClicks := buttonEvent(clicks, VAL(MButtonSet, mask), VAL(MButtonSet, state), loc, buttonset, keys);
  mox := loc.x;
  moy := loc.y;
  buttons := VAL(INTEGER, buttonset);
  keyState := VAL(INTEGER, keys);
  RETURN doneClicks;
END EventButton;


PROCEDURE mouseEvent (    moveDirec: RectEnterMode;
                          frame    : Rectangle;
                      VAR buttons  : MButtonSet;
                      VAR keyState : SpecialKeySet): Point;
VAR loc: Point;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := ORD(moveDirec);
  GEMShare.our_cb^.pubs.aINTIN[1] := frame.x;
  GEMShare.our_cb^.pubs.aINTIN[2] := frame.y;
  GEMShare.our_cb^.pubs.aINTIN[3] := frame.w;
  GEMShare.our_cb^.pubs.aINTIN[4] := frame.h;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MOUSE, 5, 5, 0));
  loc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
  loc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
  buttons := VAL(MButtonSet, GEMShare.our_cb^.pubs.aINTOUT[3]);
  keyState := VAL(SpecialKeySet, GEMShare.our_cb^.pubs.aINTOUT[4]);
  RETURN loc;
END mouseEvent;


PROCEDURE MouseEvent (    moveDirec: RectEnterMode;
                          frame    : Rectangle;
                      VAR buttons  : MButtonSet;
                      VAR keyState : SpecialKeySet;
                      VAR mouseLoc : Point);

VAR   locResult: Point;
                     
BEGIN
  LOOP
    locResult := mouseEvent(moveDirec, frame, buttons, keyState);
    IF (GEMShare.firstRectPlug <> GEMShare.rectPlugProc(0)) AND (GEMShare.firstRectPlug(locResult, buttons, keyState)) THEN
    	EXIT;
    END;
    IF (GEMShare.secondRectPlug <> GEMShare.rectPlugProc(0)) THEN
        IF (GEMShare.secondRectPlug(locResult, buttons, keyState)) THEN
      	  EXIT;
      	END
    ELSE
    	EXIT;
	END;
  END;
  mouseLoc := locResult;
END MouseEvent;


PROCEDURE EventMouse(direction: INTEGER; x, y, w, h: INTEGER; VAR buttons, keyState, mox, moy: INTEGER);
VAR   locResult: Point;
      frame: Rectangle;
    buttonset: MButtonSet;
    keys: SpecialKeySet;
BEGIN
  frame.x := x;
  frame.y := y;
  frame.w := w;
  frame.h := h;
  locResult := mouseEvent(VAL(RectEnterMode, direction), frame, buttonset, keys);
  buttons := VAL(INTEGER, buttonset);
  keyState := VAL(INTEGER, keys);
  mox := locResult.x;
  moy := locResult.y;
END EventMouse;


PROCEDURE TimerEvent (time: CARDINAL32);
BEGIN
  LOOP
    GEMShare.our_cb^.pubs.aINTIN[0] := VAL(INTEGER, time);
    GEMShare.our_cb^.pubs.aINTIN[1] := VAL(INTEGER, SHIFT(VAL(BITSET, time), -16));
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_TIMER, 2, 1, 0));
    IF GEMShare.timerPlug = GEMShare.timerPlugProc(0) THEN EXIT END;
    IF GEMShare.timerPlug() THEN EXIT END;
  END;
END TimerEvent;


PROCEDURE EventTimer(lo, hi: INTEGER);
BEGIN
    GEMShare.our_cb^.pubs.aINTIN[0] := lo;
    GEMShare.our_cb^.pubs.aINTIN[1] := hi;
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_TIMER, 2, 1, 0));
END EventTimer;


PROCEDURE MessageEvent (VAR msg: MessageBuffer);
BEGIN
  LOOP
    GEMShare.our_cb^.pubs.ADDRIN[0] := ADR(msg);
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MESAG, 0, 1, 1));
    IF GEMShare.messagePlug = GEMShare.messagePlugProc(0) THEN EXIT END;
    IF GEMShare.messagePlug(msg) THEN EXIT END;
  END;
END MessageEvent;


PROCEDURE EventMessage(msg: ADDRESS);
BEGIN
    GEMShare.our_cb^.pubs.ADDRIN[0] := msg;
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MESAG, 0, 1, 1));
END EventMessage;


PROCEDURE multiEvent (    events       : EventSet;
                          noClicks     : CARDINAL;
                          butMask,
                          butState     : MButtonSet;
                          moveDirec1   : RectEnterMode; rect1Size: Rectangle;
                          moveDirec2   : RectEnterMode; rect2Size: Rectangle;
                      VAR msg          : MessageBuffer;
                          time         : CARDINAL32;
                      VAR mouseLoc     : Point;
                      VAR buttons      : MButtonSet;
                      VAR keyState     : SpecialKeySet;
                      VAR key          : GemChar;
                      VAR doneClicks   : CARDINAL): EventSet;
BEGIN
    GEMShare.our_cb^.pubs.ADDRIN[0] := ADR(msg);
    GEMShare.our_cb^.pubs.aINTIN[0] := VAL(INTEGER, events);
    GEMShare.our_cb^.pubs.aINTIN[1] := noClicks;
    GEMShare.our_cb^.pubs.aINTIN[2] := VAL(INTEGER, butMask);
    GEMShare.our_cb^.pubs.aINTIN[3] := VAL(INTEGER, butState);
    GEMShare.our_cb^.pubs.aINTIN[4] := moveDirec1;
    GEMShare.our_cb^.pubs.aINTIN[5] := rect1Size.x;
    GEMShare.our_cb^.pubs.aINTIN[6] := rect1Size.y;
    GEMShare.our_cb^.pubs.aINTIN[7] := rect1Size.w;
    GEMShare.our_cb^.pubs.aINTIN[8] := rect1Size.h;
    GEMShare.our_cb^.pubs.aINTIN[9] := moveDirec2;
    GEMShare.our_cb^.pubs.aINTIN[10] := rect2Size.x;
    GEMShare.our_cb^.pubs.aINTIN[11] := rect2Size.y;
    GEMShare.our_cb^.pubs.aINTIN[12] := rect2Size.w;
    GEMShare.our_cb^.pubs.aINTIN[13] := rect2Size.h;
    GEMShare.our_cb^.pubs.aINTIN[14] := VAL(INTEGER, time);
    GEMShare.our_cb^.pubs.aINTIN[15] := VAL(INTEGER, SHIFT(VAL(BITSET, time), -16));
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MULTI, 16, 7, 1));
    mouseLoc.x := GEMShare.our_cb^.pubs.aINTOUT[1];
    mouseLoc.y := GEMShare.our_cb^.pubs.aINTOUT[2];
    buttons := VAL(MButtonSet, GEMShare.our_cb^.pubs.aINTOUT[3]);
    keyState := VAL(SpecialKeySet, GEMShare.our_cb^.pubs.aINTOUT[4]);
    key.scan := VAL(CHAR, SHIFT(VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[5]), -8));
    key.ascii := VAL(CHAR, VAL(BITSET, GEMShare.our_cb^.pubs.aINTOUT[5]) * BITSET(255));
    doneClicks := GEMShare.our_cb^.pubs.aINTOUT[6];
	RETURN VAL(EventSet, GEMShare.our_cb^.pubs.aINTOUT[0]);
END multiEvent;
                     

PROCEDURE MultiEvent (    events       : EventSet;
                          noClicks     : CARDINAL;
                          butMask,
                          butState     : MButtonSet;
                          moveDirec1   : RectEnterMode; rect1Size: Rectangle;
                          moveDirec2   : RectEnterMode; rect2Size: Rectangle;
                      VAR msg          : MessageBuffer;
                          time         : CARDINAL32;
                      VAR mouseLoc     : Point;
                      VAR buttons      : MButtonSet;
                      VAR keyState     : SpecialKeySet;
                      VAR key          : GemChar;
                      VAR doneClicks   : CARDINAL;
                      VAR occuredEvents: EventSet);
                     
VAR   eventResult: EventSet;
BEGIN
    eventResult := multiEvent(events, noClicks, butMask, butState,
      moveDirec1, rect1Size,
      moveDirec2, rect2Size,
      msg,
      time,
      mouseLoc, buttons, keyState, key, doneClicks);
    IF GEMShare.keyboardPlug <> GEMShare.keyboardPlugProc(0) THEN
      IF keyboard IN eventResult THEN
        IF NOT(GEMShare.keyboardPlug(key, keyState)) THEN
          EXCL(eventResult, keyboard);
        END;
      END;
    END;
    IF GEMShare.buttonPlug <> GEMShare.buttonPlugProc(0) THEN
      IF mouseButton IN eventResult THEN
        IF NOT(GEMShare.buttonPlug(doneClicks, mouseLoc, buttons, keyState)) THEN
          EXCL(eventResult, mouseButton);
        END;
      END;
    END;
    IF GEMShare.firstRectPlug <> GEMShare.rectPlugProc(0) THEN
      IF firstRect IN eventResult THEN
        IF NOT(GEMShare.firstRectPlug(mouseLoc, buttons, keyState)) THEN
          EXCL(eventResult, firstRect);
        END;
      END;
    END;
    IF GEMShare.secondRectPlug <> GEMShare.rectPlugProc(0) THEN
      IF secondRect IN eventResult THEN
        IF NOT(GEMShare.secondRectPlug(mouseLoc, buttons, keyState)) THEN
          EXCL(eventResult, secondRect);
        END;
      END;
    END;
    IF GEMShare.timerPlug <> GEMShare.timerPlugProc(0) THEN
      IF timer IN eventResult THEN
        IF NOT(GEMShare.timerPlug()) THEN
          EXCL(eventResult, timer);
        END;
      END;
    END;
    IF GEMShare.messagePlug <> GEMShare.messagePlugProc(0) THEN
      IF message IN eventResult THEN
        IF NOT(GEMShare.messagePlug(msg)) THEN
          EXCL(eventResult, message);
        END;
      END;
    END;
  occuredEvents := eventResult;
END MultiEvent;


PROCEDURE EventMultiple(events: INTEGER; noclicks, butMask, butState: INTEGER;
      moveDirect1, move1x, move1y, move1w, move1h: INTEGER;
      moveDirect2, move2x, move2y, move2w, move2h: INTEGER;
      msg: ADDRESS;
      timelo, timehi: INTEGER;
      VAR mox, moy, buttons, keyState, key, doneClicks: INTEGER): INTEGER;
BEGIN
    GEMShare.our_cb^.pubs.ADDRIN[0] := msg;
    GEMShare.our_cb^.pubs.aINTIN[0] := events;
    GEMShare.our_cb^.pubs.aINTIN[1] := noclicks;
    GEMShare.our_cb^.pubs.aINTIN[2] := butMask;
    GEMShare.our_cb^.pubs.aINTIN[3] := butState;
    GEMShare.our_cb^.pubs.aINTIN[4] := moveDirect1;
    GEMShare.our_cb^.pubs.aINTIN[5] := move1x;
    GEMShare.our_cb^.pubs.aINTIN[6] := move1y;
    GEMShare.our_cb^.pubs.aINTIN[7] := move1w;
    GEMShare.our_cb^.pubs.aINTIN[8] := move1h;
    GEMShare.our_cb^.pubs.aINTIN[9] := moveDirect2;
    GEMShare.our_cb^.pubs.aINTIN[10] := move2x;
    GEMShare.our_cb^.pubs.aINTIN[11] := move2y;
    GEMShare.our_cb^.pubs.aINTIN[12] := move2w;
    GEMShare.our_cb^.pubs.aINTIN[13] := move2h;
    GEMShare.our_cb^.pubs.aINTIN[14] := timelo;
    GEMShare.our_cb^.pubs.aINTIN[15] := timehi;
    GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_MULTI, 16, 7, 1));
    mox := GEMShare.our_cb^.pubs.aINTOUT[1];
    moy := GEMShare.our_cb^.pubs.aINTOUT[2];
    buttons := GEMShare.our_cb^.pubs.aINTOUT[3];
    keyState := GEMShare.our_cb^.pubs.aINTOUT[4];
    key := GEMShare.our_cb^.pubs.aINTOUT[5];
    doneClicks := GEMShare.our_cb^.pubs.aINTOUT[6];
    RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END EventMultiple;

                     
PROCEDURE SetDClickSpeed (speed: CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := speed;
  GEMShare.our_cb^.pubs.aINTIN[1] := 1;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_DCLICK, 2, 1, 0));
END SetDClickSpeed;


PROCEDURE DClickSpeed (): CARDINAL;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[1] := 0;
  GEMShare.aes_if(AES_CTRL_CODE(GEMOps.EVNT_DCLICK, 2, 1, 0));
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END DClickSpeed;


PROCEDURE EventDoubleClick(val: INTEGER; setorget: INTEGER): INTEGER;
BEGIN
  GEMShare.our_cb^.pubs.aINTIN[0] := val;
  GEMShare.our_cb^.pubs.aINTIN[1] := setorget;
  RETURN GEMShare.our_cb^.pubs.aINTOUT[0];
END EventDoubleClick;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END AESEvents.
