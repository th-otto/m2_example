MODULE AESDemo;
#define REF

(*
 * Dies Programm zeigt die Anwendung vom Modul 'GEMBase' zum direkten
 * Zugriff auf die AES-Funktionen/Parameter.
 *
 * Die hier gezeigte Anwendung, der Aufruf der Funktion 'fsel_exinput'
 * des AES, ist sinnlos, weil sie schon in den normalen AES-Modulen
 * enthalten ist.
 *
 * Achtung: Diese Routine ist erst ab TOS 1.4 vorhanden, fuehrt bei
 * aelteren TOS-Versionen zu einer Fehlermeldung! (Sollte nicht weiter
 * schlimm sein - ist ja ein Demoprogramm)
 *
 * Sinnvoll wird dies erst bei Zugriff auf Funktionen, die vielleicht
 * in einer spaeteren GEM-Version implementiert werden und wir unsere
 * GEM-Module noch nicht adaptiert haben. Selbstverstaendlich muessen Sie
 * dann selbst ueber die benoetigten Aufrufparameter informiert sein.
 *
 * Dies Demoprogramm von Michael Seyfried erstellt und durch TT von seinem
 * AESBase/VDIBase auf GEMBase angepasst.
 *)

FROM SYSTEM IMPORT ADR;

IMPORT MOSGlobals;

IMPORT GEMBase;

IMPORT GEMEnv;

IMPORT StrIO, StdIO;
FROM IOChan IMPORT Flush;
FROM StdChans IMPORT StdOutChan;

VAR dev: GEMEnv.DeviceHandle;
    gemHdl: GEMEnv.GemHandle;
    path: MOSGlobals.PathStr;
    name: MOSGlobals.NameStr;
    ch: CHAR;
    ok: BOOLEAN;

PROCEDURE FselExInput(  REF ftitle: ARRAY OF CHAR;
                        VAR fpath, fname: ARRAY OF CHAR;
                        VAR fok: BOOLEAN);
  (*
   * Implementation von 'fsel_exinput' mit Hilfe von GEMBase.
   *)
  VAR aespb: GEMBase.AESPB; vdipb: GEMBase.VDIPB;
  BEGIN
    GEMBase.GetPBs (gemHdl, vdipb, aespb);
    aespb.paddrin^[0]:= ADR (fpath);
    aespb.paddrin^[1]:= ADR (fname);
    aespb.paddrin^[2]:= ADR (ftitle);
    aespb.pcontrl^ := GEMBase.AESContrlArray {91, 0, 2, 3, 0};
    GEMBase.CallAES (ADR (aespb));
    fok:= (aespb.pintout^[1] = 1)
  END FselExInput;

BEGIN
  (* Zunaechst beim GEM anmelden. *)
  GEMEnv.InitGem (GEMEnv.RC, dev, ok);
  IF NOT ok THEN HALT END;
  (* GEM-Handle ermitteln *)
  gemHdl := GEMEnv.CurrGemHandle ();

  (* Weitere Initialisierungen *)
  path := '\*.*';
  name := '';

  (* File-Selector aufrufen *)
  FselExInput ('Dies ist der Titel', path, name, ok);

  (* Ausgabeparameter darstellen *)
  StrIO.WriteString ('path: ');
  StrIO.WriteString (path);
  StrIO.WriteLn;
  StrIO.WriteString ('name: ');
  StrIO.WriteString (name);
  StrIO.WriteLn;
  IF ok THEN
    StrIO.WriteString ('Es wurde der "OK"-Button angewaehlt.')
  ELSE
    StrIO.WriteString ('Es wurde der "ABBRUCH"-Button angewaehlt.')
  END;
  StrIO.WriteLn;
  StrIO.WriteString ('Taste...');
  StdIO.Read (ch)
END AESDemo.
