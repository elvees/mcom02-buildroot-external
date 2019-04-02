################################################################################
#
# mcom-python-linux-tests
#
################################################################################

MCOM_PYTHON_LINUX_TESTS_VERSION = master
MCOM_PYTHON_LINUX_TESTS_SITE = ssh://gerrit.elvees.com:29418/tools/mcom-linux-tests
MCOM_PYTHON_LINUX_TESTS_SITE_METHOD = git
MCOM_PYTHON_LINUX_TESTS_LICENSE = BSD-2c
MCOM_PYTHON_LINUX_TESTS_DEPENDENCIES = python
MCOM_PYTHON_LINUX_TESTS_SETUP_TYPE = setuptools

$(eval $(python-package))
