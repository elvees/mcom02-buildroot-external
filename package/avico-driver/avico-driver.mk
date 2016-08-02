################################################################################
#
# avico-driver
#
################################################################################

AVICO_DRIVER_VERSION = 1.0
AVICO_DRIVER_DEPENDENCIES = linux
AVICO_DRIVER_LICENSE = GPL
AVICO_DRIVER_SITE = $(BR2_EXTERNAL)/package/avico-driver
AVICO_DRIVER_SITE_METHOD = local

define AVICO_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/avico.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/avico.ko
	$(HOST_DIR)/sbin/depmod -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef

$(eval $(generic-package))
