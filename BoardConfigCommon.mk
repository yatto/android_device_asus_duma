#
# Copyright (C) 2011 The Android Open-Source Project
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


# Variants
TARGET_OTA_ASSERT_DEVICE := duma,K005,ME302KL


TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# SDClang
TARGET_USE_SDCLANG := true

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
# BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=msm8960 maxcpus=2
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=duma user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += vmalloc=340M androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_KERNEL_SOURCE := kernel/asus/duma
TARGET_KERNEL_CONFIG := Glitch_duma_defconfig

BOARD_USES_ALSA_AUDIO:= true
BOARD_USES_LEGACY_ALSA_AUDIO:= false
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/duma/bluetooth

# RIL
TARGET_RIL_VARIANT := caf


# Media HAL
BOARD_GLOBAL_CFLAGS += -DQCOM_BSP_LEGACY
BOARD_GLOBAL_CPPFLAGS += -DQCOM_BSP_LEGACY



# FIXME: HOSTAPD-derived wifi driver
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
USE_OPENGL_RENDERER := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 3200000
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
TARGET_USES_SF_BYPASS := true
TARGET_USES_C2D_COMPOSITON := true


# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS), linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_ONLY ?= true


# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 16 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 16 MB
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 # 10 MB
BOARD_PERSISTIMAGE_PARTITION_SIZE := 15360000 # 14.6 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736 # 1.5 GB
BOARD_CACHEIMAGE_PARTITION_SIZE := 549453824 # 524 MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27648834560 # 27.6 GB

# Filesystems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

#Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Native suppor NTFS &EXFAT Filesystems
TARGET_USES_EXFAT := true
KERNEL_EXFAT_MODULE_NAME := "exfat"
TARGET_USES_NTFS := true
KERNEL_NTFS_MODULE_NAME := "ntfs"

BOARD_USES_SECURE_SERVICES := true


USE_CAMERA_STUB := false
BOARD_USES_CAMERA_FAST_AUTOFOCUS := false

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true

TARGET_USES_POST_PROCESSING := true
TARGET_CUSTOM_DISPLAY_TUNING := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

USE_DEVICE_SPECIFIC_CAMERA:= true

HAVE_ADRENO_SOURCE:= false

BOARD_SEPOLICY_DIRS += device/asus/duma/sepolicy


# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# CM Hardware
BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw

# Recovery
TARGET_RECOVERY_DENSITY := hdpi

-include vendor/asus/duma/BoardConfigVendor.mk
