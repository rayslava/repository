# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1
WANT_AUTOMAKE="1.11"

inherit autotools-utils git-r3

DESCRIPTION="Thin wrapper over POSIX syscalls"
HOMEPAGE="http://common-lisp.net/project/iolib/"
EGIT_REPO_URI="https://github.com/sionescu/${PN}.git"

LICENSE="Boost-1"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	dev-libs/check
"

DEPEND="${COMMON_DEPEND}"

RDEPEND="${COMMON_DEPEND}"
