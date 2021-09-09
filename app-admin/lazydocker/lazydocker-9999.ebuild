# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
EGO_PN=github.com/jesseduffield/${PN}

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	EGIT_COMMIT="6fd5337"
	SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi
inherit golang-build

DESCRIPTION="A simple terminal UI for both docker and docker-compose, written in Go with the gocui library."
HOMEPAGE="https://github.com/jesseduffield/lazydocker"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=""

src_install() {
	dobin lazydocker
}
