# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Famous quotes from Linux.Org.Ru"
HOMEPAGE="http://lorquotes.ru/"
SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="unicode"

RDEPEND="games-misc/fortune-mod"
DEPEND="${RDEPEND}
	unicode? ( virtual/libiconv )"

S="${WORKDIR}"

src_unpack() {
	wget http://www.lorquotes.ru/fortraw.php -O "${S}"/lor
}

src_compile() {
#	cp "${T}"/lor "${S}"/lor
	if use unicode ; then
		iconv --from-code koi8-r --to-code utf8 -o lor.utf8 lor || die "iconv failed"
		mv lor.utf8 lor
	fi
	strfile -s lor || die "strfile failed"
}

src_install() {
	insinto /usr/share/fortune
	doins lor lor.dat || die "doins failed"
}
