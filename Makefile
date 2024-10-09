# TI-99/sim Makefile

include rules.mak

all: ti99sim

ifeq ($(OS),OS_WIN32)
include Makefile.win32
endif

ifeq ($(OS),OS_UNIX)
include Makefile.unix
endif

ifeq ($(OS),OS_MACOS)
include Makefile.macosx
endif
