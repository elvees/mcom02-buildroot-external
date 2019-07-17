################################################################################
#
# MCOM_DELCORE30M_TESTS
#
################################################################################

MCOM_DELCORE30M_TESTS_VERSION = master
MCOM_DELCORE30M_TESTS_SITE_METHOD = git
MCOM_DELCORE30M_TESTS_SITE = ssh://gerrit.elvees.com:29418/tools/delcore30m
MCOM_DELCORE30M_TESTS_DEPENDENCIES = toolchain-elcore30m python3 libdrm

MCOM_DELCORE30M_TESTS_CONF_OPTS = -DELCORE30M_TOOLCHAIN_FILE=$(TOOLCHAIN_ELCORE30M_TOOLCHAIN_FILE)

$(eval $(cmake-package))
