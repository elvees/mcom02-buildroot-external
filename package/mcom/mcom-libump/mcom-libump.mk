################################################################################
#
# mcom-libump
#
################################################################################

MCOM_LIBUMP_VERSION = mcom02
MCOM_LIBUMP_LICENSE = Apache-2.0
MCOM_LIBUMP_SITE = ssh://callisto.elvees.com:29418/lib/ump
MCOM_LIBUMP_SITE_METHOD = git
MCOM_LIBUMP_INSTALL_STAGING = YES

$(eval $(cmake-package))
