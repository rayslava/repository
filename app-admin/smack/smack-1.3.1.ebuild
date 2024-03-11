# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit autotools

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

src_prepare() {
	default
	./autogen.sh || die
}
