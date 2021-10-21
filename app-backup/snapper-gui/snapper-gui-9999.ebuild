# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="GUI for snapper, a tool for Linux filesystem snapshot management"
HOMEPAGE="https://github.com/ricardomv/snapper-gui"
if [[ "${PV}" = 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ricardomv/${PN}.git"
else
	SRC_URI="https://github.com/ricardomv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="
	${DEPEND}
	app-backup/snapper
	dev-python/dbus-python
	dev-python/pygobject
	x11-libs/gtksourceview
"
