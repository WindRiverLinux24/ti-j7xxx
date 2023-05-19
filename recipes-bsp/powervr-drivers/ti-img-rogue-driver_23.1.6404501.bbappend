COMPATIBLE_MACHINE = "(^$)"
COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

do_compile:prepend:ti-j7() {
	cp ${S}/build/linux/config/compilers/aarch64-linux-gnu.mk ${S}/build/linux/config/compilers/aarch64-wrs-linux.mk
}

