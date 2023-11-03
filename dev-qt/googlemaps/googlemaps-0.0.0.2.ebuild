# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

inherit git-r3 qmake-utils

DESCRIPTION="QtLocation plugin for Google maps tile API"
HOMEPAGE="https://github.com/vladest/googlemaps"
EGIT_REPO_URI="https://github.com/vladest/googlemaps.git"

if [[ ${PV} == *9999 ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="v.${PV}"
fi

RESTRICT="primaryuri"
LICENSE="MIT"
SLOT="0"

DEPEND="dev-qt/qtlocation:5"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX=${EPREFIX}
}

src_install() {
	emake install INSTALL_ROOT=${D}
}
