################################################################################
#
# mcom-linux-tests
#
################################################################################

MCOM_LINUX_TESTS_VERSION = master
MCOM_LINUX_TESTS_SITE = ssh://gerrit.elvees.com:29418/mcom02/linux-tests
MCOM_LINUX_TESTS_SITE_METHOD = git
MCOM_LINUX_TESTS_LICENSE = BSD-2c

ifeq ($(BR2_PACKAGE_MCOM_LINUX_TESTS_MALI_UTILS),y)
    MCOM_LINUX_TESTS_CONF_OPTS += -DWITH_MALI_UTILS=ON
endif

ifeq ($(BR2_PACKAGE_MCOM_LINUX_TESTS_DMATESTCONTIG),y)
    MCOM_LINUX_TESTS_CONF_OPTS += -DWITH_DMATESTCONTIG=ON
endif

$(eval $(cmake-package))
