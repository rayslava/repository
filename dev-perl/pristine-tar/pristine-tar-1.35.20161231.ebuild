# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-module

MAJOR_PV="$(ver_cut 1-2)"
TIZEN_ORIG_PV="$(ver_cut 3)"
DESCRIPTION="pristine-tar"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="https://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}.orig.tar.gz
https://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}-tizen${TIZEN_ORIG_PV}.debian.tar.xz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-util/xdelta:3
		app-alternatives/tar"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_prepare () {
	default
	mv debian ${S}
}
