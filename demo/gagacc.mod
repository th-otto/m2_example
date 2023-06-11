MODULE GagACC;

(*
 * Dies ist eine etwas komplexeres GEM- und Accessory-Demo.
 * Es zeigt auch die Anwendung von "FormDo" sowie dem "Redraw"
 * von Fenstern.
 *
 * Es ist eine Art Wecker, der zehn Minuten vor Erreichen einer
 * bestimmbaren Tageszeit jede Minute eine Meldung anzeigt.
 *
 * Zuvor muss die GEM-Resource-Datei "GAG.RSC" mit dem NRSC.PRG
 * geladen und gleich wieder gespeichert werden, um das benoetigte
 * Definitionsmodul "GAG.D" mit den Object-Konstanten zu erhalten.
 * Dann koennen die Module uebersetzt und gelinkt werden und "GAGACC.ACC"
 * mit "GAG.RSC" als Accessory auf die Bootdisk kopiert werden.
 *
 * Das Programm wurde von Hannes Krohn waehrend der CeBIT '90
 * programmiert.
 *)

IMPORT Gag;

FROM AESEvents          IMPORT  accClose,       accOpen,        Event,
                                EventSet,       MessageBuffer,  MultiEvent,
                                MessageEvent,   RectEnterMode,  windRedraw;
FROM AESForms           IMPORT  FormAlert,      FormCenter,     FormDial,
                                FormDialMode,   FormDo;
FROM AESGraphics        IMPORT  GrafMouse,      MouseForm;
FROM AESMenus           IMPORT  RegisterAcc;
FROM AESObjects         IMPORT  DrawObject;
FROM AESResources       IMPORT  LoadResource,   ResourceAddr,   ResourcePart;
FROM AESWindows         IMPORT  CalcWindow,     CloseWindow,    CreateWindow,
                                DeleteWindow,   NoWindow,       OpenWindow,
                                RListMode,      WCalcMode,      WElementSet,
                                UpdateWindow,   WindowRectList;
FROM Clock              IMPORT  CurrentTime;
FROM PrgCtrl            IMPORT  Accessory;
FROM GEMEnv             IMPORT  InitApplication,ExitApplication,GemError;
FROM GEMGlobals         IMPORT  GemChar,        MButtonSet,     PtrObjTree,
                                PtrTEdInfo,     Root,           MaxDepth,
                                SpecialKeySet, ObjState;
FROM GrafBase           IMPORT  ClipRect,       Point,
                                Rect,           Rectangle,      WordBitSet;
FROM MOSGlobals         IMPORT  Time;
FROM NumberIO           IMPORT  CardToStr,      IntToStr,       StrToCard;
FROM Strings            IMPORT  Append,         Assign,         Concat,
                                Extract, Length;
FROM SYSTEM             IMPORT  ADR, CARDINAL16;

PROCEDURE SelectObj (ptree : PtrObjTree; obj : CARDINAL; sel : BOOLEAN);
VAR
        state : WordBitSet;
BEGIN
  state := ptree^[obj].state;
  IF sel THEN
    INCL (state, 0)
  ELSE
    EXCL (state, 0)
  END;
  ptree^[obj].state := state;
END SelectObj;

PROCEDURE ObjSelected (ptree : PtrObjTree; obj : CARDINAL) : BOOLEAN;
BEGIN
  RETURN selectObj IN ptree^[obj].state
END ObjSelected;

VAR
        msgBuf : MessageBuffer;
        mouseLoc : Point;
        buttons : MButtonSet;
        keyState : SpecialKeySet;
        key : GemChar;
        doneClicks : CARDINAL;
        occuredEvents : EventSet;
        tree : PtrObjTree;
        open : BOOLEAN;
        wHandle : CARDINAL;
        windSpace : Rectangle;
        time : LONGCARD;
        r : Rectangle;
        t : Time;
        stage : CARDINAL;
        dispText : ARRAY [1..30] OF CHAR;
        title : ARRAY [1..10] OF CHAR;
        active : BOOLEAN;
        accId : CARDINAL;
        msgTime : Time;
        msgPre : CARDINAL;
        
