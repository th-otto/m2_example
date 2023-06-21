MODULE decsym;

FROM SYSTEM IMPORT ADDRESS, ADR;
IMPORT GEMDOS;
IMPORT AESGraphics;
IMPORT AESWindows;
FROM GEMVDIbase IMPORT PxyArrayType, BigPxyArrayType, VDIWorkInType, VDIWorkOutType;
IMPORT VDIAttribs;
IMPORT VDIOutputs;
IMPORT VDIControls;
IMPORT VDIRasters;
IMPORT AESApplications;
IMPORT AESForms;
IMPORT AESShells;
IMPORT AESEvents;
IMPORT Strings;
IMPORT AppWindow;
IMPORT ExecUtil;

VAR dummy: INTEGER;
VAR name: ARRAY [0..127] OF CHAR;
VAR handle: INTEGER;
VAR pos: LONGCARD;
VAR addr: ADDRESS;
VAR count: LONGCARD;
VAR pxy: PxyArrayType;
VAR pxy2: BigPxyArrayType;
VAR workin: VDIWorkInType;
VAR workout: VDIWorkOutType;
VAR where: CARDINAL;

BEGIN
  GEMDOS.Open(name, 0, handle);
  GEMDOS.Create(name, 0, handle);
  IF GEMDOS.Close(handle) THEN END;
  GEMDOS.Read(handle, count, NIL);
  GEMDOS.Write(handle, count, NIL);
  GEMDOS.Seek(0, handle, GEMDOS.beginning, pos);
  GEMDOS.GetPath(name, 0);
  GEMDOS.Alloc(0, addr);
  IF GEMDOS.Free(addr) THEN END;
  
  AESGraphics.GrafGrowBox(0, 0, 0, 0, 0, 0, 0, 0);
  AESGraphics.GrafShrinkBox(0, 0, 0, 0, 0, 0, 0, 0);
  IF AESGraphics.GrafHandle(dummy, dummy, dummy, dummy) = 0 THEN END;
  AESGraphics.GrafMouse(0, NIL);
  
  IF AESWindows.WindowCreate(0, 0, 0, 0, 0) = 0 THEN END;
  AESWindows.WindowOpen(0, 0, 0, 0, 0);
  AESWindows.WindowClose(0);
  AESWindows.WindowDelete(0);
  AESWindows.WindowGet(0, 0, dummy, dummy, dummy, dummy);
  AESWindows.WindowSet(0, 0, 0, 0, 0, 0);
  AESWindows.WindowUpdate(0);
  
  VDIAttribs.SetGraphicTextAlignment(0, 0, 0, dummy, dummy);
  IF VDIAttribs.SetFillInteriorStyle(0, 0) = 0 THEN END;
  IF VDIAttribs.SetFillColour(0, 0) = 0 THEN END;
  
  VDIOutputs.GraphicText(0, 0, 0, name);
  VDIOutputs.FillRectangle(0, pxy);
  
  VDIControls.OpenVirtualWorkstation(workin, handle, workout);
  VDIControls.CloseVirtualWorkstation(handle);
  
  VDIRasters.CopyRasterOpaque(0, 0, pxy2, NIL, NIL);

  IF AESApplications.ApplInitialise() = 0 THEN END;
  AESApplications.ApplRead(0, 0, NIL);
  AESApplications.ApplWrite(0, 0, NIL);
  IF AESApplications.ApplFind(name) = 0 THEN END;
  AESApplications.ApplExit();
  
  IF AESForms.FormAlert(0, name) = 0 THEN END;
  IF AESForms.FormError(0) = 0 THEN END;
  AESForms.FileSelectorInput(ADR(name), ADR(name), dummy);
  
  AESShells.ShellRead(NIL, NIL);
  AESShells.ShellWrite(0, 0, 0, NIL, NIL);

  Strings.Assign(name, '');
  Strings.Insert(name, 'hello', 0);
  Strings.Concat('', '', name);
  IF Strings.Length(name) > 0 THEN END;
  IF Strings.Pos(name, '.', 0, where) THEN END;
  
  AESEvents.EventMessage(NIL);
  AppWindow.Clear();

  ExecUtil.IOError(0, FALSE);
    
END decsym.
