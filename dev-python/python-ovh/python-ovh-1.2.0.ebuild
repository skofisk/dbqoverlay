# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="ovh"

inherit distutils-r1 pypi

DESCRIPTION="Thin python wrapper around OVH's APIs."
HOMEPAGE="https://github.com/ovh/python-ovh"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
