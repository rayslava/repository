# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="A set of c++ tools that provide nicer (more Qt-like) APIs on top of stl classes with a friendly license."
HOMEPAGE="https://github.com/Andersbakken/rct"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://github.com/Andersbakken/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/Andersbakken/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
