#
# Copyright 2014 The Android Open Source Project
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

# Inherit from the proprietary version
-include vendor/huawei/u8950/BoardConfigVendor.mk

# Inherit from the common msm7x27a definitions
-include device/huawei/msm7x27a-common/BoardConfigCommon.mk

-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk

TARGET_CPU_SMP := true

TARGET_BOOTLOADER_BOARD_NAME := u8950
TARGET_OTA_ASSERT_DEVICE := u8950,hwu8950,u8950-1,g600

# Audio
TARGET_HAS_QACT := false

# Bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/huawei/u8950/bluetooth/vnd_u8950.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/u8950/bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true

# RIL
BOARD_RIL_CLASS := ../../../device/huawei/u8950/ril/

# Kernel
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_CMDLINE := androidboot.hardware=huawei androidboot.selinux=permissive
BOARD_PAGE_SIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01800000
TARGET_KERNEL_SOURCE := kernel/huawei/huawei-kernel-3.4
TARGET_KERNEL_CONFIG := u8950_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro-4.9-15.05/bin/arm-linux-gnueabihf-

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824 # 0x40000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1207943168 # 0x47FFC000

# Recovery
TARGET_RECOVERY_FSTAB := device/huawei/u8950/rootdir/fstab.huawei

BOARD_CACHE_DEVICE := /dev/block/mmcblk0p15
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p17
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_DATA_DEVICE := /dev/block/mmcblk0p18
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw

DEVICE_RESOLUTION := 540x960
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/u8950/recovery/graphics.c

# Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG := "firmware_path=${WIFI_DRIVER_FW_PATH_STA} nvram_path=/system/etc/nvram_4330.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/${WIFI_DRIVER_MODULE_NAME}.ko"
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/${WIFI_EXT_MODULE_NAME}.ko"

BOARD_LEGACY_NL80211_STA_EVENTS := true

# QCOM
#-include build/core/qcom_target.mk
#-include build/core/qcom_utils.mk
