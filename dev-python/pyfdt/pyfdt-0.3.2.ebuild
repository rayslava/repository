# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5,6,7,8,9} )

inherit distutils-r1

MY_PN="fdt"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="This python module is usable for manipulation with Device Tree Data and primary was created for imxsb tool"
HOMEPAGE="https://github.com/molejar/pyFDT"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
S="${WORKDIR}/${MY_P}"
