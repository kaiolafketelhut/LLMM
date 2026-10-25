VERSION ?= 1.0-rc1
KEY_ID  ?= 06828A5E95AD2BAF15C25FF55A41231A54F475F
TARBALL = oeneyecuda-$(VERSION).tar.gz
SIGFILE = $(TARBALL).asc

.PHONY: all dist sign verify clean

all: dist sign

dist:
	tar -czvf $(TARBALL) --exclude=.git --exclude=$(TARBALL) --exclude=$(SIGFILE) .

sign:
	gpg --armor --detach-sign -u $(KEY_ID) $(TARBALL)

verify:
	gpg --verify $(SIGFILE) $(TARBALL)

clean:
	rm -f $(TARBALL) $(SIGFILE)
