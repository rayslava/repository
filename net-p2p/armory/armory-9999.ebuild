# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-2 eutils

DESCRIPTION="Armory is an advanced Bitcoin client"
HOMEPAGE="http://bitcoinarmory.com/"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/goatpig/BitcoinArmory.git"
	inherit git-r3
else
	SRC_URI="https://github.com/goatpig/BitcoinArmory/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="net-p2p/bitcoin-qt"

DEPEND="dev-python/PyQt4
	dev-lang/swig
	dev-python/twisted-web
	x11-misc/xdg-utils"

#src_prepare() {
	#epatch "${FILESDIR}/build_detect_platform-02.patch"
#}

src_install() {
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_64x64.png armoryofflineicon
	xdg-icon-resource install --novendor --context apps --size 64 /usr/share/armory/img/armory_icon_green_64x64.png armorytestneticon
}
