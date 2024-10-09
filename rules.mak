# TI-99/sim common build rules

ifndef AR
AR       := ar
endif

ifndef RANLIB
RANLIB   := ranlib
endif

ifndef CXX
CXX      := g++
endif

CFLAGS   += --std=c++2a
CFLAGS   += -fno-strict-aliasing -fexceptions -fPIC
CFLAGS   += -fdata-sections -ffunction-sections
CFLAGS   += -funsigned-char
CFLAGS   += -Wno-deprecated-declarations

LDFLAGS  += -rdynamic

# This is redundant, defined in rules.mk
# XLIBS    += -lstdc++fs

WARNINGS := -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers
WARNINGS += -Wno-implicit-fallthrough
WARNINGS += -Wcast-qual

INCLUDES := -I../../include

ifndef CFG
CFG      := Release
endif

ifeq ($(CFG),Debug)
DEBUG    := 1
endif

ifdef ARCH
CFLAGS   += -march=$(ARCH)
endif

ifdef LTO
CFLAGS   += -flto
LDFLAGS  += -flto
endif

ifdef DEBUG
CFLAGS   += -g3 -O0 -DDEBUG
else
CFLAGS   += -g3 -O3 -fomit-frame-pointer
LDFLAGS  += -g3 -O3
endif

ifdef LOGGER
CFLAGS   += -D_REENTRANT -DLOGGER
ifdef DEBUG
CFLAGS   += -DDEBUG_LOGGER
endif
endif

OS       := OS_UNKNOWN

# OSTYPE may not be exported from the shell - make our own
ifndef OSTYPE
OSTYPE   := $(shell uname -s)
endif

ifeq ($(OSTYPE),Linux)
OS       := OS_UNIX
ifneq (,$(findstring /,$(shell whereis ccache)))
CXX      := ccache $(CXX)
endif
XLIBS	 += -lstdc++fs
endif

ifeq ($(OSTYPE),FreeBSD)
OS       := OS_UNIX
endif

ifeq ($(OSTYPE),NetBSD)
OS       := OS_UNIX
endif

ifeq ($(OSTYPE),Darwin)
CXX      := c++
OS       := OS_MACOS
else
LDFLAGS  += -Wl,--gc-sections
ifdef LOGGER
LIBS     += -lrt
endif
endif

ifeq ($(OSTYPE),CYGWIN_NT-5.1)
OS       := OS_WIN32
endif

ifdef WIN32
OS       := OS_WIN32
endif

ifdef AMIGA
OS       := OS_AMIGAOS
endif

CFLAGS   += -D$(OS)

DF        = $(CFG)/$(*F)

$(CFG)/%.o : %.cpp
	@echo $<
	@$(CXX) -c $(CFLAGS) $(WARNINGS) $(INCLUDES) -MD -o $@ $<
	@cp $(DF).d $(DF).dep; \
		sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
			-e '/^$$/ d' -e 's/$$/ :/' < $(DF).d >> $(DF).dep; \
		rm -f $(DF).d

$(CFG)/%.o : %.m
	@echo $<
	@$(CC) -c $(CFLAGS) $(WARNINGS) $(INCLUDES) -o $@ $<

%.h.gch: %.h
	@echo Generating pre-compiled header for $<
	@$(CXX) $(CFLAGS) $(WARNINGS) $(INCLUDES) $<

.SUFFIXES: .cpp .c .o

all:

$(CFG):
	@mkdir $(CFG)
