# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GH_USER="google"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github autotools

DESCRIPTION="XSecureLock is an X11 screen lock utility designed with the primary goal of security."
HOMEPAGE="https://github.com/${GH_USER}/${GH_REPO}/"
RESTRICT="primaryuri"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="sys-libs/pam
		x11-libs/libX11
		x11-libs/libXcomposite
		x11-libs/libXext
		x11-libs/libXfixes
		x11-libs/libXft
		x11-libs/libXmu
		x11-libs/libXrandr
		x11-libs/libXScrnSaver
		x11-base/xorg-proto
"
RDEPEND="${DEPEND}"

src_prepare() {
   default
   eautoreconf --with-pam-service-name=xscreensaver
}
