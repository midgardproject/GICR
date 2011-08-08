NULL = 

ACLOCAL_AMFLAGS = -I m4

DISTCHECK_CONFIGURE_FLAGS = --enable-introspection

lib_LTLIBRARIES = libgicr.la

AM_CFLAGS = \
	    -I$(top_srcdir)/src \
	    @GICR_CFLAGS@ \
	    $(GLIB_CFLAGS) 

AM_LDFLAGS = @GICR_LIBS@

pkgdatadir = $(datadir)/gicr
pkglibdir = $(libdir)/gicr
libgicrincludedir = $(includedir)/gicr
libgicrinclude_HEADERS = src/gicr.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = gicr.pc

vapidir = $(datadir)/vala/vapi
vapi_DATA = \
	    src/vala/GICR-1.0.vapi \
	    $(NULL)

gicr_header = $(top_srcdir)/src/gicr.h
gicr_vapi_file = MidgardCR-3.0.vapi
gicr_gir_file = MidgardCR-3.0.gir

libgicr_la_SOURCES = \
			  Repository.vala \
			  Session.vala \
			  Item.vala \
			  Node.vala \
			  Property.vala \
			  $(NULL)
			  
libgicr_la_LDFLAGS = -module -export-dynamic @GICR_ABI_MAJOR@:0:0
libgicr_la_LIBADD = @GICR_LIBS@ 

src_libgicr_la_CPPFLAGS = \
			  -I$(top_srcdir)/src \
			  -DG_LOG_DOMAIN=\"GICR\"

EXTRA_DIST = \
	     $(gicr_vapi_file) \
	     gicr.pc.in \
	     m4/introspection.m4 \
	     $(NULL)

VALAFLAGS = --vapi=$(gicr_vapi_file) --vapidir=$(top_srcdir)/src  -H $(gicr_header) --gir=$(gicr_gir_file) --library gicr

CLEANFILES = \
	     $(gicr_vapi_file) \
	     $(gicr_header) \
	     libgivala_la_vala.stamp \
	     $(libgivala_la_SOURCES:.vala=.c) \
	     $(gicr_vapi_file) \
	     $(gicr_gir_file) \
	     $(NULL)

