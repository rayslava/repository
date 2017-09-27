# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.6

EAPI=5

MODULE_AUTHOR="LEONT"
MODULE_VERSION="0.039"


inherit perl-module

DESCRIPTION="A tiny replacement for Module::Build"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=perl-gcpan/ExtUtils-InstallPaths-0.011
	>=perl-gcpan/ExtUtils-Config-0.008
	>=perl-gcpan/ExtUtils-Helpers-0.022
	dev-lang/perl"
