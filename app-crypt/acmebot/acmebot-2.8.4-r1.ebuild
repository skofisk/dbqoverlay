# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} pypy3)
export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

EGIT_REPO_URI="https://github.com/plinss/${PN}.git"
[[ $PV == 9999 ]] && _scm=git-r3

inherit ${_scm} distutils-r1

DESCRIPTION="Certificate manager bot using ACME protocol"
HOMEPAGE="https://github.com/plinss/acmebot"
if [[ $PV != 9999 ]]; then
        SRC_URI="https://github.com/plinss/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
fi

PATCHES=(
	"${FILESDIR}/0001-acmev2-v2.patch"
	"${FILESDIR}/02-alt_chain.patch"
)

LICENSE="GPL-3"
SLOT="0"
[[ $PV != 9999 ]] && KEYWORDS="amd64 ~x86"

python_install_all() {
        insinto /etc/logrotate.d
        doins logrotate.d/acmebot
        insinto /etc/acmebot
        doins config/acmebot.example.json
        doins config/acmebot.example.yaml
}
