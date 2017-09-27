# Copyright 2011-2012 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_4 python3_5 )

inherit distutils-r1 eutils

DESCRIPTION="twtxt is a decentralised, minimalist microblogging service for hackers."
HOMEPAGE="https://github.com/buckket/twtxt"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
dev-python/aiohttp
dev-python/python-dateutil
dev-python/click
dev-python/humanize
"
RDEPEND="${DEPEND}"
