# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

MY_PN="hunspell-dict-ko"

DESCRIPTION="A simple wrapper script for the Borg backup software that creates and prunes backups"
HOMEPAGE="https://github.com/spellcheck-ko/${MY_PN}"
SRC_URI="https://github.com/spellcheck-ko/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="amd64"
SLOT="0"

DESCRIPTION="Subsurface divelog program"
HOMEPAGE="https://subsurface-divelog.org/"

LICENSE="GPLv2 GPLv3 CC-BY-4.0 MPL-1.1 LGPL-2.1"
SLOT="0"
IUSE=""
DEPEND="app-text/hunspell"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	insinto /usr/share/hunspell
	doins ko.dic ko.aff
}
