top_srcdir = ..
include $(top_srcdir)/config.mak

PROGRAMS =
PROGRAMS += asmdemo
PROGRAMS += aesdemo
PROGRAMS += vdidemo
PROGRAMS += dhryston
#PROGRAMS += excdemo
PROGRAMS += gag.acc
#PROGRAMS += hatschi
PROGRAMS += kbddemo
#PROGRAMS += kbdtest
#PROGRAMS += localmod
#PROGRAMS += progdefd
PROGRAMS += sieve
#PROGRAMS += syslibdemo
#PROGRAMS += textdemo
#PROGRAMS += tiefe
#PROGRAMS += wdwlists


all:: $(PROGRAMS)

asmdemo: asmdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

aesdemo: aesdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

vdidemo: vdidemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

dhryston: dhryston.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

excdemo: excdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

gag.acc: gagacc.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

hatschi: hatschi.mod
	$(M2) $(M2CFLAGS) -flibs=m2cor,m2pim,m2iso,m2log  $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

kbddemo: kbddemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

kbdtest: kbdtest.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

localmod: localmod.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

progdefd: progdefd.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

sieve: sieve.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

syslibdemo: syslibdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

textdemo: textdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

tiefe: tiefe.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

wdwlists: wdwlists.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

clean::
	rm -f *.o *.a $(PROGRAMS)

$(PROGRAMS): $(top_srcdir)/src/libm2gem.a
