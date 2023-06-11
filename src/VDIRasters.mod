IMPLEMENTATION MODULE VDIRasters;


(*  MEGAMAX MODULA 2 GEM-Library :  Die VDI Rasterfunktionen
 *
 *  Autor: Manuel Chakravarty           Erstellt :  04.11.87
 *
 *  Version   2.2     V#0019
 *)

(*  04.11.87    | Uebernahme aus 'GEMBase' und 'GEMExt'
 *  02.04.90    | Anpassung an public arrays
 *  20.11.91    | PixelState geht nun ('set' wurde auf Stack vergessen)
 *)

FROM SYSTEM IMPORT CARDINAL16, CARDINAL32, SHIFT, ADR, ADDRESS, INTEGER16;

IMPORT  GEMShare;
IMPORT MOSGlobals;
IMPORT GEMOps;

#include "VdiCtrl.i"


PROCEDURE CopyOpaque(handle:DeviceHandle; sourceMem,destMem:PtrMemFormDef;
                     sourceFrame,destFrame:Rectangle;mode:BitOperation);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(sourceFrame, pxy^);
  INC(pxy, SIZE(pxy^));
  GEMShare.getCalcedFrame(destFrame, pxy^);
  GEMShare.our_cb^.V_CONTRL.ptr1.ptr := sourceMem;
  GEMShare.our_cb^.V_CONTRL.ptr2.ptr := destMem;
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(mode);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.COPY_RASTER_OPAQUE, 0, 4, 1));
END CopyOpaque;


PROCEDURE CopyRasterOpaque(handle: DeviceHandle; mode: INTEGER; VAR pxy: BigPxyArrayType; sourceMem: ADDRESS; destMem: ADDRESS);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := pxy[0];
  GEMShare.our_cb^.pubs.PTSIN[1] := pxy[1];
  GEMShare.our_cb^.pubs.PTSIN[2] := pxy[2];
  GEMShare.our_cb^.pubs.PTSIN[3] := pxy[3];
  GEMShare.our_cb^.pubs.PTSIN[4] := pxy[4];
  GEMShare.our_cb^.pubs.PTSIN[5] := pxy[5];
  GEMShare.our_cb^.pubs.PTSIN[6] := pxy[6];
  GEMShare.our_cb^.pubs.PTSIN[7] := pxy[7];
  GEMShare.our_cb^.V_CONTRL.ptr1.ptr := sourceMem;
  GEMShare.our_cb^.V_CONTRL.ptr2.ptr := destMem;
  GEMShare.our_cb^.pubs.vINTIN[0] := mode;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.COPY_RASTER_OPAQUE, 0, 4, 1));
END CopyRasterOpaque;


PROCEDURE CopyTrans(handle:DeviceHandle;sourceMem,destMem:PtrMemFormDef;
                    sourceFrame,destFrame:Rectangle;mode:WritingMode;
                    setCol,unsetCol:CARDINAL);
VAR pxy: POINTER TO GEMShare.PXY4;
BEGIN
  pxy := ADR(GEMShare.our_cb^.pubs.PTSIN);
  GEMShare.getCalcedFrame(sourceFrame, pxy^);
  INC(pxy, SIZE(pxy^));
  GEMShare.getCalcedFrame(destFrame, pxy^);
  GEMShare.our_cb^.V_CONTRL.ptr1.ptr := sourceMem;
  GEMShare.our_cb^.V_CONTRL.ptr2.ptr := destMem;
  GEMShare.our_cb^.pubs.vINTIN[0] := ORD(mode);
  GEMShare.our_cb^.pubs.vINTIN[1] := setCol;
  GEMShare.our_cb^.pubs.vINTIN[2] := unsetCol;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.COPY_RASTER_TRANSP, 0, 4, 3));
END CopyTrans;


PROCEDURE CopyRasterTransparent(handle: DeviceHandle; mode: INTEGER; VAR pxy: BigPxyArrayType; sourceMem: ADDRESS; destMem: ADDRESS; VAR setcol: SmallArrayType);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := pxy[0];
  GEMShare.our_cb^.pubs.PTSIN[1] := pxy[1];
  GEMShare.our_cb^.pubs.PTSIN[2] := pxy[2];
  GEMShare.our_cb^.pubs.PTSIN[3] := pxy[3];
  GEMShare.our_cb^.pubs.PTSIN[4] := pxy[4];
  GEMShare.our_cb^.pubs.PTSIN[5] := pxy[5];
  GEMShare.our_cb^.pubs.PTSIN[6] := pxy[6];
  GEMShare.our_cb^.pubs.PTSIN[7] := pxy[7];
  GEMShare.our_cb^.V_CONTRL.ptr1.ptr := sourceMem;
  GEMShare.our_cb^.V_CONTRL.ptr2.ptr := destMem;
  GEMShare.our_cb^.pubs.vINTIN[0] := mode;
  GEMShare.our_cb^.pubs.vINTIN[1] := setcol[0];
  GEMShare.our_cb^.pubs.vINTIN[2] := setcol[1];
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.COPY_RASTER_TRANSP, 0, 4, 3));
END CopyRasterTransparent;


PROCEDURE TransformForm(handle:DeviceHandle;VAR sourceMem,destMem:MemFormDef);
BEGIN
  GEMShare.our_cb^.V_CONTRL.ptr1.ptr := ADR(sourceMem);
  GEMShare.our_cb^.V_CONTRL.ptr2.ptr := ADR(destMem);
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.TRANSFORM_FORM, 0, 0, 0));
END TransformForm;


PROCEDURE PixelState(handle:DeviceHandle; toTest:Point; VAR pel:CARDINAL; VAR color:CARDINAL);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := toTest.x;
  GEMShare.our_cb^.pubs.PTSIN[1] := toTest.y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GET_PIXEL, 0, 1, 0));
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  pel := GEMShare.our_cb^.pubs.vINTOUT[0];
END PixelState;


PROCEDURE GetPixel(handle: DeviceHandle; x, y: INTEGER; VAR pel: INTEGER; VAR color: INTEGER);
BEGIN
  GEMShare.our_cb^.pubs.PTSIN[0] := x;
  GEMShare.our_cb^.pubs.PTSIN[1] := y;
  GEMShare.vdi_if(handle, VDI_CTRL_CODE(GEMOps.GET_PIXEL, 0, 1, 0));
  color := GEMShare.our_cb^.pubs.vINTOUT[1];
  pel := GEMShare.our_cb^.pubs.vINTOUT[0];
END GetPixel;


BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END VDIRasters.
