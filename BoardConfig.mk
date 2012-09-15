# include Toshiba paz00
include device/toshiba/paz00-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME 		:= paz00
TARGET_OTA_ASSERT_DEVICE                := paz00,ac100,GT-P7510

# Kernel
TARGET_KERNEL_SOURCE 			:= kernel/toshiba/paz00
TARGET_KERNEL_CONFIG 			:= paz00_android_defconfig

BOARD_KERNEL_CMDLINE 			:= mem=512M@0 console=ttyS0,115200n8 androidboot.hardware=paz00 tegrapart=recovery:300:a00:800,boot:d00:1000:800,mbr:1d00:200:800 nvtegra_hideparts=BCT,PT,EBT,MBR,EM1,EM2

# Avoid generating of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 	:= true
