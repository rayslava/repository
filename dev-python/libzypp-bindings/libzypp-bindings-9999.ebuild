# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy{2_3,2_4} )
inherit eutils versionator cmake-utils git-2

DESCRIPTION="libzypp bindings for Perl, Python and Ruby"
HOMEPAGE="https://github.com/openSUSE/libzypp-bindings"
EGIT_REPO_URI="https://github.com/openSUSE/libzypp-bindings.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python perl ruby"

DEPEND="dev-libs/libzypp"

RDEPEND="${DEPEND}"

src_configure() {
        local mycmakeargs=(
                $(cmake-utils_use ruby RUBY_LIBRARY)
                $(cmake-utils_use python PYTHON_LIBRARY)
                $(cmake-utils_use perl PERL_LIBRARY)
        )
        cmake-utils_src_configure
}
