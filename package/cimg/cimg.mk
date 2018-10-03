################################################################################
#
# cimg
#
################################################################################

CIMG_VERSION = 2.2.2
CIMG_SITE = http://cimg.eu/files
CIMG_SOURCE = CImg_$(CIMG_VERSION).zip
CIMG_LICENSE = CeCILL-C
CIMG_INSTALL_STAGING = YES
CIMG_INSTALL_TARGET = NO
CIMG_DEPENDENCIES = libpng jpeg

define CIMG_EXTRACT_CMDS
	$(UNZIP) -d $(@D) $(DL_DIR)/$(CIMG_SOURCE)
endef

define CIMG_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/CImg-$(CIMG_VERSION)/CImg.h $(STAGING_DIR)/usr/include/CImg.h
endef

$(eval $(generic-package))
