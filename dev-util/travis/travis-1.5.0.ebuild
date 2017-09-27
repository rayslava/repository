# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby20"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC=""

inherit ruby-ng

DESCRIPTION="Travis CI Client (CLI and Ruby library)"
HOMEPAGE="https://github.com/travis-ci/travis.rb"
SRC_URI="https://github.com/travis-ci/travis.rb/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	<dev-ruby/json-1.9
	dev-ruby/rspec
	"
RDEPEND="${DEPEND}"
S="${WORKDIR}/all/${PN}.rb-${PV}"

all_ruby_compile() {
	all_fakegem_compile

	rdoc --title "seattlerb's hoe-3.5.1 Documentation" -o doc --main README.txt lib History.txt Manifest.txt README.txt || die
}

