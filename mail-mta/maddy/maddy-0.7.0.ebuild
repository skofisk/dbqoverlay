# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module fcaps systemd

DESCRIPTION="Composable all-in-one mail server"
HOMEPAGE="https://maddy.email"

MY_COMMIT="f5def9cb04bbd60a5add65d1cd27f4389149174f"

SRC_URI="https://github.com/foxcpp/maddy/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://files.dbq.no/${P}-deps.tar.xz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
RESTRICT="mirror"
IUSE="+doc"
RDEPEND="acct-group/${PN}
	acct-user/${PN}"
DEPEND="${RDEPEND}
	doc? ( app-text/scdoc )"
FILECAPS=( "cap_net_bind_service+ep" "usr/bin/${PN}" )
S=${WORKDIR}/${PN}-${MY_COMMIT}

src_compile() {
	default
	"./build.sh" "build" || die
}

src_install() {
	dobin "build/${PN}"
	dodoc -r "docs" "README.md" "HACKING.md"
	doman "build/man/"*
	systemd_dounit "build/systemd/"*
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	dodir "/etc/${PN}"
	insinto "/etc/${PN}"
	newins "build/${PN}.conf" "${PN}.conf"
	fowners -R "${PN}:${PN}" "/etc/${PN}"
	fperms "0770" "/etc/${PN}"
	fperms "0640" "/etc/${PN}/${PN}.conf"
}
