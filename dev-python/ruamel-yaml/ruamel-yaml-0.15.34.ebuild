# Copyright 2011-2017 W-Mark Kubacki
# Distributed under the terms of the OSI Reciprocal Public License

EAPI=6
PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

inherit distutils-r1 eutils

DESCRIPTION="YAML 1.2 loader/dumper package for Python."
HOMEPAGE="https://bitbucket.org/ruamel/yaml"
SRC_URI="https://bitbucket.org/ruamel/yaml/get/${PV}.tar.gz -> python-${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="MIT"
KEYWORDS="amd64"
IUSE=""
SLOT="0"

DEPEND="dev-python/setuptools
dev-python/pip"

src_unpack() {
	default
	cd ${WORKDIR}
	mv ${PN}* ${P}
}

src_install() {
	pip3 install --install-option="--prefix=${D}" .
}
