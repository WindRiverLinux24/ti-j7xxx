PV:ti-j7 = "2.6"
LIC_FILES_CHKSUM:ti-j7 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
SRC_URI:ti-j7 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
SRCREV_tfa:ti-j7 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
TFA_BUILD_TARGET:ti-j7 = "all"
TFA_INSTALL_TARGET:ti-j7 = "bl31"
TFA_SPD:ti-j7 = "opteed"
TFA_PLATFORM:ti-j7 = "k3"

FILES:${PN}:ti-j7 += "/firmware/*"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"
