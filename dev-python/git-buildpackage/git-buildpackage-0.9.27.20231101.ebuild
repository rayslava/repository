# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( pypy3 python3_{9..12} )

inherit distutils-r1

MAJOR_PV="$(ver_cut 1-3)"
TIZEN_PV="$(ver_cut 4)"
DESCRIPTION="Git buildpackage python library"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}.orig.tar.gz -> ${P}.tar.gz
http://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}-tizen${TIZEN_PV}.diff.gz -> ${P}-tizen-patch.patch.gz
"

LICENSE="GPL-2"
SLOT="tizen"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-util/osc
dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/coverage[${PYTHON_USEDEP}]
dev-python/nose[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_prepare () {
	default
	unpack ${P}-tizen-patch.patch.gz
	eapply ${WORKDIR}/${P}-tizen-patch.patch  # Apply Tizen patches

	sed -e "s/-tizen${TIZEN_PV}/+tizen${TIZEN_PV}/g" -i debian/*
}
