# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Public key of Newsboat release"
HOMEPAGE="https://newsboat.org/"
SRC_URI="https://newsboat.org/newsboat.pgp"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 arm ppc64 x86"
IUSE="test"

DEPEND=""

S="${WORKDIR}"
MY_KEY_NAME="newsboat.asc"

src_unpack() {
	cp "${DISTDIR}/newsboat.pgp" "${S}/${MY_KEY_NAME}"
}

src_install() {
	insinto /usr/share/openpgp-keys/
	doins ${MY_KEY_NAME}
}
