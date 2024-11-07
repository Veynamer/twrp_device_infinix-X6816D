#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from Infinix-X6816D device
$(call inherit-product, device/infinix/X6816D/device.mk)

PRODUCT_DEVICE := X6816D
PRODUCT_NAME := twrp_X6816D
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6816D
PRODUCT_MANUFACTURER := infinix