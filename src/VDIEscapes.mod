IMPLEMENTATION MODULE VDIEscapes;
#define REF


(*      Implementation der MEGAMAX MODULA II GEM Library (Escape-Funk.)
 *
 *      geschrieben von Manuel Chakravarty
 *
 *      Version 2.2     V#0038      Erstellt Maerz-Oktober 1987
 *)

(*  ???????? TT  V2.1   | REF-Parm.
 *  02.04.90 MCH V2.2   | Anpassung auf public arrays
 *  15.09.91 MS         | WriteToMetafile korrigiert
 *  10.06.23 THO        | Port to gm2
 *)

FROM SYSTEM IMPORT CARDINAL32, SHIFT, ADR, INTEGER16;


FROM    GrafBase        IMPORT Point, Rectangle;

IMPORT GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;
FROM GEMBase IMPORT PtrIntinArray, PtrPtsinArray;

#include "VdiCtrl.i"


PROCEDURE GetCharCells(handle:DeviceHandle;VAR rows,columns:CARDINAL16);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VQ_CHCELLS, 0, 0));
  rows := GEMShare.our_cb^.pubs.vINTOUT[0];
  columns := GEMShare.our_cb^.pubs.vINTOUT[1];
END GetCharCells;


PROCEDURE ExitCursorMode(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_EXIT_CUR, 0, 0));
END ExitCursorMode;


PROCEDURE EnterCursorMode(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_ENTER_CUR, 0, 0));
END EnterCursorMode;


PROCEDURE CursorUp(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURUP, 0, 0));
END CursorUp;


PROCEDURE CursorDown(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURDOWN, 0, 0));
END CursorDown;


PROCEDURE CursorRight(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURRIGHT, 0, 0));
END CursorRight;


PROCEDURE CursorLeft(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURLEFT, 0, 0));
END CursorLeft;


PROCEDURE CursorHome(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURHOME, 0, 0));
END CursorHome;


PROCEDURE EraseToEndOfScreen(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_EEOS, 0, 0));
END EraseToEndOfScreen;


PROCEDURE EraseToEndOfLine(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_EEOL, 0, 0));
END EraseToEndOfLine;


PROCEDURE LocateCursor(handle:DeviceHandle;column,row:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := row;
  GEMShare.our_cb^.pubs.vINTIN[1] := column;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VS_CURADDRESS, 0, 2));
END LocateCursor;


PROCEDURE CursorText(handle:DeviceHandle;REF str:ARRAY OF CHAR);
VAR n: CARDINAL16;
BEGIN
  n := GEMShare.stringIntoINTIN(str, 0);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CURTEXT, 0, n));
END CursorText;


PROCEDURE ReverseVideoOn(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_RVON, 0, 0));
END ReverseVideoOn;


PROCEDURE ReverseVideoOff(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_RVOFF, 0, 0));
END ReverseVideoOff;


PROCEDURE GetCursorLocation(handle:DeviceHandle;VAR column,row:CARDINAL16);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VQ_CURADDRESS, 0, 0));
  row := GEMShare.our_cb^.pubs.vINTOUT[0];
  column := GEMShare.our_cb^.pubs.vINTOUT[1];
END GetCursorLocation;


PROCEDURE TabletStatus(handle:DeviceHandle):BOOLEAN;
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VQ_TABSTATUS, 0, 0));
  RETURN GEMShare.our_cb^.pubs.vINTOUT[0] <> 0;
END TabletStatus;


PROCEDURE HardCopy(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_HARDCOPY, 0, 0));
END HardCopy;


PROCEDURE DisplayCursor(handle:DeviceHandle;row,column:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := row;
  GEMShare.our_cb^.pubs.PTSIN[1] := column;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_DSPCUR, 1, 0));
END DisplayCursor;


PROCEDURE RemoveCursor(handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_RMCUR, 0, 0));
END RemoveCursor;

(*      Folgende Routinen sind nur bei geladenem GDOS verfuegbar.
 *)

PROCEDURE FormAdvance (handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_FORM_ADV, 0, 0));
END FormAdvance;


PROCEDURE OutputWindow (handle:DeviceHandle; frame:Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_OUTPUT_WINDOW, 2, 0));
END OutputWindow;


PROCEDURE ClearDisplayList (handle:DeviceHandle);
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_CLEAR_DISP_LIST, 0, 0));
END ClearDisplayList;


PROCEDURE OutputBitImage (handle:DeviceHandle; REF fname:ARRAY OF CHAR;
                          aspect:AspectRatio;
   xscale, yscale, halign, valign: CARDINAL16; frame: Rectangle);
