# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
CMAKE_BUILD_TYPE=Release
inherit cmake-utils

DESCRIPTION="Robomongo is a shell-centric crossplatform MongoDB management tool."
HOMEPAGE="http://www.robomongo.org/"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/paralect/${PN}"
	inherit git-r3
else
	SRC_URI="https://github.com/paralect/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
if [[ ${PV} == "9999" ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
fi
IUSE=""

DEPEND="dev-qt/qtcore:5
		dev-qt/qtgui:5[gtkstyle]
		dev-qt/qtdbus:5
		dev-qt/qtprintsupport:5"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

scr_configure() {
		local mycmakeargs=(
			-DOS_ARC=64
		)
		cmake-utils_src_configure
}
