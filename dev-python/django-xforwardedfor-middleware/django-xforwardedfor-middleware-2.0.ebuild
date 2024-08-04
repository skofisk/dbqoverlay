# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Use the X-Forwarded-For header to get the real ip of a request."
HOMEPAGE="https://github.com/allo-/django-xforwardedfor-middleware"

LICENSE="Public-Domain"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

DEPEND="
	>=dev-python/django-1.1[${PYTHON_USEDEP}]
"
