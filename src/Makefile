top_srcdir = ..
include $(top_srcdir)/config.mak

all:: libm2gem.a

OBJS = \
	MOSGlobals.o \
	SysTypes.o \
	SysVars.o \
	SysVars2.o \
	Characters.o \
	XBIOS.o \
	BIOS.o \
	GEMDOS.o \
	GrafBase.o \
	LineA.o \
	GEMGlobals.o \
	GEMBase.o \
	GEMShare.o \
	GEMEnv.o \
	AESFile.o \
	GEMOps.o \
	AESMisc.o \
	AESEvents.o \
	AESForms.o \
	AESMenus.o \
	AESObjects.o \
	AESResources.o \
	AESWindows.o \
	AESScraps.o \
	AESShells.o \
	AESApplications.o \
	PathEnv.o \
	AESGraphics.o \
	PrgCtrl.o \
	MOSCtrl.o \
	FileNames.o \
	ErrBase.o \
	MOSConfig.o \
	ResCtrl.o \
	Directory.o \
	Clock.o \
	Excepts.o \
	MOSSupport.o \
	SysInfo.o \
	CookieJar.o \
	KbdEvents.o \
	XBRA.o \
	VDIAttributes.o \
	$(empty)

libm2gem.a: $(OBJS)
	@$(RM) $@
	$(AR) rcs $@ $(OBJS)

MOSGlobals.o: MOSGlobals.mod MOSGlobals.def
SysTypes.o: SysTypes.mod SysTypes.def
SysVars.o: SysVars.mod SysVars.def
SysVars2.o: SysVars2.mod SysVars2.def
Characters.o: Characters.mod Characters.def
XBIOS.o: XBIOS.mod XBIOS.def
BIOS.o: BIOS.mod BIOS.def
GEMDOS.o: GEMDOS.mod GEMDOS.def
GrafBase.o: GrafBase.mod GrafBase.def
LineA.o: LineA.mod LineA.def
GEMGlobals.o: GEMGlobals.mod GEMGlobals.def
GEMBase.o: GEMBase.mod GEMBase.def
GEMShare.o: GEMShare.mod GEMShare.def GEMConf.def GEMOps.def
GEMEnv.o: GEMEnv.mod GEMEnv.def GEMConf.def GEMOps.def
AESFile.o: AESFile.mod AESFile.def GEMOps.def
GEMOps.o: GEMOps.mod GEMOps.def
AESMisc.o: AESMisc.mod AESMisc.def GEMOps.def
AESEvents.o: AESEvents.mod AESEvents.def GEMOps.def
AESForms.o: AESForms.mod AESForms.def GEMOps.def
AESMenus.o: AESMenus.mod AESMenus.def GEMOps.def
AESObjects.o: AESObjects.mod AESObjects.def GEMOps.def
AESResources.o: AESResources.mod AESResources.def GEMOps.def
AESWindows.o: AESWindows.mod AESWindows.def GEMOps.def
AESScraps.o: AESScraps.mod AESScraps.def GEMOps.def
AESShells.o: AESShells.mod AESShells.def GEMOps.def
AESApplications.o: AESApplications.mod AESApplications.def GEMOps.def
PathEnv.o: PathEnv.mod PathEnv.def
AESGraphics.o: AESGraphics.mod AESGraphics.def
PrgCtrl.o: PrgCtrl.mod PrgCtrl.def
MOSCtrl.o: MOSCtrl.mod MOSCtrl.def
FileNames.o: FileNames.mod FileNames.def
ErrBase.o: ErrBase.mod ErrBase.def
MOSConfig.o: MOSConfig.mod MOSConfig.def
ResCtrl.o: ResCtrl.mod ResCtrl.def
Directory.o: Directory.mod Directory.def
Clock.o: Clock.mod Clock.def
Excepts.o: Excepts.mod Excepts.def
MOSSupport.o: MOSSupport.mod MOSSupport.def
SysInfo.o: SysInfo.mod SysInfo.def
CookieJar.o: CookieJar.mod CookieJar.def
KbdEvents.o: KbdEvents.mod KbdEvents.def
XBRA.o: XBRA.mod XBRA.def
VDIAttributes.o: VDIAttributes.mod VDIAttributes.def

clean::
	rm -f *.o *.a
