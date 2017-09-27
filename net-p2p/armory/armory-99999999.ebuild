# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Armory is an advanced Bitcoin client"
HOMEPAGE="http://bitcoinarmory.com/"

EGIT_REPO_URI="git://github.com/etotheipi/BitcoinArmory.git"
EGIT_BRANCH="testing"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="net-p2p/bitcoin-qt"

DEPEND="dev-python/PyQt4
	dev-lang/swig
	dev-python/twisted-web
	x11-misc/xdg-utils"

src_install() {
	CFLAGS="-O3 -g -march=native -mtune=native" LDLIBS="-lsnappy" emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryofflineicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_green_64x64.png armorytestneticon
}
