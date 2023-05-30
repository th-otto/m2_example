IMPLEMENTATION MODULE GEMEnv;
#define REF VAR

(*
FROM Terminal IMPORT WriteString, WriteLn, Read; (*  FOR DEBUGGING ONLY  *)
FROM StrConv  IMPORT CardToStr;
*)


(*      Implementation der Megamax Modula-2 GEM Library (Enviroment)
 *
 *      geschrieben von Manuel Chakravarty
 *
 *      Version 2.2     V#0395      Erstellt Maerz-Oktober 1987
 *)


(* TT  22.01.88: Parameter in 'GrafHandle' korrekt behandelt
 * TT  22.01.88: SysInit mit Level 0 statt -1
 *     02.06.88: Fehlermeldung bei Benutzung von 'SuspendedProcess'
 *     13.06.88: Optimierung in ASM (bis teilweise 'OpenDevice')
 *     27.06.88: Optimierung in ASM ('OpenDevice')
 *     21.07.88: Jetzt hoffentlich richtige Indexoffsetberechnung in
 *               'OpenDevice'
 *     27.06.89: Benutzt 'ResCtrl'.
 *     02.08.89: 'SuspendedProcess' raus
 *     11.08.89: Verschiebung waehrend dem Kopieren der Geraeteparameterliste
 *               korrigiert.
 *     20.08.89: 'GDOSAvailable' + 'GEMVersion' def. + impl. ausserdem
 *               Selektorgeschichte auf den 'SelectFileExtended' umgestellt.
 * TT  07.09.89: Kein extended FSel bei GEM V2;
 * TT  ????????: REF-Parm.
 *     01.02.90: 'errorProcPtr' wird im Body gesetzt.
 *     02.04.90: 'GEMAvailable' def. + impl.; Anpassung an public arrays
 * TT  26.06.90: FileSelect raus -> nun im PathEnv-Modul; InitGem init. PathEnv
 *               auch Doku zu InitGem im Def-Text erweitert!
 *               nur der durch InitGem zugewiesene SelectFile schaltet die Maus
 *               selbstst. ein! Bisher wurde das immer von SelectFile hier
 *               erledigt, egal, welche Routine angemeldet war - Mist?!
 * TT  21.11.90: GDOSAvailable drin und getestet; Nur noch ein globales
 *               appl_init und appl_exit pro Prozess;
 *               Damit ModLoad auch nach Aufruf von "termProc" noch InitGem u.
 *               ExitGem taetigen kann, wird "modId" zu Beginn auf 2 statt 1
 *               gesetzt. So ist "modID"=1 nach "termProc", sodass die OWNER_ID
 *               bei einem InitGem nicht Null ist (denn dan wuerde ExitGem nix
 *               freigeben).
 *               'ErrorProc' ist nicht mehr HALT sondern ein neuer TRAP#6-Code;
 *               outOfMemory: LINK A5 statt A6; GEMAvailable angepasst;
 *               envelopeProc/ExitGem: 'error' wird immer auf FALSE gesetzt,
 *               damit dort nicht noch Fehler gemeldet werden.
 * TT  10.12.90: InitGem/Dev: ShellRead wird nur einmal pro Prozess gemacht.
 * TT  12.12.90: InitDev: Bei TT-TOS wird auch extended-fileSelector verwendet;
 *               Envelopes: PathEnv.SelectFile wird vom Vater-Prozess uebernommen
 * TT  25.02.91: CloseDevice macht "unloadFonts", wenn noetig.
 * TT  17.04.91: PathEnv.SelectFile wird sowohl bei InitGem als auch bei
 *               InitApplication gesetzt.
 * TT  10.07.93: Kein automatische Error-Meldung mehr bei GemErrors, damit
 *               keine Probleme mehr mit den vielen neuen GEM-Versionen.
 * THO 25.05.23  Port to gm2
 *
 *)

FROM    SYSTEM          IMPORT ADDRESS, ADR, INTEGER16, CARDINAL16, CARDINAL32, SHIFT;

FROM    SysStorage      IMPORT ALLOCATE, DEALLOCATE;

FROM    MOSGlobals      IMPORT MemArea, IllegalPointer, GeneralErr, OutOfMemory,
                               GemErr, FileStr;

FROM    PrgCtrl         IMPORT EnvlpCarrier, TermCarrier,
                               Accessory, SetEnvelope, CatchProcessTerm;

FROM    ResCtrl         IMPORT RemovalCarrier, CatchRemoval;

FROM    GEMGlobals      IMPORT TEffectSet;

