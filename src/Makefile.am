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
libgicrinclude_HEADERS = $(top_srcdir)/src/gicr.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = $(top_srcdir)/gicr.pc

gicr_header = $(top_srcdir)/src/gicr.h
gicr_vapi_file = GICR-1.0.vapi
gicr_gir_file = GICR-1.0.gir

libgicr_la_SOURCES = \
		     Credentials.vala \
		     Repository.vala \
		     Session.vala \
		     Item.vala \
		     LockManager.vala \
		     Node.vala \
		     Property.vala \
		     QueryManager.vala \
		     Workspace.vala \
		     Transaction.vala \
		     NamespaceRegistry.vala \
		     NodeTypeManager.vala \
		     ObservationManager.vala \
		     VersionManager.vala \
		     ContentHandler.vala \
		     NodeType.vala \
		     Errordomains.vala \
		     ItemVisitor.vala \
		     Lock.vala \
		     NodeTypeTemplate.vala \
		     NodeTypeDefinition.vala \
		     $(NULL)
			  
libgicr_la_LDFLAGS = -module -export-dynamic @GICR_ABI_MAJOR@:0:0
libgicr_la_LIBADD = @GICR_LIBS@ 

src_libgicr_la_CPPFLAGS = \
			  -I$(top_srcdir)/src \
			  -DG_LOG_DOMAIN=\"GICR\"

VALAFLAGS = --vapi=$(gicr_vapi_file) --vapidir=$(top_srcdir)/src  -H $(gicr_header) --gir=$(gicr_gir_file) --library gicr

CLEANFILES = \
	     $(gicr_vapi_file) \
	     $(gicr_header) \
	     libgicr_la_vala.stamp \
	     $(libgicr_la_SOURCES:.vala=.c) \
	     $(gicr_gir_file) \
	     $(NULL)

EXTRA_DIST = \
	     $(gicr_vapi_file) \
	     gicr.pc.in \
	     m4/introspection.m4 \
	     $(NULL)

vapidir = $(datadir)/vala/vapi
vapi_DATA = \
	    $(top_srcdir)/src/GICR-1.0.vapi \
	    $(NULL)

-include $(INTROSPECTION_MAKEFILE)
INTROSPECTION_COMPILER_ARGS = --includedir=$(srcdir)

if HAVE_INTROSPECTION
INTROSPECTION_CFLAGS += $(AM_CFLAGS)
introspection_sources = $(libgicr_la_SOURCES)
GICR-1.0.gir: $(lib_LTLIBRARIES)
GICR_1_0_gir_INCLUDES = GObject-2.0
GICR_1_0_gir_CFLAGS = $(AM_CFLAGS)
GICR_1_0_gir_LIBS = $(lib_LTLIBRARIES)
GICR_1_0_gir_FILES = $(addprefix $(srcdir)/,$(introspection_sources))
GICR_1_0_gir_PACKAGES = gobject-2.0 
introspection_file = GICR-1.0.gir
girdir = $(datadir)/gir-1.0
gir_DATA = $(introspection_file)

typelibsdir = $(libdir)/girepository-1.0
typelibs_DATA = $(introspection_file:.gir=.typelib)
CLEANFILES = $(dist_gir_DATA) $(typelibs_DATA)
endif

