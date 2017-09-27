# Copyright 2011-2012 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1 eutils

DESCRIPTION="This library eases the use of the JIRA REST API from Python and it has been used in production for years."
HOMEPAGE="https://github.com/pycontribs/jira"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
>=dev-python/requests-2.6.0
>=dev-python/requests-oauthlib-0.3.3
>=dev-python/tlslite-0.4.4
>=dev-python/six-1.9.0
dev-python/requests-toolbelt
dev-python/ordereddict
>=dev-python/setuptools-0.8.0
"
