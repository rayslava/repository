# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/magiblot/${PN}.git"
else
	MY_PV="r${PV}"
	SRC_URI="https://github.com/magiblot/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
RESTRICT="primaryuri"
HOMEPAGE="https://github.com/magiblot/tvision"
IUSE="gpm"
SLOT="0"
S="${WORKDIR}/${PN}-${MY_PV}"
LICENSE="MIT"
RDEPEND=""
DEPEND="${RDEPEND}
		sys-libs/ncurses
		gpm? ( sys-libs/gpm )"
