# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

MY_PN="WTForms-Components"
MY_P="${MY_PN}-${PV}"

inherit distutils-r1 pypi

DESCRIPTION="Additional fields, validators and widgets for WTForms."
HOMEPAGE="https://pypi.org/project/WTForms-Components/ https://github.com/kvesteri/wtforms-components"
SRC_URI="https://github.com/kvesteri/${PN}/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/wtforms-1.0.5[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinxcontrib-log-cabinet \
	dev-python/sphinx-issues

distutils_enable_tests pytest
