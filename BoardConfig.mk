# include Toshiba paz00
include device/toshiba/paz00-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME 		:= paz00
TARGET_OTA_ASSERT_DEVICE                := paz00,ac100,GT-P7510

# Kernel
TARGET_KERNEL_SOURCE                   := kernel/toshiba/grouper
#TARGET_KERNEL_CONFIG 			:= cyanogenmod_paz00_defconfig
TARGET_KERNEL_CONFIG                   := paz00_android_debug_defconfig
#TARGET_KERNEL_CONFIG                    := paz00_android_defconfig
#TARGET_KERNEL_CONFIG                   := paz00_android_debug_nonvec_defconfig

#BOARD_KERNEL_CMDLINE 			:= mem=512M@0 console=ttyS0,115200n8 androidboot.hardware=paz00 tegrapart=recovery:300:a00:800,boot:d00:1000:800,mbr:1d00:200:800 nvtegra_hideparts=BCT,PT,EBT,MBR,EM1,EM2

# cmdline with extended debug info
BOARD_KERNEL_CMDLINE                    := mem=512M@0 console=ttyS0,115200n8 no_console_suspend=1 androidboot.hardware=paz00 ignore_loglevel earlyprintk initcall_debug tegrapart=recovery:300:a00:800,boot:d00:1000:800,mbr:1d00:200:800 nvtegra_hideparts=BCT,PT,EBT,MBR,EM1,EM2 tegra_wdt.heartbeat=30 cpufreq.debug=7

# Integrate compat-wireless building
COMPAT_WIRELESS:
	make -C hardware/backports/ ARCH="arm" CROSS_COMPILE="arm-eabi-" KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) mrproper
	make -C hardware/backports/ ARCH="arm" CROSS_COMPILE="arm-eabi-" KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) defconfig-paz00
	make -C hardware/backports/ ARCH="arm" CROSS_COMPILE="arm-eabi-" KLIB=$(KERNEL_OUT) KLIB_BUILD=$(KERNEL_OUT) modules 
	mv hardware/backports/net/wireless/cfg80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/net/mac80211/mac80211.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/drivers/net/wireless/rt2x00/rt2x00usb.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/drivers/net/wireless/rt2x00/rt2800usb.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/drivers/net/wireless/rt2x00/rt2x00lib.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/drivers/net/wireless/rt2x00/rt2800lib.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/compat/compat.ko $(KERNEL_MODULES_OUT)
	mv hardware/backports/drivers/net/wireless/rndis_wlan.ko $(KERNEL_MODULES_OUT)

TARGET_KERNEL_MODULES 			:= COMPAT_WIRELESS

# Jb new additions
#
# Avoid generating of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320	:= true

# Use legacy ICS audio blobs
#USES_AUDIO_LEGACY			:= true

#Use old kernel toolchain.  GCC 4.6 may be the root cause of our modem
#interface dying all the time.
#TARGET_KERNEL_CUSTOM_TOOLCHAIN 		:= arm-eabi-4.4.3

# Use legacy camery istead Gallery2
#BOARD_USES_LEGACY_CAMERA 		:= true

# Custom name for recovery
RECOVERY_NAME 				:= Toshiba AC100 CWM-based Recovery

# Uboot
BOARD_CUSTOM_BOOTIMG_MK 		:= device/toshiba/ac100/uboot-bootimg.mk
# Keep kernel name as zImage
BOARD_USES_UBOOT			:= false
BOARD_USES_UBOOT_MULTIIMAGE 		:= false

# RIL
BOARD_MOBILEDATA_INTERFACE_NAME 	:= "wwan0"

# Test
BOARD_FIRST_CAMERA_FRONT_FACING 	:= true

# Custom release tools for uMulti inclusion
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/toshiba/ac100/releasetools/ac100_ota_from_target_files

