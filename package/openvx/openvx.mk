################################################################################
#
# openvx
#
################################################################################

OPENVX_MAJOR_VERSION = 1
OPENVX_VERSION = $(OPENVX_MAJOR_VERSION).0.2
OPENVX_LICENSE = custom
OPENVX_SITE = $(BR2_EXTERNAL_MCOM02_PATH)/package/openvx
OPENVX_SITE_METHOD = local
OPENVX_INSTALL_STAGING = YES
OPENVX_DEPENDENCIES = openvx-headers

define OPENVX_INSTALL_CMD
	$(INSTALL) -D -m 0755 $(@D)/libopenvx_wrapper.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_wrapper.so.$(OPENVX_VERSION)
	ln -sf libopenvx_wrapper.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_wrapper.so
	ln -sf libopenvx_wrapper.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_wrapper.so.$(OPENVX_MAJOR_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/libopenvx_kernels.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_kernels.so.$(OPENVX_VERSION)
	ln -sf libopenvx_kernels.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_kernels.so
	ln -sf libopenvx_kernels.so.$(OPENVX_VERSION) $(1)/usr/lib/libopenvx_kernels.so.$(OPENVX_MAJOR_VERSION)
endef

define OPENVX_INSTALL_STAGING_CMDS
	$(call OPENVX_INSTALL_CMD,$(STAGING_DIR))
endef

OPENVX_INSTALL_TARGET_CMDS = $(call OPENVX_INSTALL_CMD,$(TARGET_DIR))

$(eval $(generic-package))
