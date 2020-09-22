################################################################################
#
# openvx-cts
#
################################################################################

OPENVX_CTS_VERSION = e3bceec4b9e8ac0d0ba5253982fba86024b149ae
OPENVX_CTS_LICENSE = Apache License 2.0
OPENVX_CTS_SITE = $(call github,KhronosGroup,OpenVX-cts,$(OPENVX_CTS_VERSION))
OPENVX_CTS_DEPENDENCIES = openvx openvx-headers
OPENVX_CTS_CONF_OPTS = -DOPENVX_LIBRARIES="libopenvx_wrapper.so;libopenvx_kernels.so;m" \
	-DOPENVX_USE_IX=OFF \
	-DOPENVX_USE_NN=ON \
	-DOPENVX_USE_NN_16=OFF \
	-DOPENVX_USE_PIPELINING=OFF \
	-DOPENVX_USE_STREAMING=OFF \
	-DOPENVX_USE_USER_DATA_OBJECT=OFF \
	-DOPENVX_USE_U1=OFF \
	-DOPENVX_CONFORMANCE_VISION=ON \
	-DOPENVX_CONFORMANCE_NEURAL_NETWORKS=ON \
	-DOPENVX_CONFORMANCE_NNEF_IMPORT=OFF \
	-DOPENVX_USE_ENHANCED_VISION=OFF

$(eval $(cmake-package))
