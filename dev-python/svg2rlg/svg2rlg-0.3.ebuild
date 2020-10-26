# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="svg2rlg is a python tool to convert SVG files to reportlab graphics."
HOMEPAGE="http://code.google.com/p/svg2rlg/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
