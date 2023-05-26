top_srcdir = ..
include $(top_srcdir)/config.mak

all:: libm2gem.a

OBJS = \
	SysTypes.o \
	SysVars.o \
	SysVars2.o \
	Characters.o \
	XBIOS.o \
	$(empty)

libm2gem.a: $(OBJS)
	@$(RM) $@
	$(AR) rcs $@ $(OBJS)

SysTypes.o: SysTypes.mod SysTypes.def
SysVars.o: SysVars.mod SysVars.def
SysVars2.o: SysVars2.mod SysVars2.def
Characters.o: Characters.mod Characters.def
XBIOS.o: XBIOS.mod XBIOS.def

clean::
	rm -f *.o *.a
