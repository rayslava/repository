# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit git-r3 distutils-r1

DESCRIPTION="TikZ editor"
HOMEPAGE="https://github.com/fredokun/TikZ-Editor"
EGIT_REPO_URI="https://github.com/fredokun/TikZ-Editor.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/qscintilla-python"
RDEPEND="${DEPEND}"
