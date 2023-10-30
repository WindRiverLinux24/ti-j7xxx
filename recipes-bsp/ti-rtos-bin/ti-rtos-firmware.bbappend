COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

PV:ti-j7 = "2022.01"
INC_PR:ti-j7 = "r3"
PLAT_SFX:ti-j78xx = "j784s4"
PLAT_SFX:ti-j72xx = "j721e"

# Firmware versions
CORESDK_RTOS_VERSION:ti-j7 = "08.02.00.04"
TI_LINUX_FW_SRCREV:ti-j7 = "c067ff8fad032a78690e7efd9a010e33e68d7e22"
SRCREV:ti-j7 = "${TI_LINUX_FW_SRCREV}"
K3_IMAGE_GEN_SRCREV:ti-j7 ?= "1319f46f3899e62d88e0a5cedad5b454d0432ddb"

FILES:${PN}:ti-j7 += "${nonarch_base_libdir}"

DM_FW_LIST:ti-j7 = "${DM_FIRMWARE}"

IPC_FW_LIST:ti-j72xx = "${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${C66_1_FW} ${C66_2_FW} ${C7X_1_FW}"

IPC_FW_LIST:ti-j78xx = "${MCU_1_1_FW} ${MCU_2_0_FW} ${MCU_2_1_FW} ${MCU_3_0_FW} ${MCU_3_1_FW} ${MCU_4_0_FW} ${MCU_4_1_FW} ${C7X_1_FW} ${C7X_2_FW} ${C7X_3_FW} ${C7X_4_FW}"

ALTERNATIVE:${PN}:ti-j78xx = "\
                    j784s4-mcu-r5f0_1-fw    j784s4-mcu-r5f0_1-fw-sec \
                    j784s4-main-r5f0_0-fw   j784s4-main-r5f0_0-fw-sec \
                    j784s4-main-r5f0_1-fw   j784s4-main-r5f0_1-fw-sec \
                    j784s4-main-r5f1_0-fw   j784s4-main-r5f1_0-fw-sec \
                    j784s4-main-r5f1_1-fw   j784s4-main-r5f1_1-fw-sec \
                    j784s4-main-r5f2_0-fw   j784s4-main-r5f2_0-fw-sec \
                    j784s4-main-r5f2_1-fw   j784s4-main-r5f2_1-fw-sec \
                    j784s4-c71_0-fw         j784s4-c71_0-fw-sec \
                    j784s4-c71_1-fw         j784s4-c71_1-fw-sec \
                    j784s4-c71_2-fw         j784s4-c71_2-fw-sec \
                    j784s4-c71_3-fw         j784s4-c71_3-fw-sec \
                    "

ALTERNATIVE:${PN}:ti-j72xx = "\
                    j7-mcu-r5f0_1-fw    j7-mcu-r5f0_1-fw-sec \
                    j7-main-r5f0_0-fw   j7-main-r5f0_0-fw-sec \
                    j7-main-r5f0_1-fw   j7-main-r5f0_1-fw-sec \
                    j7-main-r5f1_0-fw   j7-main-r5f1_0-fw-sec \
                    j7-main-r5f1_1-fw   j7-main-r5f1_1-fw-sec \
                    j7-c66_0-fw         j7-c66_0-fw-sec \
                    j7-c66_1-fw         j7-c66_1-fw-sec \
                    j7-c71_0-fw         j7-c71_0-fw-sec \
                    "
DEPENDS:append:ti-j7 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
TI_K3_SECDEV_INSTALL_DIR:ti-j7 = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
TI_SECURE_DEV_PKG:ti-j7 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"

