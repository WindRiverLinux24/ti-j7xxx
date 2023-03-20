COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

SRCREV:ti-j7 = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
PR:ti-j7 = "r2"

do_install:append:ti-j7 () {

    if [ ${libdir} = "/usr/lib64" ]; then
        mkdir -p ${D}/usr/lib64/
        mv ${D}/usr/lib/lib* ${D}/usr/lib64/
        mv ${D}/usr/lib/pkgconfig ${D}/usr/lib64/
    fi
}

FILES:${PN}:append:ti-j7 = " /lib/firmware/ \
		              /usr/lib/"


