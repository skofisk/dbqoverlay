# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..14} )

inherit webapp python-r1 git-r3

DESCRIPTION="Virtual Mail Account management for Exim mailservers"
HOMEPAGE="https://gitlab.com/runout/veximpy"
if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://gitlab.com/runoutat/veximpy.git"
	KEYWORDS=""
else
	EGIT_REPO_URI="https://gitlab.com/runout/veximpy.git"
	EGIT_COMMIT="b3baec48825342856aac508b3cac38f6ec3a5b7e"
	KEYWORDS="~alpha amd64 ~arm arm64 ~hppa ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
WEBAPP_MANUAL_SLOT="yes"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	www-servers/uwsgi[python]
	>=dev-python/flask-2.1[${PYTHON_USEDEP}]
	dev-python/flask-login[${PYTHON_USEDEP}]
	dev-python/flask-migrate[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/flask-wtf[${PYTHON_USEDEP}]
	dev-python/bootstrap-flask[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/pymysql[${PYTHON_USEDEP}]
	dev-python/wtforms-components[${PYTHON_USEDEP}]
	dev-python/intervals[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	${PYTHON_DEPS}
"
	#dev-python/flask-debugtoolbar[${PYTHON_USEDEP}]
	#dev-python/virtualenv[${PYTHON_USEDEP}]

need_httpd_fastcgi

pkg_setup() {
	webapp_pkg_setup
}

#src_configure() { :; }
src_install() {
	webapp_src_preinst

	local x
	x="${MY_HOSTROOTDIR}/${PN}"
	mkdir "${D}/${x}"
	dodir "${x}"
	cp -R * "${D}/${x}" || die "Install failed!"

	webapp_src_install
}
