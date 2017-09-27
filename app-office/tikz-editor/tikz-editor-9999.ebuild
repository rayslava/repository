# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit git-2 distutils-r1

DESCRIPTION="TikZ editor"
HOMEPAGE="https://github.com/fredokun/TikZ-Editor"
EGIT_REPO_URI="https://github.com/fredokun/TikZ-Editor.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/qscintilla-python"
RDEPEND="${DEPEND}"
