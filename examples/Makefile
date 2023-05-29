top_srcdir = ..
include $(top_srcdir)/config.mak

PROGRAMS =
PROGRAMS += hello
PROGRAMS += hellotos

all:: $(PROGRAMS)

hello: hello.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@

hellotos: hellotos.mod
	$(M2) $(M2CFLAGS) $(M2LDFLAGS) $< -o $@ -L$(top_srcdir)/src -lm2gem

clean::
	rm -f *.o *.a $(PROGRAMS)

$(PROGRAMS): $(top_srcdir)/src/libm2gem.a
