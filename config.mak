CROSS = m68k-atari-mint-
M2 = $(CROSS)gm2 -I$(top_srcdir)/src
AR = $(CROSS)ar
M2CFLAGS = -fpim -Os -Werror
M2LDFLAGS =
ifneq ($(shell echo "" | $(CROSS)gcc -dM -E - | grep __ELF__),)
M2CFLAGS += -ffunction-sections -fdata-sections
M2LDFLAGS += -Wl,--gc-sections
endif

all::

.mod.o:
	$(M2) $(M2CFLAGS) -c $< -o $@

