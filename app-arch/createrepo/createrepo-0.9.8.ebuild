# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_DEPEND="2:2.7"
PYTHON_COMPAT=( python2_7 )
PYTHON_USE_WITH="xml"

inherit python-r1 eutils git-r3

DESCRIPTION="Tizen version of tool which creates a common metadata repository"
HOMEPAGE="http://createrepo.baseurl.org/"
EGIT_REPO_URI="http://createrepo.baseurl.org/git/createrepo.git"
EGIT_COMMIT="createrepo-0-9-8"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/urlgrabber-2.9.0
	>=app-arch/rpm-4.1.1[python]
	dev-libs/libxml2[python]
	>=app-arch/deltarpm-3.6_pre20110223[python]
	dev-python/pyliblzma
	>=sys-apps/yum-3.4.3"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
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
	python_convert_shebangs -r 2 "${ED}"
}
