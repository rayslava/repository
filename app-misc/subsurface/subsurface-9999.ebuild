# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Subsurface is an open source divelog program for recreational, tech, and free-divers that runs on Windows, Mac and Linux"
if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

fi
inherit cmake

RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="~amd64"
SLOT="0"

DESCRIPTION="Subsurface divelog program"
HOMEPAGE="https://subsurface-divelog.org/"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND="dev-qt/qtpositioning:6
dev-qt/qtwebengine:6
dev-libs/libxml2
dev-libs/libzip
dev-libs/libxslt
dev-db/sqlite:3
dev-libs/libgit2
=dev-libs/libdivecomputer-subsurface-${PV}
=dev-qt/googlemaps-9999
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
	sed -e '/find_package(QT NAMES/s/Qt5//' -i CMakeLists.txt
	eapply -p1 "${FILESDIR}/qstring-6.9.patch"
}

src_configure() {
	local mycmakeargs=(
		-DLIBDC_FROM_PKGCONFIG=ON
		-DQT_VERSION_MAJOR="6"
		-DBUILD_WITH_QT6=ON
		-DCMAKE_PREFIX_PATH="$(pkg-config --variable=cmakedir Qt6Core)"
	)

	cmake_src_configure
}
