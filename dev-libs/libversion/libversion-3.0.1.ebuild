# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="Advanced version string comparison library"
HOMEPAGE="https://repology.org/"
SRC_URI="https://github.com/repology/libversion/archive/refs/tags/${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# DEPEND=""
# RDEPEND="${DEPEND}"

src_prepare(){
	sed -i -e "s;LIBRARY DESTINATION lib;LIBRARY DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR};" libversion/CMakeLists.txt
	cmake_src_prepare
}
