# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="A Django Management Command to rename existing Django Applications."
HOMEPAGE="https://github.com/odwyersoftware/django-rename-app"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
