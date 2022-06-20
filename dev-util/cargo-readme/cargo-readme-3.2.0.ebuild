# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	aho-corasick-0.7.10
	ansi_term-0.11.0
	assert_cli-0.6.3
	atty-0.2.14
	backtrace-0.3.46
	backtrace-sys-0.1.35
	bitflags-1.2.1
	cc-1.0.50
	cfg-if-0.1.10
	clap-2.33.0
	colored-1.9.3
	difference-2.0.0
	environment-0.1.1
	failure-0.1.7
	failure_derive-0.1.7
	hermit-abi-0.1.10
	itoa-0.4.5
	lazy_static-1.4.0
	libc-0.2.68
	memchr-2.3.3
	percent-encoding-2.1.0
	proc-macro2-1.0.10
	quote-1.0.3
	regex-1.3.6
	regex-syntax-0.6.17
	rustc-demangle-0.1.16
	ryu-1.0.3
	serde-1.0.105
	serde_derive-1.0.105
	serde_json-1.0.50
	strsim-0.8.0
	syn-1.0.17
	synstructure-0.12.3
	textwrap-0.11.0
	thread_local-1.0.1
	toml-0.5.6
	unicode-width-0.1.7
	unicode-xid-0.2.0
	vec_map-0.8.1
	winapi-0.3.8
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

MY_PN="cargo-readme"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A cargo subcommand to generate README.md content from doc comments"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/livioribeiro/cargo-readme"

SRC_URI="https://github.com/livioribeiro/cargo-readme/archive/cf66017c0120ae198210ebaf58a0be6a78372974.zip -> ${P}.zip $(cargo_crate_uris)"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Boost-1.0 MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_P}"
