# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{7,8,9}  )
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
dev-python/requests[${PYTHON_USEDEP}]
dev-python/requests-oauthlib[${PYTHON_USEDEP}]
dev-python/oauthlib[${PYTHON_USEDEP}]
dev-python/six[${PYTHON_USEDEP}]
dev-python/pykerberos[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/00-remove-tests-from-setup.patch"
)
