IMAGE_INSTALL += "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "mesa-pvr ti-img-rogue-driver ti-img-rogue-umlibs devil weston weston-init wayland-protocols wayland", " ", d)}"
IMAGE_INSTALL += 'u-boot-ti-staging'
IMAGE_INSTALL += 'ti-rtos-echo-test-fw ti-dm-fw ti-eth-fw-j721e ti-eth-fw-j784s4'
