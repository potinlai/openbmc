FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
RDEPENDS:${PN}:append = " bash"

inherit obmc-phosphor-systemd

SRC_URI:append = " \
    file://server.ttyUSB0.conf \
    file://server.ttyUSB1.conf \
    file://server.ttyUSB2.conf \
    file://server.ttyUSB3.conf \
    file://server.ttyUSB4.conf \
    file://server.ttyUSB5.conf \
    file://server.ttyUSB6.conf \
    file://server.ttyUSB7.conf \
    file://plat-80-obmc-console-uart.rules \
    "

OBMC_CONSOLE_TTYS:append = " ttyUSB0 ttyUSB1 ttyUSB2 ttyUSB3 ttyUSB4 ttyUSB5 ttyUSB6 ttyUSB7"

do_install:append() {
        install -d ${D}${base_libdir}/udev/rules.d/
        install -m 0644 ${UNPACKDIR}/plat-80-obmc-console-uart.rules ${D}${base_libdir}/udev/rules.d/80-obmc-console-uart.rules
}
