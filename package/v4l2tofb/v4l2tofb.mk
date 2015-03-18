#############################################################
#
# v4l2tofb
#
#############################################################

V4L2TOFB_VERSION = ce198a7c83086676cca7b73e547553665c16725e
V4L2TOFB_SITE = ssh://callisto.elvees.com:29418/tools/v4l2tofb
V4L2TOFB_SITE_METHOD = git
V4L2TOFB_LICENSE = GPLv2

$(eval $(cmake-package))
