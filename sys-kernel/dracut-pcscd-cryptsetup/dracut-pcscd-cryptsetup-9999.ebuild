# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-verify-signature

DESCRIPTION="A dracut module that installs pcscd daemon into initramfs"
HOMEPAGE="https://github.com/VTimofeenko/dracut-pcscd-cryptsetup"
SRC_URI=""
EGIT_REPO_URI="https://github.com/VTimofeenko/dracut-pcscd-cryptsetup"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/pubkey_id_vtimofeenko.asc
EGIT_BRANCH="main"

if [[ ${PV} = 9999 ]] ; then
	EGIT_COMMIT=""
else
	EGIT_COMMIT="${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="debug"

DEPEND=""
RDEPEND="
	app-crypt/ccid[usb]
	app-crypt/p11-kit[systemd]
	dev-libs/opensc[pcsc-lite]
	sys-apps/pcsc-lite[systemd,udev]
	sys-apps/systemd[cryptsetup,pkcs11]
	sys-kernel/dracut
"
BDEPEND="verify-sig? ( app-crypt/openpgp-keys-vtimofeenko )"

src_prepare(){
	if use debug; then
		eapply "${FILESDIR}/debug.patch"
	fi
	default
}
src_install() {
	MY_MODULE_PATH="${EPREFIX}/usr/lib/dracut/modules.d/99pcscd-cryptsetup"
	dodir "${MY_MODULE_PATH}"
	insinto "${MY_MODULE_PATH}"
	doins module-setup.sh
}
