# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

MY_PN="Bootstrap-Flask"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Bootstrap-Flask is a collection of Jinja macros for Bootstrap 4 & 5 and Flask"
HOMEPAGE="https://pypi.org/project/bootstrap-flask/ https://github.com/helloflask/bootstrap-flask"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~riscv x86"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/wtforms-1.0.5[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinxcontrib-log_cabinet \
	dev-python/sphinx-issues
distutils_enable_tests pytest
