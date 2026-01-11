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

inherit obmc-phosphor-dbus-service

OBMC_CONSOLE_TTYS:append = " \
    VSER0 VSER1 VSER2 VSER3 VSER4 VSER5 VSER6 VSER7 VSER8 VSER9 \
    VSER10 VSER11 VSER12 VSER13 VSER14 VSER15 VSER16 VSER17 VSER18 VSER19 \
    VSER20 VSER21 VSER22 VSER23 VSER24 VSER25 VSER26 VSER27 VSER28 VSER29 \
    VSER30 VSER31 \
    "

SRC_URI:append = " \
    file://server.VSER0.conf \
    file://server.VSER1.conf \
    file://server.VSER2.conf \
    file://server.VSER3.conf \
    file://server.VSER4.conf \
    file://server.VSER5.conf \
    file://server.VSER6.conf \
    file://server.VSER7.conf \
    file://server.VSER8.conf \
    file://server.VSER9.conf \
    file://server.VSER10.conf \
    file://server.VSER11.conf \
    file://server.VSER12.conf \
    file://server.VSER13.conf \
    file://server.VSER14.conf \
    file://server.VSER15.conf \
    file://server.VSER16.conf \
    file://server.VSER17.conf \
    file://server.VSER18.conf \
    file://server.VSER19.conf \
    file://server.VSER20.conf \
    file://server.VSER21.conf \
    file://server.VSER22.conf \
    file://server.VSER23.conf \
    file://server.VSER24.conf \
    file://server.VSER25.conf \
    file://server.VSER26.conf \
    file://server.VSER27.conf \
    file://server.VSER28.conf \
    file://server.VSER29.conf \
    file://server.VSER30.conf \
    file://server.VSER31.conf \
    "

SRC_URI:append = " \
    file://use-service-VSER0.conf \
    file://use-service-VSER1.conf \
    file://use-service-VSER2.conf \
    file://use-service-VSER3.conf \
    file://use-service-VSER4.conf \
    file://use-service-VSER5.conf \
    file://use-service-VSER6.conf \
    file://use-service-VSER7.conf \
    file://use-service-VSER8.conf \
    file://use-service-VSER9.conf \
    file://use-service-VSER10.conf \
    file://use-service-VSER11.conf \
    file://use-service-VSER12.conf \
    file://use-service-VSER13.conf \
    file://use-service-VSER14.conf \
    file://use-service-VSER15.conf \
    file://use-service-VSER16.conf \
    file://use-service-VSER17.conf \
    file://use-service-VSER18.conf \
    file://use-service-VSER19.conf \
    file://use-service-VSER20.conf \
    file://use-service-VSER21.conf \
    file://use-service-VSER22.conf \
    file://use-service-VSER23.conf \
    file://use-service-VSER24.conf \
    file://use-service-VSER25.conf \
    file://use-service-VSER26.conf \
    file://use-service-VSER27.conf \
    file://use-service-VSER28.conf \
    file://use-service-VSER29.conf \
    file://use-service-VSER30.conf \
    file://use-service-VSER31.conf \
    "

SYSTEMD_OVERRIDE:${PN}:append = " \
    use-service-VSER0.conf:obmc-console@VSER0.service.d/use-service-VSER0.conf \
    use-service-VSER1.conf:obmc-console@VSER1.service.d/use-service-VSER1.conf \
    use-service-VSER2.conf:obmc-console@VSER2.service.d/use-service-VSER2.conf \
    use-service-VSER3.conf:obmc-console@VSER3.service.d/use-service-VSER3.conf \
    use-service-VSER3.conf:obmc-console@VSER4.service.d/use-service-VSER4.conf \
    use-service-VSER5.conf:obmc-console@VSER5.service.d/use-service-VSER5.conf \
    use-service-VSER6.conf:obmc-console@VSER6.service.d/use-service-VSER6.conf \
    use-service-VSER7.conf:obmc-console@VSER7.service.d/use-service-VSER7.conf \
    use-service-VSER8.conf:obmc-console@VSER8.service.d/use-service-VSER8.conf \
    use-service-VSER9.conf:obmc-console@VSER9.service.d/use-service-VSER9.conf \
    use-service-VSER10.conf:obmc-console@VSER10.service.d/use-service-VSER10.conf \
    use-service-VSER11.conf:obmc-console@VSER11.service.d/use-service-VSER11.conf \
    use-service-VSER12.conf:obmc-console@VSER12.service.d/use-service-VSER12.conf \
    use-service-VSER13.conf:obmc-console@VSER13.service.d/use-service-VSER13.conf \
    use-service-VSER13.conf:obmc-console@VSER14.service.d/use-service-VSER14.conf \
    use-service-VSER15.conf:obmc-console@VSER15.service.d/use-service-VSER15.conf \
    use-service-VSER16.conf:obmc-console@VSER16.service.d/use-service-VSER16.conf \
    use-service-VSER17.conf:obmc-console@VSER17.service.d/use-service-VSER17.conf \
    use-service-VSER18.conf:obmc-console@VSER18.service.d/use-service-VSER18.conf \
    use-service-VSER19.conf:obmc-console@VSER19.service.d/use-service-VSER19.conf \
    use-service-VSER20.conf:obmc-console@VSER20.service.d/use-service-VSER20.conf \
    use-service-VSER21.conf:obmc-console@VSER21.service.d/use-service-VSER21.conf \
    use-service-VSER22.conf:obmc-console@VSER22.service.d/use-service-VSER22.conf \
    use-service-VSER23.conf:obmc-console@VSER23.service.d/use-service-VSER23.conf \
    use-service-VSER23.conf:obmc-console@VSER24.service.d/use-service-VSER24.conf \
    use-service-VSER25.conf:obmc-console@VSER25.service.d/use-service-VSER25.conf \
    use-service-VSER26.conf:obmc-console@VSER26.service.d/use-service-VSER26.conf \
    use-service-VSER27.conf:obmc-console@VSER27.service.d/use-service-VSER27.conf \
    use-service-VSER28.conf:obmc-console@VSER28.service.d/use-service-VSER28.conf \
    use-service-VSER29.conf:obmc-console@VSER29.service.d/use-service-VSER29.conf \
    use-service-VSER30.conf:obmc-console@VSER30.service.d/use-service-VSER30.conf \
    use-service-VSER31.conf:obmc-console@VSER31.service.d/use-service-VSER31.conf \
    "
