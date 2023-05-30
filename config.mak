CROSS = m68k-atari-mint-
M2 = $(CROSS)gm2 -I$(top_srcdir)/src
AR = $(CROSS)ar
M2CFLAGS = -fcpp -O2 -Wall -Werror -funbounded-by-reference
# make sure we dont search in the Logitech libraries:
# String.Insert has conflicting parameters?
M2CFLAGS += -flibs=m2pim,m2iso
M2LDFLAGS =
# the cc1gm2 backend sometimes complains about -sys-root being passed
M2CFLAGS += -Wno-complain-wrong-lang
ifneq ($(shell echo "" | $(CROSS)gcc -dM -E - | grep __ELF__),)
M2CFLAGS += -ffunction-sections -fdata-sections
M2LDFLAGS += -Wl,--gc-sections
endif

all::

.mod.o:
	$(M2) $(M2CFLAGS) -c $< -o $@

