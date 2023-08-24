# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=8

inherit perl-module

MY_PN="perl-${PN}"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Perl module used to determine if processes are already running"
HOMEPAGE="https://github.com/openSUSE/perl-BSSolv"
SRC_URI="https://github.com/openSUSE/perl-BSSolv/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Perl Artistic"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND="dev-libs/libsolv[rpm]"
RDEPEND="${DEPEND}"

SRC_TEST="do"
mydoc="LICENSE README Changes"

S="${WORKDIR}/${MY_P}"
