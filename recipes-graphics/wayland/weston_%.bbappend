PACKAGECONFIG:remove:ti-j7 = " ${@bb.utils.contains("MACHINE_FEATURES", "gpu", "xwayland", "", d)}"
