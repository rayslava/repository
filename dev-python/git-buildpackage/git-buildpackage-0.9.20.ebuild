# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_8 python3_9 )

inherit eutils distutils-r1 python-r1

DESCRIPTION="Git buildpackage python library"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/git-buildpackage_${PV}.orig.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/setup.patch"
}
