# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="svg2rlg is a python tool to convert SVG files to reportlab graphics."
HOMEPAGE="http://code.google.com/p/svg2rlg/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
