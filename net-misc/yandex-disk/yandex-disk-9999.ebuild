# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit rpm

DESCRIPTION="Yandex.Disk official client"
HOMEPAGE="http://disk.yandex.com/"
SRC_URI="x86?	( http://repo.yandex.ru/yandex-disk/yandex-disk-latest.i386.rpm )
	amd64?	( http://repo.yandex.ru/yandex-disk/yandex-disk-latest.x86_64.rpm )"

SLOT="0"
KEYWORDS=""
IUSE=""

RESTRICT="mirror"

S=${WORKDIR}

src_unpack () {
    rpm_src_unpack ${A}
    cd "${S}"
}

src_install() {
	cp -vrR ${S}/* ${D}/
}
