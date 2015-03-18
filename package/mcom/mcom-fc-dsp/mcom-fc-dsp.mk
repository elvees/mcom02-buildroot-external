################################################################################
#
# mcom-fc-dsp
#
################################################################################

MCOM_FC_DSP_VERSION = 101
MCOM_FC_DSP_SITE = https://hyperion.elvees.com/linuxnvcom01/tools/tests/dsp
MCOM_FC_DSP_SITE_METHOD = svn
MCOM_FC_DSP_DEPENDENCIES = mcom-libdsp
MCOM_FC_DSP_INSTALL_TARGET = YES
MCOM_FC_DSP_LICENSE = unknown

define MCOM_FC_DSP_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" EXECUTABLE=fc-dsp CFLAGS="-g -O0" LDFLAGS="" -C $(@D)
endef

define MCOM_FC_DSP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/fc-dsp $(TARGET_DIR)/usr/bin/fc-dsp
endef

$(eval $(generic-package))
