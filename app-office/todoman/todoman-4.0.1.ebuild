# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_10 )
PYTHON_REQ_USE="sqlite"
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1 bash-completion-r1

DESCRIPTION="Simple, standards-based, cli todo (aka: task) manager"
HOMEPAGE="https://github.com/pimutils/todoman"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
IUSE="zsh-completion bash-completion"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="
>=dev-python/click-7.1[${PYTHON_USEDEP}]
<dev-python/click-9.0[${PYTHON_USEDEP}]
>=dev-python/click-log-0.2.1[${PYTHON_USEDEP}]
dev-python/atomicwrites[${PYTHON_USEDEP}]
dev-python/humanize[${PYTHON_USEDEP}]
>=dev-python/icalendar-4.0.3[${PYTHON_USEDEP}]
dev-python/parsedatetime[${PYTHON_USEDEP}]
dev-python/python-dateutil[${PYTHON_USEDEP}]
dev-python/pyxdg[${PYTHON_USEDEP}]
dev-python/tabulate[${PYTHON_USEDEP}]
dev-python/urwid[${PYTHON_USEDEP}]
"
BDEPEND="
${RDEPEND}
dev-python/setuptools_scm[${PYTHON_USEDEP}]
"

DOCS=( AUTHORS.rst CHANGELOG.rst README.rst config.py.sample )

python_test() {
	# pytest dies hard if the envvars do not have any value...
	local -x CI=false
	local -x DETERMINISTIC_TESTS=false
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

src_install() {
	distutils-r1_src_install
	# The upstream suggests using the bundled bin instead of one produced by setup
	dobin "${WORKDIR}/${P}/bin/todo"
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins "${WORKDIR}/${P}/contrib/completion/zsh/_todo"
	fi
	if use bash-completion; then
		dobashcomp "${WORKDIR}/${P}/contrib/completion/bash/_todo"
	fi
}

pkg_preinst() {
	local cur_ver
	cur_ver="$(best_version ${CATEGORY}/${PN})"
	cur_ver="$(ver_cut 1-3 ${cur_ver#*/todoman})"
	if ver_test ${cur_ver} -lt "4.0.0" ; then
		breaking_upgrade="Y"
	fi
}

pkg_postinst() {
	if [ "$breaking_upgrade" == "Y" ] ; then
		ewarn "todoman Configuration file format has changed"
		ewarn "See 'Breaking Changes' issue:"
		ewarn "https://github.com/pimutils/todoman/issues/433"
	fi
}
