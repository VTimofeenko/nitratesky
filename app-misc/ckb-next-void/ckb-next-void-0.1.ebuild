# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 linux-info

DESCRIPTION="Based on ckb-next, this ebuild installs a specific commit of CKB-next
and provides a way to apply the patch to enable Corsair Void 0x0a14 device.

If your device ID is different - disable the 0a14 use flag and add a custom patch
to /etc/portage/patches.
"
HOMEPAGE="https://github.com/ckb-next/ckb-next"
SRC_URI=""
EGIT_REPO_URI="https://github.com/ckb-next/ckb-next"
EGIT_BRANCH="void"
EGIT_COMMIT="009ee19f76214ee13c1526d6864ed5ad40b06334"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+0a14 qt animations"

DEPEND="
qt? (
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-libs/quazip
)
!!app-misc/ckb
"
RDEPEND="${DEPEND}"
BDEPEND=""

CONFIG_CHECK="INPUT_UINPUT"

src_prepare() {
	if use 0a14; then
		eapply "${FILESDIR}/${PN}-0a14-headset.patch"
	fi
	if ! use qt; then
		eapply "${FILESDIR}/with_gui_no_quazip.patch"
	fi
	eapply "${FILESDIR}/udev-dest.patch"
	cmake-utils_src_prepare
	default
}

src_configure() {
	if ! use qt && use animations; then
		einfo "Animations are enabled, but GUI is disabled. Please make sure you know how to control them"
	fi

	einfo "Configure"
	local mycmakeargs=(
		-DWITH_GUI=$(usex qt)
		-DWITH_ANIMATIONS=$(usex animations)
	)
	cmake-utils_src_configure
}
src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
