# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="buserror"
GH_REPO="simavr"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github

DESCRIPTION="simavr is a lean, mean and hackable AVR simulator for linux & OSX"
HOMEPAGE="https://github.com/buserror/simavr"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="cross-avr/avr-libc
cross-avr/gcc
virtual/libelf
>=media-libs/freeglut-3.0.0"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e '/^install/s/all$//' -i simavr/Makefile
	sed -e '/$(DESTDIR)\/lib$/s#$#/#' -i simavr/Makefile
	sed -e "s#/lib/#/$(get_libdir)/#" -i simavr/Makefile
}

src_compile() {
	emake RELEASE=1
}

src_install() {
	emake install DESTDIR=${D}/usr
}
