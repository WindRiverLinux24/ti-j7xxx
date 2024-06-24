COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

do_install:append:ti-j7 () {

    if [ ${libdir} = "/usr/lib64" ]; then
        mkdir -p ${D}/usr/lib64/
        mv ${D}/usr/lib/lib* ${D}/usr/lib64/
    fi
}

FILES:${PN}:append:ti-j7 = " /lib/firmware/ \
		              /usr/lib/"

ALLOW_EMPTY:${PN}-firmware:ti-j7 = "1"

INSANE_SKIP:${PN}:append:ti-j7 = " ldflags arch"
