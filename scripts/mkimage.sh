#!/usr/bin/env bash

# Copyright 2019 RnD Center "ELVEES", JSC

set -o errexit
set -o nounset
set -o pipefail

readonly BOOTFS_IMG=bootfs.img
readonly BOOTFS_SIZE_MiB=128
readonly BOOTFS_START_MiB=1
readonly BOOTFS_END_MiB=$((BOOTFS_SIZE_MiB + BOOTFS_START_MiB))

readonly ROOTFS_IMG=rootfs.img
readonly ROOTFS_SIZE_MiB=1024
readonly ROOTFS_START_MiB=$BOOTFS_END_MiB
readonly ROOTFS_END_MiB=$((ROOTFS_START_MiB + ROOTFS_SIZE_MiB))
readonly CARD_END_MiB=$((ROOTFS_END_MiB + 1))  # GNU Parted 3.x boundary checks fail otherwise

mk_bootpart(){
    local -r linux_image=$1
    local -r tmp_dir_boot=$TMP_DIR/boot
    mkdir -p $tmp_dir_boot
    cp $linux_image $tmp_dir_boot/
    truncate --size=${BOOTFS_SIZE_MiB}M $BOOTFS_IMG
    mkfs.vfat -n boot $BOOTFS_IMG
    mcopy -i $BOOTFS_IMG $tmp_dir_boot/* ::
}

mk_rootpart(){
    local -r rootfs=$1
    local -r tmp_dir_root=$TMP_DIR/root
    truncate --size=${ROOTFS_SIZE_MiB}M $ROOTFS_IMG
    mkfs.ext4 -L root -F $ROOTFS_IMG
    echo "Mounting $ROOTFS_IMG file to create rootfs image..."
    mkdir -p $tmp_dir_root
    sudo mount -t ext4 -o loop $ROOTFS_IMG $tmp_dir_root
    sudo tar -xf $rootfs -C $tmp_dir_root
    # BUG: umount should be trapped on abnormal exit
    sudo umount $tmp_dir_root
}

cookimg(){
    local -r image=$1
    truncate --size=${CARD_END_MiB}M $image
    parted --script $image mklabel msdos
    parted --script $image mkpart primary ${BOOTFS_START_MiB}MiB ${BOOTFS_END_MiB}MiB
    parted --script $image mkpart primary ${ROOTFS_START_MiB}MiB ${ROOTFS_END_MiB}MiB
    dd if=$BOOTFS_IMG of=$image bs=1M seek=$BOOTFS_START_MiB conv=notrunc
    dd if=$ROOTFS_IMG of=$image bs=1M seek=$ROOTFS_START_MiB
    echo "Created image $image"
}

if [[ $# -ne 3 ]]; then
    echo "Incorrect number of arguments." >&2
    echo "Usage: $(basename $0) <linux-image> <rootfs-tar> <output-sdcard-img>" >&2
    exit 1
fi

readonly ZIMAGE=$1
readonly ROOTFS=$2
readonly SDCARD_IMG=$3

readonly TMP_DIR=$(mktemp -d)
echo "Created temporary directory $TMP_DIR"
trap 'rm -rf $TMP_DIR' EXIT

# Lets be explicit: request the sudo password as soon as possible
sudo echo "Creating image..."
mk_bootpart $ZIMAGE
mk_rootpart $ROOTFS
cookimg $SDCARD_IMG
