# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_P="${P/pebble/Pebble}"

DESCRIPTION="Pebble provides a neat API to manage threads and processes within an application."
HOMEPAGE="https://pypi.org/project/Pebble/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64 x86 ~x64-macos"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"