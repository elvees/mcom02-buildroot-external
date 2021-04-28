################################################################################
#
# toolchain-elcore30m
#
################################################################################

TOOLCHAIN_ELCORE30M_VERSION := 8365_2018.04.05
TOOLCHAIN_ELCORE30M_SITE := http://dist.elvees.com/support/1892VM14YA/Baremetal/Tools/Linux
TOOLCHAIN_ELCORE30M_SOURCE := eltools_3.6_linux_$(TOOLCHAIN_ELCORE30M_VERSION).tar.gz
TOOLCHAIN_ELCORE30M_INSTALL_DIR := $(HOST_DIR)/opt/toolchain-elcore30m

mkfile_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
# The toolchain gets extracted in $(@D). We need it to be moved
# into TOOLCHAIN_ELCORE30M_INSTALL_DIR.
define TOOLCHAIN_ELCORE30M_MOVE
	rm -rf $(TOOLCHAIN_ELCORE30M_INSTALL_DIR)/*
	mkdir -p $(TOOLCHAIN_ELCORE30M_INSTALL_DIR)
	mv $(@D)/* $(TOOLCHAIN_ELCORE30M_INSTALL_DIR)/
	cp -r $(mkfile_path)/share/* $(TOOLCHAIN_ELCORE30M_INSTALL_DIR)/share
endef

TOOLCHAIN_ELCORE30M_POST_EXTRACT_HOOKS += \
	TOOLCHAIN_ELCORE30M_MOVE

# This variable should be used by CMake project to specify toolchain file.
TOOLCHAIN_ELCORE30M_TOOLCHAIN_FILE := $(TOOLCHAIN_ELCORE30M_INSTALL_DIR)/share/cmake/elcore30m-toolchain.cmake

$(eval $(generic-package))
