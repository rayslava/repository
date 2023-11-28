# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1

MY_PATCH_HASH="tizen20210514"
DESCRIPTION="Git buildpackage python library"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${PN}_${PV}.orig.tar.gz -> ${P}.tar.gz
http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${PN}_${PV}-${MY_PATCH_HASH}.diff.gz -> ${P}-tizen-patch.patch.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-util/osc
dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/coverage[${PYTHON_USEDEP}]
dev-python/nose[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/setup.patch"
	"${FILESDIR}/${PV}-2to3.patch"
)

src_prepare () {
	default
	eapply "${WORKDIR}/${P}-tizen-patch.patch"  # Apply Tizen patches
}
