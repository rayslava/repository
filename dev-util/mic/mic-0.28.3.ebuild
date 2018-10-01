# Copyright 2018 Slava Barinov

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils

DESCRIPTION="Mic the Image Creator"
HOMEPAGE="https://www.tizen.org/"
RESTRICT="primaryuri"
LICENSE="GPLv2"
KEYWORDS="~amd64"
IUSE=""
SLOT="0"
SRC_URI="https://download.tizen.org/tools/latest-release/Ubuntu_16.04/${PN}_${PV}.tar.gz"

DEPEND="=app-arch/createrepo-0.9.8
sys-apps/yum"
RDEPEND="${DEPEND}"
