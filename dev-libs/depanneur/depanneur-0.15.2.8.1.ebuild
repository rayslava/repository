# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator rpm

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
DESCRIPTION="Deppaneur perl module"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/CentOS_7/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${PN}-${MAJOR_PV}"

DEPEND=">=dev-util/suse-build-2013.11.12
		dev-perl/HTML-Template
		dev-perl/YAML
		dev-perl/JSON
		dev-lang/perl[ithreads]"
RDEPEND="${DEPEND}"

src_unpack () {
	rpm_src_unpack ${A}
	cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_SUFFIX="patch" \
		EPATCH_FORCE="yes" epatch

	find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
	find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
}
