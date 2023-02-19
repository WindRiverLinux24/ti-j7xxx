RDEPENDS:libgl-mesa:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "ti-img-rogue-umlibs", "", d)}"
J7-GPU:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "yes", "no", d)}"
PACKAGECONFIG:append:ti-j7 = " gallium"

do_install:append:ti-j7 () {
    if [ ${J7-GPU} = "yes" ]; then
        rm -rf ${D}${includedir}/KHR \
        rm -rf ${D}${libdir}/libglapi.* \
        rm ${D}${libdir}/pkgconfig/dri.pc \
        rm -rf ${D}${libdir}/dri 
    fi
}
