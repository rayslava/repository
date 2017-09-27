# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator rpm cmake-utils

MAJOR_PV="$(get_version_component_range 1-2)"
BUILD_PV="$(get_version_component_range 3)"
UPDATE_PV="$(get_version_component_range 4)"
DESCRIPTION="Firmware upload tool for Tizen devices"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/openSUSE_13.2/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_unpack () {
	rpm_src_unpack ${A}
	cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_SUFFIX="patch" \
		EPATCH_FORCE="yes" epatch
}
