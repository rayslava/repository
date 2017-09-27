# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="tagsistant, a semantic filesystem"
HOMEPAGE="http://www.tagsistant.net/"

inherit git-2 autotools-utils

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-libs/libextractor
		 dev-db/libdbi-drivers[sqlite]
		 sys-fs/fuse"

DEPEND="${RDEPEND}"

EGIT_REPO_URI="https://github.com/StrumentiResistenti/Tagsistant.git"

src_prepare() {
	eautoreconf
}
