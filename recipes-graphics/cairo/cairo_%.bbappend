PACKAGECONFIG:append:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", " egl glesv2", "", d)}"
PACKAGECONFIG:remove:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "opengl", "", d)}"
