EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit toolchain-funcs distutils-r1
inherit git-r3
EGIT_REPO_URI="https://github.com/vsq/${PN}.git"

DESCRIPTION="A Python CD-DA ripper preferring accuracy over speed with freedb patch"
HOMEPAGE="https://github.com/vsq/${PN}"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	media-sound/cdparanoia
	app-cdr/cdrdao
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/python-musicbrainz-ngs[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
	dev-python/pycdio[${PYTHON_USEDEP}]
	media-libs/libsndfile
	media-sound/sox
"
DEPEND="
	${PYTHON_DEPS}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
DOCS=( {CHANGELOG,README}.md HACKING TODO )

python_prepare_all() {
	sed -e '/FLAGS/s:=:+=:' -i src/config.mk
	distutils-r1_python_prepare_all
}

python_compile_all() {
	emake -C src CC=$(tc-getCC)
}

python_install_all() {
	distutils-r1_python_install_all
	emake -C src DESTDIR="${D}" PREFIX="/usr" install
}
