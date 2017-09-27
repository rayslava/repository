# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 pypy )
inherit git-2 distutils-r1

DESCRIPTION="Commandline Evernote client"
HOMEPAGE="http://geeknote.me"
EGIT_REPO_URI="https://github.com/VitaliyRodnenko/geeknote.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/html2text 
		dev-python/sqlalchemy 
		dev-python/markdown2
		dev-python/thrift
		dev-python/beautifulsoup:4
		"
RDEPEND="${DEPEND}"
