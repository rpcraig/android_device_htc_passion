# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/htc/passion/BoardConfigVendor.mk
# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := mahimahi

# Kernel
BOARD_KERNEL_CMDLINE    := no_console_suspend=1 wire.search_count=5
#console=ttyMSM0,115200n8
BOARD_KERNEL_BASE       := 0x20000000
BOARD_KERNEL_NEW_PPPOX  := true

TARGET_KERNEL_CONFIG    := evervolv_mahimahi_defconfig
TARGET_PREBUILT_KERNEL  := device/htc/passion/prebuilt/kernel

# GPS HAL and AMSS version
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := mahimahi
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD       := true

# cat /proc/mtd #AOSP                   # cat /proc/mtd #CM7
# dev:    size   erasesize  name        # dev:    size   erasesize  name
# mtd0: 000e0000 00020000 "misc"        # mtd0: 000e0000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"    # mtd1: 00400000 00020000 "recovery"
# mtd2: 00280000 00020000 "boot"        # mtd2: 00380000 00020000 "boot"
# mtd3: 07800000 00020000 "system"      # mtd3: 09100000 00020000 "system"
# mtd4: 07800000 00020000 "cache"       # mtd4: 05f00000 00020000 "cache"
# mtd5: 0c440000 00020000 "userdata"    # mtd5: 0c440000 00020000 "userdata"
# mtd6: 00200000 00020000 "crashdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00300000 #0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00400000

ifeq ($(MINISKIRT),true)
# Less fonts saves ~2mb
SMALLER_FONT_FOOTPRINT := true
# Less sounds (ringtones/notifications)
MINIMAL_NEWWAVELABS := true
# Stock hboot has smaller system partition
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 150994944 #0x09000000 #0x08400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 205783040 #0x0c440000
else
# Use larger system partiton
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 220200960 # 230686720
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 228589568 # 209715200
endif

BOARD_FLASH_BLOCK_SIZE := 131072
