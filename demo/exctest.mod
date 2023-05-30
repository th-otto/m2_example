MODULE ExcTest;

(* Demo-Programm fuer Modul 'EasyExceptions' *)

IMPORT InOut, EasyExceptions;

MODULE localMod;

(*
 * Dies lokale Modul exportiert eine Funktion 'DoIt', die zwei Zahlen
 * multiplizieren kann.
 * Zwei Fehler koennen auftreten:
 *  - Das Ergebnis wird groesser als 65335 - ein Ueberlauf tritt auf,
 *    der durch 'EasyExceptions.Overflow()' signalisiert wird.
 *  - Der Anwender gibt ungueltige Werte ein - Die Funktion 'DoIt'
 *    loest diesen Fehler selbst aus (mittels 'Raise') - der Aufrufer
 *    kann dies mit 'InputFault()' ermitteln (s.u.).
 * Die Kennung fuer den Laufzeitfehler sollte nach aussen nur ueber eine
 * Funktion zugaenglich gemacht werden, um zu verhindern, dass sie von
 * aussen veraendert werden koennte.
 *)

  IMPORT InOut, EasyExceptions;
  
  EXPORT DoIt,          (* Die Funktion *)
         InputFault;    (* Die Kennung fuer Eingabefehler *)

  VAR myError: EasyExceptions.Exception;
  
  PROCEDURE InputFault (): EasyExceptions.Exception;
    BEGIN
      RETURN myError
    END InputFault;

  PROCEDURE DoIt;
    VAR c1, c2: CARDINAL;
    BEGIN
      InOut.WriteLn;
      InOut.WriteString ('Multiplikation zweier CARDINAL-Zahlen');
      InOut.WriteLn;
      InOut.WriteString (' Erste Zahl? ');
      InOut.ReadCard (c1);
      IF NOT InOut.Done THEN
        (* Fehler signalisieren und zum Aufrufer von 'Call' zurueckkehren *)
        EasyExceptions.Raise (InputFault ())
      END;
      InOut.WriteString (' Zweite Zahl? ');
      InOut.ReadCard (c2);
      IF NOT InOut.Done THEN
        EasyExceptions.Raise (InputFault ())
      END;
      InOut.WriteLn;
      InOut.WriteString ('Ergebnis: ');
      InOut.WriteCard (c1 * c2, 0); (* Hier kann ein Ueberlauf auftreten *)
      InOut.WriteLn
    END DoIt;

  BEGIN
    (* Die Kennung muss zuerst einmal erzeugt werden *)
    EasyExceptions.New (myError)
  END localMod;

VAR result: EasyExceptions.Exception;

PROCEDURE Report (text: ARRAY OF CHAR);
  VAR ch: CHAR;
  BEGIN
    InOut.WriteLn;
    InOut.WriteString (text);
    InOut.WriteString ('   Taste...');
    InOut.Read (ch);
    InOut.WriteLn;
  END Report;

PROCEDURE Abort (): BOOLEAN;
  VAR ch: CHAR;
  BEGIN
    InOut.WriteLn;
    InOut.WriteString ('Nochmal (J/N)? ');
    InOut.Read (ch);
    InOut.WriteLn;
    RETURN CAP (ch) = 'N'
  END Abort;

BEGIN
  REPEAT
    EasyExceptions.Call (DoIt, result);
    IF result = EasyExceptions.NormalReturn () THEN
      Report ('Kein Fehler.')
    ELSIF result = EasyExceptions.Overflow () THEN
      Report ('Ueberlauf!')
    ELSIF result = InputFault () THEN
      Report ('Eingabefehler!')
    ELSE
      (* Unerkannte / unerwartetet Fehler weiterreichen *)
      (* -- Kann ausprobiert werden, indem einer *)
      (*    der oberen Faelle eingeklammert wird. *)
      EasyExceptions.Raise (result)
    END;
  UNTIL Abort ()
END ExcTest.
