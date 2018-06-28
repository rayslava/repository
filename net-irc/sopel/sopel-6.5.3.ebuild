# Copyright 2011-2018 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=6
PYTHON_COMPAT=( python3_5 python3_6 )

inherit distutils-r1 eutils

DESCRIPTION="Sopel is a simple, lightweight, open source, easy-to-use IRC Utility bot, written in Python."
HOMEPAGE="https://github.com/sopel-irc/sopel"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND="
dev-python/xmltodict
dev-python/pytz
dev-python/praw
dev-python/pyenchant
dev-python/pygeoip
<dev-python/requests-3.0.0
"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	newconfd "${FILESDIR}/sopel.confd" "sopel"
	newinitd "${FILESDIR}/sopel.initd" "sopel"
}
