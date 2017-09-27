# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_4 python3_5 )
inherit git-r3 distutils-r1

DESCRIPTION="twtxt is a decentralised, minimalist microblogging service for hackers."
HOMEPAGE="https://github.com/buckket/twtxt"
EGIT_REPO_URI="https://github.com/buckket/twtxt.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-python/aiohttp
dev-python/python-dateutil
dev-python/click
dev-python/humanize
"
RDEPEND="${DEPEND}"
