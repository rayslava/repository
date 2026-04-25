EAPI=8

inherit go-module

DESCRIPTION="TUI for reviewing diffs, files, and documents with inline annotations"
HOMEPAGE="https://github.com/umputun/revdiff"
SRC_URI="https://github.com/umputun/revdiff/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	emake build
}

src_install() {
	dobin .bin/revdiff
}
