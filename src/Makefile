top_srcdir = ..
include $(top_srcdir)/config.mak

all:: libm2gem.a

OBJS = \
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
	PathEnv.o \
	$(empty)

libm2gem.a: $(OBJS)
	@$(RM) $@
	$(AR) rcs $@ $(OBJS)

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
PathEnv.o: PathEnv.mod PathEnv.def

clean::
	rm -f *.o *.a
