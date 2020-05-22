################################################################################
#
# Applications and tests for MCom-02 SWIC driver
#
################################################################################

MCOM_LIBSWIC_SITE = ssh://gerrit.elvees.com:29418/lib/swic
MCOM_LIBSWIC_SITE_METHOD = git
MCOM_LIBSWIC_VERSION = master

# Disable the service by default.
define MCOM_LIBSWIC_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 $(MCOM_LIBSWIC_PKGDIR)/50-spacewire.preset \
		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-spacewire.preset
endef

$(eval $(cmake-package))
