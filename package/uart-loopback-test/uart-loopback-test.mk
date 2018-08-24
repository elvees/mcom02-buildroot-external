################################################################################
#
# Test for UART in loopback mode
#
################################################################################

UART_LOOPBACK_TEST_SITE = ssh://callisto.elvees.com:29418/tools/uart-loopback-test
UART_LOOPBACK_TEST_SITE_METHOD = git
UART_LOOPBACK_TEST_VERSION = master
UART_LOOPBACK_TEST_SETUP_TYPE = setuptools

$(eval $(python-package))
