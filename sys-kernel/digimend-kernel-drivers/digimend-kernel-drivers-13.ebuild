# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod udev

DESCRIPTION="DIGImend graphics tablet drivers for the Linux kernel"
HOMEPAGE="http://digimend.github.io/"
SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
SLOT="0"

BUILD_TARGETS="modules"
BUILD_PARAMS="-C ${KERNEL_DIR} M=${S}"
MODULE_NAMES="hid-kye(misc:${S}) hid-uclogic(misc:${S}) hid-polostar(misc:${S}) hid-viewsonic(misc:${S})"

src_prepare() {
	default
	eapply -p1 "${FILESDIR}/linux-6.12-1.patch"
	eapply -p1 "${FILESDIR}/linux-6.12-2.patch"
}

src_install() {
	linux-mod_src_install
	insinto $(get_udevdir)
	doins hid-rebind
	udev_newrules udev.rules 90-digimend.rules
	dodoc xorg.conf
	docompress -x "${ED}"/usr/share/doc/${PF}/xorg.conf
}
