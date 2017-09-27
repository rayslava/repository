# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit git-2 distutils-r1

DESCRIPTION="Mic the Image Creator"
HOMEPAGE="https://www.tizen.org/"
EGIT_REPO_URI="https://github.com/01org/mic.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=app-arch/createrepo-0.9.8
sys-apps/yum"
RDEPEND="${DEPEND}"
