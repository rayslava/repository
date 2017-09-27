# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 pypy{1_9,2_0} )
EGIT_REPO_URI="http://git.linaro.org/git/lava/lava-test.git"
inherit eutils versionator distutils-r1 git-2

DESCRIPTION="Lava testing framework"
HOMEPAGE="https://launchpad.net/lava-test"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-python/versiontools
        test? ( dev-python/mocker ) "
RDEPEND="${DEPEND}"

