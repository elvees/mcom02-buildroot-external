################################################################################
#
# Library to access DSP cores from userspace
#
################################################################################

MCOM_LIBDSP_VERSION = 101
MCOM_LIBDSP_SITE = https://hyperion.elvees.com/linuxnvcom01/tools/tests/libdsp
MCOM_LIBDSP_SITE_METHOD = svn
MCOM_LIBDSP_INSTALL_STAGING = YES
MCOM_LIBDSP_INSTALL_TARGET = NO
MCOM_LIBDSP_LICENSE = unknown

define MCOM_LIBDSP_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" AR="$(TARGET_AR)" -C $(@D)
endef

define MCOM_LIBDSP_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libdsp.a $(STAGING_DIR)/usr/lib/libdsp.a
	$(INSTALL) -D -m 0644 $(@D)/libdsp.h $(STAGING_DIR)/usr/include/libdsp.h
endef

$(eval $(generic-package))
