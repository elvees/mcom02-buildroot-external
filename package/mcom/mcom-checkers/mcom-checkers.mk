################################################################################
#
# mcom-checkers
#
################################################################################

MCOM_CHECKERS_VERSION = master
MCOM_CHECKERS_SITE = ssh://callisto.elvees.com:29418/tools/mcom-checkers
MCOM_CHECKERS_SITE_METHOD = git
MCOM_CHECKERS_LICENSE = GPLv2
MCOM_CHECKERS_SETUP_TYPE = setuptools

$(eval $(python-package))
