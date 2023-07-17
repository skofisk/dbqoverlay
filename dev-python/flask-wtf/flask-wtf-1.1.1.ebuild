# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )

PYPI_NO_NORMALIZE=1
PYPI_PN="Flask-WTF"

inherit pypi
inherit distutils-r1

DESCRIPTION="Simple integration of Flask and WTForms"
HOMEPAGE="https://pythonhosted.org/Flask-WTF/ https://pypi.org/project/Flask-WTF/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror"

RDEPEND="
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-babel[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	>=dev-python/wtforms-1.0.5[${PYTHON_USEDEP}]
"

S=${WORKDIR}/${PYPI_PN}-${PV}

distutils_enable_sphinx docs dev-python/pallets-sphinx-themes dev-python/sphinxcontrib-log_cabinet dev-python/sphinx-issues
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# tries to access things over the network
	tests/test_recaptcha.py
	# unpackaged Flask-Uploads
	tests/test_file.py
)
