PACKAGECONFIG:remove:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "glx glu glew", "", d)}"
