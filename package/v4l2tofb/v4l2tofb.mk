################################################################################
#
# v4l2tofb
#
################################################################################

V4L2TOFB_VERSION = master
V4L2TOFB_SITE = ssh://gerrit.elvees.com:29418/tools/v4l2tofb
V4L2TOFB_SITE_METHOD = git
V4L2TOFB_DEPENDENCIES = libdrm
V4L2TOFB_LICENSE = GPLv2

$(eval $(cmake-package))
