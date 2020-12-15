# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig git-r3 udev

DESCRIPTION="A basic script to switch monitors when connected to specific network"
HOMEPAGE="https://github.com/VTimofeenko/monitors-switch"
SRC_URI=""
EGIT_REPO_URI="https://github.com/VTimofeenko/monitors-switch"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="root-notify-send +savedconfig"

DEPEND="
virtual/udev
x11-apps/xrandr
net-misc/networkmanager
sys-process/at
root-notify-send? ( x11-misc/root-notify-send )
"
RDEPEND=""
BDEPEND=""

src_prepare () {
	default
	if use root-notify-send; then
		eapply "${FILESDIR}/root-notify.patch"
	fi

	restore_config config.sed
	for file in 95-display-hotplug.rules display_detect.sh; do
		sed -i -f "${WORKDIR}/${P}/config.sed" "${WORKDIR}/${P}/${file}" || die "Sed failed on ${file}"
	done
}

src_install () {
	udev_dorules 95-display-hotplug.rules

	insinto /usr
	dosbin display_detect.sh
	dosbin display_hotplug.sh

	udev_reload
}