FROM ErrBase IMPORT TRAP6, TRAP6_SELF, TRAP6_CONT;
FROM PathEnv IMPORT FileSelectProc, SelectFile, HomePath;
FROM FileNames IMPORT SplitPath;
FROM GEMShare IMPORT device, cb, deviceMagic, logInpDev, inputMode, our_cb, root_cb,
     GDPAttribute, GDPFkt, InputDev, DeviceType, ScreenType, TextRotType,
     timerVecList, butChgVecList, msMoveVecList, curChgVecList,
     errorProcPtr, ptrToErrHdler, testErrorCheck, gemErrorOccured,
     UpdateWindowType, updateWindow, removeCurChgVector, removeMsMoveVector,
     removeButChgVector, removeTimerVector, cbMagic, error, errNum,
     aes_if, vdi_if, unloadFonts, setDevice,
     windowSet, PtrDevParm, intinMax, ptsinMax, MaxWinds, closeWindow, deleteWindow,
     showCursor, hideCursor;
FROM AESMisc IMPORT ShellRead;
FROM AESGraphics IMPORT GrafMouse, MouseForm;
FROM Directory IMPORT GetDefaultPath;
FROM GEMFile IMPORT selectFile, selectFileExtended;

(* fuer Tests:
  FROM SysTypes IMPORT ScanDesc;
  FROM SysCtrl IMPORT GetScanAddr;
  FROM GEMScan IMPORT InitChain, InputScan;
  VAR scanidx: CARDINAL; scan: ScanDesc;
*)


#include "gemops.icl"
#include "gemcnf.icl"



VAR     noInits         : CARDINAL;  (*  Zaehlt die Anzahl der '(Sys)InitGem's *)
        modID           : INTEGER;   (*  Zaehlt die Ebenen angemeldeter Module
                                      *  (=0: SysEbene; >0: Mod.init.)
                                      *)
        gemStatus       : (unknown, available);

        didShRead: ARRAY [-1..15] OF BOOLEAN; (* 'ShellRead' durchgefuehrt? *)
        appIsInit: ARRAY [-1..15] OF BOOLEAN; (* appIsInit[modID] zeigt an,
                                               * ob schon appl_init() auf-
                                               * gerugen wurde. *)


(*  misc. internal proc.s  *)
(*  =====================  *)

PROCEDURE outOfMemory();
BEGIN
  TRAP6(OutOfMemory - TRAP6_SELF - TRAP6_CONT);
END outOfMemory;


(*  exported proc.s  *)
(*  ===============  *)

PROCEDURE GrafHandle (VAR charW,
                          charH,
                          cellW,
                          cellH: CARDINAL;
                      VAR hdl  : CARDINAL);
BEGIN
  aes_if(AES_CTRL_CODE(GRAF_HANDLE, 0, 2, 0));
  hdl := our_cb^.pubs.aINTOUT[0];
  charW := our_cb^.pubs.aINTOUT[1];
  charH := our_cb^.pubs.aINTOUT[2];
  cellW := our_cb^.pubs.aINTOUT[3];
  cellH := our_cb^.pubs.aINTOUT[4];
END GrafHandle;


PROCEDURE opnwrk0(ctrlcode: CARDINAL32;
                  handle  : CARDINAL;
                  device, koorSys : CARDINAL;
                  VAR param           : ARRAY OF INTEGER): CARDINAL;
VAR     oldpts,oldint           :ADDRESS;
        i                       :CARDINAL;
BEGIN
  IF HIGH(param)<56 THEN        (* Nicht genug Platz fuer die Parameter *)
    TRAP6(GeneralErr - TRAP6_CONT);
    RETURN 0;
  END;
  our_cb^.V_CONTRL.handle := handle;
  WITH our_cb^ DO
    oldpts := vdipb.ptsout;
    oldint := vdipb.intout;
    vdipb.intout := ADR (param[0]);
    vdipb.ptsout := ADR (param[45]);
    pubs.vINTIN[0] := device;
    FOR i:=1 TO 9 DO pubs.vINTIN[i] := 1 END;   (* Wird vom GEM ignoriert *)
    pubs.vINTIN[10] := koorSys;
  END;
  vdi_if(NIL, ctrlcode);
  WITH our_cb^ DO
    vdipb.intout := oldint;
    vdipb.ptsout := oldpts;
    RETURN V_CONTRL.handle
  END;
END opnwrk0;


PROCEDURE v_opnwk (    device,
                       koorSys: CARDINAL;
                   VAR param  : ARRAY OF INTEGER): CARDINAL;
BEGIN
  RETURN opnwrk0(VDI_CTRL_CODE(V_OPNWK, 0, 0, 11), 0, device, koorSys, param);
END v_opnwk;


PROCEDURE v_opnvwk (    handle          : CARDINAL;
                        device, koorSys : CARDINAL;
                    VAR param           : ARRAY OF INTEGER): CARDINAL;
