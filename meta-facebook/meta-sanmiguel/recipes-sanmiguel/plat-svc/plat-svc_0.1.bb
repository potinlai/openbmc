LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

inherit allarch
inherit systemd
inherit obmc-phosphor-utils

S = "${UNPACKDIR}/sources"

NIC_SNR_POLL_INSTANCES = " \
    IOB0_NIC0 IOB0_NIC1 \
    IOB1_NIC0 IOB1_NIC1 \
    IOB2_NIC0 IOB2_NIC1 \
    IOB3_NIC0 IOB3_NIC1 \
    NS_NIC \
    "
NIC_SNR_READ_INSTFMT = "nic-snr-read@{0}.service "

RDEPENDS:${PN} += "bash"
RDEPENDS:${PN} += "libgpiod-tools"
RDEPENDS:${PN} += "fb-common-functions"

# udev rules
SRC_URI:append = " \
    file://99-cp2112-bind.rules \
    file://99-cp2112-cx9-gpio.rules \
    "

# scripts
SRC_URI:append = " \
    file://platform-early-sys-init \
    file://standby-power-enable \
    file://nic-snr-read \
    "

# services
SRC_URI:append = " \
    file://platform-sys-init.service \
    file://nic-snr-read@.service \
    "

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN}:append = " \
    platform-sys-init.service \
    ${@compose_list(d, 'NIC_SNR_READ_INSTFMT', 'NIC_SNR_POLL_INSTANCES')} \
    "

FILES:${PN} += " \
    ${systemd_system_unitdir}/platform-sys-init.service \
    ${systemd_system_unitdir}/nic-snr-read@.service \
    "

do_install() {
    # install scripts
    PLATSVC_LIBEXECDIR="${D}${libexecdir}/plat-svc"
    install -d ${PLATSVC_LIBEXECDIR}
    install -m 0755 ${UNPACKDIR}/platform-early-sys-init ${PLATSVC_LIBEXECDIR}
    install -m 0755 ${UNPACKDIR}/standby-power-enable ${PLATSVC_LIBEXECDIR}
    install -m 0755 ${UNPACKDIR}/nic-snr-read ${PLATSVC_LIBEXECDIR}

    # install udev rules
    UDEV_RULES_DIR="${D}${sysconfdir}/udev/rules.d"
    install -d ${UDEV_RULES_DIR}
    install -m 0644 ${UNPACKDIR}/99-cp2112-bind.rules ${UDEV_RULES_DIR}/99-cp2112-bind.rules
    install -m 0644 ${UNPACKDIR}/99-cp2112-cx9-gpio.rules ${UDEV_RULES_DIR}/99-cp2112-cx9-gpio.rules

    # install services
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${UNPACKDIR}/platform-sys-init.service ${D}${systemd_system_unitdir}
    install -m 0644 ${UNPACKDIR}/nic-snr-read@.service ${D}${systemd_system_unitdir}
}

