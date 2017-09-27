# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="pgf/TikZ diagram editor "
HOMEPAGE="http://sourceforge.net/projects/tikzit/"
SRC_URI="http://downloads.sourceforge.net/project/${PN}/${P}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/gcc[objc]"
RDEPEND="${DEPEND}"
