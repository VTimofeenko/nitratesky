# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="BGRA patch for libXft"
HOMEPAGE="https://gitlab.freedesktop.org/xorg/lib/libxft/-/merge_requests/1"
# The SRC_URI has been comprised on Nov 08 2021 by spreading out the
# https://gitlab.freedesktop.org/xorg/lib/libxft/merge_requests/1.patch
# into separate commits. AFAIU, just a link to '1.patch' would link to a dynamic target
# which could produce inconsistent results if something is bumped.
SRC_URI="
	https://gitlab.freedesktop.org/xorg/lib/libxft/-/commit/723092ece088559f1af299236305911f4ee4d450.diff -> 00-add_XftCompositeString-bgra.diff
	https://gitlab.freedesktop.org/xorg/lib/libxft/-/commit/e0fc4ce7e87ab9c4b47e5c8e693f070dfd0d2f7b.diff -> 01-add_XftCompositeText-bgra.diff
	https://gitlab.freedesktop.org/xorg/lib/libxft/-/commit/d385aa3e5320d18918413df0e8aef3a713a47e0b.diff -> 02-add_support_for_bgra_glyphs_display_and_scaling-bgra.diff
"

LICENSE="MIT"  # as in upstream
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	~x11-libs/libXft-${PV}
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}"/* "${WORKDIR}"/
}

src_install() {
	insinto "/etc/portage/patches/x11-libs/libXft-${PV}"
	doins ./*.diff
	# newins "${COMMIT_ID}.diff" "libXft-bgra-commit-${COMMIT_ID}.patch"
}

pkg_postinst() {
	einfo "libXft BGRA patches installed. Please recompile libXft."
}
