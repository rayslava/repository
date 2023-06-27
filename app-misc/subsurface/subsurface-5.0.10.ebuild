# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake eutils

DESCRIPTION="Subsurface is an open source divelog program for recreational, tech, and free-divers that runs on Windows, Mac and Linux"
HOMEPAGE="https://github.com/${PN}/${PN}"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="amd64"
SLOT="0"

DESCRIPTION="Subsurface divelog program"
HOMEPAGE="https://subsurface-divelog.org/"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=">=dev-qt/qtgui-5.2
>=dev-qt/qtpositioning-5.2
>=dev-libs/libxml2-2.10.4
dev-libs/libzip
dev-libs/libxslt
dev-db/sqlite:3
dev-libs/libgit2
=dev-libs/libdivecomputer-subsurface-${PV}"
RDEPEND="${DEPEND}"

CMAKE_MAKEFILE_GENERATOR="emake"
