# Inherit my config
$(call inherit-product, device/toshiba/ac100/full_ac100.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, vendor/cm/config/telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=paz00 BUILD_FINGERPRINT="motorola/tervigon/wingray:4.1.1/JRO03H/405518:user/release-keys" PRIVATE_BUILD_DESC="tervigon-user 4.1.1 JRO03H 405518 release-keys"

PRODUCT_NAME 				:= cm_ac100
PRODUCT_RELEASE_NAME 			:= ac100
PRODUCT_DEVICE 				:= ac100
PRODUCT_BRAND 				:= toshiba
PRODUCT_MODEL 				:= ac100
PRODUCT_MANUFACTURER 			:= toshiba

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD 		:= true
TARGET_BOOTANIMATION_TEXTURE_CACHE      := true
TARGET_BOOTANIMATION_USE_RGB565         := true
TARGET_SCREEN_HEIGHT 			:= 1024
TARGET_SCREEN_WIDTH 			:= 600
