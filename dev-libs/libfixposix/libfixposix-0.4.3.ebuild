# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

AUTOTOOLS_AUTORECONF=1
WANT_AUTOMAKE="1.11"

inherit autotools git-r3
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/sionescu/${PN}.git"
else
	SRC_URI="https://github.com/sionescu/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
RESTRICT="primaryuri"

DESCRIPTION="Thin wrapper over POSIX syscalls"
HOMEPAGE="http://common-lisp.net/project/iolib/"
LICENSE="Boost-1"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	dev-libs/check
"

DEPEND="${COMMON_DEPEND}"

RDEPEND="${COMMON_DEPEND}"
