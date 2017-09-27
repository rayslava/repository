# Copyright 2014 Slava S Barinov
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=5
PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1 eutils

DESCRIPTION="Python bindings for the Apache Thrift RPC system"
HOMEPAGE="https://pypi.python.org/pypi/service_identity"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="dev-python/setuptools"
