# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="This package provides a module aafigure, that can be used from other programs, and a command line tool aafigure."
HOMEPAGE="http://launchpad.net/aafigure"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="MIT"
KEYWORDS="amd64"
SLOT="0"
