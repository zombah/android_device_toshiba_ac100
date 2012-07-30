# Release name                                                                                                          
PRODUCT_RELEASE_NAME := ac100_116

$(call inherit-product, device/toshiba/ac100_116/full_ac100_116.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=paz00 BUILD_FINGERPRINT="motorola/tervigon/wingray:4.0.4/IMM76/292727:user/release-keys" PRIVATE_BUILD_DESC="tervigon-user 4.0.4 IMM76 292727 release-keys"

PRODUCT_NAME := cm_ac100_116
PRODUCT_RELEASE_NAME := ac100_116
PRODUCT_DEVICE := ac100_116
PRODUCT_BRAND := toshiba
PRODUCT_MODEL := ac100_116
PRODUCT_MANUFACTURER := toshiba

TARGET_BOOTANIMATION_NAME := horizontal-1024x600