BEGIN
  RETURN opnwrk0(VDI_CTRL_CODE(OPEN_V_WORK, 0, 0, 11), handle, device, koorSys, param);
END v_opnvwk;


PROCEDURE v_clswk (handle: DeviceHandle);
BEGIN
  vdi_if(handle, VDI_CTRL_CODE(V_CLSWK, 0, 0, 0));
END v_clswk;


PROCEDURE v_clsvwk (handle: DeviceHandle);
BEGIN
  vdi_if(handle, VDI_CTRL_CODE(CLOSE_V_WORK, 0, 0, 0));
END v_clsvwk;


PROCEDURE extendedInquire (handle: DeviceHandle; VAR param: ARRAY OF INTEGER);
VAR     oldpts,oldint           :ADDRESS;
BEGIN
  IF HIGH(param)<56 THEN        (* Nicht genug Platz fuer die Parameter *)
    TRAP6(GeneralErr - TRAP6_CONT);
    RETURN;
  END;
  WITH our_cb^ DO
    oldpts := vdipb.ptsout;
    oldint := vdipb.intout;
    vdipb.intout := ADR (param[0]);
    vdipb.ptsout := ADR (param[45]);
    pubs.vINTIN[0] := 1;                     (* Erfrage erweiterte Parameter *)
  END;
  vdi_if(handle, VDI_CTRL_CODE(EXTENDED_INQUIRE, 0, 0, 1));
  WITH our_cb^ DO
    vdipb.intout := oldint;
    vdipb.ptsout := oldpts;
  END;
END extendedInquire;


PROCEDURE OpenDevice (dev, sysKoor, newMode: CARDINAL; VAR hdl: DeviceHandle);

CONST   maxParm         = 56;
TYPE PtrDeviceHandle = POINTER TO DeviceHandle;

VAR     i               : INTEGER;
        current         : DeviceHandle;
        parameters      : ARRAY[0..maxParm] OF INTEGER;
        j               : GDPFkt;
        last : PtrDeviceHandle;

  PROCEDURE newDevice (): DeviceHandle;

  VAR   d       : logInpDev;
        newdev: DeviceHandle;
  
  BEGIN
    ALLOCATE (newdev, SIZE (newdev^));
    IF newdev <> NIL THEN
      newdev^.noHdCurs := 0;
      newdev^.next := NIL;
      newdev^.magic := deviceMagic;
      newdev^.fontsLoaded := FALSE;
      FOR d := MIN (logInpDev) TO MAX (logInpDev) DO
        newdev^.curInpMode[d] := noMode;
      END;
    END;
    RETURN newdev;
  END newDevice;

  PROCEDURE deleteLast(lastp: PtrDeviceHandle);
  BEGIN
    lastp^^.magic := 0;
    DEALLOCATE (lastp^, SIZE(lastp^^))
  END deleteLast;

