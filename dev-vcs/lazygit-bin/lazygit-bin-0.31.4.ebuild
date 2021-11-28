# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lazygit, A simple terminal UI for git commands"
HOMEPAGE="https://github.com/jesseduffield/lazygit"
SRC_URI="
	amd64? ( https://github.com/jesseduffield/lazygit/releases/download/v${PV}/lazygit_${PV}_Linux_x86_64.tar.gz )
	x86? ( https://github.com/jesseduffield/lazygit/releases/download/v${PV}/lazygit_${PV}_Linux_32-bit.tar.gz )
	arm64? ( https://github.com/jesseduffield/lazygit/releases/download/v${PV}/lazygit_${PV}_Linux_arm64.tar.gz )
	arm? ( https://github.com/jesseduffield/lazygit/releases/download/v${PV}/lazygit_${PV}_Linux_armv6.tar.gz )
"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm ~arm64"

RDEPEND=""

QA_PRESTRIPPED="usr/bin/lazygit"
QA_PREBUILT="usr/bin/lazygit"

src_install() {
	dobin lazygit
}
