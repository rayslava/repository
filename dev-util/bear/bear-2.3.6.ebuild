# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="Bear is a tool that generates a compilation database for clang tooling."
HOMEPAGE="https://github.com/rizsotto/Bear"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/rizsotto/Bear.git"
	inherit git-r3
else
	SRC_URI="https://github.com/rizsotto/Bear/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/python:2.7"

DEPEND="${RDEPEND}"

S=${WORKDIR}/Bear-${PV}
