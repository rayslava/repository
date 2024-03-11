# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit perl-module

DESCRIPTION="Deppaneur perl module"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="https://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/obs-build
		dev-perl/HTML-Template
		dev-perl/YAML
		dev-perl/JSON
		dev-perl/Config-Tiny
		dev-perl/Parallel-ForkManager
		dev-perl/XML-Parser
		dev-perl/BSSolv
		dev-lang/perl[ithreads]"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_prepare () {
	default
	sed -e 's#/usr/lib/build#/usr/libexec/obs-build#' -i depanneur || die
}

src_install () {
	emake DESTDIR="${ED}" install
}
