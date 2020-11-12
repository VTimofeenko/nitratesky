# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig

DESCRIPTION="Allows calling notify-send as root for it to appear on USERNAME's desktop"
HOMEPAGE="https://gist.github.com/SabbathHex/916c8e02d7fd0008561e24109a6fff07"
SRC_URI="https://gist.githubusercontent.com/SabbathHex/916c8e02d7fd0008561e24109a6fff07/raw/f5ef860b88b3f48103cdd8709186dcc5ca813aaa/root-notify-send"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="savedconfig"

DEPEND="
x11-libs/libnotify
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir "${WORKDIR}/${P}"
	cp "${FILESDIR}/root-notify-send" "${WORKDIR}/${P}/root-notify-send"
}

src_prepare() {
	default

	restore_config config.sed
	sed -i -f "${WORKDIR}/${P}/config.sed" "${WORKDIR}/${P}/root-notify-send" || die "Sed failed"

}

src_install () {
	dobin root-notify-send
}

