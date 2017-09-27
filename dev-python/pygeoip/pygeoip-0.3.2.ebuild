# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=5
PYTHON_COMPAT=( python2_7 python3_5 )

inherit distutils-r1 eutils

DESCRIPTION="Pure Python GeoIP API"
HOMEPAGE="https://github.com/appliedsec/pygeoip"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
dev-python/setuptools
"
RDEPEND="${DEPEND}"
