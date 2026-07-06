# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Gigahost.no status reporting script"
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
	exeinto "/opt/gigahost-agent"
	doexe "${DISTDIR}"/agent.sh

	insinto "/opt/gigahost-agent"
	doins "${FILESDIR}"/gateway

	use cron && install_cron_file

	touch "${ED}/opt/gigahost-agent/serverkey"
	fowners -R ghagent:ghagent /opt/gigahost-agent
	fperms 640 "/opt/gigahost-agent/serverkey"

	ewarn "Manual steps:"
	ewarn 'echo $SERVERKEY > /opt/gigahost/serverkey'
}
