# TI-99/sim src/sdl makefile

include ../../rules.mak

ifeq ($(OS),OS_UNIX)
CFLAGS	+= `sdl2-config --cflags | sed 's|-I/|-isystem/|g'`
XLIBS	+= `sdl2-config --libs`
endif

XLIBS	+= -lpthread
XLIBS	+= `pkg-config --libs openssl`

ifeq ($(OS),OS_MACOS)
CFLAGS	+= -I /Library/Frameworks/SDL2.framework/Headers
XLIBS	+= -F /Library/Frameworks -framework SDL2
XLIBS	+= -lobjc -framework Cocoa
OBJS	+= $(CFG)/SDLMain.o
endif

FILES	+= main.cpp
FILES	+= bitmap.cpp
FILES	+= tms9919-sdl.cpp
FILES	+= tms9918a-sdl.cpp
FILES	+= ti994a-sdl.cpp

LIBS	+= ti-core.a

OBJS	+= $(FILES:%.cpp=$(CFG)/%.o)

BINDIR  := ../../bin

TARGET	:= $(BINDIR)/ti99sim-sdl

vpath %.a ../core/$(CFG)

all: $(CFG) $(BINDIR) $(TARGET)

clean:
	@-rm -Rf *~ $(CFG) $(TARGET)

$(BINDIR):
	mkdir -p $@

$(TARGET): $(OBJS) $(LIBS)
	$(CXX) -o $@ $(LDFLAGS) $^ $(XLIBS)

-include $(FILES:%.cpp=$(CFG)/%.dep)
