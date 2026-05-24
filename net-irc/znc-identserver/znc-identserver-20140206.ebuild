# Copyright 2020-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_COMMIT="fe8569efd2cc1ce478257c6a486c76d7c5f683af"

DESCRIPTION="ZNC module which provides an ident server"
HOMEPAGE="https://github.com/KiNgMaR/znc/blob/msvc/win32/extra_modules/identserver.cpp"
SRC_URI="https://github.com/KiNgMaR/znc/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/znc-${MY_COMMIT}/win32/extra_modules"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

DEPEND="net-irc/znc:="
RDEPEND="${DEPEND}"
BDEPEND=">=dev-build/cmake-3.13"

PATCHES=(
	"${FILESDIR}"/port49113.patch
)

src_prepare() {
	#eapply -p2 "${FILESDIR}"/port49113.patch
	cp -v "${FILESDIR}/CMakeLists.txt" . || die
	cmake_src_prepare
}
