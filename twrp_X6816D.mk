#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from Infinix-X6816D device
$(call inherit-product, device/infinix/X6816D/device.mk)

PRODUCT_DEVICE := X6816D
PRODUCT_NAME := twrp_X6816D
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6816D
PRODUCT_MANUFACTURER := INFINIX MOBILITY LIMITED

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="X6816D-user 12 SP1A.210812.016 235 release-keys"

BUILD_FINGERPRINT := Infinix/X6816D-RU/Infinix-X6816D:12/SP1A.210812.016/240407V163:user/release-keys