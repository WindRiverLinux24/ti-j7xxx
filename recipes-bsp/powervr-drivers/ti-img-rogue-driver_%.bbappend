FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/files:"
COMPATIBLE_MACHINE = "(^$)"
COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

BRANCH:ti-j7 = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"

SRC_URI:ti-j7 = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH} \
	file://0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch \
	file://0001-driver-pvr_buffer_sync-replace-dma_resv_get_list-wit.patch \
	file://0002-services-drop-included-file-stdarg.h.patch \
"
SRCREV:ti-j7 = "c901804e8221d477983a6f7224a9cdc6e832f050"

TARGET_BVNC:ti-j7 = "22.104.208.318"

MACHINE_KERNEL_PR:append:ti-j7 = "b"

do_compile:prepend:ti-j7() {
	cp ${S}/build/linux/config/compilers/aarch64-linux-gnu.mk ${S}/build/linux/config/compilers/aarch64-wrs-linux.mk
}

