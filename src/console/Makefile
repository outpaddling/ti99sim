# TI-99/sim src/console makefile

include ../../rules.mak

FILES	+= gpl.cpp
FILES	+= screenio.cpp
FILES	+= ti-main.cpp
FILES	+= ti994a-console.cpp
FILES	+= tms9918a-console.cpp

LIBS	+= ti-core.a

BINDIR	:= ../../bin

TARGET	:= $(BINDIR)/ti99sim-console

ifdef DEBUG
XLIBS	+= -Wl,-rpath,/usr/lib -lpthread
endif

XLIBS	+= `pkg-config --libs openssl`

OBJS	+= $(FILES:%.cpp=$(CFG)/%.o)

vpath %.a ../core/$(CFG)

all: $(CFG) $(BINDIR) $(TARGET)

clean:
	@-rm -Rf *~ $(CFG) $(TARGET)

$(BINDIR):
	mkdir -p $@

$(BINDIR)/ti99sim-console: $(OBJS) $(LIBS)
	$(CXX) -o $@ $(LDFLAGS) $^ $(XLIBS)

-include $(FILES:%.cpp=$(CFG)/%.dep)
