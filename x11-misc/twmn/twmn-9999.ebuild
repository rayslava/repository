# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GH_USER="sboli"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github qmake-utils

DESCRIPTION="A notification system for tiling window managers."
HOMEPAGE="https://github.com/${GH_USER}/${GH_REPO}/"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtdbus:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-libs/boost[threads]
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -i -e "s:^target.path.*:target.path = /usr/bin:" \
		twmnd/twmnd.pro twmnc/twmnc.pro \
		|| die 'failed to fix target.path in src.pro'
}

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
