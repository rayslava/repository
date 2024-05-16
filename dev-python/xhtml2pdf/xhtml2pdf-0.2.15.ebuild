# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="xhtml2pdf is a HTML to PDF converter using Python, the ReportLab Toolkit, html5lib and PyPDF2."
HOMEPAGE="http://github.com/xhtml2pdf/xhtml2pdf"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
