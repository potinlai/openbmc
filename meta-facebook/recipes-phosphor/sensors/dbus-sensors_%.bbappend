FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG:remove = " \
    intrusionsensor \
    intelcpusensor \
"
