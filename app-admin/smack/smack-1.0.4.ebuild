# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils

DESCRIPTION="Simplified Mandatory Access Control Kernel userspace utilities"
HOMEPAGE="http://schaufler-ca.com/"
SRC_URI="https://github.com/smack-team/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
AUTOTOOLS_AUTORECONF="yes"
AUTOTOOLS_IN_SOURCE_BUILD="yes"

