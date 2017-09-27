# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

AUTOTOOLS_IN_SOURCE_BUILD="yes"
inherit git-r3 autotools-utils
DESCRIPTION="Man pages created from cpprefence.com"
HOMEPAGE="http://cppreference.com/"
EGIT_REPO_URI="https://github.com/jeaye/stdman.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/man
www-client/elinks
app-arch/gzip
sys-apps/findutils"
RDEPEND="${DEPEND}"
