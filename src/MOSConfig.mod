IMPLEMENTATION MODULE MOSConfig;

IMPORT MOSGlobals;
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
  
  (* Abzufangende Exceptions: *)
  CaughtExceptions := ExcSet{TRAP6,CHKExc,TRAPVExc,BusError,AddrError,IllInstr};
  (*    Die folgende Anweisung darf bei einer 68020 (z.B. Atari TT) nicht
        verwendet werden. Bei einem normalen 68000-Atari kann sie dagegen
        benutzt werden.
    INCL (CaughtExceptions,PrivViol);
  *)
  IgnoreExceptions := ExcSet{};
  
  MaxBlSize := 0;  (* So ermittelt Storage selbst den optimalen Wert *)
END MOSConfig.
