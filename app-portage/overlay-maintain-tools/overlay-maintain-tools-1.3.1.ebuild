# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

MY_PN="overlay_maintain_tools"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Generates README and versions report for overlay"
HOMEPAGE="https://pypi.org/project/overlay-maintain-tools/"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="zsh-completion bash-completion"

RDEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/toolz-0.11.1[${PYTHON_USEDEP}]
	~dev-python/typer-0.4.0[${PYTHON_USEDEP}]
	dev-python/libversion[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${MY_PN}-${PV}"

DOCS=( README.md )

src_install() {
	distutils-r1_src_install

	local DATADIR="${S}/${MY_PN}/data"
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "${DATADIR}/_overlay_maintain_tools.zsh_completion"
	fi
	if use bash-completion; then
		doins "${DATADIR}/_overlay_maintain_tools.bash_completion"
	fi

	dodoc "${DATADIR}/sample_readme.skel.jinja2"
}

pkg_postinst() {
	einfo "Sample README jinja skeleton installed into /usr/share/doc/${PF}"
}
