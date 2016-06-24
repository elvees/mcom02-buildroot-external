################################################################################
#
# mcom-mali-driver
#
################################################################################

MCOM_MALI_DRIVER_VERSION = r3p0-04rel0-v2.0
MCOM_MALI_DRIVER_DEPENDENCIES = linux
MCOM_MALI_DRIVER_LICENSE = custom
MCOM_MALI_DRIVER_SITE = $(BR2_EXTERNAL)/package/mcom/mcom-mali-driver
MCOM_MALI_DRIVER_SITE_METHOD = local
MCOM_MALI_DRIVER_LIBS_PREFIX = /lib

define MCOM_MALI_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/mali.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/mali.ko
	$(INSTALL) -D -m 0644 $(@D)/ump.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/ump.ko
	$(HOST_DIR)/sbin/depmod -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
	$(INSTALL) -D -m 0755 $(@D)/libMali.so $(TARGET_DIR)$(MCOM_MALI_DRIVER_LIBS_PREFIX)/libMali.so
	$(INSTALL) -D -m 0755 $(@D)/libUMP.so $(TARGET_DIR)$(MCOM_MALI_DRIVER_LIBS_PREFIX)/libUMP.so
	for f in libEGL.so libEGL.so.1.4 libGLESv1_CM.so.1 libGLESv2.so libGLESv2.so.2.0 libEGL.so.1 libGLESv1_CM.so libGLESv1_CM.so.1.1 libGLESv2.so.2; do ln -sf libMali.so $(TARGET_DIR)$(MCOM_MALI_DRIVER_LIBS_PREFIX)/$$f;done
	tar -C $(TARGET_DIR) -xf $(@D)/mali-demos.tar.gz
endef

$(eval $(generic-package))
