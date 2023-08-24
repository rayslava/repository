# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7..11} )

inherit eutils distutils-r1

MY_PATCH_HASH="tizen20210514"
MY_PN="git-buildpackage"
DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${MY_PN}_${PV}.orig.tar.gz -> ${P}.tar.gz
http://download.tizen.org/tools/latest-release/Ubuntu_20.04/${MY_PN}_${PV}-${MY_PATCH_HASH}.diff.gz -> ${P}-tizen-patch.patch.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-util/osc"
RDEPEND="${DEPEND}"

MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

src_prepare () {
    default
    cd "${S}"
    eapply "${WORKDIR}/${P}-tizen-patch.patch"  # Apply Tizen patches
    find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
    find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
    find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
}

src_install() {
	distutils-r1_src_install
	dosym osc-wrapper.py /usr/bin/osc
	keepdir /usr/lib/osc/source_validators
	cd "${ED}"/usr/
	find . -type f -exec sed -i 's|/usr/bin/build|/usr/bin/suse-build|g'     {} +
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/suse-build|g' {} +
	find . -type f -exec sed -i 's|/usr/lib/obs|/usr/libexec/obs|g'          {} +
	rm -f "${ED}"/usr/share/doc/${PN}*/TODO*
}
