# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="xml(+)"

inherit python-any-r1 eutils git-r3

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
