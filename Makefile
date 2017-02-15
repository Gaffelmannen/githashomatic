CC=gcc
CFLAGS=-g -Wall
SOURCES= main.c
REVISION=git rev-parse --short HEAD | tr -d "\n"
EXECUTABLE=githashomatic



.PHONY : cleanall cleanobj cleanhash

clean : cleanall

cleanall : cleanobj cleanhash
	rm -f $(EXECUTABLE)

cleanobj :
	rm -f *.o

cleanhash :
	rm -f thehash.h

.PHONY all: thehash.h
	CC $(CFLAGS) -o $(EXECUTABLE) $(SOURCES) 

thehash.h:
	@/bin/echo '#ifndef THE_HASH' > $@
	@/bin/echo -n '#define THE_HASH "' >> $@
	$(REVISION) >> $@ && \
	echo '"\n#endif' >> $@
