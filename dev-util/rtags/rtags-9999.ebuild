# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="A c/c++ client/server indexer for c/c++/objc[++] with integration for Emacs based on clang."
HOMEPAGE="http://www.rtags.net"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/Andersbakken/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/Andersbakken/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-devel/clang
		sys-libs/ncurses:0
		dev-util/rct"

DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_EXPORT_COMPILE_COMMANDS=1
		)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	newconfd "${FILESDIR}/rdm.confd" "rdm"
	newinitd "${FILESDIR}/rdm.initd" "rdm"
}
