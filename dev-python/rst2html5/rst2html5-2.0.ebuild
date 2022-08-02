# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Generates (X)HTML5 documents from standalone reStructuredText sources"
HOMEPAGE="https://foss.heptapod.net/doc-utils/rst2html5"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"	
KEYWORDS="amd64"
SLOT="0"

DEPEND=">=dev-python/genshi-0.7[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.5[${PYTHON_USEDEP}]
	>=dev-python/docutils-0.13.1[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
