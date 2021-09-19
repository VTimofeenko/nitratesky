# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 git-verify-signature systemd

DESCRIPTION="A script and a service to bring up isolated namespace for WireGuard"
HOMEPAGE="https://github.com/VTimofeenko/wireguard-namespace-service"
SRC_URI=""
EGIT_REPO_URI="https://github.com/VTimofeenko/wireguard-namespace-service"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/pubkey_id_vtimofeenko.asc
EGIT_BRANCH="main"

if [[ ${PV} = 9999 ]] ; then
	EGIT_COMMIT=""
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Unlicense"
SLOT="0"
IUSE="systemd doc"

# packages that need to be found on built system, e.g. libraries and headers.
DEPEND="net-vpn/wireguard-tools"
# Dependencies required runtime
RDEPEND="${DEPEND}"

BDEPEND="verify-sig? ( app-crypt/openpgp-keys-vtimofeenko )"

src_install(){
	if use systemd; then
		systemd_dounit "systemd/wg-netnamespace@.service"
	fi
	if use doc; then
		doman docs/wg_namespace_cli.8
	fi

	dosbin wg_namespace_cli
}
pkg_postinst(){
	einfo "Before using the service, please configure wireguard"
	einfo "see man wg_namespace_cli for details"
}
