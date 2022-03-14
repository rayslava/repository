# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="radareorg"
GH_REPO="${PN}"
RESTRICT="primaryuri"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github cmake-utils

DESCRIPTION="A Qt and C++ GUI for radare2 ."
HOMEPAGE="https://github.com/hteso/iaito"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="dev-util/radare2
>=dev-qt/qtcore-5.3
>=dev-qt/qtgui-5.3
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src"
