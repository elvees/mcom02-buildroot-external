################################################################################
#
# vinc-tools
#
################################################################################

VINC_TOOLS_VERSION = master
VINC_TOOLS_SITE = ssh://gerrit.elvees.com:29418/tools/vinc
VINC_TOOLS_SITE_METHOD = git
VINC_TOOLS_GIT_SUBMODULES = YES

$(eval $(cmake-package))
