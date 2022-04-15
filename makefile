CC := gcc

HDIR := ./headers
SRCDIR := ./src
BINDIR := ./bin
OBJDIR := ./objects
EXECDIR := ./executable

CFILES := main.c
OBJ := main.o
EXEC := rrus


ifeq ($(OS), Windows_NT)
	EXT := .exe
	CFLAGS := -I$(HDIR)
	CLEAN := Remove-Item $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT) Remove-Item $(BINDIR)/$(OBJDIR)/main.o
else
	EXT := .o
	CFLAGS := -I$(HDIR)
	CLEAN := rm -r $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
endif


TARGET := clean main linker


all: $(TARGET)


main: $(SRCDIR)/main.c
	@echo [info] Compile files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(CFILES) -o $(BINDIR)/$(OBJDIR)/main.o
	@echo [ok] Files are compiled


linker:
	@echo [info] Linking files together
	$(CC) $(BINDIR)/$(OBJDIR)/$(OBJ) -o $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
	@echo [ok] Files linked together
	

clean:
	@echo [info] cleaning
	$(clean)
	@echo [ok] files removed