################################################################################
#
# mcom-libmali
#
################################################################################

MCOM_LIBMALI_VERSION = mcom02
MCOM_LIBMALI_LICENSE = custom
MCOM_LIBMALI_SITE = ssh://gerrit.elvees.com:29418/mcom02/mali-bin
MCOM_LIBMALI_SITE_METHOD = git
MCOM_LIBMALI_INSTALL_STAGING = YES
MCOM_LIBMALI_DEPENDENCIES = mcom-libump
MCOM_LIBMALI_PROVIDES = libegl libgles

define MCOM_LIBMALI_INSTALL_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(MCOM_LIBMALI_SRCDIR) DESTDIR=$(1) \
		VARIANT=mali300-gles11-gles20-linux-ump-drawmerge-no_profiling install
endef

MCOM_LIBMALI_INSTALL_TARGET_CMDS = $(call MCOM_LIBMALI_INSTALL_CMDS,$(TARGET_DIR))
MCOM_LIBMALI_INSTALL_STAGING_CMDS = $(call MCOM_LIBMALI_INSTALL_CMDS,$(STAGING_DIR))

$(eval $(generic-package))
