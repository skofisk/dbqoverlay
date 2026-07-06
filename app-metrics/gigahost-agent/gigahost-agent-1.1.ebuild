# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Gigahost.no monitoring script"
HOMEPAGE="https://www.gigahost.no"
SRC_URI="https://flux.gigahost.no/static/agent.sh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 ~ppc ~ppc64 ~sparc x86"
IUSE="+cron"

RDEPEND="
	acct-group/ghagent
	acct-user/ghagent
	net-misc/curl
	app-misc/jq
	sys-apps/iproute2
	cron? ( virtual/cron )
"
DEPEND="${RDEPEND}"

S=${WORKDIR}
RESTRICT="mirror"

install_cron_file() {
	exeinto /etc/cron.d
	newexe "${FILESDIR}"/"{PN}".cron "${PN}"
}

src_install() {
	insinto /opt/gigahost-agent
	doins "${DISTDIR}"/agent.sh

	use cron && install_cron_file

	echo "https://api.gigahost.no/v0/monitor" > /opt/gigahost/gateway

	elog "Manual steps:"
	elog 'echo $SERVERKEY > /opt/gigahost/serverkey'
}
