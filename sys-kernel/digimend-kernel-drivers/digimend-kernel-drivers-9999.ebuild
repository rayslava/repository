# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod udev git-r3

DESCRIPTION="DIGImend graphics tablet drivers for the Linux kernel"
HOMEPAGE="http://digimend.github.io/"
EGIT_REPO_URI="https://github.com/DIGImend/${PN}.git"
LICENSE="GPL-2"
SLOT="0"

BUILD_TARGETS="clean modules"
BUILD_PARAMS="-C ${KERNEL_DIR} M=${S}"
MODULE_NAMES="hid-kye(misc:${S}) hid-uclogic(misc:${S}) hid-polostar(misc:${S}) hid-viewsonic(misc:${S})"

src_install() {
	linux-mod_src_install
	insinto $(get_udevdir)
	doins hid-rebind
	udev_newrules udev.rules 90-digimend.rules
	dodoc xorg.conf
	docompress -x "${ED}"/usr/share/doc/${PF}/xorg.conf
}
