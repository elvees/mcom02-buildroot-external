#############################################################
#
# coremark
#
#############################################################

COREMARK_VERSION = master
COREMARK_SITE = ssh://callisto.elvees.com:29418/tools/coremark
COREMARK_SITE_METHOD = git
COREMARK_CONF_OPTS = -DTHREADS=2 -DCMAKE_C_FLAGS_RELEASE="-Ofast -mcpu=$(BR2_GCC_TARGET_CPU) -DNDEBUG"

$(eval $(cmake-package))
