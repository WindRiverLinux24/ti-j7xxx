IMAGE_INSTALL += "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "img-pvr-sdk mesa-pvr ti-img-rogue-driver ti-img-rogue-umlibs devil", " ", d)}"
IMAGE_INSTALL += 'u-boot-ti-staging'
IMAGE_INSTALL += 'ti-rtos-firmware ti-dm-fw ti-eth-fw'
