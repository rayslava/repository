# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools libtool

MAJOR_PV="$(ver_cut 1-4)"
TIZEN_ORIG_PV="$(ver_cut 5)"
TIZEN_UPDATE_PV="$(ver_cut 6)"
DESCRIPTION="RPM patched for GBS"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="https://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}.tizen${TIZEN_ORIG_PV}.orig.tar.gz
https://download.tizen.org/tools/latest-release/Ubuntu_22.04/${PN}_${MAJOR_PV}.tizen${TIZEN_ORIG_PV}-tizen${TIZEN_UPDATE_PV}.diff.gz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-admin/smack
		sys-libs/db
		dev-libs/nspr
		dev-libs/nss
		dev-libs/libxml2
		>=dev-lang/lua-5.1
		dev-lang/python
		dev-libs/uthash
		!app-arch/rpm"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${MAJOR_PV}.tizen${TIZEN_ORIG_PV}"

src_unpack () {
	unpack ${PN}_${MAJOR_PV}.tizen${TIZEN_ORIG_PV}.orig.tar.gz
	unpack ${PN}_${MAJOR_PV}.tizen${TIZEN_ORIG_PV}-tizen${TIZEN_UPDATE_PV}.diff.gz
	pushd ${S}
	eapply -p1 ${WORKDIR}/${PN}_${MAJOR_PV}.tizen${TIZEN_ORIG_PV}-tizen${TIZEN_UPDATE_PV}.diff
	popd
}

src_prepare () {
	export NSPR=`pkg-config --cflags nspr`
	export NSS=`pkg-config --cflags nss`
	export CFLAGS="${NSPR} ${NSS} -ffunction-sections"
	export LUA_PKGCONFIG_NAME=lua5.1
	rm -rf sqlite
	cp -a ${S}/packaging/rpm-tizen_macros tizen_macros
	rm -f m4/libtool.m4
	rm -f m4/lt*.m4
	ln -s db3 db
	./autogen.sh
}

src_configure () {
	local NSPR=`pkg-config --cflags nspr`
	local NSS=`pkg-config --cflags nss`
	local XML=`pkg-config --cflags libxml-2.0`
	local LUA=`pkg-config --cflags lua5.1`
	local LUA_LIBS=`pkg-config --libs lua5.1`
	econf --disable-dependency-tracking \
		--enable-python \
		--enable-shared \
		--with-external-db \
		--without-acl \
		--without-cap \
		--with-lua \
		--with-msm \
		PYTHON_MODULENAME=rpm_tizen \
		CFLAGS="${CFLAGS} ${NSPR} ${NSS} ${XML} ${LUA} -ffunction-sections" \
		LDFLAGS="${LDFLAGS} -Wl,-Bsymbolic-functions -ffunction-sections ${LUA_LIBS}"
}

src_install () {
	default
	insinto /usr/$(get_libdir)/rpm
	newins ${S}/packaging/rpm-tizen_macros tizen_macros
}
