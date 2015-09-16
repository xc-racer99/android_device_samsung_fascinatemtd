# Copyright (C) 2007 The Android Open Source Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

# Use the non-open-source parts, if they're present
-include vendor/samsung/fascinatemtd/BoardConfigVendor.mk

# inherit from aries-common
-include device/samsung/aries-common/BoardConfigCommon.mk

BOARD_MOBILEDATA_INTERFACE_NAME := "ppp0"

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/fascinatemtd

# Camera
BOARD_CAMERA_HAVE_FLASH := true

# Audio
TARGET_PROVIDES_LIBAUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/fascinatemtd/bluetooth

# Kernel Config
TARGET_KERNEL_CONFIG := omni_fascinatemtd_defconfig

BOARD_USERDATAIMAGE_PARTITION_SIZE := 1665130496

# SELinux
BOARD_SEPOLICY_DIRS := $(filter-out device/samsung/aries-common/sepolicy,$BOARD_SEPOLICY_DIRS)
BOARD_SEPOLICY_DIRS += \
	device/samsung/fascinatemtd/sepolicy

# Recovery
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/fascinatemtd/shbootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "echo 1 > /cache/.startrecovery; sync;"
TARGET_RECOVERY_FSTAB := device/samsung/fascinatemtd/fstab.aries

#TWRP
undefine TW_INTERNAL_STORAGE_PATH
undefine TW_INTERNAL_STORAGE_MOUNT_POINT
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true
