# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="Microsoft Teams client for Linux. Binary precompiled version."
HOMEPAGE="https://teams.microsoft.com/"
SRC_URI="https://github.com/IsmaelMartinez/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3 MIT BSD" # to match various stuff from upstream
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
IUSE=""

src_prepare() {
	# add-startup-script makes it a little easier to generate desktop file
	PATCHES=(
		"${FILESDIR}/${PN}-add-startup-script.patch"
	)
	default
}

src_install() {
	dodir /opt/${PN}
	cp -a "${WORKDIR}/${P}"/* "${D}"/opt/${PN}/ || die
	# should this be here? yeah, probably.
	local res
	# 1024 is unsupported
	for res in  128 16 24 256 32 48 512 64 96 ; do
		newicon -s ${res} "${FILESDIR}/icons/${res}x${res}.png" ${PN}.png
	done
	doicon "${FILESDIR}"/icons/teams-for-linux.png

	dobin ebuild_assets/${PN}
	make_desktop_entry /opt/${PN}/${PN} "Teams for Linux" teams-for-linux
}

pkg_postinst() {
	einfo "1024x1024 icon is not installed, since that size is not supported by portage."
	einfo "Install manually if needed."
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}
