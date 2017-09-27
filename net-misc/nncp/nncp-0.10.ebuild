# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
KEYWORDS="~amd64"

inherit eutils
DESCRIPTION="NNCP (Node to Node copy) is a collection of utilities simplifying secure store-and-forward files and mail exchanging."
LICENSE="GPLv3"
SLOT="0"
DEPEND=">=dev-lang/go-1.7"
RDEPEND=""
SRC_URI="http://www.nncpgo.org/download/${P}.tar.xz"
HOMEPAGE="http://www.nncpgo.org/"

src_compile() {
	emake PREFIX=/usr CFGPATH=/etc/nncp.yaml
}

src_install() {
	emake DESTDIR=${D} PREFIX=/usr install
}
