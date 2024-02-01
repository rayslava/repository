# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="C++ Driver for MongoDB"
HOMEPAGE="https://github.com/mongodb/${PN}"
RESTRICT="primaryuri"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="debug sasl ssl static-libs"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openSUSE/${PN}.git"
else
	SRC_URI="https://github.com/mongodb/${PN}/releases/download/r${PV}/${PN}-r${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit cmake

RDEPEND=">=dev-libs/boost-1.56[threads(+)]
		>=dev-libs/mongo-c-driver-1.10.0[static-libs?]"

S="${WORKDIR}/${PN}-r${PV}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_AND_STATIC_LIBS=$(usex static-libs)
		-DBUILD_VERSION="${PV}"
		-DBSONCXX_POLY_USE_BOOST=ON
	)

	cmake_src_configure
}
