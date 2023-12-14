# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=MLS
inherit perl-module

DESCRIPTION="A simple conversion API from XML to perl structures and back"

SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ppc sparc x86"

RDEPEND="
	>=dev-perl/XML-Parser-2.190.0
	dev-perl/libxml-perl
"
BDEPEND="${RDEPEND}"
