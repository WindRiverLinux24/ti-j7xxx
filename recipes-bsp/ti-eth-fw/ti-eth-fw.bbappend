COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

PLAT_SFX:ti-j72xx = "j721e"
PLAT_SFX:ti-j78xx = "j784s4"

ETH_FW_LIST:ti-j7 =  "${ETH_FW}"

# Set up names for the firmwares
ALTERNATIVE:${PN}:ti-j72xx = "\
                    j7-main-r5f0_0-fw \
                    j7-main-r5f0_0-fw-sec \
                    "

ALTERNATIVE:${PN}:ti-j78xx = "\
                    j784s4-main-r5f0_0-fw \
                    j784s4-main-r5f0_0-fw-sec \
                    "
DEPENDS:append:ti-j7 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-j7 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-j7 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
