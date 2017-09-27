# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
PYTHON_COMPAT=( python2_7 )
DEPEND="sys-fs/multipath-tools
	app-emulation/qemu[static-user]
	|| (app-arch/rpm[lua] app-arch/rpm5[lua])
	|| ( sys-apps/yum dev-libs/libzypp )
	"
inherit eutils versionator rpm distutils-r1 python-r1

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
DESCRIPTION="Meego Image Creator for Tizen"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${PN}-${MAJOR_PV}"

DEPEND="=app-arch/createrepo-0.9.8"
# dev-python/libzypp-bindings
RDEPEND="${DEPEND}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
    EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
	find -name 'misc.py' -exec sed -i -e 's/qemu-arm64/qemu-aarch64/' {} \;
}


