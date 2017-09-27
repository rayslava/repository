# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 pypy python3_4 )
inherit git-2

DESCRIPTION="Python binding for Project-Tox the skype replacement"
HOMEPAGE="https://github.com/JFreegman/ToxBot"
EGIT_REPO_URI="https://github.com/JFreegman/ToxBot.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/tox"
RDEPEND="${DEPEND}"

src_compile() {
	emake
}

src_install() {
	einstall
}
