# to avoid incompatible with host aarch64-wrs-linux
COMPATIBLE_HOST:ti-j7 = "${HOST_SYS}"
COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

DEPENDS:append:ti-j7 = " openssl-native"
