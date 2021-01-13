# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A small utility to write down user patches"
HOMEPAGE="https://github.com/VTimofeenko/portage-record-patch"
SRC_URI=""
EGIT_REPO_URI="https://github.com/VTimofeenko/portage-record-patch"
EGIT_COMMIT="v${PV}"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin record-patch
}
