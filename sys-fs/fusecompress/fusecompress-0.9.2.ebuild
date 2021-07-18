# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/FS-make-simple/${PN}.git"
else
	SRC_URI="https://github.com/FS-make-simple/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
RESTRICT="primaryuri"
SLOT="0"
DEPEND="sys-fs/fuse:0"
RDEPEND="${DEPEND}"

src_prepare() {
	./autogen.sh
	default
}
