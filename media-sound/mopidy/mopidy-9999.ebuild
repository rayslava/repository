# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
	GH_USER="mopidy"
	GH_REPO="mopidy"
fi
PYTHON_COMPAT=( python2_7 python3_5 )

inherit distutils-r1 eutils github

DESCRIPTION="Mopidy is an extensible music server written in Python."
HOMEPAGE="http://www.mopidy.com"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND=">=dev-python/pykka-1.1
>=dev-python/requests-2.0
>=www-servers/tornado-2.3"
RDEPEND="${DEPEND}"
