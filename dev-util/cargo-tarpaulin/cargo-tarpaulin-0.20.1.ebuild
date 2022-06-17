# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.1

EAPI=8

CRATES="
	adler-1.0.2
	adler32-1.2.0
	aho-corasick-0.7.18
	ansi_term-0.12.1
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	byteorder-1.4.3
	camino-1.0.5
	cargo-platform-0.1.2
	cargo_metadata-0.14.2
	cc-1.0.72
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.34.0
	coveralls-api-0.5.0
	crc32fast-1.3.0
	curl-0.4.41
	curl-sys-0.4.51+curl-7.80.0
	deflate-0.8.6
	fallible-iterator-0.2.0
	fastrand-1.7.0
	flate2-1.0.22
	fnv-1.0.7
	form_urlencoded-1.0.1
	gimli-0.26.1
	git2-0.14.4
	gzip-header-0.3.0
	hashbrown-0.11.2
	hermit-abi-0.1.19
	hex-0.4.3
	humantime-2.1.0
	humantime-serde-1.1.1
	idna-0.2.3
	indexmap-1.8.1
	instant-0.1.12
	itoa-1.0.1
	jobserver-0.1.24
	lazy_static-1.4.0
	libc-0.2.124
	libgit2-sys-0.13.4+1.4.2
	libssh2-sys-0.2.23
	libz-sys-1.1.3
	log-0.4.14
	matchers-0.0.1
	matches-0.1.9
	md5-0.7.0
	memchr-2.4.1
	memmap-0.7.0
	miniz_oxide-0.4.4
	nix-0.24.1
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.1
	object-0.28.4
	once_cell-1.9.0
	openssl-probe-0.1.4
	openssl-src-111.17.0+1.1.1m
	openssl-sys-0.9.72
	percent-encoding-2.1.0
	pin-project-lite-0.2.7
	pkg-config-0.3.24
	proc-macro2-1.0.39
	procfs-0.12.0
	quick-error-1.2.3
	quick-xml-0.22.0
	quote-1.0.18
	redox_syscall-0.2.10
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.26
	remove_dir_all-0.5.3
	rustc-demangle-0.1.21
	rustc_version-0.4.0
	rusty-fork-0.3.0
	ryu-1.0.9
	same-file-1.0.6
	schannel-0.1.19
	semver-1.0.4
	serde-1.0.137
	serde_derive-1.0.137
	serde_json-1.0.81
	sharded-slab-0.1.4
	smallvec-1.7.0
	socket2-0.4.2
	stable_deref_trait-1.2.0
	strsim-0.8.0
	syn-1.0.95
	tempfile-3.3.0
	textwrap-0.11.0
	thread_local-1.1.3
	time-0.1.44
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	toml-0.5.9
	tracing-0.1.34
	tracing-core-0.1.22
	tracing-log-0.1.2
	tracing-subscriber-0.2.25
	unicode-bidi-0.3.7
	unicode-ident-1.0.0
	unicode-normalization-0.1.19
	unicode-width-0.1.9
	url-2.2.2
	valuable-0.1.0
	vcpkg-0.2.15
	vec_map-0.8.2
	wait-timeout-0.2.0
	walkdir-2.3.2
	wasi-0.10.0+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

MY_PN="tarpaulin"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Cargo-Tarpaulin is a tool to determine code coverage achieved via tests"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/xd009642/tarpaulin"
SRC_URI="https://github.com/xd009642/tarpaulin/archive/${PV}.tar.gz -> ${P}.tar.gz $(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_P}"
