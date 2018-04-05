# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="C++ Driver for MongoDB"
HOMEPAGE="https://github.com/mongodb/mongo-cxx-driver"
GH_USER="mongodb"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils flag-o-matic multilib cmake-utils github

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug sasl ssl static-libs"

RDEPEND=">=dev-libs/boost-1.50[threads(+)]
	sasl? ( dev-libs/cyrus-sasl )
	ssl? ( dev-libs/openssl:= )
	dev-libs/libbson
	>=dev-libs/mongo-c-driver-1.5.0[static-libs?]
	app-arch/snappy[static-libs?]"

DEPEND="${RDEPEND}
>=sys-devel/gcc-5"

# Maintainer notes
# TODO: enable test in IUSE with
# test? ( >=dev-cpp/gtest-1.7.0 dev-db/mongodb )

DOCS=( README.md )

src_prepare() {
	default
	cmake-utils_src_prepare
	sed -e '/(examples)/s/add_subdirectory(examples)/# no examples needed/' -i ${S}/CMakeLists.txt
	sed -e '/enable_testing()/d' -i ${S}/CMakeLists.txt
	sed -e '/project/ainclude(GNUInstallDirs)' -i ${S}/src/{bson,mongo}cxx/CMakeLists.txt
	sed -e '/PACKAGE_LIBRARY_INSTALL_DIRS/s/lib/${CMAKE_INSTALL_FULL_LIBDIR}/' -i ${S}/src/{bson,mongo}cxx/CMakeLists.txt
	sed -e '/DESTINATION lib\//s/lib/${CMAKE_INSTALL_LIBDIR}/' -i ${S}/src/{bson,mongo}cxx/{config,}/CMakeLists.txt
	echo -e "\n#if defined(MONGOCXX_TESTING)\n#include <cassert>\n#endif" >> ${S}/src/mongocxx/config/prelude.hpp
}

src_configure() {
	local mycmakeargs=(
		-DBSONCXX_POLY_USE_MNMLSTC=OFF
		-DBSONCXX_POLY_USE_STD_EXPERIMENTAL=ON
		-DCMAKE_CXX_STANDARD=14
	)

	cmake-utils_src_configure

	if $(use static-libs) ; then
		mkdir ${WORKDIR}/${P}_static_build
		local mycmakeargs=(
			-DBSONCXX_POLY_USE_MNMLSTC=OFF
			-DBSONCXX_POLY_USE_STD_EXPERIMENTAL=ON
			-DCMAKE_CXX_STANDARD=14
			-DBUILD_SHARED_LIBS=OFF
		)
		BUILD_DIR=${WORKDIR}/${P}_static_build cmake-utils_src_configure
	fi
}

src_compile() {
	default
	cmake-utils_src_compile
	if $(use static-libs) ; then
		BUILD_DIR=${WORKDIR}/${P}_static_build cmake-utils_src_compile
	fi
}

src_install() {
	default
	cmake-utils_src_install
	if $(use static-libs) ; then
		pushd ${WORKDIR}/${P}_static_build
		cmake-utils_src_install
		popd
	fi
}
