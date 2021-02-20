# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 git-verify-signature

DESCRIPTION="This is a collection of scripts to be used with tmux, i3-gaps and i3blocks."
HOMEPAGE="https://github.com/VTimofeenko/wm-scripts"
SRC_URI=""
EGIT_REPO_URI="https://github.com/VTimofeenko/wm-scripts"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="libvirt sensors pulsemixer pavucontrol headsetcontrol shortcuts todo verify-sig"

# It is not strictly necessary to use i3blocks with this package, so it's not in the DEPEND
RDEPEND="
libvirt? ( app-emulation/libvirt )
sensors? ( sys-apps/lm-sensors )
pulsemixer? ( media-sound/pulsemixer )
pavucontrol? ( media-sound/pavucontrol )
headsetcontrol? ( app-misc/headsetcontrol )
shortcuts? ( x11-misc/xvkbd )
todo? ( app-office/todoman )
x11-misc/xkblayout-state
>=x11-misc/dunst-1.5.0
"
BDEPEND="verify-sig? ( app-crypt/openpgp-keys-vtimofeenko )"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/pubkey_id_vtimofeenko.asc

src_install () {
	base_dir="usr/libexec/SH-wm-scripts"
	dodir "${base_dir}"
	for _dir in "i3blocks" "i3-helpers" "tmux"; do
		dodir "${base_dir}/${_dir}"
		exeinto "${base_dir}/${_dir}"
		for file in "${_dir}"/*; do
			doexe "$file"
		done
	done
}

pkg_postinst () {
	einfo "If using with i3blocks, the scripts are available at /usr/libexec/SH-wm-scripts/i3blocks"
	einfo "You can provide the path to these scripts by setting "
	einfo "command=/usr/libexec/SH-wm-scripts/i3blocks/\$BLOCK_NAME"
}
