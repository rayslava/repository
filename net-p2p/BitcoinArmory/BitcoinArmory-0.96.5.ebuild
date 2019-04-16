# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools

DESCRIPTION="Armory is an advanced Bitcoin client"
HOMEPAGE="http://bitcoinarmory.com/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/goatpig/${PN}.git"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://github.com/goatpig/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="AGPL-3"
SLOT="0"

RDEPEND="net-p2p/bitcoin-qt"

DEPEND="dev-python/PyQt4
	dev-lang/swig
	dev-python/twisted
	x11-misc/xdg-utils"

src_prepare() {
	default
	./autogen.sh
}


pkg_postinst() {
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryofflineicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_green_64x64.png armorytestneticon
}
