# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib

DESCRIPTION="A high-performance MongoDB driver for C"
+HOMEPAGE="https://github.com/mongodb/${PN}"
+SRC_URI="https://github.com/mongodb/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
SLOT="0"
IUSE="debug examples test sasl ssl static-libs"

RDEPEND="sasl? ( dev-libs/cyrus-sasl[static-libs?] )
	ssl? ( || ( dev-libs/openssl:=[static-libs?] dev-libs/libressl:=[static-libs?] ) )"

DEPEND="${RDEPEND}"

DOCS=( NEWS )

multilib_src_configure() {
	local mycmakeargs=(
		-DCMAKE_LIBRARY_PATH=/usr/$(get_libdir)
		-DENABLE_SSL=$(usex ssl AUTO OFF)
		-DENABLE_SASL=$(usex sasl AUTO OFF)
		-DENABLE_STATIC=$(usex static-libs)
		-DENABLE_EXAMPLES=$(usex examples)
		-DENABLE_TESTS=$(usex test)
	)
	cmake-utils_src_configure

	if $(use static-libs) ; then
		mkdir ${WORKDIR}/${P}_static_build
		local mycmakeargs=(
			-DCMAKE_LIBRARY_PATH=/usr/$(get_libdir)
			-DENABLE_SSL=$(usex ssl AUTO OFF)
			-DENABLE_SASL=$(usex sasl AUTO OFF)
			-DENABLE_STATIC=$(usex static-libs)
			-DENABLE_EXAMPLES=$(usex examples)
			-DENABLE_TESTS=$(usex test)
			-DENABLE_STATIC=ON
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
		BUILD_DIR=${WORKDIR}/${P}_static_build cmake-utils_src_install
	fi
}
