SUBDIRS = src demo examples


all clean::
	for i in $(SUBDIRS); do $(MAKE) -C $$i $@; done
