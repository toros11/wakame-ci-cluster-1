ODGS := $(wildcard draw/*.odg)
PNGS := $(patsubst %.odg,%.png,${ODGS})

all:
	./init-bridges.sh
	./replace.sh
	(cd ../192.168.3.11-vnetdev/ && ./replace.sh)

updatefig: ${PNGS}

%.png: %.odg
	unoconv -n -f png -o $@.tmp $< 2> /dev/null   || \
          unoconv -f png -o $@.tmp $<                 || \
	  unoconv -n -f png -o $@.tmp $< 2> /dev/null || \
          unoconv -f png -o $@.tmp $<
	convert -resize 800x $@.tmp $@
	rm -f $@.tmp

.PHONY: distclean