COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

PLAT_SFX = ""
PLAT_SFX:ti-j72xx = "j721e"
PLAT_SFX:ti-j78xx = "j784s4"

TI_DM_FW_VERSION = "08.06.04"
DM_FW_LIST:ti-j7 = "${DM_FIRMWARE}"

# Set up names for the firmwares
ALTERNATIVE:${PN}:ti-j72xx = "j7-mcu-r5f0_0-fw"
ALTERNATIVE:${PN}:ti-j78xx = "j784s4-mcu-r5f0_0-fw"

DEPENDS:append:ti-j7 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-j7 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-j7 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"

