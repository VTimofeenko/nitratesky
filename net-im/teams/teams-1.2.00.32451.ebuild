# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MULTILIB_COMPAT=( abi_x86_64 )

inherit chromium-2 desktop rpm xdg

DESCRIPTION="Microsoft Teams for Linux is your chat-centered workspace in Office 365."
HOMEPAGE="https://www.teams.microsoft.com/"
SRC_URI="https://packages.microsoft.com/yumrepos/ms-teams/${P}-1.x86_64.rpm"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RDEPEND=""

pkg_setup() {
	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
	rpm_src_unpack ${A}
}

src_prepare() {
	default

}

src_install() {
	dodir /opt/${PN}
	cp -a "${WORKDIR}"/* "${D}"/opt/${PN}/ || die
	sed -e "s!^Exec=.*!Exec=/opt/teams/bin/teams!" \
		-i usr/share/applications/${PN}.desktop || die

	doicon usr/share/pixmaps/${PN}.png

	domenu usr/share/applications/${PN}.desktop

}
