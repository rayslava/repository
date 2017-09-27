# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GH_USER="aws"
GH_REPO="aws-sdk-cpp"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit cmake-utils eutils github

DESCRIPTION=" Amazon Web Services SDK for C++"
HOMEPAGE="https://aws.amazon.com/sdk-for-cpp/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""
DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"
