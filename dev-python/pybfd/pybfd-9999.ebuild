# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_4,3_5} )
inherit eutils git-2 distutils-r1

DESCRIPTION="libzypp bindings for Perl, Python and Ruby"
HOMEPAGE="https://github.com/Groundworkstech/pybfd"
EGIT_REPO_URI="https://github.com/ilya-palachev/pybfd.git"
EGIT_BRANCH="devel"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"


src_prepare () {
	epatch ${FILESDIR}/libopcode-path.patch
}
