# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="DynamoRIO"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="release_${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github cmake-utils

DESCRIPTION="Dr. Memory is a memory monitoring tool capable of identifying memory-related programming errors"
HOMEPAGE="https://github.com/DynamoRIO/drmemory"

LICENSE="BSD"
SLOT="0"
if [[ ${PV} != "9999" ]]; then
	KEYWORDS="~amd64"
fi
IUSE=""
DEPEND="dev-util/dynamorio"
RDEPEND="${DEPEND}"
