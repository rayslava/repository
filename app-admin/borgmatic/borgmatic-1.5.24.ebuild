# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9,10} )

inherit distutils-r1

DESCRIPTION="A simple wrapper script for the Borg backup software that creates and prunes backups"
HOMEPAGE="https://github.com/witten/borgmatic"
SRC_URI="https://github.com/witten/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPLv3"
KEYWORDS="amd64"
SLOT="0"

DEPEND="app-backup/borgbackup
dev-python/setuptools
<dev-python/ruamel-yaml-0.18
>=dev-python/pykwalify-1.6.0
>=dev-python/colorama-0.4.1
dev-python/jsonschema
dev-python/requests"
