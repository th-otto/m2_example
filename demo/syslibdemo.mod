(*
 *      Modul-Skelett zur Verwaltung von System-Ressourcen
 *      --------------------------------------------------
 *                 mit Hilfe von 'ResHandler'
 *                 --------------------------
 *
 * Das folgende Modul 'SysLibSkeleton' ist eine beispielhafte Implementation
 * fuer das Verwalten von Zugriffen, die eroeffnet und wieder geschlossen
 * werden koennen. Die Module 'Files', 'Excepts' oder 'TextWindows' sind
 * diesbezueglich aehnlich aufgebaut.
 *
 * Problemstellung:
 *   Beim Dateizugriff oder beim Verwenden mehrerer Fenster wird im
 * Allgemeinen ein Zugriff mit einer 'Open'-Funktion erlangt und am
 * Ende mit der entsprechenden 'Close'-Funktion wieder beendet.
 * Fuer dieses Verfahren gibt viele weitere Anwendungen, z.B. fuer
 * Module, die Stapel (Stacks), Schlangen (Queues) oder Verwenden
 * von Systemvektoren, wie Timer, VBL-Queue, usw., vorsehen.
 *
 *   Im Allgemeinen ist es dabei wuenschenswert, dem Anwenderprogramm
 * die Arbeit abzunehmen, beim Programmende alle eroeffneten Zugriffe
 * wieder zu schliessen. In der Regel sollte dies zwar am Ende des
 * Programms geschehen aber bei einem Laufzeitfehler oder einfach
 * schlampiger Programmierung sollte das betreffende Modul dies zur
 * Not selbst erledigen koennen.
 *
 *   Man kann sich nun aber, vor Allem beim Megamax-System, Anwendungen
 * vorstellen, bei denen bei Programmende die Zugriffe erhalten bleiben
 * sollen, so z.B., wenn der Zugriff vom darunter liegenden Prozess
 * weitergefuehrt werden soll oder wenn das Programm resident bleiben
 * will und weiterhin die Zugriffe benoetigt.
 *
 *   In den betroffenen MOS-Modulen sind deshalb, wie auch im Handbuch
 * in Kapitel 5.1, unter 'Allg. Hinweise zu den Modulen' vermerkt,
 * 'Sys'-Funktionen vorgesehen. Diese Funktionen dienen dazu, den Zugriff
 * so zu eroeffnen, dass er nicht mehr automatisch geschlossen wird.
 * In dem Fall ist dann das Anwenderprogramm wieder ganz und gar selbst
 * fuer das Schliessen verantwortlich.
 *
 *   Die folgende Modulimplementation sieht nun alle Funktionen vor, um
 * sowohl das normale, automatische Schliessen als auch die Sys-Funktion
 * korrekt durchzufuehren. Das Definitionsmodul muss dazu immer zwei
 * 'Open'-Funktionen (wovon die eine mit 'Sys' beginnt) und eine Close-
 * Funktion enthalten. Weiterhin sind eigene Funktionen zum Zugriff auf
 * die 'Resourcen' implementierbar. Die Namensgebung ist selbstver-
 * staendlich beliebig, nur sollte die Sys-Funktion auf jeden Fall mit
 * diesem Prefix ("Sys") beginnen.
 *
 *   Ausserdem ist schon alles vorgesehen, wiederholte, verschiedene
 * Zugriffe zu verwalten, indem fuer jeden Zugriff ein Record angelegt
 * wird, in dem die spezifischen Daten stehen und alle solche Records
 * in einer Liste verkettet werden. Es ist unumgaenglich, die Zugriffe
 * untereinander zu verketten, aber sie koennen natuerlich auch anders
 * als mit einer Liste realisiert werden.
 *
 *   Die Verwaltung geoeffneter Zugriffe in Listen und das automatische
 * Schliessen wird mit Hilfe des Moduls 'ResHandler' realisiert.
 *
 *   Das Beispielmodul zeigt eine einfache Anwendung, bei der beim
 * Oeffnen eines Zugriffs eine Zahl bestimmt werden kann. Mit der
 * Zugriffsfunktion 'DoIt' kann dann eine Textzeile ausgegeben werden,
 * die um soviel Zeichen eingerueckt ist, wie vorher beim Oeffnen bestimmt
 * wurde. Fuer dies einfache Beispiel findet sich ganz am Ende ein Modul,
 * das die Verwendung dieses Systemmoduls demonstiert. Diese gesamte
 * Textdatei kann auf einmal vom Compiler uebersetzt werden und dann das
 * enthaltene Testmodul mit Ctrl-A von der Shell aus gestartet werden.
 *
 *   Um eigene Systemmodule zu erstellen, sind die Namen im Definitions-
 * text und ggf. die Parameter bei den Open-Funktionen zu aendern und
 * eigene Zugriffsroutinen zu deklarieren. Im Implementationsteil muessen
 * die Zugriffsroutinen neu programmiert werden (anhand der Beispielrou-
 * tine 'DoIt') und in den Funktionen 'myOpen' und 'myClose' muessen ggf.
 * die externen Zugriffe initialisiert bzw. rueckgesetzt werden. Ausserdem
 * muss das Zugriffs-Record 'MyType' mit den benoetigten Datenfeldern
 * versehen werden.
 *
 *   Alle weiteren Aenderungsstellen sind im Text mit drei Punkten im
 * Kommentar versehen. Die Kontrollausgaben sollten natuerlich auch
 * entfernt werden.
 *)


