MODULE KbdDemo;

(*------------------------------------------------------------------------------
 * Version 1.1
 *------------------------------------------------------------------------------
 * Copyright ½ 1989 by Michael Seyfried
 *------------------------------------------------------------------------------
 * Demonstartionsprogramm zum Austesten von 'KbdEvents'
 *------------------------------------------------------------------------------
 *)

FROM SYSTEM IMPORT BYTE;

FROM GEMGlobals IMPORT MButtonSet, GemChar, SpecialKeySet, SpecialKey;

FROM GEMEnv IMPORT RC, InitGem;

FROM AESEvents IMPORT Event, RectEnterMode, MultiEvent, MessageBuffer,
                      EventSet;

FROM GrafBase IMPORT Rectangle, Rect, Point;
IMPORT GEMShare;

FROM StrIO IMPORT WriteString, WriteLn;
FROM NumberIO IMPORT WriteCard;
FROM StdIO IMPORT Write;

IMPORT KbdEvents;

VAR DevHdl: GEMShare.DeviceHandle;                   (* VDI-Handle *)
    success: BOOLEAN;
    mouseLoc: Point;                        (* Variablen fuer MultiEvent *)
    buttons: MButtonSet;
    keyState: SpecialKeySet;
    key: GemChar;
    doneClicks: CARDINAL;
    occuredEvents: EventSet;
    msg: MessageBuffer;

BEGIN
  InitGem( RC, DevHdl, success);    (* beim GEM anmelden *)
  IF success THEN
    WriteString( "Modul 'KbdDemo' zum Austesten von 'KbdEvents'");
    WriteLn;
    WriteString( 'Copyright ½ 1989 by Michael Seyfried');
    WriteLn; WriteLn;
    WriteString( "'Esc' beenden, 'Undo' KbdEvents (de)aktivieren");
    WriteLn; WriteLn;

    (* Ereignisschleife *)
    LOOP
      MultiEvent( EventSet {keyboard}, 0, MButtonSet {}, MButtonSet {},
                  lookForEntry, Rect( 0, 0, 0, 0),
                  lookForEntry, Rect( 0, 0, 0, 0),
                  msg, 0, mouseLoc, buttons, keyState,
                  key, doneClicks, occuredEvents);
      IF keyboard IN occuredEvents THEN
        IF key.scan = VAL( BYTE, 97) THEN
          WriteString( 'KbdEvents wurde ');
          IF KbdEvents.KbdEventsInstalled() THEN
            KbdEvents.DeInstallKbdEvents;
            WriteString( 'deaktiviert.');
          ELSE
            KbdEvents.InstallKbdEvents;
            WriteString( 'aktiviert.');
          END;
          WriteLn;
        ELSIF key.ascii = CHR( 27) THEN
          (* Bei Esc terminieren *)
          EXIT
        ELSE
          WriteString( 'Das GEM meldet folgendes Tastaturereignis:');
          WriteLn;
          WriteString( 'ascii: ');
          Write( key.ascii);
          WriteLn;
          WriteString( 'scan: ');
          WriteCard(VAL( CARDINAL, key.scan), 5);
          WriteLn;
          WriteString( 'keyState: { ');
          IF rightShiftKey IN keyState THEN
            WriteString( 'rightShiftKey ')
          END;
          IF leftShiftKey IN keyState THEN
            WriteString( 'leftShiftKey ')
          END;
          IF controlKey IN keyState THEN
            WriteString( 'controlKey ')
          END;
          IF alternateKey IN keyState THEN
            WriteString( 'alternateKey ')
          END;
          WriteString( '}');
          WriteCard( VAL( CARDINAL, keyState), 6);
          WriteLn;
        END;
      END;
    END
  END
END KbdDemo.
