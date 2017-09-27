# Copyright 2011-2012 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License
# $Header: $

EAPI=5
PYTHON_COMPAT=( python3_4 python3_5 )

inherit distutils-r1 eutils

DESCRIPTION="This modest package contains various common humanization utilities"
HOMEPAGE="https://github.com/jmoiron/humanize"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="dev-python/setuptools"
