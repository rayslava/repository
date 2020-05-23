# Copyright 2017 Slava Barinov

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )

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
SLOT="0"

DEPEND="app-backup/borgbackup
dev-python/setuptools
<dev-python/ruamel-yaml-0.17
>=dev-python/pykwalify-1.6.0"
