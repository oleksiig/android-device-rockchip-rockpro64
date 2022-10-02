
# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/verity.mk)

PRODUCT_NAME := rockpro64
PRODUCT_DEVICE := rockpro64

PRODUCT_MODEL := RockPro64
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Android

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi mdpi

PRODUCT_LOCALES := en_US ua_UA

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0

PRODUCT_SUPPORTS_BOOT_SIGNER := false
PRODUCT_SUPPORTS_VERITY_FEC := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
# From build/make/target/product/go_defaults_common.mk
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
    
# Do not generate libartd.
# From build/make/target/product/go_defaults_common.mk
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

$(call inherit-product, device/rockchip/rockpro64/device.mk)
