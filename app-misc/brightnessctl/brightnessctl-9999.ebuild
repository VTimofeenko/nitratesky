# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="This program allows you read and control device brightness."
HOMEPAGE="https://github.com/Hummer12007/brightnessctl"
SRC_URI=""
EGIT_REPO_URI="https://github.com/Hummer12007/brightnessctl"

if [[ ${PV} = 9999 ]] ; then
	EGIT_COMMIT=""
else
	EGIT_COMMIT="${PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd udev"

DEPEND="
systemd? ( sys-apps/systemd:= )
udev? ( virtual/udev )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	local myconf
	if use systemd && use udev ; then
		myconf="${myconf} ENABLE_SYSTEMD=1 INSTALL_UDEV_RULES=0"
		einfo "Both systemd and udev are specified, defaulting to systemd only"
	elif use udev && ! use systemd; then
		myconf="${myconf} ENABLE_SYSTEMD=0 INSTALL_UDEV_RULES=1"
	elif ! use udev ; then
		myconf="${myconf} INSTALL_UDEV_RULES=0"
	fi

	emake install ${myconf} DESTDIR="${D}"
}
