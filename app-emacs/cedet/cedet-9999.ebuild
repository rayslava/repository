# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/cedet/cedet-1.1.ebuild,v 1.6 2014/06/07 11:03:10 ulm Exp $

EAPI=4

inherit elisp git-2

MY_P=${P/_}
DESCRIPTION="CEDET: Collection of Emacs Development Environment Tools"
HOMEPAGE="http://cedet.sourceforge.net/"
EGIT_REPO_URI="http://git.randomsample.de/cedet.git"
#EBZR_REPO_URI="bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk"

LICENSE="GPL-3+ FDL-1.2+"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~amd64-linux ~x86-linux ~x86-macos ~sparc-solaris"

S="${WORKDIR}/${MY_P}"
SITEFILE="50${PN}-gentoo.el"
EMACSFLAGS="${EMACSFLAGS} -L ${S}/lisp/eieio -L ${S}/lisp/cedet/semantic \
#-L ${S}/lisp/cedet/recode \ -L ${S}/lisp/cedet/ede -L ${S}/lisp/speedbar \
#-L ${S}/lisp/cedet/cogre"

src_compile() {
	emake -j1 \
		EMACS="${EMACS}" \
		EMACSFLAGS="${EMACSFLAGS}"

}

src_test() {
	emake -j1 \
		EMACS="${EMACS}" \
		EMACSFLAGS="${EMACSFLAGS}" \
		utest
}

src_install() {
	rm -rf .git
	local target file dir
	find . -type d -name tests -prune -o -type f -print | while read target
	do
		file=${target##*/}
		dir=${target%/*}; dir=${dir#./}
		case "${file}" in
			*~ | Makefile* | *.pt | *.texi | *-script | PRERELEASE_CHECKLIST \
				| Project.ede | *.clj | USING_CEDET_FROM_BZR | *.sh \
				| *.dot | dir | *.dia | .*ignore | *.wwwinfo \
				| CEDET_STYLE_GUIDE | grammar-fw-ov.txt)
				# ignore
				touch ${file}
				;;
			ChangeLog | README | AUTHORS | *NEWS* | INSTALL \
				| renamelist.txt | semanticdb.sh)
				docinto "${dir}"
				dodoc "${target}" ;;
			*.el | *.by | *.wy)
				# install grammar sources along with the elisp files, since
				# the location where semantic expects them is not configurable
				insinto "${SITELISP}/${PN}/${dir}"
				doins "${target}" ;;
			*.elc)
				# we are in a subshell, so collecting in a variable won't work
				echo "${target}" >>"${T}/elc-list.txt" ;;
			*.srt | *.xpm)
				insinto "${SITEETC}/${PN}/${dir}"
				doins "${target}" ;;
			*.info* | grammar-fw-ov.png)
				doinfo "${target}" ;;
			*)
				die "Unrecognised file ${target}" ;;
		esac
	done

	# make sure that the compiled elisp files don't have older time stamps
	# than corresponding sources, in order to suppress warnings at run time
	while read target; do
		dir=${target%/*}; dir=${dir#./}
		insinto "${SITELISP}/${PN}/${dir}"
		doins "${target}"
	done <"${T}/elc-list.txt"

	elisp-site-file-install "${FILESDIR}/${SITEFILE}"
}
