# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
	GH_USER="OpenOrienteering"
	GH_REPO="mapper"
fi

inherit cmake-utils eutils github

DESCRIPTION="OpenOrienteering Mapper is a software for creating maps for the orienteering sport."
HOMEPAGE="http://www.openorienteering.org/apps/mapper/"

LICENSE="LGPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND=">=dev-qt/qtgui-5.2
>=sci-libs/proj-4.8.0"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DMapper_BUILD_QT=OFF
		)

	cmake-utils_src_configure
}
