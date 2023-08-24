# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1 obs-service

DESCRIPTION="Git Build System"
HOMEPAGE="https://github.com/intel/obs-service-git-buildpackage"
SRC_URI="https://github.com/intel/${PN}/archive/v${PV}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-util/gbs"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/setup.patch"
	"${FILESDIR}/${PV}-2to3.patch"
)

src_prepare() {
	default
	obs-service_src_prepare
}

src_install() {
	distutils-r1_src_install
}
