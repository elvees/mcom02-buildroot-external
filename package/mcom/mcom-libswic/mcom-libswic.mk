################################################################################
#
# Applications and tests for MCom-02 SWIC driver
#
################################################################################

MCOM_LIBSWIC_SITE = ssh://gerrit.elvees.com:29418/lib/swic
MCOM_LIBSWIC_SITE_METHOD = git
MCOM_LIBSWIC_VERSION = master

$(eval $(cmake-package))
