# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Write email in markdown, and convert to multipart MIME"
HOMEPAGE="https://github.com/begriffs/mimedown"
SRC_URI=""
EGIT_REPO_URI="https://github.com/begriffs/mimedown"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-text/cmark"
RDEPEND="${DEPEND}"

src_install(){
	dobin md2mime
}
