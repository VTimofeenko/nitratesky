# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 bash-completion-r1

DESCRIPTION="Supplementary script for posting confluence wiki articles from vim."
HOMEPAGE="https://pypi.org/project/confluence-poster/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion bash-completion"

DEPEND="${RDEPEND}"
RDEPEND="
~dev-python/atlassian-python-api-2.3.0[${PYTHON_USEDEP}]
>=dev-python/typer-0.3.2[${PYTHON_USEDEP}]
dev-python/toml[${PYTHON_USEDEP}]
dev-python/requests[${PYTHON_USEDEP}]
>=dev-python/xdg-5.0.1[${PYTHON_USEDEP}]
~dev-python/tomlkit-0.7.0[${PYTHON_USEDEP}]
~dev-python/markdown-3.3.3[${PYTHON_USEDEP}]
~dev-python/marshmallow-3.10.0[${PYTHON_USEDEP}]
zsh-completion? ( app-shells/zsh )
"
BDEPEND=""

DOCS=( README.md config.toml )

src_install() {
	distutils-r1_src_install

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "${WORKDIR}/${P}/contrib/completions/zsh/_confluence_poster"
	fi
	if use bash-completion; then
		dobashcomp "${WORKDIR}/${P}/contrib/completions/bash/_confluence_poster"
	fi
}