DEFINITION MODULE SysLibSkeleton;

TYPE  Handle;

PROCEDURE OpenIt (VAR hdl: Handle; param: CARDINAL; VAR ok: BOOLEAN);
  (*
   * Oeffnet einen Zugriff (Ressource).
   * 'param' bestimmt dabei die Einrueckungsweite (s. 'DoIt').
   * Bei Prozessende wird der Zugriff automatisch geschlossen
   *)

PROCEDURE SysOpenIt (VAR hdl: Handle; param: CARDINAL; VAR ok: BOOLEAN);
  (*
   * Wie 'OpenIt', jedoch als 'Sys'-Funktion (siehe Handbuch, Kap. 5.1)
   * Bei Prozessende wird der Zugriff NICHT automatisch geschlossen, sondern
   * muss manuell vom anwendenden Programm geschlossen werden!
   *)

PROCEDURE DoIt (hdl: Handle; data: ARRAY OF CHAR; VAR ok: BOOLEAN);
  (*
   * Gibt Textzeile aus, eingerueckt um den Wert, der beim Oeffnen des
   * Zugriffs f. 'hdl' angegeben wurde.
   *)

PROCEDURE CloseIt (VAR hdl: Handle);
  (*
   * Beendet Zugriff auf 'hdl'
   *)

END SysLibSkeleton.

(* ----------------------------------------------------------------------- *)

IMPLEMENTATION MODULE SysLibSkeleton;

(*$Y+  Kennzeichnung fuer Systemmodule mit "shared data" (s. Handbuch) *)

FROM SYSTEM IMPORT ADDRESS, ADR;
FROM Storage IMPORT SysAlloc, DEALLOCATE;
FROM ErrBase IMPORT RtnCond, ErrResp, RaiseError;
FROM MOSGlobals IMPORT OutOfMemory;
FROM ResHandler IMPORT Resource, CreateResource,
                       InsertHandle, InsertSysHandle,
                       RemoveHandle, HandleInList;

(* ... werden ggf. nicht benoetigt: *)
  IMPORT TOSIO, InOut, Strings;


TYPE MyType = RECORD
                (* ... hier folgen die eigenen Datenfelder: *)
                  col: CARDINAL;
              END;

TYPE Handle = POINTER TO MyType;      (* Der Opaque Typ wird redeklariert *)

VAR HandleList: Resource;             (* Liste zum Verketten der Zugriffe *)


PROCEDURE myClose (hdlAddr: ADDRESS; user: BOOLEAN);
  (*
   * Diese Prozedur uebernimmt das Schliessen eines Zugriffs und wird
   * bei '(Sys)InsertHandle' als Parameter fuer die Freigabeprozedur
   * uebergeben.
   *)
  VAR hdl: Handle;
  BEGIN
    hdl:= hdlAddr; (* Initialisierung (Typkonvertierung) *)
    WITH hdl^ DO
      (* ... hier muessen ggf. Ruecksetzungen erfolgen, wie *)
      (*     z.B. veraenderte Vektoren wiederherzustellen. *)
      IF user THEN
        InOut.WriteString( 'Der Benutzer ');
      ELSE
        InOut.WriteString( 'Das System ');
      END;
      InOut.WriteString ('schliesst den Zugriff auf Spalte ');
      InOut.WriteCard (col, 0);
      InOut.WriteLn;
    END;
    DEALLOCATE (hdl, 0)     (* Speicher f. Record freigeben *)
  END myClose;

