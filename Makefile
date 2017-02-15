CC=gcc
SOURCES= main.c thehash.h
REVISION=git rev-parse --short HEAD | tr -d "\n"

.PHONY : cleanall cleanobj cleanhash

cleanall : cleanobj cleanhash
	rm main

cleanobj :
	rm *.o

cleanhash :
	rm -f thehash.h

.PHONY all: thehash.h
	CC $(SOURCES)

thehash.h:
	@/bin/echo '#ifndef THE_HASH' > $@
	@/bin/echo -n '#define THE_HASH "' >> $@
	$(REVISION) >> $@ && \
	echo '"\n#endif' >> $@
