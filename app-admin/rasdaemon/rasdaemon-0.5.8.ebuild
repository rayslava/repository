# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 autotools linux-info

DESCRIPTION="Tools for Reliability, Availability and Serviceability (RAS) reports"
HOMEPAGE="https://pagure.io/rasdaemon"
EGIT_REPO_URI="git://git.infradead.org/users/mchehab/rasdaemon.git"

if [[ ${PV} != "9999" ]]; then
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPLv2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
CONFIG_CHECK="X86_MCE"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default

	newconfd "${FILESDIR}/rasdaemon.confd" "rasdaemon"
	newinitd "${FILESDIR}/rasdaemon.initd" "rasdaemon"
}
