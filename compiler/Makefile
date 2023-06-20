top_srcdir = .

CROSS = m68k-atari-mint-
M2 = $(CROSS)gm2 -I$(top_srcdir)
AR = $(CROSS)ar
M2CFLAGS = -O2 -Wall -funbounded-by-reference
M2CFLAGS += -flibs=m2log,m2pim,m2iso
M2LDFLAGS =
ifneq ($(shell echo "" | $(CROSS)gcc -dM -E - | grep __ELF__),)
M2CFLAGS += -ffunction-sections -fdata-sections
M2LDFLAGS += -Wl,--gc-sections
endif

OBJS = \
	Conversions.o \
	DecoMachineDef.o \
	FileLookup.o \
	FileNames.o \
	FilePool.o \
	MCBase.o \
	MCFileNames.o \
	MCMnemonics.o \
	MCOperations.o \
	MCP1IO.o \
	MCP1Ident.o \
	MCP1Reals.o \
	MCP2IO.o \
	MCP2Ident.o \
	MCP2Reference.o \
	MCP3IO.o \
	MCP3Ident.o \
	MCP4AttributSys.o \
	MCP4CallSys.o \
	MCP4CodeSys.o \
	MCP4ExpressionSys.o \
	MCP4Global.o \
	MCSymFileDefs.o \
	NewStreams.o \
	Options.o \
	WriteStrings.o \
	MCPublic.o \
	Program.o \
	ProgramMessage.o \
	OutFile.o \
	$(empty)

PROGRAMS = 
PROGRAMS += MCPass1
PROGRAMS += MCPass2
#PROGRAMS += MCPass3
PROGRAMS += MCPass4
#PROGRAMS += MCInit
PROGRAMS += MCListing
PROGRAMS += Decode
PROGRAMS += MCSymFile

all::

.mod.o:
	$(M2) $(M2CFLAGS) -c $< -o $@

all:: $(PROGRAMS)

MCPass1: MCPass1.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCPass2: MCPass2.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCPass3: MCPass3.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCPass4: MCPass4.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCInit: MCInit.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCListing: MCListing.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

Decode: Decode.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

MCSymFile: MCSymFile.mod libmccomp.a
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) -o $@ $< -L. -lmccomp

libmccomp.a: $(OBJS)
	@$(RM) $@
	$(AR) rcs $@ $(OBJS)

MCBase.o: MCBase.mod MCBase.def

clean::
	rm -f *.o *.a $(PROGRAMS)
