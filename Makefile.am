
if WANT_JANSSON
JANSSON_INCLUDES= -I$(top_srcdir)/compat/jansson
else
JANSSON_INCLUDES=
endif

EXTRA_DIST	= example-cfg.json nomacro.pl

SUBDIRS		= compat

ALL_INCLUDES	= @PTHREAD_FLAGS@ -fno-strict-aliasing $(JANSSON_INCLUDES) -I.

bin_PROGRAMS	= sumanajo

dist_man_MANS	= sumanajo.1

sumanajo_SOURCES = \
  cpu-miner.c \
  util.c \
  uint256.cpp \
  api.c \
  sysinfos.c \
  algo/lyra2/zoin.c \


disable_flags =

if USE_ASM
   sumanajo_SOURCES += asm/neoscrypt_asm.S
if ARCH_x86
   sumanajo_SOURCES += asm/sha2-x86.S asm/scrypt-x86.S asm/aesb-x86.S
endif
if ARCH_x86_64
   sumanajo_SOURCES += asm/sha2-x64.S asm/scrypt-x64.S asm/aesb-x64.S
endif
if ARCH_ARM
   sumanajo_SOURCES += asm/sha2-arm.S asm/scrypt-arm.S
endif
else
   disable_flags += -DNOASM
endif

if HAVE_WINDOWS
   sumanajo_SOURCES += compat/winansi.c
endif

sumanajo_LDFLAGS	= @LDFLAGS@
sumanajo_LDADD	= @LIBCURL@ @JANSSON_LIBS@ @PTHREAD_LIBS@ @WS2_LIBS@ -lssl -lcrypto -lgmp
sumanajo_CPPFLAGS = @LIBCURL_CPPFLAGS@ $(ALL_INCLUDES)
sumanajo_CFLAGS   = -Wno-pointer-sign -Wno-pointer-to-int-cast $(disable_flags)

if HAVE_WINDOWS
sumanajo_CFLAGS += -Wl,--stack,10485760
endif

if HAVE_WINDOWS
# use to profile an object
# gprof_cflags = -pg -g3
# cpuminer_LDFLAGS += -pg
# cpuminer_CFLAGS += -fno-inline-functions -static

# copy/paste from generated Makefile
common_ccflags = $(DEFS) $(ALL_INCLUDES) $(cpuminer_CPPFLAGS) $(CPPFLAGS) $(cpuminer_CFLAGS) $(CFLAGS)

# special CFLAGS (if you find a simpler way to do that tell me ;)
#cpuminer-neoscrypt.o: neoscrypt.c
#	@echo "CUSTOM ${@}: ${filter %.o,${^}} ${filter %.c,${^}}"
#	$(CC) $(common_ccflags) -g -O3 $(gprof_cflags) -MT $@ -MD -MP -c -o $@ $<


endif
