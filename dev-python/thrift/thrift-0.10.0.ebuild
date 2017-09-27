# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=5
PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1 eutils

DESCRIPTION="Python bindings for the Apache Thrift RPC system"
HOMEPAGE="http://thrift.apache.org/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip -> python-${P}.zip"
RESTRICT="primaryuri"

LICENSE="BSD"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="dev-python/setuptools
	!dev-libs/thrift[python]
	"
