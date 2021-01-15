# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/atlas-engineer/${PN}.git"
else
	SRC_URI="https://github.com/atlas-engineer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
RESTRICT="primaryuri"
LICENSE="BSD-3"
SLOT="0"
DEPEND=""
RDEPEND="${DEPEND}
		dev-lisp/sbcl
		net-libs/glib-networking
		gnome-base/gsettings-desktop-schemas
		dev-libs/libfixposix
		app-text/enchant
		net-libs/webkit-gtk
"

src_prepare() {
	default
}

src_compile() {
	emake all
}

src_install() {
	emake DESTDIR="${ED}" install
}
