################################################################################
#
# igt-gpu-tools
#
################################################################################

IGT_GPU_TOOLS_VERSION = intel-gpu-tools-1.22
IGT_GPU_TOOLS_SITE = git://anongit.freedesktop.org/drm/igt-gpu-tools
IGT_GPU_TOOLS_SITE_METHOD = git
IGT_GPU_TOOLS_LICENSE = GPLv2

IGT_GPU_TOOLS_AUTORECONF = YES

IGT_GPU_TOOLS_DEPENDENCIES = cairo \
	kmod \
	libdrm \
	libpciaccess \
	libunwind \
	procps-ng \
	xutil_util-macros \
	xproto_dri2proto

IGT_GPU_TOOLS_CONF_OPTS = --disable-git-hash \
	--disable-intel \
	--disable-amdgpu \
	--disable-nouveau \
	--disable-vc4

# autogen.sh calls gtkdocize to create gtk-doc.make file, or creates it yourself.
# But the Buildroot doesn't know about this, therefore hook was added.
define IGT_GPU_TOOLS_MAKE_GTKDOC_RULES
	echo "EXTRA_DIST =" > $(IGT_GPU_TOOLS_DIR)/gtk-doc.make
	echo "CLEANFILES =" >> $(IGT_GPU_TOOLS_DIR)/gtk-doc.make
endef

IGT_GPU_TOOLS_PRE_CONFIGURE_HOOKS += IGT_GPU_TOOLS_MAKE_GTKDOC_RULES

$(eval $(autotools-package))