PROCEDURE myOpen ( VAR hdl     : Handle;
                       param   : CARDINAL;
                   VAR ok      : BOOLEAN;
                       sysLevel: BOOLEAN);
  (*
   * Ist sysLevel 'TRUE', dann wird der Zugriff bei Prozessende nicht
   * automatisch geschlossen.
   *)
  VAR strOk, found, error: BOOLEAN;
  BEGIN
    ok:= FALSE;
    (* Nur neu oeffnen, wenn Zugriff noch nicht geoeffnet ist: *)
    IF NOT HandleInList (HandleList, hdl) THEN
      (*
       * Nun Speicher fuer Record anfordern. Dazu wird eine 'Sys'-Funktion
       * benutzt (wichtig!!), damit dieser auch 'InsertSysHandle' ueberlebt.
       * Auch, wenn andere Ressourcen (GEM, Vektoren, Prozesse, usw.) hier
       * angelegt werden, sollten moeglichst immer 'Sys'-Funktion dazu ver-
       * wendet werden. Ist dies nicht moeglich, darf hier auch keine Sys-
       * Funktion angeboten werden, damit's nicht schiefgeht!
       * Natuerlich kann dieses Modul auch Dinge tun, wozu ueberhaupt keine
       * externen Ressourcen (wie der Speicher fuer das Record) geoeffnet werden
       * muessen, z.B. wenn hier nur damit ein Daten-Stack aufgebaut wird.
       * Dann kann hier natuerlich problemlos eine Sys-Funktion angeboten
       * werden.
       *)
      SysAlloc (hdl, SIZE (hdl^));
      IF hdl # NIL THEN
        (* Record in der Resource-Liste HandleList verketten *)
        IF sysLevel THEN
          (* System-Zugriff; nur verwenden, wenn der Rest (Speicher, usw.)
           * auch mit Sys-Funktionen angelegt wurde! *)
          InsertSysHandle (HandleList, hdl, myClose, error);
        ELSE
          (* normaler Zugriff *)
          InsertHandle (HandleList, hdl, myClose, error);
        END;
        IF error THEN
          DEALLOCATE (hdl, 0)
        ELSE
          WITH hdl^ DO
            (* ... hier folgen eigene Initialisierungen *)
            (* ... und Zuweisungen der Record-Felder:   *)
              col:= param;
          END;
          ok:= TRUE
        END
      END
    END
  END myOpen;

PROCEDURE OpenIt (VAR hdl: Handle; param: CARDINAL; VAR ok: BOOLEAN);
  (*
   * Normales Eroeffnen eines Zugriffs (einer Ressource).
   *)
  BEGIN
    myOpen (hdl, param, ok, FALSE)
  END OpenIt;

PROCEDURE SysOpenIt (VAR hdl: Handle; param: CARDINAL; VAR ok: BOOLEAN);
  (*
   * Dauerhaftes Eroeffnen eines Zugriffs (einer Ressource).
   *)
  BEGIN
    myOpen (hdl, param, ok, TRUE)
  END SysOpenIt;


PROCEDURE DoIt (hdl: Handle; data: ARRAY OF CHAR; VAR ok: BOOLEAN);
  (*
   * Operation auf dem Zugriff (auf der Ressource)
   *)
  BEGIN
    (* Existiert Zugriff ueberhaupt ? *)
    IF HandleInList (HandleList, hdl) THEN
      WITH hdl^ DO                   (* ja, dann ist der 'handle' gueltig. *)
        (* ...hier wird ein Zugriff durchgefuehrt: *)
        InOut.WriteString (Strings.Space (col));  (* 'col' aus Record *)
        InOut.WriteString (data);
        InOut.WriteLn;
      END
    END
  END DoIt;


