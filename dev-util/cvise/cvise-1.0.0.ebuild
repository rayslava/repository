# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/marxin/cvise.git"
	inherit git-r3
else
	KEYWORDS="amd64"
	SRC_URI="https://github.com/marxin/cvise/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

inherit python-any-r1 cmake-utils llvm

DESCRIPTION="Super-parallel Python port of the C-Reduce"
HOMEPAGE="https://github.com/marxin/cvise.git"

LICENSE="UoI-NCSA"
SLOT="0"
DEPEND="
	>=sys-devel/llvm-9.0"
RDEPEND="dev-python/pebble
dev-python/pytest
|| (
        sys-devel/llvm:9
        sys-devel/llvm:10
)
"
DEPEND=${RDEPEND}
LLVM_MAX_SLOT=10