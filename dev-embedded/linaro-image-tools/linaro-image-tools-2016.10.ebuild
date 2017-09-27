# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 pypy )
inherit eutils versionator distutils-r1

PLATFORM=$(echo ${PV} | cut -c 3-)
DESCRIPTION="Linaro image tools"
HOMEPAGE="http://linaro.org"
SRC_URI="https://git.linaro.org/ci/linaro-image-tools.git/snapshot/linaro-image-tools-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/python-distutils-extra
		dev-python/pyparted
		gnome-base/dconf"
RDEPEND="${DEPEND}"