PROCEDURE Config;
VAR
        ptree : PtrObjTree;
        resButton : CARDINAL;
        diagRect : Rectangle;
        hStr, mStr : ARRAY [0..2] OF CHAR;
        allStr : ARRAY [0..4] OF CHAR;
        tedPtr : PtrTEdInfo;
        fooC : CARDINAL;
        
BEGIN
  ptree := ResourceAddr (treeRsrc, Gag.Foset);
  
  (* Buttons selektieren, Werte einsetzen *)
  IntToStr (msgPre, 10, hStr);
  tedPtr := ptree^[Gag.Ftpre].spec.more;
  Assign (hStr, tedPtr^.textPtr^);
  
  IntToStr (msgTime.hour, 10, hStr);
  IntToStr (msgTime.minute, 10, mStr);
  tedPtr := ptree^[Gag.Fttime].spec.more;
  Concat (hStr, mStr, tedPtr^.textPtr^);
  SelectObj (ptree, Gag.Btan, active);
  SelectObj (ptree, Gag.Btaus, ~active);
  SelectObj (ptree, Gag.Btfertig, FALSE);
  
  (* Dialog animieren *)
  diagRect := FormCenter (ptree);
  FormDial (reserveForm, diagRect, diagRect);
  GrafMouse (mouseOff, NIL);
  DrawObject (ptree, Root, MaxDepth, diagRect);
  GrafMouse (mouseOn, NIL);
  FormDo (ptree, Root, resButton);
  FormDial (freeForm, diagRect, diagRect);
  
  (* Werte auslesen *)
  active := ObjSelected (ptree, Gag.Btan);
  Assign (tedPtr^.textPtr^, allStr);
  WHILE Length (allStr) < 4 DO
    Append ('0', allStr)
  END;
  Extract(allStr, 0, 2, hStr);
  Extract(allStr, 2, 2, mStr);
  StrToCard (hStr, fooC);
  msgTime.hour := fooC;
  StrToCard (mStr, fooC);
  msgTime.minute := fooC;
  tedPtr := ptree^[Gag.Ftpre].spec.more;
  StrToCard (tedPtr^.textPtr^, fooC);
  msgPre := fooC;
  IF open AND ~active THEN
    CloseWindow (wHandle);
    DeleteWindow (wHandle);
    open := FALSE;
    stage := 0
  END
END Config;

PROCEDURE SetText (text : ARRAY OF CHAR);
VAR
        boxSpace, textSpace : Rectangle;
BEGIN
  Assign (text, dispText);
  boxSpace := tree^[Root].space;
  textSpace := tree^[Gag.Text].space;
  textSpace.w := 8 * Length (text);
  boxSpace.w := 2 * textSpace.x + textSpace.w;
  boxSpace.h := 2 * textSpace.y + textSpace.h;
  tree^[Root].space := boxSpace;
  tree^[Gag.Text].space := textSpace;
  tree^[Gag.Text].spec.more := ADR (dispText);
  boxSpace := FormCenter (tree);
  windSpace := CalcWindow (calcBorder, WElementSet{}, boxSpace);
  CreateWindow (WElementSet{}, windSpace, wHandle);
  IF wHandle <> NoWindow THEN
    OpenWindow (wHandle, windSpace);
  END
END SetText;

VAR success: BOOLEAN;
a : ARRAY [1..30] OF CHAR;
    alertBut : CARDINAL;

