CC := g++

LIBDIR := ./libraries/*.so
HDIR := ./headers 
LHDIR := ./libraries/distribution/include
SRCDIR := ./src
BINDIR := ./bin
OBJDIR := ./objects
EXECDIR := ./executable

CFILES := main.cpp
AUTHFILES := authentication.cpp
NETFILES := network.cpp
OBJ := $(BINDIR)/$(OBJDIR)/*.o
EXEC := rrus


ifeq ($(OS), Windows_NT)
	EXT := .exe
	CFLAGS := -I$(HDIR) -I$(LHDIR) -L$(LIBDIR) -Wall -std=c++14
	CLEAN := Remove-Item $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT) Remove-Item $(BINDIR)/$(OBJDIR)/*.o
else
	EXT := .out
	CFLAGS := -I$(HDIR) -I$(LHDIR) -L$(LIBDIR) -Wall -std=c++14
	CLEAN := rm -r $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
endif


TARGET := clean main linker


all: $(TARGET)


main: authentication.o network.o
	@echo [info] Compile main files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(CFILES) -o $(BINDIR)/$(OBJDIR)/main.o
	@echo [ok] Main files are compiled


authentication.o: 
	@echo [info] Compile authentication files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(AUTHFILES) -o $(BINDIR)/$(OBJDIR)/auth.o
	@echo [ok] Authentication files are compiled


network.o:
	@echo [info] Compile network files
	$(CC) $(CFLAGS) -c $(SRCDIR)/$(NETFILES) -o $(LIBDIR) $(BINDIR)/$(OBJDIR)/network.o
	@echo [ok] Network files are compiled


linker:
	@echo [info] Linking files together
	$(CC) $(OBJ) -o $(BINDIR)/$(EXECDIR)/$(EXEC)$(EXT)
	@echo [ok] Files linked together


clean:
	@echo [info] cleaning
	$(clean)
	@echo [ok] files removed