PROCEDURE CloseIt (VAR hdl: Handle);
  BEGIN
    (*
     * Falls der angegebene Zugriff noch existiert, wird der
     * belegte Speicher freigegeben und der Zugriff aus der Liste
     * 'HandleList' geloescht.
     *)
    RemoveHandle (HandleList, hdl)
  END CloseIt;


VAR error: BOOLEAN;

BEGIN
  CreateResource (HandleList, error);
  IF error THEN
    RaiseError (OutOfMemory, '', selfCaused, mustAbort)
  END;
END SysLibSkeleton.

(* ----------------------------------------------------------------------- *)

MODULE SysLibDemo;

(*
 * Dies Modul demonstiert die Anwendung des obigen Beispielmoduls.
 *
 * Es oeffnet erst zwei Zugriffe, dann wendet es die Zugriffsfunktionen an,
 * dann startet es einen Tochterprozess, welcher ebenfalls zwei Zugriffe
 * eroeffnet. Einer der Zugriffe wird mit der Sys-Funktion geoeffnet. Der
 * Prozess gibt auch mit 'DoIt' Text aus und endet dann, ohne die Zugriffe
 * zu schliessen. Der eine Zugriff wird sodann vom Systemmodul geschlossen,
 * waehrend der Sys-Zugriff erhalten bleibt. Dann werden im ersten Prozess
 * wieder Ausgaben mit 'DoIt' gemacht, wobei auch der noch vorhandene
 * Sys-Zugriff benutzt wird. Am Ende wird dann einer der beiden ersten
 * Zugriffe ordnungsgemaess geschlossen, sodass das Systemmodul den anderen
 * wiederum automatisch schliesst.
 *
 * Der Sys-Zugriff muss (immer) explizit geschlossen werden, was in der
 * 'Termination'-Funktion geschieht, die zuvor mit 'CatchProcessTerm'
 * einen Aufruf bei Prozessende angefordert hat. Dies ist besser, als am
 * Ende des Programmtextes diesen Aufruf durchzufuehren, weil bei einem
 * Laufzeitfehler diese Programmstelle nicht mehr erreicht werden wuerde
 * und der Zugriff fuer immer (bis zum Reset des Rechners) als "Leiche"
 * im Speicher verleiben wuerde.
 *
 * Die Fehlerabfragen ('ok') wurden absichtlich weggelassen, da hier sowieso
 * alles funktionieren sollte (Speicher sollte ausreichen).
 *)

IMPORT GEMDOSIO; (*$E MOS ..machen wir ein TOS-Programm draus. *)

FROM SYSTEM IMPORT ADR;
FROM SysLibSkeleton IMPORT Handle, OpenIt, SysOpenIt, DoIt, CloseIt;
FROM MOSGlobals IMPORT MemArea;
FROM ModCtrl IMPORT CallProcess;
FROM MOSCtrl IMPORT CatchRemoval, RemovalEntry;
FROM PrgCtrl IMPORT CatchProcessTerm, TermCarrier;
IMPORT InOut;

MODULE local;

  (*
   * Dies lokale Modul enthaelt eine Prozedur, die als neuer Prozess unter
   * dem Hauptprogramm gestartet wird.
   * Ebenso koennte zur Demonstration mit 'Loader.CallModule' ein anderes
   * Modul als Tochterprozess gestartet werden, das dann 'SysLibSkeleton'
   * importiert und die im Folgenden gezeigten Funktionen aufruft.
   *)

  IMPORT Handle, OpenIt, SysOpenIt, DoIt, CloseIt;
  IMPORT InOut;

  EXPORT otherProgram, sysHdl;

  VAR sysHdl: Handle;

  PROCEDURE otherProgram;
    VAR ok: BOOLEAN;
        hdl: Handle;
    BEGIN
      (* Normalen Zugriff zu diesem Prozess oeffnen *)
      OpenIt (hdl, 12, ok);
        InOut.WriteString ('Oeffne Zugriff auf Spalte 12');
        InOut.WriteLn;

      (* Dauerhaften Zugriff oeffnen *)
      SysOpenIt (sysHdl, 14, ok);
        InOut.WriteString ('Oeffne Sys-Zugriff 2 auf Spalte 14');
        InOut.WriteLn;

      DoIt (hdl,    'Dies ist 2. Prozess, normaler Zugriff', ok);
      DoIt (sysHdl, 'Dies ist 2. Prozess, Sys-Zugriff', ok)

      (* Der Sys-Zugriff soll nicht geschlossen werden, da im *)
      (* Vaterprozess noch darauf zugegriffen werden wird..    *)
      (* Der andere Prozess wird einfach vergessen - er wird   *)
      (* vom Systemmodul geschlossen werden.                  *)
    END otherProgram;

  END local;

