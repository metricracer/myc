#http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
EXECUTABLE=sailing
SOURCES=sailing.c
OBJECTS=$(SOURCES:.c=.o)

#HEADERS=smrdate.h
HEADERS=
#HEADERPATH=../include
HEADERPATH=
#INCPATH=-I$(HEADERPATH)
INCPATH=
#LIBPATH=-L../lib
LIBPATH=
#LIBS=-lm -lsmrdate
LIBS=
CC=gcc
CFLAGS=-c -Wall
DEPS = $(patsubst %,$(HEADERPATH)/%,$(HEADERS))
OBJS = $(patsubst %, %,$(OBJECTS))
LDFLAGS=

.PHONY: default all clean apply

default: $(EXECUTABLE)
all: default

%.o: %.c $(DEPS)
	$(CC) $(INCPATH) $(CFLAGS) -c $< -o $@
	#$(OBJECTS)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LIBPATH) $(LDFLAGS) $(OBJECTS) $(LIBS) -o $@
	#$(EXECUTABLE)

clean:
	-rm -f *.o
	-rm -f $(EXECUTABLE)

apply:
	cp $(EXECUTABLE) ../..
