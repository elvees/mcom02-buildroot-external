################################################################################
#
# mcom-libmali
#
################################################################################

MCOM_LIBMALI_VERSION = r3p0-04rel0-v2.4
MCOM_LIBMALI_LICENSE = custom
MCOM_LIBMALI_SITE = $(BR2_EXTERNAL)/package/mcom/mcom-libmali
MCOM_LIBMALI_SITE_METHOD = local
MCOM_LIBMALI_INSTALL_STAGING = YES
MCOM_LIBMALI_LIBS_PREFIX = /lib

define MCOM_LIBMALI_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libMali.so $(1)$(MCOM_LIBMALI_LIBS_PREFIX)/libMali.so
	$(INSTALL) -D -m 0755 $(@D)/libUMP.so $(1)$(MCOM_LIBMALI_LIBS_PREFIX)/libUMP.so
	for f in libEGL.so{,.1,.1.4} libGLESv1_CM.so{,.1,.1.1} libGLESv2.so{,.2,.2.0}; do \
		ln -sf libMali.so $(1)$(MCOM_LIBMALI_LIBS_PREFIX)/$$f;done
	tar -C $(1) -xf $(@D)/mali-demos.tar.gz
endef

MCOM_LIBMALI_INSTALL_TARGET_CMDS = $(call MCOM_LIBMALI_INSTALL_CMDS,$(TARGET_DIR))
MCOM_LIBMALI_INSTALL_STAGING_CMDS = $(call MCOM_LIBMALI_INSTALL_CMDS,$(STAGING_DIR))

$(eval $(generic-package))
