# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

MY_PN="Flask-DebugToolbar"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Debug toolbar for Flask applications"
HOMEPAGE="https://pypi.org/project/Flask-DebugToolbar/ https://github.com/flask-debugtoolbar/flask-debugtoolbar"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~riscv x86"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
"
