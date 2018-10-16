################################################################################
#
# mcom-mali-demos
#
################################################################################

MCOM_MALI_DEMOS_VERSION = 1.0
MCOM_MALI_DEMOS_LICENSE = custom
MCOM_MALI_DEMOS_SITE = $(BR2_EXTERNAL)/package/mcom/mcom-mali-demos
MCOM_MALI_DEMOS_SITE_METHOD = local

define MCOM_MALI_DEMOS_INSTALL_TARGET_CMDS
	tar -C $(TARGET_DIR) -xf $(MCOM_MALI_DEMOS_SRCDIR)/mali-demos.tar.gz
endef

$(eval $(generic-package))
