#@TYPE: Machine inc.
#@NAME: ti-j7

MACHINEOVERRIDES =. "ti-j7:"

DEFAULTTUNE = "cortexa72"
require conf/machine/include/arm/armv8a/tune-cortexa72.inc

MACHINE_FEATURES += "ext3 pci usbgadget usbhost vfat keyboard network"

DISTRO_FEATURES:append = " vfat serial emmc SD"

KERNEL_IMAGETYPE = "Image"
KERNEL_IMAGETYPES = "Image.gz Image"

SERIAL_CONSOLE = "115200 ttyS0"

MACHINE_EXTRA_RRECOMMENDS = " kernel-modules kernel-devicetree"
IMAGE_FSTYPES += "tar.bz2 wic wic.bmap"
WKS_FILE ?= "j7xxx-sdimage.wks"
IMAGE_INSTALL:append = " kernel-devicetree kernel-image-image"
do_image_wic[depends] += " mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"

KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb"
KERNEL_DTBVENDORED = "1"

# multilib support
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 ?= "armv7athf-neon"
PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
PREFERRED_VERSION_linux-yocto ?= "6.1%"
MACHINE_EXTRA_RRECOMMENDS += "linux-firmware-cadence linux-firmware-pvdec-full-bin linux-firmware-cnm"

# to fix dtbo loading error due to the lack of symbols in the generated overlay dtbo file.
KERNEL_EXTRA_ARGS = " DTC_FLAGS='-@'"

PREFERRED_PROVIDER_virtual/egl = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles3 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles2 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgles1 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgbm = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libgl = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/libglx = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"
PREFERRED_PROVIDER_virtual/mesa = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr", "mesa", d)}"

NON_MULTILIB_RECIPES:append = " u-boot-ti-staging optee-os trusted-firmware-a ti-rtos-firmware ti-dm-fw ti-eth-fw ti-k3-secdev"
# For ostree
OSTREE_BOOTLOADER_INCLUDE ?= ""

# No u-boot
OSTREE_SD_UBOOT_WIC1 ?= ""

OSTREE_BOOTSCR_PRECMD ?= " \
setenv no_menu yes; \
setenv no_setexpr yes; \
if test ! -n \${devnum}; then setenv devnum 1; fi; \
setenv loadaddr 0x82000000; \
setenv loadaddr1 0x82000001; \
setenv loadaddr2 0x82000002; \
setenv fdt_addr 0x88000000; \
setenv initrd_addr 0x98000000; \
setenv bct_addr 0x82000200; \
setenv bct_addr1 0x82000201; \
setenv console ttyS2; \
setenv baudrate 115200; \
"

OSTREE_SD_BOOT_ALIGN ?= "4096"
OSTREE_FDISK_BLM ?= "8192"
OSTREE_FDISK_FSZ ?= "132"
INITRAMFS_IMAGE ??= ""
IMAGE_BOOT_FILES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ostree', '${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES};initramfs boot.scr', '', d)} \
"
OSTREE_KERNEL ?= "Image"
OSTREE_COPY_IMAGE_BOOT_FILES = "1"
OSTREE_UBOOT_CMD ?= "booti"
OSTREE_WKS_EFI_SIZE ?= "--size=64M"

# For ustart.img
OSTREE_NETINST_DEV ?= "/dev/mmcblk0,/dev/sda,/dev/vda"
OSTREE_NETINST_ARGS ?= "${OSTREE_CONSOLE} bl=ufsd rdinit=/install instdev=${OSTREE_NETINST_DEV} instname=wrlinux instbr=\$BRANCH insturl=\$URL instab=${OSTREE_USE_AB} instsf=1 instdate=BUILD_DATE"
