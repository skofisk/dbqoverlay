# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=maturin

inherit distutils-r1 pypi

DESCRIPTION="A Rust HTTP server for Python applications"
HOMEPAGE="https://github.com/emmett-framework/granian"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

RDEPEND="
	>=dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.18[${PYTHON_USEDEP}]
"
