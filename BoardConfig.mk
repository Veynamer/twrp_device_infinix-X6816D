#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/X6816D

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    mmcblk0boot1 \
    trustos \
    sml \
    teecfg \
    vbmeta \
    vbmeta_system \
    vbmeta_system_ext \
    vbmeta_vendor \
    vbmeta_product \
    dtbo \
    uboot \
    vendor_boot \
    l_modem \
    l_agdsp \
    l_cdsp \
    l_gdsp \
    l_ldsp \
    pm_sys \
    l_fixnv1 \
    l_fixnv2 \
    l_deltanv \
    system \
    system_ext \
    vendor \
    product \
    vendor_dlkm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := $(TARGET_ARCH_VARIANT)
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := $(TARGET_CPU_VARIANT)

# Assert
TARGET_OTA_ASSERT_DEVICE := Infinix-X6816D

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X6816D
TARGET_NO_BOOTLOADER := true
#TARGET_USES_UEFI := true

# Display
TARGET_SCREEN_DENSITY := 320


#vendor_boot configuration
TARGET_NO_RECOVERY := true
BOARD_BOOT_HEADER_VERSION := 4
TARGET_NO_KERNEL := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_RAMDISK_USE_LZ4 := true
TW_LOAD_VENDOR_BOOT_MODULES := true

# MKBOOTIMG from original vendor_boot 
BOARD_VENDOR_BASE := 0x00000000
# TODO: remove "androidboot.." from kernel cmdline after verification
BOARD_VENDOR_CMDLINE :=  console=ttyS1,115200n8 buildvariant=user
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_VENDOR_BASE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600

# super
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := group_unisoc
BOARD_GROUP_UNISOC_PARTITION_LIST := system system_ext product vendor vendor_dlkm
BOARD_GROUP_UNISOC_SIZE := 9122611200 # TODO: Fix hardcoded value
# https://source.android.com/devices/bootloader/partitions/generic-boot#combinations, "Launch device without recovery partition":

# filesystem
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# copyout
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 3

# Platform
BOARD_USES_SPRD_HARDWARE := true
TARGET_BOARD_PLATFORM := ums512

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_METADATA_PARTITION := true
TW_USE_FSCRYPT_POLICY := 2
#BOARD_FORCE_ENCRYPT := false
#TW_PREPARE_DATA_MEDIA_EARLY := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Properties prop & fstab
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
RECOVERY_SDCARD_ON_DATA := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /dev/block/loop%d
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION :=  INFINIX-X6816D
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEFAULT_LANGUAGE := en
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_CUSTOM_CPU_TEMP_PATH = "/sys/class/thermal/thermal_zone1/temp"
# screen
TW_FRAMERATE := 60
TW_BRIGHTNESS_PATH := "/sys/class/backlight/sprd_backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 4095
TW_MAX_BRIGHTNESS := 4095
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true

# INCLUDE TWRP CONFIG
TW_INCLUDE_PYTHON := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_FASTBOOTD := true
TW_HAS_MTP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# EXCLUDE TWRP CONFIG
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_FLASH_CURRENT_TWRP := true
TW_EXCLUDE_APEX := true

# StatusBar
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"
# Debug
TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

#additional lib for fix decryption
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk_platform \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk_platform \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk_platform \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk_platform \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk_platform \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk_platform \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkernelbootcp.trusty \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkernelbootcp.trusty \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkey \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkey \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrustyHalHelper \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrustyHalHelper \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrusty.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrusty.so \ 
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk_platform.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk_platform.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk_platform.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk_platform.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkernelbootcp.trusty.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkernelbootcp.trusty.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkey.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkey.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrustyHalHelper.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrustyHalHelper.so \
