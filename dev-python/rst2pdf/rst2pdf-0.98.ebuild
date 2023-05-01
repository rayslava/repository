# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10,11} )

inherit distutils-r1

DESCRIPTION="A simple wrapper script for the Borg backup software that creates and prunes backups"
HOMEPAGE="https://github.com/rst2pdf/rst2pdf"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"

DEPEND="dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/aafigure[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pdfrw[${PYTHON_USEDEP}]
	dev-python/PyPDF2[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/smartypants[${PYTHON_USEDEP}]
	>=dev-python/reportlab-2.6[${PYTHON_USEDEP}]
	dev-python/smartypants[${PYTHON_USEDEP}]
	dev-python/svglib[${PYTHON_USEDEP}]
	dev-python/svg2rlg[${PYTHON_USEDEP}]
	<dev-python/xhtml2pdf-0.2.5[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
