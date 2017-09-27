# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
inherit eutils versionator rpm distutils-r1

MAJOR_PV="$(get_version_component_range 1-2)"
BUILD_PV="$(get_version_component_range 3)"
UPDATE_PV="$(get_version_component_range 4)"

MY_PB=1.1	# Build number
DESCRIPTION="Release Engineering Process Assistant"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/CentOS_7/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${PN}-${MAJOR_PV}"

DEPEND="dev-util/gbs
		dev-util/osc"
RDEPEND="${DEPEND}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
}
