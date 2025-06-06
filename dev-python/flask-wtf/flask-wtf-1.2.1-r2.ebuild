# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Simple integration of Flask and WTForms"
HOMEPAGE="https://pythonhosted.org/Flask-WTF/ https://pypi.org/project/Flask-WTF/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm64"
RESTRICT="mirror"

RDEPEND="
	dev-python/babel[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-babel[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	>=dev-python/wtforms-1.0.5[${PYTHON_USEDEP}]
"

distutils_enable_sphinx docs dev-python/pallets-sphinx-themes dev-python/sphinxcontrib-log-cabinet dev-python/sphinx-issues
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# tries to access things over the network
	tests/test_recaptcha.py
	# unpackaged Flask-Uploads
	tests/test_file.py
)
