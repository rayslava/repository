# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/openSUSE/${PN}.git"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openSUSE/${PN}.git"
else
	SRC_URI="https://github.com/openSUSE/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

inherit eutils

DESCRIPTION="OBS build script, can be used with OBS or stand alone"
HOMEPAGE="https://build.opensuse.org/package/show/openSUSE:Tools/build"

LICENSE="GPL-2"
SLOT="0"
IUSE="symlink"

RDEPEND="
	virtual/perl-Digest-MD5
	virtual/perl-Getopt-Long
	dev-perl/XML-Parser
	dev-perl/TimeDate
	app-shells/bash
	app-arch/cpio
	app-arch/rpm
"

S="${WORKDIR}/${P/suse/obs}"

src_compile() { :; }

src_install() {
	emake DESTDIR="${ED}" pkglibdir=/usr/libexec/obs-build install
	cd "${ED}"/usr
	find bin -type l | while read i; do
		mv "${i}" "${i/bin\//bin/suse-}"
		use !symlink || dosym "${i/bin\//suse-}" "/usr/${i}"
	done
	find share/man/man1 -type f | while read i; do
		mv "${i}" "${i/man1\//man1/suse-}"
		use !symlink || dosym "${i/man1\//suse-}" "/usr/${i}"
	done
	find . -type f -exec sed -i 's|/usr/lib/build|/usr/libexec/obs-build|' {} +

	# create symlink for default build config
	dosym /usr/libexec/obs-build/configs/sl42.2.conf /usr/libexec/obs-build/configs/default.conf
}
