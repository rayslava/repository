# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=5
PYTHON_COMPAT=( python3_4 python2_7 pypy )
MY_PV="4"

inherit distutils-r1 eutils

DESCRIPTION="Python bindings igpraph"
HOMEPAGE="http://igraph.org/python/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}-${MY_PV}.tar.gz -> ${P}_${MY_PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL"
KEYWORDS="amd64 x86"
S="${WORKDIR}/${P}-${MY_PV}"
IUSE=""
SLOT="0"

DEPEND="dev-libs/igraph"
