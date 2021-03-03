# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_8 python3_9 pypy3 )

inherit eutils distutils-r1

MY_PB=1.1	# Build number
DESCRIPTION="Git Build System"
HOMEPAGE="http://developer.tizen.org"
SRC_URI="http://download.tizen.org/tools/latest-release/Ubuntu_20.04/git-buildpackage_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-util/osc
		dev-python/git-buildpackage"
RDEPEND="${DEPEND}"

src_prepare () {
	cd "${S}"
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
