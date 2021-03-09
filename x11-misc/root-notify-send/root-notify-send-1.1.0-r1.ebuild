# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Allows calling notify-send as root for it to appear on a user's desktop"
HOMEPAGE="https://github.com/VTimofeenko/root-notify-send"
EGIT_REPO_URI="https://github.com/VTimofeenko/root-notify-send"

if [[ ${PV} = 9999 ]] ; then
	EGIT_COMMIT=""
else
	EGIT_COMMIT="v${PV}"
fi

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dunstify"

DEPEND="
x11-libs/libnotify
dunstify? ( || ( ~x11-misc/dunst-1.4.1[dunstify] >=x11-misc/dunst-1.5.0 ) )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if use dunstify; then
		sed -i 's/notify-send/dunstify/' root-notify-* || die "Sed failed!"
	fi
}

src_install () {
	dobin root-notify-send
	dobin root-notify-user
}
