################################################################################
#
# memtester-simple
#
################################################################################

MEMTESTER_SIMPLE_VERSION = master
MEMTESTER_SIMPLE_SITE = ssh://gerrit.elvees.com:29418/tools/memtester-simple
MEMTESTER_SIMPLE_SITE_METHOD = git

$(eval $(cmake-package))
