# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools git-r3 eutils

DESCRIPTION="Fully decentralized P2P microblogging platform"
HOMEPAGE="http://twister.net.co/"
EGIT_REPO_URI="https://github.com/miguelfreitas/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	dev-libs/boost:=
	dev-libs/openssl
	net-libs/miniupnpc
	sys-libs/db
"

DEPEND="${COMMON_DEPEND}"

RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	#export BDB_INCLUDE_PATH=/usr/include/db4.8/
	#export CFLAGS+=" $CFLAGS -I$BDB_INCLUDE_PATH "
	#export CXXFLAGS+=" $CXXFLAGS -I$BDB_INCLUDE_PATH "
	cd "${S}"
	epatch "${FILESDIR}/update-desktop.patch"
	./autotool.sh
	econf
# Leveldb install problem fixup
	echo -e "\ninstall:\n\n" >> "${S}/src/leveldb/Makefile"
}

pkg_postinst() {
fdo-mime_mime_database_update
elog
elog "The database format has changed between 0.60 and 0.70."
elog "You may need to update all your local databases and caches."
elog "To do so, please run the following commands:"
elog "(for each user) $ update-mime-database ~/.local/share/mime/"
elog "(as root) # update-mime-database /usr/local/share/mime/"
elog
}
