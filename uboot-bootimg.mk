#
# Copyright (C) 2012 The Cyanogenmod Project
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

#
# To use this bootimg 
#  
#  Add to your BoardConfig.mk:
#    BOARD_CUSTOM_BOOTIMG_MK := device/common/uboot-bootimg.mk
#  If using uboot multiimage add:
#    BOARD_USES_UBOOT_MULTIIMAGE := true
# 

#
# Ramdisk/boot image
#
LOCAL_PATH := $(call my-dir)

ifneq ($(strip $(TARGET_NO_KERNEL)),true)

    INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img

    INTERNAL_UMULTIIMAGE_ARGS := -A arm -O linux -T ramdisk -C none -a 0x40800000 -n "ramdisk"

    INSTALLED_RAMDISK_TARGET := $(PRODUCT_OUT)/initrd.gz

    INSTALLED_KERNEL_TARGET := $(PRODUCT_OUT)/zImage

    INTERNAL_UMULTIIMAGE_ARGS += -d $(PRODUCT_OUT)/ramdisk.img $(INSTALLED_RAMDISK_TARGET)

$(INSTALLED_RAMDISK_TARGET): $(MKIMAGE) $(INTERNAL_RAMDISK_FILES) $(BUILT_RAMDISK_TARGET)
			$(MKIMAGE) $(INTERNAL_UMULTIIMAGE_ARGS)

$(INSTALLED_BOOTIMAGE_TARGET): $(INSTALLED_RAMDISK_TARGET) $(INSTALLED_KERNEL_TARGET)
			$(hide) rm -f $@
			zip -qDj $@ $(PRODUCT_OUT)/initrd.gz $(INSTALLED_KERNEL_TARGET)
			@echo ----- Made boot image \(zip\) -------- $@

endif #!TARGET_NO_KERNEL

ifneq ($(strip $(TARGET_NO_RECOVERY)),true)
    INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
    recovery_ramdisk := $(PRODUCT_OUT)/ramdisk-recovery.img
    recovery_bootscr := $(PRODUCT_OUT)/system/etc/boot.cmd
    recovery_kernel  := $(PRODUCT_OUT)/zImage-recovery-cm-10-1
    
    RCV_INSTALLED_RAMDISK_TARGET := $(PRODUCT_OUT)/initrd-recovery-cm-10-1.gz

    RCV_INSTALLED_BOOTSCR_TARGET := $(PRODUCT_OUT)/boot.scr

    RCV_INTERNAL_UMULTIIMAGE_ARGS := -A arm -O linux -T ramdisk -C none -a 0x40800000 -n "recovery-ramdisk"

    RCV_INTERNAL_UMULTIIMAGE_ARGS += -d $(PRODUCT_OUT)/ramdisk-recovery.img $(RCV_INSTALLED_RAMDISK_TARGET)

    RCV_INTERNAL_BOOTSCR_ARGS := -A arm -O linux -T script -C none -a 0 -e 0 -n "recovery-script"

    RCV_INTERNAL_BOOTSCR_ARGS += -d $(PRODUCT_OUT)/system/etc/boot.cmd $(RCV_INSTALLED_BOOTSCR_TARGET)

$(RCV_INSTALLED_BOOTSCR_TARGET): $(MKIMAGE) $(recovery_bootscr)  
			$(MKIMAGE) $(RCV_INTERNAL_BOOTSCR_ARGS)

$(RCV_INSTALLED_RAMDISK_TARGET): $(MKBOOTIMG) $(INSTALLED_BOOTIMAGE_TARGET) $(MKIMAGE) $(recovery_ramdisk) $(INSTALLED_KERNEL_TARGET)
			$(MKIMAGE) $(RCV_INTERNAL_UMULTIIMAGE_ARGS)

$(INSTALLED_RECOVERYIMAGE_TARGET): $(RCV_INSTALLED_RAMDISK_TARGET) $(INSTALLED_KERNEL_TARGET) $(RCV_INSTALLED_BOOTSCR_TARGET)
			$(hide) rm -f $@
			$(hide) cp $(INSTALLED_KERNEL_TARGET) $(recovery_kernel)
			zip -qDj $@ $(RCV_INSTALLED_RAMDISK_TARGET) $(recovery_kernel) $(RCV_INSTALLED_BOOTSCR_TARGET)
			@echo ----- Made recovery image \(zip\) -------- $@
endif #!TARGET_NO_RECOVERY

