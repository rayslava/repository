# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..11} )

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openSUSE/${PN}.git"
else
	SRC_URI="https://github.com/openSUSE/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit distutils-r1

DESCRIPTION="Command line tool for Open Build Service"
HOMEPAGE="https://en.opensuse.org/openSUSE:OSC"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/urllib3[${PYTHON_USEDEP}]
	app-arch/rpm[python]
	dev-python/m2crypto[${PYTHON_USEDEP}]
	${PYTHON_DEPS}
"
PDEPEND="${DEPEND}
	app-admin/sudo
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	distutils-r1_src_prepare
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
