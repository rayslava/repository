# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.16.6

EAPI=5

MODULE_AUTHOR="TADAM"
MODULE_VERSION="0.06"


inherit perl-module

DESCRIPTION="mocks LWP::UserAgent and dispatches your requests/responses"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/HTTP-Message
	dev-perl/Test-Exception
	dev-perl/Test-MockObject
	dev-lang/perl"
