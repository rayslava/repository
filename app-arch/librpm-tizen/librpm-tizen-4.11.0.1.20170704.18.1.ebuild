# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
WANT_AUTOMAKE="1.11"
inherit eutils versionator rpm autotools libtool

MAJOR_PV="$(get_version_component_range 1-4)"
VERSION_REV="$(get_version_component_range 5)"
BUILD_PV="$(get_version_component_range 6)"
UPDATE_PV="$(get_version_component_range 7)"
DESCRIPTION="Deppaneur perl module"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/openSUSE_42.3/src/${PN}-${MAJOR_PV}.tizen${VERSION_REV}-${BUILD_PV}.${UPDATE_PV}.src.rpm"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-admin/smack
		dev-libs/nspr
		dev-libs/nss
		dev-libs/libxml2
		dev-lang/lua"
RDEPEND="${DEPEND}"

S="${WORKDIR}/rpm-${MAJOR_PV}.tizen${VERSION_REV}"

src_unpack () {
	rpm_src_unpack ${A}
	cd "${S}"
	EPATCH_SOURCE="${WORKDIR}" EPATCH_OPTS="-p1" EPATCH_SUFFIX="patch" \
		EPATCH_FORCE="yes" epatch
}

src_prepare () {
	local NSPR=`pkg-config --cflags nspr`
	local NSS=`pkg-config --cflags nss`
	export CFLAGS="${NSPR} ${NSS} -ffunction-sections"
	rm -rf sqlite
	cp -a ${WORKDIR}/rpm-tizen_macros tizen_macros
	rm -f m4/libtool.m4
	rm -f m4/lt*.m4
	./autogen.sh
}

src_configure () {
	local NSPR=`pkg-config --cflags nspr`
	local NSS=`pkg-config --cflags nss`
	local XML=`pkg-config --cflags libxml-2.0`
	local LUA=`pkg-config --cflags lua5.1`
	export CFLAGS="${NSPR} ${NSS} ${XML} ${LUA} -ffunction-sections"
	export LDFLAGS="${LDFLAGS} -Wl,-Bsymbolic-functions -ffunction-sections"
	export LUA_LIBS=`pkg-config --libs lua5.1`
	econf  --disable-dependency-tracking \
		--enable-python \
		--enable-shared \
		--with-external-db \
		--without-acl \
		--without-cap \
		--with-lua \
		--with-msm \
		PYTHON_MODULENAME=rpm_tizen
}
