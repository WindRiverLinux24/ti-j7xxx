COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

ALLOW_EMPTY:${PN}:ti-j7 = "1"

PACKAGECONFIG:append:ti-j7 = "pvr"
RRECOMMENDS:mesa-megadriver:append:class-target:ti-j7 = " ti-img-rogue-driver"
