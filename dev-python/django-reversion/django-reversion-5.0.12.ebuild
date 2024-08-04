# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="django-reversion is an extension to the Django web framework that provides version control for model instances."
HOMEPAGE="https://github.com/etianen/django-reversion"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
IUSE=""

DEPEND="
	>=dev-python/django-4[${PYTHON_USEDEP}]"
