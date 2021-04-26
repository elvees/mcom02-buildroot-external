################################################################################
#
# m2m-test
#
################################################################################

M2M_TEST_VERSION = master
M2M_TEST_SITE = ssh://gerrit.elvees.com:29418/tools/m2m-test
M2M_TEST_SITE_METHOD = git
M2M_TEST_LICENSE = GPLv2
M2M_TEST_DEPENDENCIES = ffmpeg

ifeq ($(BR2_PACKAGE_LIBDRM),y)
M2M_TEST_DEPENDENCIES += libdrm

ifeq ($(BR2_PACKAGE_SDL2),y)
M2M_TEST_DEPENDENCIES += sdl2
endif
endif

$(eval $(cmake-package))
