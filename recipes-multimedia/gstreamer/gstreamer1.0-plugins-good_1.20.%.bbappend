FILESEXTRAPATHS:prepend:ti-j7 := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE:ti-j7 = "ti-j7"

SRC_URI:append:ti-j7 = " \
    file://0001-v4l2src-Increase-minimum-num-buffers-by-3.patch \
    file://0002-v4l2src-Use-generic-dmabuf-import-in-v4l2src.patch \
    file://0001-v4l2object-Update-formats-table-to-include-YUV422-mu.patch \
    file://0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch \
    file://0001-qmlglsink-fix-build-on-EGL-platform-without-X11-head.patch \
    file://0001-v4l2h264enc-Add-Extended-controls-support-for-H264-e.patch \
    file://0001-Avoiding-Failure-to-allocate-required-memory-error.patch \
    file://0001-v4l2bufferpool-Set-Video-Meta-to-Imported-Buffers.patch \
    file://gst_raw10-12_support.patch \
"
