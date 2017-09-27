# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_3 )
inherit git-2 distutils-r1

DESCRIPTION="Magnificent app which corrects your previous console command"
HOMEPAGE="https://github.com/nvbn/thefuck"
EGIT_REPO_URI="https://github.com/nvbn/thefuck.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/psutil
		dev-python/colorama
		dev-python/six
		dev-python/decorator
		"
RDEPEND="${DEPEND}"
