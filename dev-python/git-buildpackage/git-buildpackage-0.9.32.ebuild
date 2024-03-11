# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1

MY_PN="${PN}-debian"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Git buildpackage python library"
HOMEPAGE="https://github.com/agx/git-buildpackage"
SRC_URI="https://github.com/agx/git-buildpackage/archive/refs/tags/debian/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
dev-python/python-dateutil[${PYTHON_USEDEP}]
dev-python/pip[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

python_compile() {
	WITHOUT_NOSETESTS=1 distutils-r1_python_compile
}

python_install() {
	WITHOUT_NOSETESTS=1 distutils-r1_python_install
}
