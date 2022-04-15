CC := gcc

HDIR := ./headers
SRCDIR := ./src
BINDIR := ./bin
OBJDIR := ./objects
EXECDIR := ./executable

CFILES := main.c
AUTHFILES := authentication.c
NETFILES := network.c
OBJ := $(BINDIR)/$(OBJDIR)/main.o $(BINDIR)/$(OBJDIR)/auth.o $(BINDIR)/$(OBJDIR)/network.o
EXEC := rrus


ifeq ($(OS), Windows_NT)
	EXT := .exe
	CFLAGS := -I$(HDIR)
	CLEAN := Remove-Item $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT) Remove-Item $(BINDIR)/$(OBJDIR)/main.o Remove-Item $(BINDIR)/$(OBJDIR)/auth.o Remove-Item $(BINDIR)/$(OBJDIR)/network.o
else
	EXT := .o
	CFLAGS := -I$(HDIR)
	CLEAN := rm -r $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
endif


TARGET := clean main authentication network linker


all: $(TARGET)


main: $(SRCDIR)/main.c
	@echo [info] Compile main files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(CFILES) -o $(BINDIR)/$(OBJDIR)/main.o
	@echo [ok] Main files are compiled


authentication: 
	@echo [info] Compile authentication files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(AUTHFILES) -o $(BINDIR)/$(OBJDIR)/auth.o
	@echo [ok] Authentication files are compiled


network:
	@echo [info] Compile network files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(NETFILES) -o $(BINDIR)/$(OBJDIR)/network.o
	@echo [ok] Network files are compiled


linker:
	@echo [info] Linking files together
	$(CC) $(OBJ) -o $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
	@echo [ok] Files linked together


clean:
	@echo [info] cleaning
	$(clean)
	@echo [ok] files removed