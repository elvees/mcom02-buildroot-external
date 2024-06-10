################################################################################
#
# mcom-linux-tests
#
################################################################################

MCOM_LINUX_TESTS_VERSION = master
MCOM_LINUX_TESTS_SITE = ssh://gerrit.elvees.com:29418/mcom02/linux-tests
MCOM_LINUX_TESTS_SITE_METHOD = git
MCOM_LINUX_TESTS_LICENSE = BSD-2c

$(eval $(cmake-package))
