#############################################################
#
# m2m-test
#
#############################################################

M2M_TEST_VERSION = master
M2M_TEST_SITE = ssh://callisto.elvees.com:29418/tools/m2m-test
M2M_TEST_SITE_METHOD = git
M2M_TEST_LICENSE = GPLv2
M2M_TEST_DEPENDENCIES = ffmpeg

$(eval $(cmake-package))
