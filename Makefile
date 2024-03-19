OBJS	= build/main.o build/mouselist.o
SOURCE	= src/main.c src/mouselist.c
HEADER	= src/mouselist.h src/miscellaneous.h
SRCDIR = src
BUILDDIR = build
OUT	= ghub-gui
CC	 = gcc
FLAGS	 = -g -c -Wall
LFLAGS	 = -lusb-1.0

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS)

build: $(SRCDIR)
	mkdir build

build/main.o: build $(SRCDIR)/main.c
	$(CC) $(FLAGS) -o $(BUILDDIR)/main.o $(SRCDIR)/main.c

build/mouselist.o: build $(SRCDIR)/mouselist.c
	$(CC) $(FLAGS) -o $(BUILDDIR)/mouselist.o $(SRCDIR)/mouselist.c

clean:
	rm -fr $(OUT) $(BUILDDIR)