VAR pxy: POINTER TO GEMShare.PXY4;
    n: CARDINAL;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(frame, pxy^);
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(aspect);
  GEMShare.our_cb^.pubs.vINTIN[1] := xscale;
  GEMShare.our_cb^.pubs.vINTIN[2] := yscale;
  GEMShare.our_cb^.pubs.vINTIN[3] := halign;
  GEMShare.our_cb^.pubs.vINTIN[4] := valign;
  n := GEMShare.stringIntoINTIN(fname, 5);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_BIT_IMAGE, 2, n));
END OutputBitImage;


PROCEDURE SelectPalette (handle:DeviceHandle; palette:CARDINAL16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := palette;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VS_PALETTE, 0, 1));
END SelectPalette;


PROCEDURE GetFilmTypes (handle:DeviceHandle; VAR films:ARRAY OF CHAR);
VAR i, n: CARDINAL;
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VQP_FILMS, 0, 0));
  n := GEMShare.our_cb^.V_CONTRL.nintout;
  IF n > HIGH(films) THEN n := HIGH(films) + 1; END;
  FOR i := 0 TO n - 1 DO
    films[i] := GEMShare.our_cb^.pubs.vINTOUT[i];
  END;
END GetFilmTypes;


PROCEDURE GetDriverState (handle:DeviceHandle; VAR port, film:CARDINAL16;
                          VAR lightness:INTEGER16; VAR interlace:BOOLEAN;
                          VAR planes:CARDINAL16; VAR indexes:IndexArray);
BEGIN
  (* NYI *)
  handle := NIL;
  port := 0;
  film := 0;
  lightness := 0;
  interlace := FALSE;
  planes := 0;
  indexes[0,0] := 0C;
END GetDriverState;


PROCEDURE SetDriverState (handle:DeviceHandle; port, film:CARDINAL16;
                          lightness:INTEGER16; interlace:BOOLEAN;
                          planes:CARDINAL16; REF indexes:IndexArray);
BEGIN
  (* NYI *)
  handle := NIL;
  port := 0;
  film := 0;
  lightness := 0;
  interlace := FALSE;
  planes := 0;
  IF indexes[0,0] <> 0C THEN END;
END SetDriverState;


PROCEDURE SaveDriverState (handle:DeviceHandle);
BEGIN
  (* NYI *)
  handle := NIL;
END SaveDriverState;


PROCEDURE SuppressPaletteMsg (handle:DeviceHandle);
BEGIN
  (* NYI *)
  handle := NIL;
END SuppressPaletteMsg;


PROCEDURE PaletteError (handle:DeviceHandle): CARDINAL16;
BEGIN
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VSP_ERROR, 0, 0));
  RETURN GEMShare.our_cb^.pubs.vINTOUT[0];
END PaletteError;


PROCEDURE MetafileExtents (handle:DeviceHandle; min, max:Point);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := min.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := min.y;
  GEMShare.our_cb^.pubs.PTSIN[2] := max.x;
  GEMShare.our_cb^.pubs.PTSIN[3] := max.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_META_EXTENTS, 2, 0));
END MetafileExtents;


PROCEDURE WriteToMetafile (handle:DeviceHandle;
                           numIntin:CARDINAL16; REF intin:ARRAY OF INTEGER16;
                           numPtsin:CARDINAL16; REF ptsin:ARRAY OF INTEGER16);
VAR     oldpts: PtrPtsinArray;
        oldint: PtrIntinArray;
VAR cb: GEMShare.GemHandle;
BEGIN
  cb := GEMShare.our_cb;
  oldpts := cb^.vdipb.ptsin;
  oldint := cb^.vdipb.intin;
  cb^.vdipb.intin := ADR (intin);
  cb^.vdipb.ptsin := ADR (ptsin);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_WRITE_META, numPtsin, numIntin));
  cb^.vdipb.intin := oldint;
  cb^.vdipb.ptsin := oldpts;
END WriteToMetafile;


PROCEDURE SetVDIFileName (handle:DeviceHandle; REF fname:ARRAY OF CHAR);
VAR n: CARDINAL;
BEGIN
  n := GEMShare.stringIntoINTIN(fname, 0);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.VM_FILENAME, 0, n));
END SetVDIFileName;


PROCEDURE SetLineOffset (handle:DeviceHandle; offset:INTEGER16);
BEGIN
  GEMShare.our_cb^.pubs.vINTIN[0] := offset;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_OFFSET, 0, 1));
END SetLineOffset;


PROCEDURE InitSystemFont (handle:DeviceHandle; fontHeader:ADDRESS);
VAR p: POINTER TO ADDRESS;
BEGIN
  p := ADR(GEMShare.our_cb^.pubs.vINTIN);
  p^ := fontHeader;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.ESCAPE, GEMOps.V_FONTINIT, 0, 2));
END InitSystemFont;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIEscapes.
