# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit latex-package git-r3

DESCRIPTION="A Rust language and style specification for the LaTeX-package listings"
HOMEPAGE="https://github.com/denki/listings-rust"
EGIT_REPO_URI="https://github.com/denki/listings-rust.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"

BDEPEND="dev-texlive/texlive-latex"
RDEPEND="
	>=dev-tex/pgf-1.10
	dev-texlive/texlive-latexrecommended
"

src_prepare() {
	default
}

src_install() {
	insinto /usr/share/texmf-site/tex/latex/listings-rust
	doins -r listings-rust.sty
}
