# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

PYPI_PN="Flask-DebugToolbar"

inherit distutils-r1 pypi

DESCRIPTION="Debug toolbar for Flask applications"
HOMEPAGE="https://pypi.org/project/Flask-DebugToolbar/ https://github.com/flask-debugtoolbar/flask-debugtoolbar"
#SRC_URI="$(pypi_sdist_url --no-normalize "${MY_PN^}" "${PV}")"
#S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
"