BEGIN
  InitApplication (success);
  IF success THEN
    IF NOT Accessory() THEN
      FormAlert (1, "[0][GAGACC laeuft nur |als Accessory!][OK]", alertBut);
      ExitApplication;
      RETURN
    END;
    LoadResource ("gag.rsc");
    IF GemError () THEN
      FormAlert (1, "[0][Accessory GAGACC: |GAG.RSC fehlt!][OK]", alertBut);
      success:= FALSE
    ELSE
      tree := ResourceAddr (treeRsrc, Gag.Box);
      Assign ("  GagAcc", title);
      RegisterAcc (ADR (title), accId, success)
    END
  END;
  IF ~success THEN
    LOOP
      MessageEvent (msgBuf)
    END
  ELSE
    msgTime.hour := 17;
    msgTime.minute := 50;
    msgPre := 10;
    time := 8000;
    open := FALSE;
    stage := 0;
    active := TRUE;
    LOOP
      MultiEvent (EventSet {message, timer},
                            0, MButtonSet{}, MButtonSet{},
                            lookForEntry, Rect (0,0,0,0),
                            lookForEntry, Rect (0,0,0,0),
                            msgBuf,
                            time,
                            mouseLoc, buttons,
                            keyState, key,
                            doneClicks,
                            occuredEvents);
      UpdateWindow (TRUE);
      IF (timer IN occuredEvents) AND active THEN
        (* Action ! *)
        t := CurrentTime ();
        
        (* Um 17.50 h Warnung! *)
        IF (((t.hour = msgTime.hour) AND (t.minute >= msgTime.minute))
            OR (t.hour > msgTime.hour))
        AND (stage = 0) THEN
          IF ~open THEN
            (* Warnung ausgeben *)
            dispText := "Noch ";
            CardToStr (msgPre, 0, a);
            Append (a, dispText);
            IF msgPre = 1 THEN
              Append (" Minute!", dispText);
            ELSE
              Append (" Minuten!", dispText);
            END;
            SetText (dispText);
          ELSE
            IF wHandle <> NoWindow THEN
              CloseWindow (wHandle);
              DeleteWindow (wHandle);
              INC (stage);
              IF msgTime.minute >= (60 - msgPre) THEN
                INC (msgTime.hour);
                DEC (msgTime.minute, (60 - msgPre))
              ELSE
                INC (msgTime.minute, msgPre)
              END
            END
          END;
          open := ~open
        END;
            
        (* Um 18.00h blinken *)
        IF (((t.hour = msgTime.hour) AND (t.minute >= msgTime.minute)) OR
            (t.hour > msgTime.hour)) AND (stage = 1) THEN
          IF open THEN
            IF wHandle <> NoWindow THEN
              CloseWindow (wHandle);
              DeleteWindow (wHandle);
            END
          ELSE
            (* Fenster oeffnen *)
            SetText ("Jetzt ist aber Schluss!");
          END;
          open := ~open
        END
      ELSIF message IN occuredEvents THEN
        WITH msgBuf DO
          CASE msgType OF
            accClose : IF (VAL(CARDINAL, aClsMId) = accId) AND open THEN
                         (* Fenster wurde bereits geschlossen
                           CloseWindow (wHandle);
                         *)
                         DeleteWindow (wHandle);
                         open := FALSE;
                         stage := 1
                       END|
            accOpen : IF VAL(CARDINAL, aOpnMId) = accId THEN
                        Config;
                      END|
            windRedraw : IF VAL(CARDINAL, rdrwHdl) = wHandle THEN
                           GrafMouse (mouseOff, NIL);
                           r := WindowRectList (wHandle, firstElem);
                           WHILE (r.w <> 0) OR (r.h <> 0) DO
                             r := ClipRect (r, rdrwFrame);
                             IF (r.w <> 0) AND (r.h <> 0) THEN
                               DrawObject (tree, Root, MaxDepth, r)
                             END;
                             r := WindowRectList (wHandle, nextElem);
                           END;
                           GrafMouse (mouseOn, NIL);
                         END
          ELSE
            (* ignorieren *)
          END
        END
      END;
      UpdateWindow (FALSE)
    END (* LOOP *)
  END;
END GagACC.
