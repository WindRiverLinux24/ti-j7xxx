FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/${PN}:"

PR:append:ti-j7 = ".arago12"

SRC_URI:append:ti-j7 = " \
    file://weston.ini \
    file://weston-launch-calibrator.sh \
"

do_install:append:ti-j7() {
    install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
}

FILES:${PN}:append:ti-j7 = "${bindir}/weston-launch-calibrator"
