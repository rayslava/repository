# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 pypy python3_4 )
inherit git-2 autotools-utils

DESCRIPTION="Python binding for Project-Tox the skype replacement"
HOMEPAGE="https://darkcoin.io"
EGIT_REPO_URI="https://github.com/darkcoin/darkcoin"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

