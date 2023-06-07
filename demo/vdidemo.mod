MODULE VDIDemo; (*$E MOS*)

(*
 * Dies Programm zeigt die Anwendung vom Modul 'GEMBase' zum direkten
 * Zugriff auf die VDI-Funktionen/Parameter.
 * Die hier gezeigte Anwendung, der Aufruf der Line-Funktion des VDI,
 * ist sinnlos, weil sie schon in den normalen VDI-Modulen enthalten ist.
 * Sinnvoll wird dies erst bei Zugriff auf Funktionen, die vielleicht
 * in einer spaeteren GEM-Version implementiert werden und wir unsere
 * VDI-Module noch nicht adaptiert haben. Selbstverstaendlich muessen Sie
 * dann selbst ueber die benoetigten Aufrufparameter informiert sein.
 *
 * Dies Demoprogramm von Michael Seyfried erstellt und durch TT von seinem
 * AESBase/VDIBase auf GEMBase angepasst.
 *)

FROM SYSTEM IMPORT ADR;

IMPORT GEMEnv;

IMPORT GEMBase;

VAR dev: GEMEnv.DeviceHandle;
    gemHdl: GEMEnv.GemHandle;
    vdiHdl: INTEGER;
    ok: BOOLEAN;

(*
 * Implementation von Line mit Hilfe von VDIBase.
 *)
PROCEDURE Line (x1, y1, x2, y2: INTEGER);
VAR aespb: GEMBase.AESPB; vdipb: GEMBase.VDIPB;
BEGIN
  GEMBase.GetPBs (gemHdl, vdipb, aespb);
  vdipb.contrl^.opcode := 6;
  vdipb.contrl^.nptsin := 2;
  vdipb.contrl^.nptsout := 0;
  vdipb.contrl^.nintin := 0;
  vdipb.contrl^.nintout := 0;
  vdipb.contrl^.handle := vdiHdl;
  vdipb.ptsin^[0] := x1;
  vdipb.ptsin^[1] := y1;
  vdipb.ptsin^[2] := x2;
  vdipb.ptsin^[3] := y2;
  GEMBase.CallVDI (ADR (vdipb));
END Line;


BEGIN
  (* Beim GEM anmelden *)
  GEMEnv.InitGem (GEMEnv.RC, dev, ok);
  IF NOT ok THEN HALT END;
  
  (* GEM-Handle ermitteln *)
  gemHdl := GEMEnv.CurrGemHandle ();

  (* INTEGER-Wert des VDI-Handle ermitteln *)
  vdiHdl := GEMBase.VDIHandle (dev);

  (* Linie zeichnen *)
  Line (0, 0, 639, 399);
END VDIDemo.
