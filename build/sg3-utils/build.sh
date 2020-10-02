#!/usr/bin/bash
#
# {{{
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#
# }}}
#
# Copyright 2020 Carsten Grzemba

. ../../lib/functions.sh

PROG=sg3_utils
VER=1.45
PKG=ooce/system/storage/sg3_utils
SUMMARY="the sg3-utils SCSI utilities"
DESC="Collection of utilities for devices that use the SCSI command set. Includes utilities to copy data based on 'dd' syntax and semantics (called sg_dd, sgp_dd and sgm_dd); check INQUIRY data and VPD pages (sg_inq); check mode and log pages (sginfo, sg_modes and sg_logs); spin up and down disks (sg_start); do self tests (sg_senddiag); and various other functions. Warning: Some of these tools access the internals of your system and the incorrect usage of them may render your system inoperable."


CONFIGURE_OPTS+="
    --prefix=$PREFIX
    --sysconfdir=/etc$PREFIX
    --localstatedir=/var$PREFIX
    --disable-static
"

set_arch 64

SRC_DIR="sg/p"
set_mirror "http://sg.danny.cz"
set_checksum sha256 "c7dab547dc37381fa50e482d9da680fe64b88cfe0e3d79b61e478de14f58b2ee"

# create package functions
init
download_source $SRC_DIR $PROG $VER
patch_source
prep_build
build
strip_install
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
