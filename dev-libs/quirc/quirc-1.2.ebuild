# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit multilib multilib-minimal

DESCRIPTION="QR codes are a type of high-density matrix barcodes, and quirc is a library for extracting and decoding them from images."
HOMEPAGE="https://github.com/dlbeer/${PN}"
SRC_URI="https://github.com/dlbeer/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

LICENSE="ISC"
SLOT="0"
IUSE=""
DEPEND="media-libs/libsdl2[${MULTILIB_USEDEP}]
media-libs/sdl-gfx[${MULTILIB_USEDEP}]"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${P}-soname.patch
)

src_prepare() {
	default
	multilib_copy_sources
}

multilib_src_install() {
	emake DESTDIR="${D}" LIBDIR=$(get_abi_LIBDIR) install
	multilib_is_native_abi || rm -rf ${D}/usr/bin
}
