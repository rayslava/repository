# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 )
inherit eutils versionator cmake-utils rpm

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
DESCRIPTION="libzypp bindings for Perl, Python and Ruby"
HOMEPAGE="https://github.com/openSUSE/libzypp-bindings"
SRC_URI="http://download.tizen.org/tools/pre-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python perl ruby"

DEPEND="dev-libs/libzypp
		<dev-lang/swig-2.0"

RDEPEND="dev-libs/libzypp"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
	EPATCH_EXCLUDE="disable-unparsed-stuff.patch" \
    EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
}
