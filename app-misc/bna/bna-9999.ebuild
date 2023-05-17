# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Command-line interface for managing Battle.net authenticator"
HOMEPAGE="https://github.com/jleclanche/python-bna"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/jleclanche/python-bna"
else
	SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.4.0[${PYTHON_USEDEP}]
"
