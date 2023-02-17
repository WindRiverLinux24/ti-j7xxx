PACKAGE_ARCH:ti-j7 = "${MACHINE_ARCH}"
FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/files:"

SRC_URI:append:ti-j7 = "\
	file://pvdec_full_bin.fw \
"

TARGET:ti-j7 = "pvdec_full_bin.fw"

do_install:append:ti-j7() {
	install -m 0644 ${WORKDIR}/${TARGET} ${D}${nonarch_base_libdir}/firmware/${TARGET}
}

FILES:${PN}-pvdec-full-bin:ti-j7 = "\
        ${nonarch_base_libdir}/firmware/${TARGET} \
"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

LICENSE:${PN}:append:ti-j7 = "\
	& Firmware-cadence \
"

LICENSE:append:ti-j7 = "\
	& Firmware-cadence \
"

FILES:${PN}-cadence:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/cadence/mhdp8546.bin \
"
FILES:${PN}-cadence-license:ti-j7 = " \
  ${nonarch_base_libdir}/firmware/LICENCE.cadence \
"
RDEPENDS:${PN}-cadence:ti-j7 += "${PN}-cadence-license"
LICENSE:${PN}-cadence:ti-j7       	= "Firmware-cadence"
LICENSE:${PN}-cadence-license:ti-j7  = "Firmware-cadence"

PACKAGES:prepend:ti-j7 = "\
	${PN}-cadence \
	${PN}-cadence-license \
	${PN}-pvdec-full-bin \
	"
