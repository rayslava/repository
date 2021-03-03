# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_8 python3_9 )
inherit eutils distutils-r1

DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/librpm-tizen
		dev-libs/depanneur
		dev-perl/Crypt-SSLeay
		app-emulation/qemu[static-user]
		dev-python/git-buildpackage
		dev-python/pyyaml
		dev-util/suse-build"
RDEPEND="${DEPEND}"
