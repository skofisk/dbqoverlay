# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Modoboa is a mail hosting and management platform including a modern and simplified Web User Interface designed to work with Postfix and Dovecot."
HOMEPAGE="https://modoboa.org/"

REQUIRED_USE=${PYTHON_REQUIRED_USE}

RDEPEND=${PYTHON_DEPS}
BDEPEND=${RDEPEND}
LICENSE="ISC"
SLOT=0
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="
	dev-python/aiosmtpd[${PYTHON_USEDEP}]
	dev-python/asgiref[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	<dev-python/django-5.0[${PYTHON_USEDEP}]
	>=dev-python/django-ckeditor-6.7[${PYTHON_USEDEP}]
	dev-python/django-otp[${PYTHON_USEDEP}]
	dev-python/django-oauth-toolkit[${PYTHON_USEDEP}]
	dev-python/django-environ[${PYTHON_USEDEP}]
	dev-python/django-cors-headers[${PYTHON_USEDEP}]
	dev-python/django-filter[${PYTHON_USEDEP}]
	>=dev-python/django-phonenumber-field-8[${PYTHON_USEDEP}]
	dev-python/django-rename-app[${PYTHON_USEDEP}]
	dev-python/django-rq[${PYTHON_USEDEP}]
	dev-python/django-xforwardedfor-middleware[${PYTHON_USEDEP}]
	dev-python/djangorestframework[${PYTHON_USEDEP}]
	dev-python/dj-database-url[${PYTHON_USEDEP}]
	>dev-python/dnspython-2.6[${PYTHON_USEDEP}]
	dev-python/drf-spectacular[${PYTHON_USEDEP}]
	>=dev-python/feedparser-6.0.11[${PYTHON_USEDEP}]
	>=dev-python/fido2-1.0[${PYTHON_USEDEP}]
	>=dev-python/gevent-24.2.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.2.2[${PYTHON_USEDEP}]
	>=dev-python/oath-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/python-ovh-1.2.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/progressbar2-4.4.2[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	>=dev-python/python-magic-0.4.24[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	>=dev-db/redis-7.2
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rq[${PYTHON_USEDEP}]
	>=net-analyzer/rrdtool-1.8[python]
	>=dev-python/sievelib-1.4.1[${PYTHON_USEDEP}]
	dev-python/tldextract[${PYTHON_USEDEP}]
	dev-python/uritemplate[${PYTHON_USEDEP}]
	"