BEGIN

  last := ADR(our_cb^.DEVICES);
  WHILE last^ <> NIL DO
    last := ADR(last^^.next);
  END;

  current := newDevice ();
  IF current = NIL THEN hdl := NIL; RETURN END;
  last^ := current;
  current^.params.charHeight := 0;
  current^.params.charWidth  := 0;
  current^.params.cellHeight := 0;
  current^.params.cellWidth  := 0;
  current^.mode := newMode;
  IF newMode = NonVirtual THEN current^.handle := v_opnwk (dev, sysKoor, parameters)
  ELSE current^.handle := v_opnvwk (newMode, dev, sysKoor, parameters) END;
  IF current^.handle = 0
  THEN
    deleteLast (last);
    hdl := NIL;
    RETURN
  END;
  our_cb^.CURDEVICE := current;
  current^.params.rasterWidth := parameters[0];
  current^.params.rasterHeight := parameters[1];
  current^.params.pointWidth := parameters[3];
  current^.params.pointHeight := parameters[4];
  current^.params.fontSizes := parameters[5];
  current^.params.lTypes := parameters[6];
  current^.params.lWidths := parameters[7];
  current^.params.mTypes := parameters[8];
  current^.params.mSizes := parameters[9];
  current^.params.fonts := parameters[10];
  current^.params.fPatterns := parameters[11];
  current^.params.fHatchings := parameters[12];
  current^.params.noColors := parameters[39];
  current^.params.minWChar := parameters[45];
  current^.params.minHChar := parameters[46];
  current^.params.maxWChar := parameters[47];
  current^.params.maxHChar := parameters[48];
  current^.params.minWRow := parameters[49];
  current^.params.maxWRow := parameters[51];
  current^.params.minWMark := parameters[53];
  current^.params.minHMark := parameters[54];
  current^.params.maxWMark := parameters[55];
  current^.params.maxHMark := parameters[56];

  FOR j := MIN(GDPFkt) TO MAX(GDPFkt) DO
    current^.params.possibleGDPs[j] := notAvaible;
  END;
  FOR i := 0 TO parameters[14]-1 DO
    current^.params.possibleGDPs[VAL(GDPFkt, parameters[i+15]-1)] := VAL(GDPAttribute, parameters[i+25]);
  END;

  current^.params.color := (parameters[35] <> 0);
  current^.params.fill := (parameters[37] <> 0);
  current^.params.cArray := (parameters[38] <> 0);
  current^.params.grafCCtrl := VAL(InputDev, parameters[40]);
  current^.params.valueIn := VAL(InputDev, parameters[41]);
  current^.params.caseIn := VAL(InputDev, parameters[42]);
  current^.params.alphanumIn := VAL(InputDev, parameters[43]);
  current^.params.deviceType := VAL(DeviceType, parameters[44]);

  extendedInquire(current, parameters);  (* erweiterte Parameter *)

  current^.params.screen := VAL(ScreenType, parameters[0]);
  current^.params.bgColors := parameters[1];
  current^.params.useTEffects := TEffectSet(parameters[2]);
  current^.params.zooming := (parameters[3] <> 0);
  current^.params.maxRasterPls := parameters[4];
  current^.params.lookUpTab := (parameters[5] <> 0);
  current^.params.op16PerSec := parameters[6];
  current^.params.contFill := (parameters[7] <> 0);
  current^.params.textRot := VAL(TextRotType, parameters[8]);
  current^.params.noWrtModes := parameters[9];
  current^.params.maxInMode := parameters[10];
  current^.params.textJust := (parameters[11] <> 0);
  current^.params.penChange := (parameters[12] <> 0);
  current^.params.colorRibbon := (parameters[13] <> 0);
  current^.params.maxMarker := parameters[14];
  IF intinMax <= parameters[15] THEN
    current^.params.maxStrLen := intinMax (* Unser Array ist eben nicht groesser *)
  ELSE
    current^.params.maxStrLen := parameters[15]
  END;
  current^.params.noMButts := parameters[16];
  current^.params.thickLnTyps := (parameters[17] <> 0);
  current^.params.thickLnModes := parameters[18];

  hdl := current;
END OpenDevice;


PROCEDURE CloseDevice (handle: DeviceHandle);
VAR   current, next: DeviceHandle;
VAR last: POINTER TO DeviceHandle;
BEGIN
  IF setDevice (handle) THEN
    current := our_cb^.CURDEVICE;
    IF current^.fontsLoaded THEN
      unloadFonts (current, 0)
    END;
    IF current^.mode = NonVirtual THEN v_clswk (current)
    ELSE v_clsvwk (current) END;
    current^.magic := 0;
    last := ADR(our_cb^.DEVICES);
    WHILE last^ <> NIL DO
      IF last^ = current THEN
        next := current^.next;
        DEALLOCATE(last^, SIZE(current^));
        last^ := next;
        RETURN;
      END;
      last := ADR(last^^.next);
    END;
    TRAP6(IllegalPointer);
  END;
END CloseDevice;


PROCEDURE DeviceParameter (handle: DeviceHandle): PtrDevParm;
BEGIN
  IF setDevice (handle) THEN RETURN ADR (handle^.params)
  ELSE RETURN NIL END;
END DeviceParameter;


PROCEDURE GemActive (): BOOLEAN;
BEGIN
  RETURN noInits <> 0;
END GemActive;


PROCEDURE GemError (): BOOLEAN;
VAR err: BOOLEAN;
BEGIN
  err := error;
  error := FALSE;
  RETURN err;
END GemError;


PROCEDURE ErrorNumber (): INTEGER;
BEGIN
  RETURN errNum;
END ErrorNumber;


PROCEDURE selectFileTOSDependent (VAR label     : ARRAY OF CHAR; (* FIXME: gives ICE in without VAR *)
                                  VAR path, name: ARRAY OF CHAR;
                                  VAR ok        : BOOLEAN);
VAR version: CARDINAL;
BEGIN
ok := FALSE;
  testErrorCheck();
  MouseInput(TRUE);
  version := GEMVersion();
  (* GEM 3.0 kann fsel_exinput *)
  (* GEM 2.0 kann fsel_exinput nicht *)
  (* erst 1.4 kann fsel_exinput *)
  IF (version >= 0300H) OR ((version >= 0140H) AND (version < 0200H)) THEN
    selectFileExtended(label, path, name, ok)
  ELSE
    selectFile(path, name, ok)
  END;
  MouseInput(FALSE);
END selectFileTOSDependent;


PROCEDURE initGem (VAR success: BOOLEAN;
                       sys    : BOOLEAN);
