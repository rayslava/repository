# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..11} )
inherit distutils-r1

DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/rpm[python]
		dev-libs/depanneur
		dev-perl/Crypt-SSLeay
		app-emulation/qemu[static-user]
		=dev-python/git-buildpackage-0.9.21
		dev-python/pyyaml
		dev-util/suse-build"
RDEPEND="${DEPEND}"

PATCHES=(
	${FILESDIR}/${PV}-2to3.patch
)

src_prepare() {
	default
}

python_compile() {
	distutils-r1_python_compile
	cd bsr && distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install
	cd bsr && distutils-r1_python_install
}
