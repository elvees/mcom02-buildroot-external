################################################################################
#
# mcom-mali-driver
#
################################################################################

MCOM_MALI_DRIVER_VERSION = mcom02
MCOM_MALI_DRIVER_DEPENDENCIES = linux
MCOM_MALI_DRIVER_SITE = ssh://callisto.elvees.com:29418/linux/modules/mali
MCOM_MALI_DRIVER_SITE_METHOD = git

# TODO: Rework repository to use $(kernel-module) infrastructure
define MCOM_MALI_DRIVER_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(notdir $(TARGET_CROSS)) KDIR=$(LINUX_DIR)
endef

define MCOM_MALI_DRIVER_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(notdir $(TARGET_CROSS)) KDIR=$(LINUX_DIR) \
		INSTALL_MOD_PATH=$(TARGET_DIR) install
endef

$(eval $(generic-package))
