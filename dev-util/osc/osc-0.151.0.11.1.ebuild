# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/osc/osc-0.144.1.ebuild,v 1.2 2014/04/21 07:29:13 scarabeus Exp $

EAPI=5

EGIT_REPO_URI="git://github.com/openSUSE/osc.git"

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="xml"

OBS_PROJECT="openSUSE:Tools"
EXTRA_ECLASS="obs-download"

DISTUTILS_SINGLE_IMPL=
DISTUTILS_IN_SOURCE_BUILD=1
DISTUTILS_NO_PARALLEL_BUILD=1
inherit eutils versionator rpm distutils-r1 ${EXTRA_ECLASS}
unset EXTRA_ECLASS

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"

DESCRIPTION="Command line tool for Open Build Service"
HOMEPAGE="http://developer.tizen.org"

SRC_URI="http://download.tizen.org/tools/pre-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

# Don't move KEYWORDS on the previous line or ekeyword won't work # 399061
KEYWORDS="amd64 x86"

DEPEND="
	dev-python/urlgrabber[${PYTHON_USEDEP}]
	app-arch/rpm[python]
	dev-python/m2crypto[${PYTHON_USEDEP}]
	${PYTHON_DEPS}
"
PDEPEND="${DEPEND}
	app-admin/sudo
	dev-util/obs-service-meta
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
}

src_install() {
	distutils-r1_src_install
	dosym osc-wrapper.py /usr/bin/osc
	keepdir /usr/lib/osc/source_validators
	cd "${ED}"/usr/
	find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
	find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
	rm -f "${ED}"/usr/share/doc/${PN}*/TODO*
}
