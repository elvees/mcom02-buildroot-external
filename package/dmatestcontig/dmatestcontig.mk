################################################################################
#
# dmatestcontig
#
################################################################################

DMATESTCONTIG_VERSION = master
DMATESTCONTIG_SITE = ssh://gerrit.elvees.com:29418/linux/modules/dmatestcontig
DMATESTCONTIG_SITE_METHOD = git
DMATESTCONTIG_LICENSE = GPL

$(eval $(kernel-module))
$(eval $(generic-package))
