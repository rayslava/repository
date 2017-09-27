# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
EGO_PN="github.com/odeke-em/drive/cmd/drive"

inherit golang-vcs golang-build

DESCRIPTION="drive is a tiny program to pull or push Google Drive files."
HOMEPAGE="https://github.com/odeke-em/drive"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
