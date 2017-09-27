# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils versionator rpm cmake-utils

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
DESCRIPTION="ZYpp Package Management library"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	|| ( app-arch/rpm[lua] app-arch/rpm5[lua] )
	dev-libs/boost
	dev-libs/expat
	dev-libs/libxml2
	dev-libs/openssl:0
	net-misc/curl
	sys-libs/zlib
	virtual/udev
"
DEPEND="${DEPEND}
	sys-devel/gettext
"
S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_unpack () {
rpm_src_unpack ${A}
cd "${S}"
#epatch "${WORKDIR}/disable-autodoc-generated.patch"
}
