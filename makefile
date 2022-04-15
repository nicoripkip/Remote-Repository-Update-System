CC := gcc

HDIR := ./headers
SRCDIR := ./src
BINDIR := ./bin

CFILES := main.c
OBJ := main.o

ifeq ($(OS), Windows_NT)
	EXT := .o
	CFLAGS := -I$(HDIR)

else
	EXT := .o
	CFLAGS := -I$(HDIR)

endif

TARGET := clean main linker


all: $(TARGET)


main: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(CFILES) -o $(BINDIR)/main$(EXT)


linker:
	$(CC) $(BINDIR)/$(OBJ) -o $(BINDIR)/rrus.exe


clean:
	@echo [info] cleaning

	@echo [ok] files removed