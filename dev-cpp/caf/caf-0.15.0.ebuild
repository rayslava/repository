# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GH_USER="actor-framework"
GH_REPO="actor-framework"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit cmake-utils eutils github

DESCRIPTION="An Open Source Implementation of the Actor Model in C++"
HOMEPAGE="http://actor-framework.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=">=sys-devel/gcc-4.8"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_EXE_LINKER_FLAGS=" -lpthread "
		)

	cmake-utils_src_configure
}
