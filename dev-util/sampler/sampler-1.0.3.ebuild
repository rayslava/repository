# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build eutils golang-vcs-snapshot

DESCRIPTION="A tool for shell commands execution, visualization and alerting. Configured with a simple YAML file."
HOMEPAGE="https://sampler.dev"
EGO_PN="github.com/sqshq/sampler"
SRC_URI="https://github.com/sqshq/sampler/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${P}"

src_prepare() {
	default
}

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}"
	go get
	go build -o ${PN} || die
	popd || die
}

src_install() {
	pushd src/${EGO_PN} || die
	dobin sampler
	popd || die
}
