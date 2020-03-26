################################################################################
#
# mcom-talita
#
################################################################################

MCOM_TALITA_VERSION = master
MCOM_TALITA_SITE = ssh://git@git.elvees.com/gnss/mcom02-linux/talita.git
MCOM_TALITA_SITE_METHOD = git
MCOM_TALITA_LICENSE = custom
MCOM_TALITA_INSTALL_STAGING = YES

define MCOM_TALITA_INSTALL_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(MCOM_TALITA_SRCDIR) \
		DESTDIR=$(1) install
endef

MCOM_TALITA_INSTALL_TARGET_CMDS = $(call MCOM_TALITA_INSTALL_CMDS,$(TARGET_DIR))
MCOM_TALITA_INSTALL_STAGING_CMDS = $(call MCOM_TALITA_INSTALL_CMDS,$(STAGING_DIR))

$(eval $(generic-package))
