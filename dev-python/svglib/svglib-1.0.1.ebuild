# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9,10} )

inherit distutils-r1

DESCRIPTION="Svglib is a pure-Python library for reading SVG files and converting them (to a reasonable degree) to other formats using the ReportLab Open Source toolkit."
HOMEPAGE="https://github.com/deeplook/svglib"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"

DEPEND="dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/tinycss2[${PYTHON_USEDEP}]
	dev-python/cssselect2[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
