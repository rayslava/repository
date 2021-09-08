# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
EGO_PN=github.com/mathaou/${PN}

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="8cec3a8"
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="a markdown processor implemented in Go"
HOMEPAGE="https://github.com/mathaou/termdbms"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=""
