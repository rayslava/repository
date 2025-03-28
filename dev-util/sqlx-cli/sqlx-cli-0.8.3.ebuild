# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.7.8
	ahash@0.8.11
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.13
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.81
	argon2@0.4.1
	arrayvec@0.7.4
	assert_cmd@2.0.14
	async-attributes@1.1.2
	async-channel@1.9.0
	async-channel@2.2.0
	async-executor@1.8.0
	async-global-executor@2.4.1
	async-io@1.13.0
	async-io@2.3.2
	async-lock@2.8.0
	async-lock@3.3.0
	async-std@1.13.0
	async-task@4.7.0
	async-trait@0.1.77
	atoi@2.0.0
	atomic-waker@1.1.2
	autocfg@1.1.0
	aws-lc-rs@1.8.0
	aws-lc-sys@0.19.0
	axum@0.5.17
	axum-core@0.2.9
	axum-macros@0.2.3
	backoff@0.4.0
	backtrace@0.3.69
	base64@0.13.1
	base64@0.22.0
	base64ct@1.6.0
	basic-toml@0.1.9
	bigdecimal@0.4.3
	bindgen@0.69.4
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.2
	bitvec@1.0.1
	blake2@0.10.6
	block-buffer@0.10.4
	blocking@1.5.1
	borsh@1.5.1
	borsh-derive@1.5.1
	bstr@1.9.1
	bumpalo@3.15.4
	bytecheck@0.6.12
	bytecheck_derive@0.6.12
	byteorder@1.5.0
	bytes@1.5.0
	camino@1.1.6
	cargo-platform@0.1.7
	cargo_metadata@0.18.1
	cassowary@0.3.0
	cast@0.3.0
	castaway@0.2.3
	cc@1.1.6
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.35
	ciborium@0.2.2
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	clang-sys@1.8.1
	clap@4.5.2
	clap_builder@4.5.2
	clap_complete@4.5.1
	clap_derive@4.5.0
	clap_lex@0.7.0
	clipboard-win@4.5.0
	cmake@0.1.50
	colorchoice@1.0.0
	compact_str@0.7.1
	concurrent-queue@2.4.0
	console@0.15.8
	const-oid@0.9.6
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crc@3.0.1
	crc-catalog@2.4.0
	criterion@0.5.1
	criterion-plot@0.5.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.19
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	darling@0.20.8
	darling_core@0.20.8
	darling_macro@0.20.8
	der@0.7.8
	deranged@0.3.11
	difflib@0.4.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	displaydoc@0.2.5
	doc-comment@0.3.3
	dotenvy@0.15.7
	downcast@0.11.0
	dunce@1.0.4
	either@1.10.0
	encode_unicode@0.3.6
	endian-type@0.1.2
	env_filter@0.1.0
	env_logger@0.11.3
	equivalent@1.0.1
	errno@0.3.8
	error-code@2.3.1
	etcetera@0.8.0
	event-listener@2.5.3
	event-listener@4.0.3
	event-listener@5.2.0
	event-listener-strategy@0.4.0
	event-listener-strategy@0.5.0
	fastrand@1.9.0
	fastrand@2.0.1
	fd-lock@3.0.13
	filetime@0.2.23
	finl_unicode@1.2.0
	float-cmp@0.9.0
	flume@0.11.0
	fnv@1.0.7
	foldhash@0.1.3
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.1
	fragile@2.0.0
	fs_extra@1.3.0
	funty@2.0.0
	futures@0.3.30
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-intrusive@0.5.0
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.2.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getrandom@0.2.12
	gimli@0.28.1
	glob@0.3.1
	gloo-timers@0.3.0
	half@2.4.0
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.10.0
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	hex@0.4.3
	hkdf@0.12.4
	hmac@0.12.1
	home@0.5.9
	http@0.2.12
	http-body@0.4.6
	http-range-header@0.3.1
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper@0.14.28
	iana-time-zone@0.1.60
	iana-time-zone-haiku@0.1.2
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	ident_case@1.0.1
	idna@0.4.0
	idna@1.0.3
	idna_adapter@1.2.0
	if_chain@1.0.2
	indexmap@1.9.3
	indexmap@2.2.5
	instant@0.1.12
	io-lifetimes@1.0.11
	ipnetwork@0.20.0
	is-terminal@0.4.12
	itertools@0.10.5
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.10
	jobserver@0.1.31
	js-sys@0.3.69
	kv-log-macro@1.0.7
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.153
	libloading@0.8.4
	libm@0.2.8
	libredox@0.0.1
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.13
	litemap@0.7.3
	lock_api@0.4.11
	log@0.4.21
	lru@0.12.3
	mac_address@1.1.5
	matchit@0.5.0
	md-5@0.10.6
	memchr@2.7.1
	memoffset@0.6.5
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.11
	mirai-annotations@1.12.0
	mockall@0.11.4
	mockall_derive@0.11.4
	native-tls@0.2.11
	nibble_vec@0.1.0
	nix@0.23.2
	nom@7.1.3
	normalize-line-endings@0.3.0
	num-bigint@0.4.4
	num-bigint-dig@0.8.4
	num-conv@0.1.0
	num-integer@0.1.46
	num-iter@0.1.44
	num-traits@0.2.18
	num_cpus@1.16.0
	object@0.32.2
	once_cell@1.19.0
	oorandom@11.1.3
	openssl@0.10.64
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.2.3+3.2.1
	openssl-sys@0.9.101
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	password-hash@0.4.2
	paste@1.0.14
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	pin-project@1.1.5
	pin-project-internal@1.1.5
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.30
	plotters@0.3.5
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	polling@2.8.0
	polling@3.5.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates@2.1.5
	predicates@3.1.0
	predicates-core@1.0.6
	predicates-tree@1.0.9
	prettyplease@0.2.17
	proc-macro-crate@3.1.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.89
	promptly@0.3.1
	ptr_meta@0.1.4
	ptr_meta_derive@0.1.4
	quote@1.0.35
	radium@0.7.0
	radix_trie@0.2.1
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xoshiro@0.6.0
	ratatui@0.27.0
	rayon@1.9.0
	rayon-core@1.12.1
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.3
	regex-automata@0.4.6
	regex-syntax@0.8.2
	rend@0.4.2
	ring@0.17.8
	rkyv@0.7.44
	rkyv_derive@0.7.44
	rsa@0.9.6
	rust_decimal@1.34.3
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.37.27
	rustix@0.38.31
	rustls@0.23.11
	rustls-native-certs@0.8.0
	rustls-pemfile@2.1.2
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.5
	rustversion@1.0.17
	rustyline@9.1.2
	ryu@1.0.17
	same-file@1.0.6
	schannel@0.1.23
	scopeguard@1.2.0
	seahash@4.1.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	semver@1.0.22
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.114
	serde_urlencoded@0.7.1
	serde_with@2.3.3
	serde_with_macros@2.3.3
	sha1@0.10.6
	sha2@0.10.8
	shlex@1.3.0
	signal-hook@0.3.17
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signature@2.2.0
	simdutf8@0.1.4
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.4.10
	socket2@0.5.6
	spin@0.5.2
	spin@0.9.8
	spki@0.7.3
	stability@0.2.1
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	str-buf@1.0.6
	stringprep@0.1.4
	strsim@0.10.0
	strsim@0.11.0
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.87
	syn_derive@0.1.8
	sync_wrapper@0.1.2
	synstructure@0.13.1
	tap@1.0.1
	tempfile@3.10.1
	termcolor@1.4.1
	termtree@0.4.1
	thiserror@1.0.58
	thiserror@2.0.0
	thiserror-impl@1.0.58
	thiserror-impl@2.0.0
	time@0.3.36
	time-core@0.1.2
	time-macros@0.2.18
	tinystr@0.7.6
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.36.0
	tokio-macros@2.2.0
	tokio-stream@0.1.14
	toml_datetime@0.6.6
	toml_edit@0.21.1
	tower@0.4.13
	tower-http@0.3.5
	tower-layer@0.3.2
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	try-lock@0.2.5
	trybuild@1.0.89
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-truncate@1.1.0
	unicode-width@0.1.13
	untrusted@0.9.0
	url@2.5.3
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.1
	uuid@1.7.0
	validator@0.16.1
	validator_derive@0.16.0
	validator_types@0.16.0
	value-bag@1.8.0
	vcpkg@0.2.15
	version_check@0.9.4
	wait-timeout@0.2.0
	waker-fn@1.1.1
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasite@0.1.0
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	web-sys@0.3.69
	webpki-roots@0.26.3
	which@4.4.2
	whoami@1.5.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	winnow@0.5.40
	write16@1.0.0
	writeable@0.5.5
	wyz@0.5.1
	yoke@0.7.4
	yoke-derive@0.7.4
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	zerofrom@0.1.4
	zerofrom-derive@0.1.4
	zeroize@1.7.0
	zeroize_derive@1.4.2
	zerovec@0.10.4
	zerovec-derive@0.10.3
"

inherit cargo

DESCRIPTION="Command-line utility for SQLx, the Rust SQL toolkit."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/launchbadge/sqlx"
SRC_URI="https://github.com/launchbadge/sqlx/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz $(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"

S="${WORKDIR}/sqlx-${PV}/${PN}"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB openssl"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	virtual/rust"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"
