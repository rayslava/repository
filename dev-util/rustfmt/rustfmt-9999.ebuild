# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-r3

DESCRIPTION="A tool for formatting Rust code according to style guidelines."
HOMEPAGE="https://github.com/rust-lang-nursery/rustfmt"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

EGIT_REPO_URI="https://github.com/rust-lang-nursery/rustfmt"

COMMON_DEPEND="virtual/rust:*"
DEPEND="${COMMON_DEPEND}
	dev-util/cargo"
RDEPEND="${COMMON_DEPEND}"

src_compile() {
	cargo build --release --verbose
}

src_install() {
	dobin target/release/rustfmt
}
