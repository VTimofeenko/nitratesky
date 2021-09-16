# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A CLI interface to git that relies heavily on fzf"
HOMEPAGE="https://github.com/bigH/git-fuzzy"
SRC_URI=""
EGIT_REPO_URI="https://github.com/bigH/git-fuzzy"

if [[ ${PV} = 9999 ]] ; then
	EGIT_COMMIT=""
else
	EGIT_COMMIT="${PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=app-shells/fzf-0.20.0
	sys-devel/bc
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/00-libdir-location.patch"
)

src_prepare() {
	default
}

src_install() {
	dobin bin/git-fuzzy
	insinto "usr/share/${PN}"
	doins -r lib/*
}

pkg_postinst() {
	einfo "See ${HOMEPAGE} for environment variables configuration."
	einfo "You may also consider installing the following:"
	einfo "dev-vcs/hub"
	einfo "sys-apps/exa"
	einfo "sys-apps/bat"
	einfo "In addition, delta or diff-so-fancy may be installed, the latter is available from 0bs1d1an overlay. "
}
