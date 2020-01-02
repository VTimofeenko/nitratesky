# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A basic script to detect when monitors are connected
while the laptop is connected to a specific network."
HOMEPAGE="https://github.com/SabbathHex/monitors-switch"
SRC_URI=""
EGIT_REPO_URI="https://github.com/SabbathHex/monitors-switch"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="root-notify-send"

DEPEND="
virtual/udev
x11-apps/xrandr
net-misc/networkmanager
root-notify-send? ( x11-misc/root-notify-send )
"
RDEPEND=""
BDEPEND=""

src_install () {
	exeinto "/usr/sbin"
	doexe display_detect.sh
	doexe display_hotplug.sh
	insinto "/lib/udev/rules.d"
	doins 95-display-hotplug.rules
}
