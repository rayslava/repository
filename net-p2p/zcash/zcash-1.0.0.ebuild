# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GH_USER="zcash"
GH_REPO="zcash"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="v${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit autotools-utils eutils github

DESCRIPTION="Zcash is an implementation of the Zerocash protocol."
HOMEPAGE="https://github.com/zcash/zcash/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qrcode"
DEPEND="dev-libs/boost[threads]
dev-libs/openssl
dev-libs/protobuf
qrcode? ( media-gfx/qrencode )"
RDEPEND="${DEPEND}"
