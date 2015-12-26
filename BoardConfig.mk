#
# Copyright (C) 2014 The CyanogenMod Project
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

-include device/oppo/common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := neo5,r831l

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

LOCAL_PATH := device/oppo/neo5

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait


BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 earlyprintk androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := neo5_defconfig
TARGET_KERNEL_SOURCE := kernel/oppo/neo5

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Graphics
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
USE_OPENGL_RENDERER := true

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1866465280
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

TARGET_USES_ION := true
TARGET_USE_KINGFISHER_OPTIMIZATION := true

#Add support for firmare upgrade on 8226
HAVE_FT_FW_UPGRADE := true
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true

# RPC
TARGET_NO_RPC := true

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_IMPL := dlmalloc

# SELinux
# include device/qcom/sepolicy/sepolicy.mk

# BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
CONFIG_EAP_PROXY                 := qmi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

#Disable memcpy_base.S optimization
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true

-include vendor/oppo/neo5/BoardConfigVendor.mk
