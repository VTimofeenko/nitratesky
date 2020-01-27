# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A small ctl wrapper around main to be used in conjunction with i3/sway. Provides several modes:

* grab area to clipboard
* grab current (determined by mouse) monitor to file
* grab area, save to file
* save all screens to file

Includes a primitive notification system integration
"
HOMEPAGE="https://gist.github.com/SabbathHex/87940496bd6bb9eec7f397bfe2ffe411"
SRC_URI="https://gist.githubusercontent.com/SabbathHex/87940496bd6bb9eec7f397bfe2ffe411/raw/cc3907074b1a2edce8101b37c0c9043215ba7ac7/monitorshot2.sh"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
media-gfx/maim
x11-libs/libnotify
>=x11-apps/xrandr-1.5.1
>=x11-misc/xdotool-3.20160805.1
>=x11-misc/xclip-0.13
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	# overriding the src_unpack to account for the script being in the open
	mkdir "${WORKDIR}/${P}"
	cp "${DISTDIR}/monitorshot2.sh" "${WORKDIR}/${P}/scrnsht_ctl"
}

src_install() {
	dobin scrnsht_ctl
}
