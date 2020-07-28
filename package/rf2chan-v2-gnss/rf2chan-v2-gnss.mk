################################################################################
#
# rf2chan-v2-gnss
#
################################################################################

RF2CHAN_V2_GNSS_VERSION = master
RF2CHAN_V2_GNSS_SITE = ssh://git@git.elvees.com:22/gnss/mcom02-linux/el24d1-rf2chan-gnss-kernel-driver.git
RF2CHAN_V2_GNSS_SITE_METHOD = git
RF2CHAN_V2_GNSS_LICENSE = GPL

$(eval $(kernel-module))
$(eval $(generic-package))
