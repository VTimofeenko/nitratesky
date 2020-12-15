# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig

DESCRIPTION="A _very_ primitive telegram notification mechanism"
HOMEPAGE="https://gist.github.com/VTimofeenko/bb2725beb6f321c4c065055deca8bacd"
SRC_URI="https://gist.githubusercontent.com/VTimofeenko/bb2725beb6f321c4c065055deca8bacd/raw/6759a8c5ee41caaab17989c0ecdd7728640fe861/tg-notify"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="savedconfig"

DEPEND="
net-misc/curl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	# overriding the src_unpack to account for the script being in the open
	mkdir "${WORKDIR}/${P}"
	cp "${DISTDIR}/tg-notify" "${WORKDIR}/${P}/tg-notify"
}

src_prepare() {
	default

	restore_config config.sed
	sed -i -f "${WORKDIR}/${P}/config.sed" "${WORKDIR}/${P}/tg-notify" || die "Sed failed"

}

src_install() {
	dobin tg-notify
}
