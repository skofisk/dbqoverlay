# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

MY_PN="Bootstrap-Flask"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Bootstrap-Flask is a collection of Jinja macros for Bootstrap 4 & 5 and Flask"
HOMEPAGE="https://pypi.org/project/bootstrap-flask/ https://github.com/helloflask/bootstrap-flask"
SRC_URI="$(pypi_sdist_url --no-normalize "${MY_PN^}" "${PV}")"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	>=dev-python/wtforms-1.0.5[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
dev-python/pallets-sphinx-themes \
dev-python/sphinxcontrib-log-cabinet \
dev-python/sphinx-issues
distutils_enable_tests pytest
