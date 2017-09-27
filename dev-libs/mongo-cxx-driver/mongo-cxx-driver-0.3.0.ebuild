# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils flag-o-matic multilib cmake-utils git-2

DESCRIPTION="C++ Driver for MongoDB"
HOMEPAGE="https://github.com/mongodb/mongo-cxx-driver"
EGIT_REPO_URI="https://github.com/mongodb/mongo-cxx-driver.git"
EGIT_COMMIT="12a5f09e2ee71eed3e66dc932ae335272116c682"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug sasl ssl static-libs"

RDEPEND=">=dev-libs/boost-1.50[threads(+)]
	sasl? ( dev-libs/cyrus-sasl )
	ssl? ( dev-libs/openssl:= )
	dev-libs/libbson
	dev-libs/mongo-c-driver[static-libs?]"

DEPEND="${RDEPEND}
sys-devel/gcc:5"

# Maintainer notes
# TODO: enable test in IUSE with
# test? ( >=dev-cpp/gtest-1.7.0 dev-db/mongodb )

DOCS=( README.md )

src_configure() {
	local mycmakeargs=(
		-DBSONCXX_POLY_USE_MNMLSTC=OFF
		-DBSONCXX_POLY_USE_STD_EXPERIMENTAL=ON
		-DCMAKE_CXX_STANDARD=14
		)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	use static-libs || find "${D}" -name '*.a' -delete
}
