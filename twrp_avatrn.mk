#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from avatrn device
$(call inherit-product, device/motorola/avatrn/device.mk)

PRODUCT_DEVICE := avatrn
PRODUCT_NAME := twrp_avatrn
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 2024 (gen5)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=avatrn_g \
    PRIVATE_BUILD_DESC="avatrn-user 12 U2UANS34.72-43-2-3 843030 release-keys"

BUILD_FINGERPRINT := motorola/avatrn/avatrn:12/U2UANS34.72-43-2-3/843030:user/release-keys
