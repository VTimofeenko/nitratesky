# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig git-r3

DESCRIPTION="A basic script to detect when monitors are connected
while the laptop is connected to a specific network."
HOMEPAGE="https://github.com/SabbathHex/monitors-switch"
SRC_URI=""
EGIT_REPO_URI="https://github.com/SabbathHex/monitors-switch"

LICENSE=""
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
	insinto /lib/udev/rules.d
	doins 95-display-hotplug.rules
	insinto /usr
	dosbin display_detect.sh
	dosbin display_hotplug.sh
}
