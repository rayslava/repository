# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DIGImend/${PN}.git"
else
	SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit linux-mod udev

DESCRIPTION="DIGImend graphics tablet drivers for the Linux kernel"
HOMEPAGE="http://digimend.github.io/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

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
