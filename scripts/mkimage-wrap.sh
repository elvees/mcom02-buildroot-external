#!/bin/bash
# Copyright 2019 RnD Center "ELVEES", JSC

set -o errexit

BINARIES_DIR=$1

$BR2_EXTERNAL_MCOM02_PATH/scripts/mkimage.sh \
    ${BINARIES_DIR}/zImage \
    ${BINARIES_DIR}/rootfs.tar \
    ${BINARIES_DIR}/mcom02-buildroot-sdcard.img
