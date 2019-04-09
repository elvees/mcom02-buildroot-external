################################################################################
#
# audio-tests
#
################################################################################

AUDIO_TESTS_SITE = ssh://gerrit.elvees.com:29418/tools/audio-tests
AUDIO_TESTS_SITE_METHOD = git
AUDIO_TESTS_VERSION = master
AUDIO_TESTS_SETUP_TYPE = setuptools
AUDIO_TESTS_DEPENDENCIES = python-numpy

$(eval $(python-package))
