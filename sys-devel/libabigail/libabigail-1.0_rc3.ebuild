# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="The ABI Generic Analysis and Instrumentation Library"
HOMEPAGE="https://www.sourceware.org/libabigail/"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://sourceware.org/git/${PN}.git"
	inherit git-r3
else
	inherit versionator
	MY_PV=$(replace_all_version_separators '.')
	MY_P="${PN}-${MY_PV}"
	SRC_URI="https://mirrors.kernel.org/sourceware/${PN}/${MY_P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="LGPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="dev-libs/elfutils
dev-libs/libxml2
virtual/pkgconfig
sys-devel/autoconf"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
