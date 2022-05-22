# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit webapp

DESCRIPTION="Virtual Mail Account management for Exim mailservers"
HOMEPAGE="https://gitlab.com/runout/veximpy"
if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.com/runoutat/veximpy.git"
	inherit git-r3
	KEYWORDS="~amd64"
else
	EGIT_REPO_URI="https://gitlab.com/runout/veximpy.git"
	EGIT_COMMIT="a4e40831d8a661a8bc7607c4017a9b86efca75b1"
	inherit git-r3
	KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
fi

LICENSE="GPL3"
SLOT="0"

RDEPEND="
	www-servers/uwsgi[python]
	>=dev-python/flask-2.1[${PYTHON_USEDEP}]
	dev-python/flask-login[${PYTHON_USEDEP}]
	dev-python/flask-migrate[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/flask-wtf[${PYTHON_USEDEP}]
	dev-python/flask-debugtoolbar[${PYTHON_USEDEP}]
	dev-python/bootstrap-flask[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
    dev-python/pymysql[${PYTHON_USEDEP}]
"
