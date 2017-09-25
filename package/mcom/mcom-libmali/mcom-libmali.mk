################################################################################
#
# mcom-libmali
#
################################################################################

MCOM_LIBMALI_VERSION = r3p0-04rel0-v2.4
MCOM_LIBMALI_LICENSE = custom
MCOM_LIBMALI_SITE = $(BR2_EXTERNAL)/package/mcom/mcom-libmali
MCOM_LIBMALI_SITE_METHOD = local
MCOM_LIBMALI_LIBS_PREFIX = /lib

define MCOM_LIBMALI_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libMali.so $(TARGET_DIR)$(MCOM_LIBMALI_LIBS_PREFIX)/libMali.so
	$(INSTALL) -D -m 0755 $(@D)/libUMP.so $(TARGET_DIR)$(MCOM_LIBMALI_LIBS_PREFIX)/libUMP.so
	for f in libEGL.so libEGL.so.1.4 libGLESv1_CM.so.1 libGLESv2.so libGLESv2.so.2.0 libEGL.so.1 libGLESv1_CM.so libGLESv1_CM.so.1.1 libGLESv2.so.2; do ln -sf libMali.so $(TARGET_DIR)$(MCOM_LIBMALI_LIBS_PREFIX)/$$f;done
	tar -C $(TARGET_DIR) -xf $(@D)/mali-demos.tar.gz
endef

$(eval $(generic-package))
