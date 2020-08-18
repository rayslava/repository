# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools
DESCRIPTION="Man pages created from cpprefence.com"
HOMEPAGE="http://cppreference.com/"
EGIT_REPO_URI="https://github.com/jeaye/stdman.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/man
www-client/elinks
app-arch/gzip
sys-apps/findutils"
RDEPEND="${DEPEND}"
