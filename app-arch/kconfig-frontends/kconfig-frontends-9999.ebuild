# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils git-r3 autotools

DESCRIPTION="kconfig infrastructure out of the Linux source tree"
HOMEPAGE="http://ymorin.is-a-geek.org/projects/kconfig-frontends"
EGIT_REPO_URI="http://ymorin.is-a-geek.org/git/kconfig-frontends"

if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="v${PV}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="mconf gconf qconf nconf"

RDEPEND="sys-devel/bison
sys-devel/flex
sys-devel/gettext
dev-util/gperf
sys-libs/ncurses:5
sys-libs/zlib
gconf? ( x11-libs/gtk+:2 gnome-base/libglade )
qconf? ( dev-qt/qtcore:5 dev-qt/qtgui:5 dev-qt/qtwidgets:5 )
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myconf=(
		$(use_enable mconf)
		$(use_enable gconf)
		$(use_enable qconf)
		$(use_enable nconf)
	)
	econf "${myconf[@]}"
}
