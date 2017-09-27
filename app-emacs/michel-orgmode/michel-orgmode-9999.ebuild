# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 pypy )
inherit mercurial distutils-r1

DESCRIPTION="Fork of michel which serves as a bridge between an org-mode textfile and a google-tasks task list."
HOMEPAGE="https://bitbucket.org/edgimar/michel-orgmode"
EHG_REPO_URI="https://bitbucket.org/edgimar/michel-orgmode"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/google-api-python-client
		dev-python/python-gflags
		"
RDEPEND="${DEPEND}"
