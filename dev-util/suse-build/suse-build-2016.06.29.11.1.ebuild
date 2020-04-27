# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit rpm

MAJOR_PV=$(ver_cut 1-3)
MY_DL=$(ver_cut 4-5)

DESCRIPTION="SUSE build package"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/openSUSE_42.3/src/build-${MAJOR_PV//./}-${MY_DL}.src.rpm"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/XML-Parser
		virtual/perl-Compress-Raw-Zlib
		dev-perl/Crypt-SSLeay"
RDEPEND="${DEPEND}"

S="${WORKDIR}/obs-build-${MAJOR_PV}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
    eapply -p1 "${FILESDIR}/Makefile.patch"

    find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
    find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
}
