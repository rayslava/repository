# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the WTFPL
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Armory is a Bitcoin client, offering a dozen innovative features not found anywhere else."
HOMEPAGE="http://bitcoinarmory.com/"

EGIT_REPO_URI="git://github.com/etotheipi/BitcoinArmory.git"
EGIT_COMMIT="v${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-libs/crypto++
		dev-python/PyQt4
		dev-lang/swig
		dev-python/twisted-web
		x11-misc/xdg-utils"

RDEPEND="|| ( net-p2p/bitcoin-qt net-p2p/bitcoind )
		dev-libs/crypto++
		dev-python/PyQt4
		dev-python/twisted-web
		x11-misc/xdg-utils"

src_prepare() {
	sed -e 's/`python -c/`python2 -c/' -i cppForSwig/Makefile \
	|| die "sed failed"
	echo python2 /usr/share/armory/ArmoryQt.py > armory
}

src_install() {
	emake DESTDIR="${D}" install

	dobin armory
}

