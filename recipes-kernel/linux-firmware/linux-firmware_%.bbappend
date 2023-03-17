PACKAGE_ARCH:ti-j7 = "${MACHINE_ARCH}"
FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/files:"

SRC_URI:append:ti-j7 = "\
	file://pvdec_full_bin.fw \
"

TARGET:ti-j7 = "pvdec_full_bin.fw"

do_install:append:ti-j7() {
	install -m 0644 ${WORKDIR}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}
	ln -sf ./cnm/wave521c_k3_codec_fw.bin ${D}${nonarch_base_libdir}/firmware/wave521c_codec_fw.bin
}

FILES:${PN}-pvdec-full-bin:ti-j7 = "\
        ${nonarch_base_libdir}/firmware/${TARGET} \
"
FILES:${PN}-wave521c_codec_fw:ti-j7 = "\
        ${nonarch_base_libdir}/firmware/wave521c_codec_fw.bin \
"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

LICENSE:${PN}:append:ti-j7 = "\
	& Firmware-cadence \
"

LICENCE:${PN}:append:ti-j7 = "\
        & Firmware-cnm \
"

LICENSE:append:ti-j7 = "\
	& Firmware-cadence \
"

LICENCE:append:ti-j7 = "\
        & Firmware-cnm \
"

FILES:${PN}-cadence:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/cadence/mhdp8546.bin \
"

FILES:${PN}-cnm:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin \
"

FILES:${PN}-cadence-license:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/LICENCE.cadence \
"
FILES:${PN}-cnm-licence:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/LICENCE.cnm \
"

RDEPENDS:${PN}-cadence:ti-j7 += "${PN}-cadence-license"
LICENSE:${PN}-cadence:ti-j7       	= "Firmware-cadence"
LICENSE:${PN}-cadence-license:ti-j7  = "Firmware-cadence"

RDEPENDS:${PN}-cnm:ti-j7 += "${PN}-cnm-licence ${PN}-wave521c_codec_fw"
LICENCE:${PN}-cnm:ti-j7             = "Firmware-cnm"
LICENCE:${PN}-cnm-licence:ti-j7  = "Firmware-cnm"

PACKAGES:prepend:ti-j7 = "\
	${PN}-cadence \
	${PN}-cadence-license \
	${PN}-pvdec-full-bin \
	${PN}-cnm \
	${PN}-cnm-licence \
	${PN}-wave521c_codec_fw \
	"
