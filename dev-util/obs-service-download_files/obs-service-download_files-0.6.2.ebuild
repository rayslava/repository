# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit obs-service

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openSUSE/${PN}.git"
else
	SRC_URI="https://github.com/openSUSE/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DEPEND=""
RDEPEND="${DEPEND}
	dev-vcs/bzr
	dev-vcs/git
	dev-vcs/mercurial
	dev-vcs/subversion
"

src_unpack() {
	default
}

src_install() {
	# different folder and files in this module
	exeinto /usr/libexec/obs/service
	doexe ${OBS_SERVICE_NAME}

	insinto /usr/libexec/obs/service
	doins ${OBS_SERVICE_NAME}.service

	insinto /etc/obs/services
	newins ${OBS_SERVICE_NAME}.rc ${OBS_SERVICE_NAME}
}
