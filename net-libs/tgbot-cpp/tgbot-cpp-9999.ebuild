# Copyright 2020 Slava Barinov

EAPI=6

GH_USER="reo7sp"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
	KEYWORDS="amd64"
else
	GH_BUILD_TYPE="live"
	KEYWORDS=""
fi

inherit github cmake-utils

DESCRIPTION="C++ library for Telegram bot API"
HOMEPAGE="https://reo7sp.github.io/tgbot-cpp"
RESTRICT="primaryuri"
LICENSE="MIT"
IUSE=""
SLOT="0"

DEPEND="dev-libs/openssl
sys-libs/zlib
dev-libs/boost
"
