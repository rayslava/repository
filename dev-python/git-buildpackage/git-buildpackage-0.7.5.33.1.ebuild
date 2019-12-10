# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
inherit eutils versionator rpm distutils-r1 python-r1

MAJOR_PV="$(get_version_component_range 1-3)"
BUILD_PV="$(get_version_component_range 4)"
UPDATE_PV="$(get_version_component_range 5)"
DESCRIPTION="Git buildpackage python library"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/pre-release/CentOS_6/src/${PN}-${MAJOR_PV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAJOR_PV}"

src_unpack () {
	rpm_src_unpack ${A}
	cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
		EPATCH_FORCE="yes" epatch
}

src_compile() {
   python_setup 'python2*'
   ${EPYTHON} setup.py build || die "Failed to setup ${A}"
}

src_install() {
   python_setup 'python2*'
   ${EPYTHON} setup.py install --root="${D}"
}
