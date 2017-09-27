# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 )
inherit eutils versionator rpm distutils-r1

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
REV_PV="$(get_version_component_range 6)"

MY_PB=1.1	# Build number
DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/pre-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.${REV_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${PN}-${MAJOR_PV}"

DEPEND="app-arch/librpm-tizen
		dev-libs/depanneur
		dev-perl/Crypt-SSLeay
		app-emulation/qemu[static-user]
		dev-python/git-buildpackage
		dev-python/pyyaml
		dev-util/suse-build"
RDEPEND="${DEPEND}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
}
