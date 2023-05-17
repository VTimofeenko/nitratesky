# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )
inherit distutils-r1

DESCRIPTION="Provides a simple python interface for interacting with Atlassian products"
HOMEPAGE="https://pypi.org/project/atlassian-python-api/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
dev-python/deprecated[${PYTHON_USEDEP}]
dev-python/requests[${PYTHON_USEDEP}]
dev-python/requests-oauthlib[${PYTHON_USEDEP}]
dev-python/oauthlib[${PYTHON_USEDEP}]
dev-python/six[${PYTHON_USEDEP}]
dev-python/pykerberos[${PYTHON_USEDEP}]
"
RESTRICT="test"  # requires an instance of Confluence

PATCHES=(
	"${FILESDIR}/remove-tests-from-setup.patch"
)
