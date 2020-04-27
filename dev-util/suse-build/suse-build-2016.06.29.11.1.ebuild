# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils versionator rpm

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
MAJOR_URL="${MAJOR_PV//./}"
DESCRIPTION="SUSE build package for gbs"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/openSUSE_42.3/src/build-${MAJOR_URL}-${BUILD_PV}.${UPDATE_PV}.src.rpm"
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
    EPATCH_SOURCE="${WORKDIR}" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch

	find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
	find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +

}
