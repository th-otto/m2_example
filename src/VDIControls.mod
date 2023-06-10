IMPLEMENTATION MODULE VDIControls;


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Kontrollfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  29.10.87
 *
 *  MS: Michael Seyfried
 *
 *  Version   2.2     V#0021
 *)
 
(* 29.10.87     | Uebernahme aus GEMBase
 * 08.04.89     | 'LoadFonts' liefert 'loaded' jetzt richtig als VAR-Parm.
 * 02.04.90     | Anpassung auf public arrays
 * 25.02.91 TT  | unloadFonts nach GEMShare uebertragen; LoadFonts loescht die
 *                Anzahl, wenn's schiefgeht.
 * 20.05.91 MS  | LoadFonts korrigiert
 * 10.06.23 THO | Port to gm2
 *)
 
FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR, INTEGER16;

FROM    GrafBase        IMPORT Rectangle;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
IMPORT GEMVDIbase;
FROM GEMBase IMPORT PtrIntoutArray, PtrPtsoutArray;

#include "VdiCtrl.i"


PROCEDURE CloseVirtualWorkstation(handle: DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.V_CLSWK, 0, 0, 0));
END CloseVirtualWorkstation;


PROCEDURE CloseWorkstation(handle: DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.CLOSE_V_WORK, 0, 0, 0));
END CloseWorkstation;


PROCEDURE opnwrk0(ctrlcode: CARDINAL32;
                  handle  : CARDINAL;
                  VAR workin: VDIWorkInType;
                  VAR workout: VDIWorkOutType): CARDINAL;
VAR     oldpts: PtrPtsoutArray;
        oldint: PtrIntoutArray;
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  cb^.V_CONTRL.handle := handle;
  oldpts := cb^.vdipb.ptsout;
  oldint := cb^.vdipb.intout;
  cb^.vdipb.intout := ADR (workout[0]);
  cb^.vdipb.ptsout := ADR (workout[45]);
  GEMShare.vdi_if(NIL, ctrlcode);
  cb^.vdipb.intout := oldint;
  cb^.vdipb.ptsout := oldpts;
  RETURN cb^.V_CONTRL.handle;
END opnwrk0;


PROCEDURE OpenWorkstation(VAR workin: VDIWorkInType; VAR handle: INTEGER; VAR workout: VDIWorkOutType);
BEGIN
  handle := opnwrk0(VDI_CTRL_CODE(GEMOps.V_OPNWK, 0, 0, 11), 0, workin, workout);
END OpenWorkstation;


PROCEDURE OpenVirtualWorkstation(VAR workin: VDIWorkInType; VAR handle: INTEGER; VAR workout: VDIWorkOutType);
BEGIN
  handle := opnwrk0(VDI_CTRL_CODE(GEMOps.OPEN_V_WORK, 0, 0, 11), handle, workin, workout);
END OpenVirtualWorkstation;


PROCEDURE ClearWorkstation(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.CLEAR_WORKSTATION, 0, 0, 0));
END ClearWorkstation;


PROCEDURE UpdateWorkstation(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.UPDATE_WORKSTATION, 0, 0, 0));
END UpdateWorkstation;


PROCEDURE LoadFonts(handle: DeviceHandle; select: CARDINAL; VAR loaded: CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := select;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.LOAD_FONTS, 0, 0, 1));
  IF GEMShare.error THEN
    loaded := 0;
  ELSE
    loaded := GEMShare.our_cb^.pubs.vINTOUT[0];
    handle^.fontsLoaded := TRUE;
  END;
END LoadFonts;


PROCEDURE UnloadFonts(handle:DeviceHandle;select:CARDINAL);
BEGIN
  GEMShare.unloadFonts(handle, select);
END UnloadFonts;


PROCEDURE SetClipping(handle:DeviceHandle;frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.our_cb^.pubs.vINTIN[0] := 1;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_CLIPPING, 0, 2, 1));
END SetClipping;


PROCEDURE DisableClipping(handle:DeviceHandle);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := 0;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.SET_CLIPPING, 0, 2, 1));
END DisableClipping;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIControls.
