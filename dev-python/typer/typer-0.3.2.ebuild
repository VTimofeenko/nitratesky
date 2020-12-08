# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
inherit distutils-r1

DESCRIPTION="Typer, build great CLIs. Easy to code. Based on Python type hints."
HOMEPAGE="https://typer.tiangolo.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/pyproject2setuppy[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

