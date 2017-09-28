# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
GH_USER="bobthecow"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github

DESCRIPTION="git flow completion for bash and zsh"
HOMEPAGE="https://github.com/${GH_USER}/${PN}/"
RESTRICT="primaryuri"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash zsh"

RDEPEND="app-shells/bash
	zsh? ( app-shells/zsh )
	dev-vcs/git-flow
	${DEPEND}"

src_install() {
	insinto /etc/bash_completion.d
	doins git-flow-completion.bash

	if use zsh; then
		insinto /etc/zsh
		doins git-flow-completion.zsh
	fi
}

pkg_postinst() {
	if use zsh; then
		ewarn "To activate the git-flow-completion you need to add the following"
		ewarn "to one of your .zshrc files:"
		ewarn ""
		ewarn "\"source /etc/zsh/git-flow-completion.zsh\""
		ewarn ""
		ewarn "If you want to enable it for all users do so in
		\"/etc/zsh/zshrc\"."
	fi
}
