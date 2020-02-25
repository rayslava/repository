# Copyright 2017 Slava Barinov

EAPI=6

GH_USER="tdlib"
GH_REPO="td"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
	KEYWORDS="amd64"
else
	GH_BUILD_TYPE="live"
	KEYWORDS=""
fi

inherit github cmake-utils

DESCRIPTION="Cross-platform library for building Telegram clients https://core.telegram.org/tdlib"
HOMEPAGE="https://github.com/tdlib/td"
RESTRICT="primaryuri"
LICENSE="Boost"
IUSE=""
SLOT="0"

DEPEND="dev-libs/openssl
sys-libs/zlib
dev-util/gperf
"
