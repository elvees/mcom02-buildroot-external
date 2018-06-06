################################################################################
#
# openvx-headers
#
################################################################################

OPENVX_HEADERS_VERSION = 1.1
OPENVX_HEADERS_SITE = https://www.khronos.org/registry/OpenVX/api/$(OPENVX_HEADERS_VERSION)
OPENVX_HEADERS_SOURCE = openvx-standard-headers-$(OPENVX_HEADERS_VERSION).tar.bz2
OPENVX_HEADERS_LICENSE = MIT
OPENVX_HEADERS_INSTALL_STAGING = YES
OPENVX_HEADERS_INSTALL_TARGET = NO
OPENVX_HEADERS_STRIP_COMPONENTS = 0

define OPENVX_HEADERS_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/include/VX
	$(INSTALL) -m 0644 $(@D)/*.h -t $(STAGING_DIR)/include/VX/
endef

$(eval $(generic-package))
