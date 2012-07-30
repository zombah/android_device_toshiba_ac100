LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

TARGET_KERNEL_SOURCE := kernel/toshiba/paz00
TARGET_KERNEL_CONFIG := paz00_android_defconfig

# include the non-open-source counterpart to this file
-include vendor/toshiba/paz00/AndroidBoardVendor.mk
