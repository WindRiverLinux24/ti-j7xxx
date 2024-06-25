FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/${PN}:"

OPTEEOUTPUTMACHINE:ti-j7 = "k3"


FILES:${PN}:ti-j7 += "/lib/firmware/* \
		      /usr/lib/firmware/*"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

DEPENDS:append:ti-j7 = " python3-cryptography-native"

EXTRA_OEMAKE:append:ti-j7 = "${@ 'CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"

do_compile:prepend:ti-j7() {
    export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
}

do_compile:append:ti-j7 () {
    ( cd ${B}/core/; \
        cp tee-pager_v2.bin ${B}/bl32.bin; \
        cp tee.elf ${B}/bl32.elf; \
    )
}

do_install:append:ti-j7() {
    install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
    install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
    install -m 644 ${B}/bl32.elf ${D}${nonarch_base_libdir}/firmware/ || true
}

INSANE_SKIP:${PN}:append:ti-j7 = " textrel"