PROCEDURE Removal;
  VAR wait: CHAR;
  BEGIN
    InOut.WriteLn;
    InOut.WriteString ('Taste...');
    InOut.Read (wait);
  END Removal;

PROCEDURE Termination;
  VAR wait: CHAR;
  BEGIN
    (* Der Sys-Zugriff muss spaetestens hier geschlossen werden, sonst bleibt
     * er fuer immer geoeffnet (und belegt damit unnoetig Speicher). *)
    InOut.WriteString ('Schliesse manuell Sys-Zugriff auf Spalte 14:');
    InOut.WriteLn;
    CloseIt (sysHdl);
    InOut.WriteLn;
    (* ... hier koennten eigene Ressourcen geschlossen werden. *)
  END Termination;

VAR ok: BOOLEAN;
    exitCode: INTEGER;                  (* Exit-Code von 2. Prozess *)
    stack: ARRAY [1..4096] OF CARDINAL; (* Stack fuer 2. Prozess: 8 KB *)
    wsp: MemArea;
    rCarrier: RemovalEntry;
    tCarrier: TermCarrier;

    hdl: ARRAY [1..2] OF Handle;        (* 'Handles' fuer zwei Zugriffe *)

BEGIN
  (* Bei Programmende soll 'Removal' aufgerufen werden, um auf einen
   * Tastendruck zu warten: *)
  wsp.bottom:= NIL; (* Damit wird der Stack des Hauptprozesses benutzt *)
  CatchRemoval (rCarrier, Removal, wsp);

  (* Bei Prozessende soll 'Termination' aufgerufen werden *)
  wsp.bottom:= NIL;  (* Damit wird der Stack des Hauptprozesses benutzt *)
  CatchProcessTerm ( tCarrier, Termination, wsp );
    (* Hier haette auch 'CatchRemoval' verwendet werden  *)
    (* koennen, da dies beim Hauptmodul, sofern es nicht *)
    (* resident ist, keinen Unterschied macht.          *)

  (* Ersten Zugriff oeffnen *)
  OpenIt (hdl [1], 2, ok);
    InOut.WriteString ('Oeffne Zugriff 1 auf Spalte 2');
    InOut.WriteLn;
  (* Zweiten Zugriff oeffnen *)
  OpenIt (hdl [2], 4, ok);
    InOut.WriteString ('Oeffne Zugriff 2 auf Spalte 4');
    InOut.WriteLn;

  (* Funktionen auf die beiden Zugriffe durchfuehren *)
  DoIt (hdl [1], 'Dies ist 1. Prozess, Zugriff 1', ok);
  DoIt (hdl [2], 'Dies ist 1. Prozess, Zugriff 2', ok);

  (* Tochterprozess starten *)
  InOut.WriteLn;
  wsp.bottom:= ADR (stack);
  wsp.length:= SIZE (stack);
  CallProcess (otherProgram, wsp, ok, exitCode);
  InOut.WriteLn;

  (* Funktionen auf die beiden Zugriffe dieses Prozesses und des    *)
  (* residenten, vom Tochterprozess geoeffneten, Zugriffs durchfuehren *)
  DoIt (hdl [2], 'Dies ist wieder 1. Prozess, Zugriff 2', ok);
  DoIt (hdl [1], 'Dies ist wieder 1. Prozess, Zugriff 1', ok);
  DoIt (sysHdl,  'Dies ist der Sys-Zugriff', ok);

  (* Einen der hier geoeffneten Zugriffe selber schliessen,  *)
  (* der andere wird testweise vom Systemmodul geschlossen *)
  InOut.WriteLn;
  InOut.WriteString ('Schliesse manuell Zugriff 2 auf Spalte 4:');
  InOut.WriteLn;
  CloseIt (hdl [2]);

  InOut.WriteLn

END SysLibDemo.
