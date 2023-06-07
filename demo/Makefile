top_srcdir = ..
include $(top_srcdir)/config.mak

PROGRAMS =
PROGRAMS += asmdemo
PROGRAMS += aesdemo
PROGRAMS += vdidemo

all:: $(PROGRAMS)

asmdemo: asmdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

aesdemo: aesdemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

vdidemo: vdidemo.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

clean::
	rm -f *.o *.a $(PROGRAMS)

$(PROGRAMS): $(top_srcdir)/src/libm2gem.a
