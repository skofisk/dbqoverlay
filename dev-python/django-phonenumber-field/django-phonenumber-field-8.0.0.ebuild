# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Django model and form field for normalised phone numbers using python-phonenumbers"
HOMEPAGE="https://github.com/stefanfoulis/django-phonenumber-field"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
IUSE=""

DEPEND="
	dev-python/Babel[${PYTHON_USEDEP}]
	>=dev-python/phonenumbers-7[${PYTHON_USEDEP}]
	>=dev-python/django-4[${PYTHON_USEDEP}]"
