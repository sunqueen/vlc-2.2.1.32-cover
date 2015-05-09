LIBDIR=.

ALL : $(LIBDIR)/cover.dll

clean :
		rm $(LIBDIR)/*.o
		rm $(LIBDIR)/*.Plo
		rm $(LIBDIR)/cover.dll
		rm $(LIBDIR)/cover.dll.a

$(LIBDIR)/cover.dll : $(LIBDIR)/cpu_asm_la-cpu_asm.o $(LIBDIR)/deinterlace_asm_la-deinterlace_asm.o \
	  $(LIBDIR)/sepia_asm_la-sepia_asm.o $(LIBDIR)/grain_asm_la-grain_asm.o \
	  $(LIBDIR)/gradfun_asm_la-gradfun_asm.o \
	  $(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.o \
	  $(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.o \
	  $(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.o $(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.o \
	  $(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.o $(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.o \
	  $(LIBDIR)/copy_asm_la-copy_asm.o

	i686-w64-mingw32-gcc -std=gnu99 -shared \
		$(LIBDIR)/cpu_asm_la-cpu_asm.o \
		$(LIBDIR)/deinterlace_asm_la-deinterlace_asm.o \
		$(LIBDIR)/sepia_asm_la-sepia_asm.o \
		$(LIBDIR)/grain_asm_la-grain_asm.o \
		$(LIBDIR)/gradfun_asm_la-gradfun_asm.o \
		$(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.o \
		$(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.o \
		$(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.o \
		$(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.o \
		$(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.o \
		$(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.o \
		$(LIBDIR)/copy_asm_la-copy_asm.o \
		-L/usr/win32/lib -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase \
		-L/usr/win32/lib -lws2_32 -lnetapi32 -lwinmm /usr/win32/lib/libintl.a /usr/win32/lib/libiconv.a -lmingw32  \
		-o $(LIBDIR)/cover.dll -Wl,--enable-auto-image-base -Xlinker --out-implib -Xlinker $(LIBDIR)/cover.dll.a

$(LIBDIR)/cpu_asm_la-cpu_asm.o : cpu_asm.c cpu_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/cpu_asm_la-cpu_asm.Tpo \
		-c cpu_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/cpu_asm_la-cpu_asm.o
	mv -f $(LIBDIR)/cpu_asm_la-cpu_asm.Tpo $(LIBDIR)/cpu_asm_la-cpu_asm.Plo

$(LIBDIR)/deinterlace_asm_la-deinterlace_asm.o : deinterlace_asm.c deinterlace_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/deinterlace_asm_la-deinterlace_asm.Tpo \
		-c deinterlace_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/deinterlace_asm_la-deinterlace_asm.o
	mv -f $(LIBDIR)/deinterlace_asm_la-deinterlace_asm.Tpo $(LIBDIR)/deinterlace_asm_la-deinterlace_asm.Plo

$(LIBDIR)/sepia_asm_la-sepia_asm.o : sepia_asm.c sepia_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/sepia_asm_la-sepia_asm.Tpo \
		-c sepia_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/sepia_asm_la-sepia_asm.o
	mv -f $(LIBDIR)/sepia_asm_la-sepia_asm.Tpo $(LIBDIR)/sepia_asm_la-sepia_asm.Plo

$(LIBDIR)/grain_asm_la-grain_asm.o : grain_asm.c grain_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/grain_asm_la-grain_asm.Tpo \
		-c grain_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/grain_asm_la-grain_asm.o
	mv -f $(LIBDIR)/grain_asm_la-grain_asm.Tpo $(LIBDIR)/grain_asm_la-grain_asm.Plo

$(LIBDIR)/gradfun_asm_la-gradfun_asm.o : gradfun_asm.c gradfun_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/gradfun_asm_la-gradfun_asm.Tpo \
		-c gradfun_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/gradfun_asm_la-gradfun_asm.o
	mv -f $(LIBDIR)/gradfun_asm_la-gradfun_asm.Tpo $(LIBDIR)/gradfun_asm_la-gradfun_asm.Plo

$(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.o : i420_rgb_asm_mmx.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DMMX \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.Tpo \
		-c i420_rgb_asm_mmx.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.o
	mv -f $(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.Tpo $(LIBDIR)/i420_rgb_asm_mmx_la-i420_rgb_asm_mmx.Plo

$(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.o : i420_rgb_asm_sse2.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DSSE2 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.Tpo \
		-c i420_rgb_asm_sse2.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.o
	mv -f $(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.Tpo $(LIBDIR)/i420_rgb_asm_sse2_la-i420_rgb_asm_sse2.Plo

$(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.o : i420_yuy2_asm_mmx.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DMODULE_NAME_IS_i420_yuy2_mmx \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.Tpo \
		-c i420_yuy2_asm_mmx.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.o
	mv -f $(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.Tpo $(LIBDIR)/i420_yuy2_asm_mmx_la-i420_yuy2_asm_mmx.Plo

$(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.o : i420_yuy2_asm_sse2.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DMODULE_NAME_IS_i420_yuy2_sse2 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.Tpo \
		-c i420_yuy2_asm_sse2.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.o
	mv -f $(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.Tpo $(LIBDIR)/i420_yuy2_asm_sse2_la-i420_yuy2_asm_sse2.Plo

$(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.o : i422_yuy2_asm_mmx.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DMODULE_NAME_IS_i422_yuy2_mmx \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.Tpo \
		-c i422_yuy2_asm_mmx.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.o
	mv -f $(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.Tpo $(LIBDIR)/i422_yuy2_asm_mmx_la-i422_yuy2_asm_mmx.Plo

$(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.o : i422_yuy2_asm_sse2.c chroma_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ -DMODULE_NAME_IS_i422_yuy2_sse2 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.Tpo \
		-c i422_yuy2_asm_sse2.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.o
	mv -f $(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.Tpo $(LIBDIR)/i422_yuy2_asm_sse2_la-i422_yuy2_asm_sse2.Plo

$(LIBDIR)/copy_asm_la-copy_asm.o : copy_asm.c copy_asm.h cover_base.h
	i686-w64-mingw32-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../vlc-2.2.1/include -I../vlc-2.2.1 \
		-I/usr/win32/include -I/usr/win32/include/ebml -D__USE_MINGW_ANSI_STDIO=1 -D__PLUGIN__ \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-g -O2 -mms-bitfields -Wall -Wextra -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast \
		-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var -Werror-implicit-function-declaration -pipe \
		-ffast-math -funroll-loops -fomit-frame-pointer \
		-mmmx  -msse  -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -msse4 \
		-DMODULE_STRING=\"main\" -DLOCALEDIR=\"/usr/local/share/locale\" \
		-DSYSCONFDIR=\"/usr/local/etc\" \
		-DLIBDIR=\"/usr/local/lib\" \
		-MD -MP -MF $(LIBDIR)/copy_asm_la-copy_asm.Tpo \
		-c copy_asm.c \
		-DDLL_EXPORT -DPIC -o $(LIBDIR)/copy_asm_la-copy_asm.o
	mv -f $(LIBDIR)/copy_asm_la-copy_asm.Tpo $(LIBDIR)/copy_asm_la-copy_asm.Plo

 