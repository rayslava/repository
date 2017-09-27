# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://git.libwebsockets.org/libwebsockets"

inherit git-2 cmake-utils

DESCRIPTION="Lightweight pure C library for websockets api."
HOMEPAGE="http://libwebsockets.org/trac/libwebsockets"
if [[ ${PV} == 9999* ]]; then
    EGIT_BRANCH="master"
    KEYWORDS=""
else
    EGIT_BRANCH="v1.23-chrome32-firefox24"
    KEYWORDS="~x86 ~amd64"
fi


SRC_URI=""

LICENSE="LGPL-2-with-linking-exception"
SLOT="0"
IUSE="openssl"
DEPEND="openssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
        $(cmake-utils_use_with openssl SSL)
    )
    cmake-utils_src_configure
}

