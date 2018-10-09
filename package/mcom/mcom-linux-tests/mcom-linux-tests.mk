################################################################################
#
# mcom-linux-tests
#
################################################################################

MCOM_LINUX_TESTS_VERSION = master
MCOM_LINUX_TESTS_SITE = ssh://callisto.elvees.com:29418/tools/mcom-linux-tests
MCOM_LINUX_TESTS_SITE_METHOD = git
MCOM_LINUX_TESTS_LICENSE = BSD-2c
MCOM_LINUX_TESTS_DEPENDENCIES = dmatestcontig memtester-simple mcom-mali-demos \
				python

$(eval $(cmake-package))
