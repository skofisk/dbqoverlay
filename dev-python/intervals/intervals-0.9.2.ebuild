# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

PYPI_PN="intervals"

inherit distutils-r1 pypi

DESCRIPTION="Python tools for handling intervals (ranges of comparable objects)."
HOMEPAGE="https://pypi.org/project/intervals/ https://github.com/kvesteri/intervals"
#SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
#S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="arm64 amd64 x86"

RDEPEND="
	dev-python/infinity[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs \
	dev-python/pallets-sphinx-themes \
	dev-python/sphinxcontrib-log-cabinet \
	dev-python/sphinx-issues

distutils_enable_tests pytest
