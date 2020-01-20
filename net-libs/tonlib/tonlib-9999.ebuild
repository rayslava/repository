# Copyright 2020 Slava Barinov

EAPI=6

GH_USER="ton-blockchain"
GH_REPO="ton"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
	KEYWORDS="amd64"
else
	GH_BUILD_TYPE="live"
	KEYWORDS=""
fi

inherit github cmake-utils

DESCRIPTION="Telegram Open Network library"
HOMEPAGE="https://github.com/ton-blockchain/ton"
RESTRICT="primaryuri"
LICENSE="GPL-2 LGPL-2"
IUSE="jemalloc"
SLOT="0"

RDEPEND="dev-libs/openssl
sys-libs/zlib
jemalloc? ( dev-libs/jemalloc )
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DTON_USE_JEMALLOC=$(usex jemalloc)
		)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	# Do not violate multilib strict
	mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"
}
