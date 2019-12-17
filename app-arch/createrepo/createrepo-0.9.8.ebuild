# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="xml(+)"

inherit versionator

GH_USER="rpm-software-management"
GH_REPO="${PN}"
MY_PV=$(replace_all_version_separators -)

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PN}-${MY_PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit distutils-r1 eutils github

DESCRIPTION="Tizen version of tool which creates a common metadata repository"
HOMEPAGE="http://createrepo.baseurl.org/"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/urlgrabber-2.9.0
	>=app-arch/rpm-4.1.1[python]
	dev-libs/libxml2[python]
	>=app-arch/deltarpm-3.6_pre20110223[python]
	dev-python/pyliblzma"

pkg_setup() {
	python-any-r1_pkg_setup
}

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	cd ${S}
	find -name Makefile -exec \
		sed -e '/^sysconfdir/s:=.*/:=/:' -i {} \; || die
}

src_compile() { :; }

src_install() {
	emake install DESTDIR="${D}"
	dodoc ChangeLog README
	python_fix_shebang "${ED}"
}
