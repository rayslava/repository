# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="tagsistant, a semantic filesystem"
HOMEPAGE="http://www.tagsistant.net/"

inherit eutils

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="media-libs/libextractor 
         dev-db/libdbi-drivers[sqlite]
         sys-fs/fuse"

DEPEND="${RDEPEND}"

SRC_URI="https://www.tagsistant.net/download/tagsistant-0-8-1a-tar-gz/finish/11-tagsistant-0-8-1a/31-tagsistant-0-8-1a/0
-> ${P}.tar.gz"

