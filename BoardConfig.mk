#
# Copyright (C) 2023 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include device/rockchip/common/BoardConfig-common.mk

TARGET_BOOTLOADER_BOARD_NAME := rockpro64

# VBMeta image
BOARD_AVB_ENABLE := true

# Bootimage
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432

# System partition definitions
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648   # 2048MB
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096

# Vendor partition definitions
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456 # 256MB
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 2048

# Android generic system image always create metadata partition
BOARD_USES_METADATA_PARTITION := true

# BT HAL external SELinux pilicies
BOARD_VENDOR_SEPOLICY_DIRS += system/bt/vendor_libs/linux/sepolicy

#
PRODUCT_FULL_TREBLE_OVERRIDE := false
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Vendor Interface Manifest
DEVICE_MANIFEST_FILE := device/rockchip/rockpro64/manifest.xml
DEVICE_MATRIX_FILE := device/rockchip/rockpro64/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/rockchip/rockpro64/device_framework_matrix_product.xml

# Kernel build
BOARD_KERNEL_VERSION    := 6.1
BOARD_KERNEL_TOOLCHAIN  := prebuilts/gcc/linux-x86/aarch64/gcc-linaro-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
BOARD_KERNEL_SOURCE     := device/rockchip/kernel
BOARD_KERNEL_OBJ_OUT    := out/target/product/$(TARGET_DEVICE)/obj/KERNEL
BOARD_KERNEL_CONFIG     := android_u_rockpro64_defconfig
BOARD_MKBOOTIMG_ARGS    := --header_version 2 \
    --dtb $(BOARD_KERNEL_OBJ_OUT)/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb \
    --base 0x40000000 --dtb_offset 0x00008000 --kernel_offset 0x00200000 --ramdisk_offset 0x02200000

BOARD_KERNEL_CMDLINE    := androidboot.hardware=rockpro64 androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE    += console=ttyS2,1500000n8 init=/init loop.max_part=7
BOARD_KERNEL_CMDLINE    += firmware_class.path=/vendor/etc/firmware
BOARD_KERNEL_CMDLINE    += printk.devkmsg=on
