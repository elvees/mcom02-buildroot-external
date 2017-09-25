################################################################################
#
# mcom-mali-driver
#
################################################################################

MCOM_MALI_DRIVER_VERSION = mcom
MCOM_MALI_DRIVER_DEPENDENCIES = linux
MCOM_MALI_DRIVER_SITE = ssh://callisto.elvees.com:29418/linux/modules/mali
MCOM_MALI_DRIVER_SITE_METHOD = git

define MCOM_MALI_DRIVER_BUILD_CMDS
	$(MAKE) -C $(@D) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(notdir $(TARGET_CROSS)) KDIR=$(LINUX_DIR)
endef

define MCOM_MALI_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/devicedrv/mali/mali.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/mali.ko
	$(INSTALL) -D -m 0644 $(@D)/devicedrv/ump/ump.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/ump.ko
	$(HOST_DIR)/sbin/depmod -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef

$(eval $(generic-package))
