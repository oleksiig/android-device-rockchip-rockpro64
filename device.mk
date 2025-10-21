#
# Copyright (C) 2025 The Android Open-Source Project
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

PRODUCT_SOONG_NAMESPACES += device/rockchip/rockpro64

$(call inherit-product, device/rockchip/common/device-common.mk)

# Adjust the dalvik heap to be appropriate for a tablet.
$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Default HALs
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.example \
    android.hardware.power-service.example \
    android.hardware.power.stats-service.example \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery \
    android.hardware.health.storage-service.default

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.audio.effect@5.0-service.rockchip \
    android.hardware.audio@5.0-service.rockchip

PRODUCT_PACKAGES += \

PRODUCT_COPY_FILES += \
    device/rockchip/common/hal/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Backlight control HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.rockpro64

# Touchcreen config file
PRODUCT_COPY_FILES += \
    device/rockchip/rockpro64/Vendor_0416_Product_038f.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Vendor_0416_Product_038f.idc
