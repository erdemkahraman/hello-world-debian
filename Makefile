prefix = /usr/local

all: src/hello-world

src/hello-world: src/hello-world.c
	@echo "CFLAGS=$(CFLAGS)" | \
				fold -s -w 70 | \
				sed -e 's/^/# /'
				$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/hello-world
	install -D src/hello-world \
		$(DESTDIR)$(prefix)/bin/hello-world

clean:
		-rm -f src/hello-world

distclean: clean

uninstall:
		-rm -f $(DESTDIR)$(prefix)/bin/hello-world

.PHONY: all install clean distclean uninstall