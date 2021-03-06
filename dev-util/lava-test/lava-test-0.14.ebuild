# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 pypy2_0 )
inherit eutils versionator distutils-r1

DESCRIPTION="Linaro image tools"
HOMEPAGE="http://linaro.org"
SRC_URI="https://pypi.python.org/packages/source/l/lava-test/lava-test-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/versiontools
        test? ( dev-python/mocker ) "
RDEPEND="${DEPEND}"

