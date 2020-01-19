# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="nfc-tools"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PN}-${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit github eutils autotools

DESCRIPTION="Mifare Classic Offline Cracker"
HOMEPAGE="https://github.com/nfc-tools/mfoc"
RESTRICT="primaryuri"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-libs/libnfc"
DEPEND="${RDEPEND}"
