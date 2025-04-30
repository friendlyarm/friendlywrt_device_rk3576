#!/bin/bash

TARGET_PLAT=rk3576
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=friendlywrt

# FriendlyWRT
#
TARGET_FRIENDLYWRT_CONFIG=rockchip
FRIENDLYWRT_SRC=friendlywrt
FRIENDLYWRT_PATCHS+=("feeds/luci/;device/common/src-patchs/23.05/feeds/luci")
FRIENDLYWRT_FILES+=(device/common/ntfs3)
FRIENDLYWRT_FILES+=(device/common/uas)
FRIENDLYWRT_FILES+=(device/common/nft-fullcone)
FRIENDLYWRT_FILES+=(device/common/emmc-tools)
FRIENDLYWRT_FILES+=(device/common/distfeeds)
FRIENDLYWRT_FILES+=(device/common/default-settings)
FRIENDLYWRT_FILES+=(device/common/rknpu)
FRIENDLYWRT_FILES+=(device/friendlyelec/rk3576/r8125)

# U-boot
#
TARGET_UBOOT_CONFIG=nanopi5_defconfig

# Kernel
#
TARGET_KERNEL_CONFIG="nanopi5_linux_defconfig friendlywrt.config kvm.config"
TARGET_KERNEL_DTB=resource.img

# Misc
#
ENABLE_OPT_PARTITION=true
TARGET_ROOTFS_PARTSIZE=1024
TARGET_USERDATA_PARTSIZE=1024
if [ "${ENABLE_OPT_PARTITION}" = "true" ]; then
    TARGET_SD_IMAGESIZE=3000
else
    TARGET_SD_IMAGESIZE=1500
fi
FRIENDLYWRT_ROOTFS=build_dir/target-aarch64_generic_musl/root-rockchip
FRIENDLYWRT_PACKAGE_DIR=bin/targets/rockchip/armv8/packages
TARGET_IMAGE_DIRNAME=friendlywrt23
TARGET_SD_RAW_FILENAME=friendlywrt_23.05_$(date +%Y%m%d)_rk3576_arm64_sd.img
TARGET_EFLASHER_RAW_FILENAME=friendlywrt_23.05_$(date +%Y%m%d)_rk3576_arm64_eflasher.img
