# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1 eutils

MY_PN=${PN/-/_}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A python module that will check for package updates."
HOMEPAGE="https://github.com/bboe/update_checker"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
>=dev-python/requests-2.3.0
dev-python/setuptools
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}
