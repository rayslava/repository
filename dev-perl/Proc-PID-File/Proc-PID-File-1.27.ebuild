# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=8

inherit perl-module

DESCRIPTION="Perl module used to determine if processes are already running"
HOMEPAGE="http://search.cpan.org/search?query=${PN}"
SRC_URI="mirror://cpan/authors/id/E/EC/ECALDER/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

SRC_TEST="do"
mydoc="LICENSE README Changes"
