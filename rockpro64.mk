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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# en_US only
PRODUCT_LOCALES := en_US

PRODUCT_NAME := rockpro64
PRODUCT_DEVICE := rockpro64

PRODUCT_MODEL := RockPro64
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Android

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi mdpi

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0

$(call inherit-product, device/rockchip/rockpro64/device.mk)
