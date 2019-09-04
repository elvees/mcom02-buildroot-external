################################################################################
#
# gst1-rtsp-server
#
################################################################################

GST1_RTSP_SERVER_CONF_OPTS += --enable-examples

define GST1_RTSP_SERVER_POST_INSTALL_TEST_LAUNCH
	$(INSTALL) -D -m 0755 $(@D)/examples/test-launch $(TARGET_DIR)/usr/bin/gst-rtsp-test-launch
endef
GST1_RTSP_SERVER_POST_INSTALL_TARGET_HOOKS += GST1_RTSP_SERVER_POST_INSTALL_TEST_LAUNCH
