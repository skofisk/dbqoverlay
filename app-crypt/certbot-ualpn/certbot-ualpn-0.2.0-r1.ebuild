# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

OWNER="ndilieto"
REPO="certbot-ualpn"
COMMIT="d05422fe2f5f561c2cc056ff5fd408a10c9911b4"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/${OWNER}/${REPO}.git"
else
	SRC_URI="
		https://github.com/${OWNER}/${REPO}/archive/${COMMIT}.tar.gz -> ${PN}-${PV}.gh.tar.gz
	"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv"
fi

PATCHES=(
	"${FILESDIR}/0001-Update-plugin-interface.patch"
)

DESCRIPTION="ualpn TLS-ALPN-01 Authenticator plugin for Certbot"
HOMEPAGE="
	https://github.com/ndilieto/certbot-ualpn
"

S="${WORKDIR}/${PN}-${COMMIT}"
LICENSE="GPL-3"
SLOT="0"

# See certbot/setup.py for acme >= dep
RDEPEND="
	>=app-crypt/certbot-3.3.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
