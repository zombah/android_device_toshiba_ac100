#
# Copyright (C) 2011 The Android Open-Source Project
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

# Base config files
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/prebuild/init.paz00.rc:root/init.paz00.rc \
    device/toshiba/paz00-common/prebuild/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    device/toshiba/paz00-common/prebuild/init.local.rc:system/etc/init.local.rc \
    device/toshiba/paz00-common/prebuild/ueventd.paz00.rc:root/ueventd.paz00.rc \
    device/toshiba/paz00-common/prebuild/tiny_hw.xml:system/etc/sound/ac100.xml \
    device/toshiba/paz00-common/prebuild/media_profiles.xml:system/etc/media_profiles.xml \
    device/toshiba/paz00-common/prebuild/excluded-input-devices.xml:system/etc/excluded-input-devices.xml \
    device/toshiba/paz00-common/prebuild/egalax_i2c.idc:system/usr/idc/egalax_i2c.idc \
    device/toshiba/paz00-common/prebuild/egalax_ts.idc:system/usr/idc/egalax_ts.idc \
    device/toshiba/paz00-common/prebuild/01NVOptimalization:system/etc/init.d/01NVOptimalization \
    device/toshiba/paz00-common/prebuild/02PmDebug:system/etc/init.d/02PmDebug \
    device/toshiba/paz00-common/prebuild/03LedBehaviour:system/etc/init.d/03LedBehaviour \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml 

# Keychars
# Keylayout
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/keymaps/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
    device/toshiba/paz00-common/keymaps/gpio-keys.kcm:system/usr/keychars/gpio-keys.kcm \
    device/toshiba/paz00-common/keymaps/NVEC_power_button.kcm:system/usr/keychars/NVEC_power_button.kcm \
    device/toshiba/paz00-common/keymaps/nvec_keyboard.kcm:system/usr/keychars/nvec_keyboard.kcm \
    device/toshiba/paz00-common/keymaps/NVEC_sleep_button.kcm:system/usr/keychars/NVEC_sleep_button.kcm \
    device/toshiba/paz00-common/keymaps/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    device/toshiba/paz00-common/keymaps/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/toshiba/paz00-common/keymaps/NVEC_power_button.kl:system/usr/keylayout/NVEC_power_button.kl \
    device/toshiba/paz00-common/keymaps/nvec_keyboard.kl:system/usr/keylayout/nvec_keyboard.kl \
    device/toshiba/paz00-common/keymaps/NVEC_sleep_button.kl:system/usr/keylayout/NVEC_sleep_button.kl 

# Terminfo
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/prebuild/terminfo:system/etc/terminfo/c/cm \
    device/toshiba/paz00-common/prebuild/terminfo:system/etc/terminfo/l/linux \
    device/toshiba/paz00-common/prebuild/terminfo:system/etc/terminfo/s/screen \
    device/toshiba/paz00-common/prebuild/terminfo:system/etc/terminfo/u/unknown \
    device/toshiba/paz00-common/prebuild/terminfo:system/etc/terminfo/x/xterm 

# Vold
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/prebuild/vold.fstab:system/etc/vold.fstab

# WiFi/BT Firmware
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/prebuild/firmware/rt2870.bin:system/vendor/firmware/rt2870.bin \
    device/toshiba/paz00-common/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/toshiba/paz00-common/wifi/hostapd.conf:system/etc/wifi/hostapd.conf

# Some files for 3G
PRODUCT_COPY_FILES += \
    device/toshiba/paz00-common/ppp/ip-up:/system/etc/ppp/ip-up \
    device/toshiba/paz00-common/ppp/ip-down:/system/etc/ppp/ip-down \
    device/toshiba/paz00-common/ppp/gprs:system/etc/ppp/peers/gprs \
    device/toshiba/paz00-common/prebuild/wwlan_select.sh:/system/bin/wwlan_select.sh

PRODUCT_PACKAGES := \
    static_busybox \
    make_ext4fs \
    mkfs.vfat \
    recovery_mkfs.vfat \
    setup_fs \
    com.android.future.usb.accessory \
    hwprops

PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    wifi.interface=wlan0 \
    keyguard.no_require_sim=true \
    ro.sf.lcd_density=120 

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    persist.sys.strictmode.visual=0

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.strictmode.visual=0

# Resolution settings
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := xlarge mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

DEVICE_PACKAGE_OVERLAYS := \
    device/toshiba/paz00-common/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    librs_jni \
    liba2dp \
    lights.tegra \
    com.android.future.usb.accessory \
    camera.tegra \
    libpkip \
    libaudioutils \
    tinyplay \
    tinycap \
    tinymix \
    audio.primary.tegra \
    audio.a2dp.default \
    FolioParts \
    wmiconfig

# Extra apps
PRODUCT_PACKAGES += \
    libhuaweigeneric-ril \
    libmbm-ril \
    FileManager \
    dropbear \
    VideoChatCameraTestApp \
    RpcPerformance \
    procstatlog \
    sensors.tegra \
    hciattach \
    hcitool \
    hcidump \
    avinfo \
    hciconfig \
    l2ping \
    rfcomm \
    libncurses \
    vim \
    powerbtnd

$(call inherit-product-if-exists, vendor/toshiba/paz00/device-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
