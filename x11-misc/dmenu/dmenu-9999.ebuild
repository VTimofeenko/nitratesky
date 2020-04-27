# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mercurial

DESCRIPTION="dmenu2 is the fork of original dmenu - an efficient dynamic menu for X, patched with XFT,
quiet, x & y, token, fuzzy matching, follow focus, tab nav, filter. Added option to set screen on which
dmenu apperars, as long as opacity, window class and window name. Also allows to dim screen with
selected color and opacity while dmenu2 is running. Added underline color and height. (options -uc and -uh)"
HOMEPAGE="https://bitbucket.org/melek/dmenu2/src/default/"
SRC_URI=""
EHG_REPO_URI="https://bitbucket.org/melek/dmenu2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xinerama +xft"

DEPEND="
x11-base/xorg-proto
virtual/pkgconfig
media-libs/fontconfig
x11-libs/libX11
xft? ( x11-libs/libXft )
xinerama? ( x11-libs/libXinerama )
"
RDEPEND="${DEPEND}"
BDEPEND=""
PATCHES=(
"${FILESDIR}"/${PN}-location.patch
"${FILESDIR}"/${PN}-xinerama.patch
"${FILESDIR}"/${PN}-xft.patch
)

src_prepare() {
	# this patch needs to be applied every time
	eapply "${FILESDIR}"/${PN}-location.patch
	if ! use xinerama; then
		eapply "${FILESDIR}"/${PN}-xinerama.patch
	fi
	if ! use xft; then
		eapply "${FILESDIR}"/${PN}-xft.patch
	fi

	eapply_user
}
src_install() {
	emake install
}
