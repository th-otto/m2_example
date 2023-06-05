IMPLEMENTATION MODULE MOSConfig;

(*
 * Enthaelt globale Konfigurationswerte fuer die MOS-Moduln
 *
 * Hier keine Moduln importieren, fuer die die Konfigurationsdaten vorgesehen
 * sind! (z.B. 'Loader', 'Excepts', 'ErrBase', 'HdlError', 'GEMError')
 *)

FROM SysTypes IMPORT ExcSet, CHARSET, TRAP6, CHKExc, TRAPVExc, IllInstr,
                     BusError, AddrError, PrivViol;

BEGIN
  (* Die globalen Variablen sind anfangs alle geloescht *)
  
  (* Default-Suffix fuer 'Load/CallModule' *)
  DftSfx := 'mod';
  (* Import-Suffix fuer 'Load/CallModule' *)
  ImpSfx := 'imp';
  
  (* Abzufangende Exceptions: *)
  CaughtExceptions := ExcSet{TRAP6,CHKExc,TRAPVExc,BusError,AddrError,IllInstr};
  (*    Die folgende Anweisung darf bei einer 68020 (z.B. Atari TT) nicht
        verwendet werden. Bei einem normalen 68000-Atari kann sie dagegen
        benutzt werden.
    INCL (CaughtExceptions,PrivViol);
  *)
  IgnoreExceptions := ExcSet{};
  
  (* Zeichen zur Trennung der Vor- und Nachkommastellen bei REAL-Zahlen: *)
  RadixChar := '.';
  
  (* Schrankenwerte fuer Wahl der Fest- oder Fliess- *)
  (* kommadarstellung bei 'WriteReal', etc.:       *)
  FixToFloatMin := 1.0E-5;
  FixToFloatMax := 1.0E+6;
  
  (* Erwartungsform des Datums bei 'TimeConvert.TextToDate': *)
  StdDateExp := 1;  (* 1: t-m-j, 2: m-t-j, 3: j-m-t, 4: j-t-m *)
  StdTimeExp := 0;

  (* Ausgabeform des Datums bei 'TimeConvert.DateToText': *)
  StdDateMask := 'DD.MM.YYYY';
  StdTimeMask := 'HH:MM:SS';
  
  Separators := CHARSET {0C..' '};
  
  MaxBlSize := 0;  (* So ermittelt Storage selbst den optimalen Wert *)
  ExtendedMemoryAccess := TRUE;
  
  CoroutineTrapNo := 4; (* TRAP-Nr, die fuer Coroutinen belegt wird *)
END MOSConfig.
