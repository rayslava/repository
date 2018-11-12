# Copyright 2011-2017 Slava Barinov

EAPI=6
PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1 eutils

DESCRIPTION="Python Reddit API Wrapper core"
HOMEPAGE="https://github.com/praw-dev/prawcore"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.zip -> python-${P}.zip
https://github.com/praw-dev/${PN}/archive/v${PV}.zip -> python-${P}.zip
"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64 x86 arm"
IUSE=""
SLOT="0"

DEPEND=">=dev-python/requests-2.6.0
dev-python/setuptools
"
RDEPEND="${DEPEND}"
