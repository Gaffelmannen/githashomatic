CC=gcc
CFLAGS=-g -Wall
SOURCES= main.c
ABBREVHASH=git rev-parse --short HEAD | tr -d "\n"
GITSTATUS=./gitstatus.sh | tr -d "\n"
HOST=$(shell hostname)
EXECUTABLE=githashomatic


.PHONY : cleanall cleanobj cleanhash

host :
	@/bin/echo $(HOST)

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
	$(ABBREVHASH) >> $@ && \
	echo '"\n#endif' >> $@
	@/bin/echo '#ifndef GITSTATUS' >> $@
	@/bin/echo -n '#define GITSTATUS "' >> $@
	$(GITSTATUS) >> $@ && \
	echo '"\n#endif' >> $@
	@/bin/echo '#ifndef HOST' >> $@
	@/bin/echo -n '#define HOST "' >> $@
	@/bin/echo -n $(HOST) >> $@
	echo '"\n#endif' >> $@