# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Provides functions to return paths defined by XDG Base Directory Specification"
HOMEPAGE="https://pypi.org/project/xdg/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

# otherwise installed directory name conflicts
RDEPEND="!!dev-python/pyxdg"
