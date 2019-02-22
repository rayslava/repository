# Copyright 2017 Slava Barinov

EAPI=6
PYTHON_COMPAT=( python3_5 python3_6 python3_7 )

GH_USER="witten"
GH_REPO="borgmatic"

if [[ ${PV} != "9999" ]]; then
	GH_TAG="${PV}"
else
	GH_BUILD_TYPE="live"
fi

inherit distutils-r1 eutils github

DESCRIPTION="A simple wrapper script for the Borg backup software that creates and prunes backups"
HOMEPAGE="https://github.com/witten/borgmatic"
RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="amd64"
IUSE=""
SLOT="0"

DEPEND="app-backup/borgbackup
dev-python/setuptools
<dev-python/ruamel-yaml-0.16.0
>=dev-python/pykwalify-1.6.0"
