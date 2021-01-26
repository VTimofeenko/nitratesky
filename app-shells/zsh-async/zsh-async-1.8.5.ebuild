# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Asynchronous jobs for ZSH"
HOMEPAGE="https://github.com/mafredri/zsh-async"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/mafredri/zsh-async.git"
else
	SRC_URI="https://github.com/mafredri/zsh-async/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=">=app-shells/zsh-5.0"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto "/usr/share/zsh/site-contrib/${PN}"
	doins "${S}/async.zsh"
}
