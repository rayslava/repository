# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=6
PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1 eutils

DESCRIPTION="Python Reddit API Wrapper"
HOMEPAGE="https://github.com/praw-dev/praw"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip -> python-${P}.zip
https://github.com/praw-dev/praw/archive/v${PV}.zip -> python-${P}.zip
"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
>=dev-python/decorator-3.4.2
>=dev-python/requests-2.3.0
>=dev-python/six-1.4
>=dev-python/update-checker-0.11
dev-python/setuptools
"
RDEPEND="${DEPEND}"
