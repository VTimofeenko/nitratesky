# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Public key of Vladimir Timofeenko"
HOMEPAGE="https://vtimofeenko.github.io"
SRC_URI="https://vtimofeenko.com/gpg/pubkey_id_vtimofeenko.asc
test? ( https://vtimofeenko.com/gpg/pubkey_id_vtimofeenko.asc.sig )"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="test? ( app-crypt/gnupg )"

S="${WORKDIR}"
MY_KEY_NAME="pubkey_id_vtimofeenko.asc"

src_test() {
	local old_umask
	old_umask=$(umask)
	umask 077

	local -x GNUPGHOME=${T}/.gnupg
	mkdir "${GNUPGHOME}" || die
	einfo "Importing keys ..."
	gpg --import "${MY_KEY_NAME}" || die "Key import failed"

	einfo "Testing the key..."
	gpg --verbose --trust-model always --verify "${S}/${MY_KEY_NAME}.sig" || die "Verification failed"

	umask "${old_umask}"
}

src_unpack() {
	cp "${DISTDIR}/pubkey_id_vtimofeenko.asc" "${S}"
	if use test; then
		cp "${DISTDIR}/pubkey_id_vtimofeenko.asc.sig" "${S}"
	fi
}

src_install() {
	insinto /usr/share/openpgp-keys/
	doins pubkey_id_vtimofeenko.asc
}
