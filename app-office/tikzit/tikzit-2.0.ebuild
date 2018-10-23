# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="tikzit"
GH_REPO="tikzit"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit qmake-utils github eutils

DESCRIPTION="pgf/TikZ diagram editor "
HOMEPAGE="https://tikzit.github.io"
RESTRICT="primaryuri"


LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtcore:5
dev-qt/qtgui:5
dev-qt/qtwidgets:5
dev-qt/qtnetwork:5
"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5 PREFIX=${EPREFIX}
}

src_install() {
	emake install INSTALL_ROOT=${D}
}
