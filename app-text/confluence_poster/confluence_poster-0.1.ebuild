# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Supplementary script for writing confluence wiki articles in vim.
Capable of alerting in case name of the last author is not the same one as in config so as to prevent collisions in versions."
HOMEPAGE="https://github.com/SabbathHex/confluence_poster"
SRC_URI="https://github.com/SabbathHex/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+bin"

PYTHON_COMPAT=( python3_6 )
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mkdir "${WORKDIR}/${P}"
	mv "${WORKDIR}/post_to_confluence" "${WORKDIR}/${P}" || die
}

src_install() {
	dobin post_to_confluence
}
