PACKAGECONFIG:remove:ti-j7 = "${@bb.utils.contains("MACHINE_FEATURES", "gpu", "glx xwayland", "", d)}"
DEPENDS:append:ti-j7 = "${@bb.utils.contains('PACKAGECONFIG', 'dri3', ' libxshmfence', '', d)}"
