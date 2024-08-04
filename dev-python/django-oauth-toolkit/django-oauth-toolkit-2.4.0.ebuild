# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="OAuth2 goodies for the Djangonauts!"
HOMEPAGE="https://github.com/jazzband/django-oauth-toolkit"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

DEPEND="
	>=dev-python/django-4[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.1
"
