#
# Copyright (C) 2022 The Android Open-Source Project
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

$(call inherit-product, device/rockchip/common/device-common.mk)

PRODUCT_PACKAGES += \

# Default HALs
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.rockchip \
    android.hardware.power@1.0-service.rockchip \
    android.hardware.health@2.0-service.rockchip \
    android.hardware.memtrack@1.0-service.rockchip \
    android.hardware.audio.effect@4.0-service.rockchip \
    android.hardware.audio@4.0-service.rockchip

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@4.0-impl

PRODUCT_COPY_FILES += \
    device/rockchip/common/hal/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Backlight control HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.rockpro64
