# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games autotools

DESCRIPTION="A Freeware BBC Micro Emulator for DOS, Windows and Mac OS X"
HOMEPAGE="http://b-em.bbcmicro.com/"
SRC_URI="http://b-em.bbcmicro.com/B-emv${PV}Linux.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/allegro:0
media-libs/freealut"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p ${S}
	cd ${S}
	unpack ${A}
}
