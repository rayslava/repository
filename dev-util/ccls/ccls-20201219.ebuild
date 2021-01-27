# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="MaskRay"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="0.${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit github eutils cmake-utils

DESCRIPTION="C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting"
HOMEPAGE="https://github.com/MaskRay/ccls"
RESTRICT="primaryuri"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-devel/clang"

DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_EXPORT_COMPILE_COMMANDS=1
		)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
