#############################################################
#
# libuio
#
#############################################################

LIBUIO_VERSION = $(FV_IP_SGBM_REVISION)
LIBUIO_SITE = ssh://callisto.elvees.com:29418/fv/fv-ip-sgbm1.git
LIBUIO_SITE_METHOD = git
LIBUIO_SUBDIR = fv/libcpptest/backend/uio/libuio
LIBUIO_INSTALL_STAGING = YES

$(eval $(cmake-package))
