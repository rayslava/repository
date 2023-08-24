# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="This is libsolv, a free package dependency solver using a satisfiability algorithm."
HOMEPAGE="https://github.com/openSUSE/libsolv"
SRC_URI="https://github.com/openSUSE/libsolv/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="rpm"
DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_RPMDB=$(usex rpm ON OFF)
		-DENABLE_RPMMD=$(usex rpm ON OFF)
		-DENABLE_RPMDB_BYRPMHEADER=$(usex rpm ON OFF)
	)
	cmake_src_configure
}
