# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig

DESCRIPTION="Eclass that may be used to verify the signature on the top commit"
HOMEPAGE="https://github.com/VTimofeenko/git-verify-signature.eclass"
SRC_URI="https://github.com/VTimofeenko/git-verify-signature.eclass/archive/v${PV}.tar.gz
verify-sig? ( https://github.com/VTimofeenko/git-verify-signature.eclass/releases/download/v${PV}/v${PV}.tar.gz.sig )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="verify-sig? ( app-crypt/openpgp-keys-vtimofeenko )"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/pubkey_id_vtimofeenko.asc

S="${WORKDIR}/git-verify-signature.eclass-${PV}"

src_install() {
	insinto usr/share/"${PN}"
	doins "${S}"/git-verify-signature.eclass
	einfo "To use this eclass, copy"
	einfo "/usr/share/${PN}/git-verify-signature.eclass"
	einfo "to the 'eclass' directory inside your overlay"
}
