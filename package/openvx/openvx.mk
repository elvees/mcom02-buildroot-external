################################################################################
#
# openvx
#
################################################################################

OPENVX_MAJOR_VERSION = 0
OPENVX_VERSION = $(OPENVX_MAJOR_VERSION).1.1
OPENVX_LICENSE = custom
OPENVX_SITE = $(BR2_EXTERNAL)/package/openvx
OPENVX_SITE_METHOD = local
OPENVX_INSTALL_STAGING = YES
OPENVX_DEPENDENCIES = openvx-headers

define OPENVX_INSTALL_CMD
	$(INSTALL) -D -m 0755 $(@D)/libopenvx.so.$(OPENVX_VERSION) $(1)/lib/libopenvx.so.$(OPENVX_VERSION)
	ln -sf libopenvx.so.$(OPENVX_VERSION) $(1)/lib/libopenvx.so
	ln -sf libopenvx.so.$(OPENVX_VERSION) $(1)/lib/libopenvx.so.$(OPENVX_MAJOR_VERSION)
endef

define OPENVX_INSTALL_STAGING_CMDS
	$(call OPENVX_INSTALL_CMD,$(STAGING_DIR))
	$(INSTALL) -D -m 0644 $(@D)/openvx-extended.h $(STAGING_DIR)/include/openvx_extended.h
endef

OPENVX_INSTALL_TARGET_CMDS = $(call OPENVX_INSTALL_CMD,$(TARGET_DIR))

$(eval $(generic-package))