VAR   oldc                            : GemHandle;
BEGIN

  success := FALSE;

  oldc := our_cb;                 (* Alte private Var's merken *)
  ALLOCATE (our_cb, SIZE (our_cb^));
  IF our_cb = NIL                 (* Speicher voll => Abbruch *) THEN
    outOfMemory();
    our_cb := oldc;
    RETURN
  END;

  (*  Init neue private Vars *)

  WITH our_cb^ DO

    LASTCB := root_cb;     (*  Neuer 'cb' ist erster in der Liste  *)

   (*  Supervision-Parameter initialisieren
    *)
    WITH SUPERVISION DO
      noGrafMouse := 0;
      noUpWind := 0;
      noMouseCtrl := 0;
      openWinds := windowSet{};
      createWinds := windowSet{};
      timerChgd := FALSE;
      butChgChgd := FALSE;
      msMoveChgd := FALSE;
      curChgChgd := FALSE;
    END;

    A_CONTRL.naddrout := 0;

    (*  AES-/VDI-Paramterbloecke mit Array-Adresse init.
     *)
    aespb.pcontrl  := ADR (A_CONTRL);
    aespb.pglobal  := ADR (GLOBAL);
    aespb.pintin   := ADR (pubs.aINTIN);
    aespb.pintout  := ADR (pubs.aINTOUT);
    aespb.paddrin  := ADR (pubs.ADDRIN);
    aespb.paddrout := ADR (pubs.ADDROUT);
    vdipb.contrl  := ADR (V_CONTRL);
    vdipb.ptsin   := ADR (pubs.PTSIN);
    vdipb.ptsout  := ADR (pubs.PTSOUT);
    vdipb.intin   := ADR (pubs.vINTIN);
    vdipb.intout  := ADR (pubs.vINTOUT);

    (*  Anmeldung beim AES
     *)
    IF NOT appIsInit[modID] THEN
      GLOBAL.ap_version := 0;
      aes_if(AES_CTRL_CODE(APPL_INIT, 0, 1, 0));
      GLOBAL.ap_id := pubs.aINTOUT[0];
      IF GLOBAL.ap_version <> 0 THEN gemStatus := available END;
      IF (gemStatus <> available) OR (GLOBAL.ap_id < 0)  (*  AES o.k.?  *) THEN
        DEALLOCATE (our_cb, SIZE (our_cb^));
        our_cb := oldc;
        RETURN
      END;
      SelectFile := selectFileTOSDependent;
      DIDAPPLINIT := TRUE;
      appIsInit[modID] := TRUE;
      error := FALSE;
    ELSE
      DIDAPPLINIT := FALSE;
      GLOBAL:= root_cb^.GLOBAL
    END;

    (*  Geraeteliste := leere Liste
     *)
    DEVICES := NIL;
    CURDEVICE := NIL;
  END;

  (*
    GetScanAddr (scan); InitChain (scan);
    scanidx:= 1; InputScan ('InitGem', scanidx);
  *)

  (*
    saveSelector;                 (* Aktuelle File-Selektor-Box retten *)
  *)

  IF sys THEN
    our_cb^.OWNER_ID := -modID;   (* Merke ID des anmeldenden Moduls *)
  ELSE
    our_cb^.OWNER_ID := modID;    (* Merke ID des anmeldenden Moduls *)
  END;
  root_cb := our_cb;            (*  Neuer cb bildet Listenanfang
                                 *  Listenordnung: historisch
                                 *)
  our_cb^.MAGIC := cbMagic;
  INC (noInits);                (* Anzahl der Level-Init's erhoehen *)

  success := TRUE;              (* Neuer Level erfolgreich angemeldet! *)
END initGem;


PROCEDURE InitApplication (VAR success: BOOLEAN);
BEGIN
  initGem(success, FALSE);
END InitApplication;


PROCEDURE SysInitApplication (VAR success: BOOLEAN);
BEGIN
  initGem(success, TRUE);
END SysInitApplication;


PROCEDURE ExitApplication;
BEGIN
  ExitGem(our_cb);
END ExitApplication;


PROCEDURE initDev (    sysKoor: CARDINAL;
                 VAR handle : DeviceHandle;
                 VAR success: BOOLEAN;
                     sys    : BOOLEAN);

CONST   screen  = 1;     (*  device = Bildschirm  *)

VAR   oldc                            : GemHandle;
      wrkStation                      : CARDINAL;
      charH, charW, cellW, cellH      : CARDINAL;
      args                            : ARRAY[0..127] OF CHAR;
      name                            : FileStr;

BEGIN
  oldc := our_cb;                 (* Alte private Vars merken *)
  initGem (success, sys);
  IF success THEN
    WITH our_cb^ DO

      (* Standardgeraet (Screen) anmelden *)
      GrafHandle (charH, charW, cellH, cellW, wrkStation);
      OpenDevice (screen, sysKoor, wrkStation, handle);
      IF handle = NIL THEN
        DEALLOCATE (our_cb, SIZE (our_cb^));
        our_cb := oldc;
        success := FALSE;
        RETURN
      END;

      WITH DEVICES^.params DO
        charHeight := charH;
        charWidth := charW;
        cellHeight := cellH;
        cellWidth := cellH;
      END;
      CURDEVICE := DEVICES;

    END;

    (* PathEnv-Vars / File-Selektor-Box init. *)
    IF NOT didShRead[modID] THEN
      (* nur beim 1. Mal, da spaeter evtl. durch rsrc_load bei alten TOS-
       * Versionen der Shell-Puffer ueberschrieben wird! *)
      ShellRead (name, args);
      SplitPath (name, HomePath, name);
      IF HomePath [0] = 0C THEN
        GetDefaultPath (HomePath)
      END;
      didShRead[modID] := TRUE
    END;
  END;
END initDev;


PROCEDURE InitGem (    sysKoor: CARDINAL;
                 VAR handle : DeviceHandle;
                 VAR success: BOOLEAN);
BEGIN
  initDev(sysKoor, handle, success, FALSE);
END InitGem;


PROCEDURE SysInitGem (    sysKoor: CARDINAL;
                    VAR handle : DeviceHandle;
                    VAR success: BOOLEAN);
BEGIN
  initDev(sysKoor, handle, success, TRUE);
END SysInitGem;


PROCEDURE closeDelWinds;
VAR i: CARDINAL;
BEGIN
#if doSupervision
  FOR i := MIN(windowSet) TO MAX(windowSet) DO
    IF i IN our_cb^.SUPERVISION.openWinds THEN
      closeWindow(i);
    END;
  END;
  FOR i := MIN(windowSet) TO MAX(windowSet) DO
    IF i IN our_cb^.SUPERVISION.createWinds THEN
      deleteWindow(i);
    END;
  END;
#endif
END closeDelWinds;


PROCEDURE isValidGemHandle (handle: GemHandle): BOOLEAN;
BEGIN
  IF handle = NIL THEN RETURN FALSE; END;
  IF handle^.MAGIC <> cbMagic THEN
    TRAP6(IllegalPointer - TRAP6_SELF);
    RETURN FALSE;
  END;
  RETURN TRUE;
END isValidGemHandle;


(*  mouseInput0 -- Ist 'start = TRUE', so werden alle mouse-hides des
 *                 aktuellen 'cb' rueckgaengig gemacht. Ist 'start = FALSE'
 *                 werden die mouse hides wieder durchgefuehrt. Also
 *                 der alte Status wiederhergestellt.
 *)

PROCEDURE mouseInput0 (start:BOOLEAN);

CONST   mouseOff        = 9;    (* Ordinalzahl des Modula-Aufzaehlungs- *)
        mouseOn         = 10;   (* typen 'MouseForm'                   *)
VAR count: CARDINAL;
    dev: DeviceHandle;
BEGIN
start := FALSE;
#if doSupervision
  (* 'GrafMouse' bearbeiten *)
  IF start THEN
    count := our_cb^.SUPERVISION.noGrafMouse;
    our_cb^.SUPERVISION.oldGrafMouse := count;
    WHILE count <> 0 DO
      GrafMouse(mouseOn, NIL);
      DEC(count);
    END;
  ELSE
    count := our_cb^.SUPERVISION.oldGrafMouse;
    WHILE count <> 0 DO
      GrafMouse(mouseOff, NIL);
      DEC(count);
    END;
  END;
  (* 'Hide-/ShowCursor' bearbeiten *)
  dev := our_cb^.DEVICES;
  WHILE dev <> NIL DO
    IF start THEN
      count := dev^.noHdCurs;
      dev^.oldHdCurs := count;
      WHILE count <> 0 DO
        showCursor(dev, FALSE);
        DEC(count);
      END;
    ELSE
      count := dev^.oldHdCurs;
      WHILE count <> 0 DO
        hideCursor(dev);
        DEC(count);
      END;
    END;
  END;
#endif
END mouseInput0;


(*  MouseInput -- Wie 'mouseInput0', nur fuer alle mouse hides, die von
 *                dieser GEM-Bibliothek durchgefuehrt wurden (alle 'cb's)
 *)

PROCEDURE MouseInput (start:BOOLEAN);

VAR     oldHdl  : GemHandle;
        current: GemHandle;
BEGIN
#if doSupervision
  oldHdl := CurrGemHandle();
  current := root_cb;
  WHILE current <> NIL DO
    IF SetCurrGemHandle(current) THEN
      mouseInput0(start);
    END;
    current := current^.LASTCB;
  END;
  SetCurrGemHandle(oldHdl);
#endif
END MouseInput;


PROCEDURE exitGem (VAR handle: GemHandle; remove: BOOLEAN);

  PROCEDURE whipFromList (VAR list: GemHandle; elem: GemHandle);
  BEGIN
    IF list = elem THEN list := elem^.LASTCB
    ELSE whipFromList (list^.LASTCB, elem) END;
  END whipFromList;


VAR   oldc    : GemHandle;

BEGIN
  (*
    GetScanAddr (scan); InitChain (scan);
    scanidx:= 1; InputScan ('ExitGem', scanidx);
  *)

  IF isValidGemHandle (handle) THEN

    our_cb := handle;

    IF our_cb^.OWNER_ID <> 0 THEN

    (*
      RemoveSelector;     (* Alte File-Selektor-Box wieder einhaengen *)
     *)
      MouseInput (TRUE);  (* Alten Mausstatus wiederherstellen *)

                            (* VDI zuruecksetzen *)

       (*  'showCursor'-Aufrufe sind schon ausgefuehrt worden
        *)
#if doSupervision
       WITH our_cb^.SUPERVISION DO    (* Melde alle GEM-IR-Vektoren ab *)
         WHILE timerChgd DO
           removeTimerVector (timerVecList^)
         END;
         WHILE butChgChgd DO
           removeButChgVector (butChgVecList^)
         END;
         WHILE msMoveChgd DO
           removeMsMoveVector (msMoveVecList^)
         END;
         WHILE curChgChgd DO
           removeCurChgVector (curChgVecList^)
         END;
       END;
#endif


      (* Devices abmelden *)

      WHILE our_cb^.DEVICES <> NIL DO
        CloseDevice (our_cb^.DEVICES);
      END;

      (* AES zuruecksetzen und eventuell Obj. abmelden *)

#if doSupervision
      WITH our_cb^.SUPERVISION DO
        WHILE noUpWind > 0 DO updateWindow (EndUpdate) END;
        WHILE noMouseCtrl > 0 DO updateWindow (EndMctrl) END;
        closeDelWinds; (* Schliesse und loesche alle Fenster dieser Modulebene *)
      END;
#endif

      IF our_cb^.DIDAPPLINIT THEN
        aes_if (AES_CTRL_CODE(APPL_EXIT, 0, 1, 0));
        our_cb^.DIDAPPLINIT:= FALSE;
        appIsInit[modID] := FALSE;
        error := FALSE
      END
    END;

    (* Kette our_cb aus der cb-Liste aus *)

    IF remove THEN
      oldc := our_cb^.LASTCB;
      whipFromList (root_cb, our_cb);
      our_cb^.MAGIC := 0;
      DEALLOCATE (our_cb, SIZE (our_cb^));
      our_cb := oldc; (* our_cb should point to the cb of the calling module *)
      DEC (noInits);
      handle := NIL;
    END;

  ELSE                  (* 'handle' is not valid *)
    gemErrorOccured()
  END;

  (*  'our_cb' mustn't be 'NIL', if there is any 'cb' left.
   *)
  IF our_cb = NIL THEN our_cb := root_cb END;
END exitGem;


PROCEDURE ExitGem (VAR handle: GemHandle);
BEGIN
  testErrorCheck();
  exitGem(handle, TRUE);
END ExitGem;


PROCEDURE CurrGemHandle (): GemHandle;
BEGIN
  RETURN our_cb;
END CurrGemHandle;


PROCEDURE SetCurrGemHandle (handle:GemHandle): [ BOOLEAN ];

BEGIN
  IF isValidGemHandle(handle) THEN
    our_cb := handle;
    RETURN TRUE;
  END;
  RETURN FALSE;
END SetCurrGemHandle;


(*  Nachfragefunktionen  *)
(*  ===================  *)

PROCEDURE GEMAvailable (): BOOLEAN;
VAR   success: BOOLEAN;
BEGIN
  IF gemStatus = unknown THEN
    (*  Als Seiteneffekt setzt 'InitGem' die Var. 'gemStatus': *)
    InitApplication (success);
    IF success THEN
      ExitApplication
    END;
  END;
  RETURN gemStatus = available
END GEMAvailable;


PROCEDURE GDOSAvailable (): BOOLEAN;
VAR retvalue: INTEGER16;
BEGIN
  ASM VOLATILE("moveq #-2,%%d0; trap #1; move.w %%d0,%0"
     : "=r"(retvalue)
     :
     : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
  );
  RETURN retvalue <> -2;
END GDOSAvailable;


PROCEDURE ApplicationID (): CARDINAL;
BEGIN
  RETURN our_cb^.GLOBAL.ap_id;
END ApplicationID;


PROCEDURE GEMVersion (): CARDINAL;
BEGIN
  IF our_cb = NIL THEN
    TRAP6(GeneralErr - TRAP6_CONT - TRAP6_SELF (* , 'GEM NOT INIT.' *) );
    RETURN 0;
  END;
  RETURN our_cb^.GLOBAL.ap_version;
END GEMVersion;


PROCEDURE MaxPoints():CARDINAL;
BEGIN
  RETURN ptsinMax DIV 2;
END MaxPoints;


PROCEDURE NoHideCursor (device:DeviceHandle) :CARDINAL;
BEGIN
  testErrorCheck();
  IF NOT setDevice(device) THEN RETURN 0 END;
  RETURN device^.noHdCurs;
END NoHideCursor;


PROCEDURE NoGrafMouseOff () :CARDINAL;
BEGIN
  testErrorCheck();
  RETURN our_cb^.SUPERVISION.noGrafMouse;
END NoGrafMouseOff;


PROCEDURE NoUpdateWindow():CARDINAL;
BEGIN
  testErrorCheck();
  RETURN our_cb^.SUPERVISION.noUpWind;
END NoUpdateWindow;


PROCEDURE NoMouseControl():CARDINAL;
BEGIN
  testErrorCheck();
  RETURN our_cb^.SUPERVISION.noMouseCtrl;
END NoMouseControl;


(*  Misc. management  *)
(*  ================  *)

VAR fathersSelectFile: FileSelectProc;
    gotFather: BOOLEAN;

PROCEDURE envelopeProc (start, child: BOOLEAN; VAR id: INTEGER);

VAR     ptr     : GemHandle;

BEGIN
  id := 0;
  IF NOT child THEN
    IF start THEN
      gotFather:= FALSE;
      IF GemActive() THEN
        fathersSelectFile := SelectFile;
        gotFather := TRUE
      END
    END
  ELSE
    IF start THEN
      INC(modID);
      appIsInit[modID] := FALSE;
      didShRead[modID] := FALSE;
      (*
       * Damit ein Prg "EasyGEM1.SelectFile" benutzen kann, ohne selbst
       * ein GemInit machen zu muessen, muss hier die Routine neu zuge-
       * wiesen werden, da EasyGEM1 nur dann selbst ein GemInit macht,
       * wenn GemActive () FALSE liefert.
       *)
      IF gotFather THEN SelectFile := fathersSelectFile END;
    ELSE

      ptr := root_cb;
      LOOP

        IF ptr = NIL THEN EXIT
        ELSIF ptr^.OWNER_ID = modID THEN
          exitGem(ptr, TRUE);
          ptr := root_cb;
        ELSIF ptr^.OWNER_ID = - modID THEN
          exitGem (ptr, FALSE);
          ptr^.OWNER_ID := 0;
          ptr := root_cb;
        ELSE ptr := ptr^.LASTCB END;
        error := FALSE

      END;
      DEC (modID);

    END;

  END;
END envelopeProc;


PROCEDURE termProc;
VAR voidI: INTEGER;
BEGIN
  (*  Current 'modID = 2'. That means all init.s but the SysInit.s are
   *  released.
   *  Decrements 'modID' to '1', to release the SysInit.s at the call
   *  of 'removalProc'.
   *)
  envelopeProc (FALSE, TRUE, voidI);
END termProc;


PROCEDURE removalProc;
VAR voidI: INTEGER;
BEGIN
  (*  Current 'modID = 1'. That means all init.s are released.
   *  Decrements 'modID' to '0'.
   *)
  envelopeProc (FALSE, TRUE, voidI);
END removalProc;


PROCEDURE emptyProc;
END emptyProc;


VAR     wsp             : MemArea;
        envlpHandle     : EnvlpCarrier;
        termHandle      : TermCarrier;
        removalHandle   : RemovalCarrier;

BEGIN
  (*  Anmeldung der Modulueberwachung
   *)
  wsp.bottom := NIL;
  wsp.length := 0;
  noInits := 0;
  modID := 2;                     (* Zaehle Module levels *)
  SetEnvelope (envlpHandle, envelopeProc, wsp);
  CatchProcessTerm (termHandle, termProc, wsp);
  CatchRemoval (removalHandle, removalProc, wsp);

  ErrorProc := emptyProc; (* ehemals: GemErrorHandler; *)
  errorProcPtr := ADR (ErrorProc);
  ErrHdlProc := emptyProc;
  ptrToErrHdler := ADR (ErrHdlProc);

  gemStatus := unknown;

END GEMEnv.
