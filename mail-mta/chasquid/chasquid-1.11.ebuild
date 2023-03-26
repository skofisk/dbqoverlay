# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="chasquid is an SMTP (email) server with a focus on simplicity, security, and ease of operation."

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://blitiri.com.ar/p/chasquid/"
SRC_URI="https://github.com/albertito/chasquid/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://files.dbq.no/${P}-deps.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=">=dev-lang/go-1.18"
RDEPEND="
        net-mail/mailbase
        virtual/logger
        "
IUSE="tools"

src_compile() {
        emake VERSION=v${PV} all
}

src_install() {
        dobin chasquid
        dobin chasquid-util

        if use tools; then
                dobin smtp-check
                dobin mda-lmtp
        fi

        insinto /etc/chasquid
        doins -r "${S}"/etc/chasquid

        diropts -m 0750 -o mail -g mail
        keepdir /var/lib/chasquid
}
