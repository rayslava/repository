# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

# Python is required for tests and some build tasks.
PYTHON_COMPAT=( python2_7 )

GH_USER="google"
GH_REPO="googletest"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils python-any-r1 cmake-utils github

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="https://github.com/google/googletest"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="examples static-libs gmock"

DEPEND="${PYTHON_DEPS}"
RDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_GMOCK=$(usex gmock)
		-DBUILD_SHARED_LIBS=ON
		)

	cmake-utils_src_configure
}
