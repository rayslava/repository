# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GH_USER="DynamoRIO"
GH_REPO="${PN}"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="release_${PV//./_}"
else
	GH_BUILD_TYPE="live"
fi

inherit eutils github cmake-utils

DESCRIPTION="DynamoRIO is a runtime code manipulation system that supports code transformations on any part of a program, while it executes."
HOMEPAGE="https://github.com/DynamoRIO/dynamorio"

LICENSE="BSD"
SLOT="0"
if [[ ${PV} != "9999" ]]; then
	KEYWORDS="~amd64"
fi
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
