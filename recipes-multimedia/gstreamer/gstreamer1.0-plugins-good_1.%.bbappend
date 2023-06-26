FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

SRC_URI:append:ti-j7 = " \
    file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
    file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
"
