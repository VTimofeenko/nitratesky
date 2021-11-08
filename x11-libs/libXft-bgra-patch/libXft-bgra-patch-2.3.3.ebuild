# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="BGRA patch for libXft"
HOMEPAGE="https://gitlab.freedesktop.org/xorg/lib/libxft/-/merge_requests/1"
SRC_URI="https://gitlab.freedesktop.org/xorg/lib/libxft/-/commit/7808631e7a9a605d5fe7a1077129c658d9ec47fc.diff"

LICENSE="MIT"  # as in upstream
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
=x11-libs/libXft-2.3.3-r0"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
COMMIT_ID="7808631e7a9a605d5fe7a1077129c658d9ec47fc"

src_unpack() {
	cp "${DISTDIR}"/* "${WORKDIR}"/
}

src_install() {
	insinto "/etc/portage/patches/x11-libs/libXft-2.3.3"
	newins "${COMMIT_ID}.diff" "libXft-bgra-commit-${COMMIT_ID}.patch"
}

pkg_postinst() {
	elog "libXft BGRA patch installed. Please recompile libXft."
}
