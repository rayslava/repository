# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( pypy3 python3_{9..12} )

inherit distutils-r1

DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/rpm:tizen[python]
		app-arch/createrepo_c
		dev-util/depanneur
		dev-perl/Crypt-SSLeay
		dev-perl/pristine-tar
		app-emulation/qemu[static-user]
		dev-python/git-buildpackage:tizen[${PYTHON_USEDEP}]
		dev-python/pyyaml
		dev-util/obs-build"
RDEPEND="${DEPEND}"
