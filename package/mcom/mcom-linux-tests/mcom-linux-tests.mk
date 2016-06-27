#############################################################
#
# mcom-linux-tests
#
#############################################################

MCOM_LINUX_TESTS_VERSION = 36f7fbd4fae0f3805cf7e472fec8bcbfcae49b0d
MCOM_LINUX_TESTS_SITE = ssh://callisto.elvees.com:29418/tools/mcom-linux-tests
MCOM_LINUX_TESTS_SITE_METHOD = git
MCOM_LINUX_TESTS_LICENSE = BSD-2c

$(eval $(cmake-package))
