# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

SRC_URI="https://github.com/subsurface/libdc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
KEYWORDS="~amd64 ~x86"

MY_PN="libdc"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Library for communication with dive computers from various manufacturers"
HOMEPAGE="https://www.libdivecomputer.org"
LICENSE="LGPL-2.1"

SLOT="0"
IUSE="bluetooth"

RDEPEND="virtual/libusb:1
	bluetooth? ( net-wireless/bluez )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--disable-static \
		$(use_with bluetooth bluez)
}

src_install() {
	default

	# no static archives
	find "${D}" -name '*.la' -delete || die
}
