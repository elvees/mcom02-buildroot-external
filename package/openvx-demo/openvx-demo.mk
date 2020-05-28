################################################################################
#
# openvx-demo
#
################################################################################

OPENVX_DEMO_VERSION = 0.1.2
OPENVX_DEMO_SOURCE = openvx_demo-v$(OPENVX_DEMO_VERSION).tar.gz
OPENVX_DEMO_LICENSE = custom
OPENVX_DEMO_SITE = https://warlock.elvees.com/share/openvx_demo/-/archive/v$(OPENVX_DEMO_VERSION)
OPENVX_DEMO_DEPENDENCIES = openvx cimg

$(eval $(cmake-package))

# No $(PKG)_DL_OPTS is available. Use target-specific variable
$(BUILD_DIR)/$(OPENVX_DEMO_NAME)-$(OPENVX_DEMO_VERSION)/.stamp_downloaded: WGET += --no-check-certificate
