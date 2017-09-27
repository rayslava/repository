# ebuild file for Eagle Mode 0.84.0
# $Header: $

EAPI=4

inherit multiprocessing

DESCRIPTION="Zoomable user interface with plugin applications"
HOMEPAGE="http://eaglemode.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="jpeg pdf png postscript svg tiff truetype xine"

DEPEND=">=dev-lang/perl-5.8
	>=sys-devel/gcc-3.3
	x11-libs/libX11
	jpeg? ( media-libs/jpeg:62 )
	png? ( media-libs/libpng:1.2 )
	tiff? ( >=media-libs/tiff-4 )
	xine? ( =media-libs/xine-lib-1.1* )
	svg? ( gnome-base/librsvg:2 )
	pdf? ( app-text/poppler[cairo] )
	truetype? ( media-libs/freetype:2 )"
RDEPEND="${DEPEND}
	postscript? ( >=app-text/ghostscript-gpl-8 )" # important to read docs

make_pl_buildargs() {
	echo "continue=no"
	# make sure we don't try to build modules that need build-time libs
	if ! (use jpeg && use pdf && use png && use svg && use tiff && use xine); then
		echo "projects=not:$(\
			use jpeg || echo -n emJpeg,; use png || echo -n emPng,;\
			use tiff || echo -n emTiff,; use xine || echo -n emAv,;\
			use pdf || echo -n emPdf,; use svg || echo -n emSvg)"
	fi
}

src_compile() {
	local cpus
	if has_version dev-lang/perl[ithreads] ; then
		einfo "Building with mutliple CPU cores"
		cpus=$(makeopts_jobs)
	else
		einfo "Perl not built with threads support, using 1 CPU core"
		cpus=1
	fi
	perl make.pl build cpus="${cpus}" $(make_pl_buildargs) || die "Compilation failed"
}

src_install() {
	perl make.pl install "root=${D}" "dir=/usr/lib/eaglemode" menu=yes bin=yes \
	|| die "Installation failed"
	# the docs must be in the $dir for eaglemode to find them, so just symlink them
	dodoc README
	dosym /usr/lib/eaglemode/doc/ /usr/share/doc/${PF}/doc
}

pkg_postinst() {
	elog "Eaglemode can use many optional programs at runtime"
	elog "to display and process different kinds of files."
	elog "For a list of these optional programs see"
	elog "/usr/share/doc/${PF}/doc/html/SystemRequirements.html"
}
