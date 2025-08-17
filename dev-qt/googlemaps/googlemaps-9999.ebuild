# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="8"

inherit git-r3 qmake-utils

DESCRIPTION="QtLocation plugin for Google maps tile API"
HOMEPAGE="https://github.com/vladest/googlemaps"
EGIT_REPO_URI="https://github.com/vladest/googlemaps.git"

if [[ ${PV} == *9999 ]]; then
	EGIT_BRANCH="master"
else
	EGIT_COMMIT="v.${PV}"
fi

KEYWORDS="~amd64"
RESTRICT="primaryuri"
LICENSE="MIT"
SLOT="0"

DEPEND="dev-qt/qtlocation:6"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake6 PREFIX=${EPREFIX}
}

src_install() {
	emake install INSTALL_ROOT=${D}
}
