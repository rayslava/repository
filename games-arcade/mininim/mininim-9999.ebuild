# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3
inherit eutils

DESCRIPTION="The Advanced Prince of Persia Engine"
HOMEPAGE="https://github.com/oitofelix/mininim"
EGIT_REPO_URI="https://github.com/oitofelix/mininim.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-libs/gnulib
>=media-libs/allegro-5.0.0[gtk,vorbis]"
RDEPEND="${DEPEND}"

src_prepare(){
  ./bootstrap
}

