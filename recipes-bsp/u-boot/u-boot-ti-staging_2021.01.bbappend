COMPATIBLE_MACHINE:ti-j7 = "ti-j7"
SPL_BINARY:ti-j7 = "tispl.bin"
PACKAGECONFIG:append:ti-j7 = " atf optee dm"
FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/files:"

SRCREV:ti-j7 = "7996ed51f1c979cfdcb4bf4178dc35cf5e1f9778"

SRC_URI:append:ti-j7 = " file://0001-drivers-ram-k3-ddrss-drop-the-whole-file-cps_bm.patch \
"
