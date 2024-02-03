# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PV=v${PV}

inherit toolchain-funcs

DESCRIPTION="open source database for building cloud services"
HOMEPAGE="https://www.cockroachlabs.com"
SRC_URI="
	amd64? ( https://binaries.cockroachdb.com/cockroach-${MY_PV}.linux-amd64.tgz )
	arm64? ( https://binaries.cockroachdb.com/cockroach-${MY_PV}.linux-arm64.tgz )
"

LICENSE="Cockroach Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	acct-group/cockroach
	acct-user/cockroach
"

DEPEND="
	${RDEPEND}
"

QA_EXECSTACK="usr/bin/cockroach"

src_unpack() {
	if use amd64; then
		 S="${WORKDIR}/cockroach-${MY_PV}.linux-amd64"
	elif use arm64; then
		S="${WORKDIR}/cockroach-${MY_PV}.linux-arm64";
	fi

	default
}

src_install() {
	dobin cockroach
	insinto /var/lib
	doins lib/libgeos.so
	doins lib/libgeos_c.so
	insinto /etc/security/limits.d
	newins "${FILESDIR}"/cockroach-limits.conf cockroach.conf
	newconfd "${FILESDIR}"/cockroach.confd-1.0 cockroach
	newinitd "${FILESDIR}"/cockroach.initd-1.0.1 cockroach
	keepdir /var/log/cockroach
	fowners cockroach:cockroach /var/log/cockroach
}

pkg_postinst(){
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		ewarn "The default setup is for the first node of an insecure"
		ewarn "cluster that only listens on localhost."
		ewarn "Please read the cockroach manual at the following url"
		ewarn "and configure /etc/conf.d/cockroach correctly if you"
		ewarn "plan to use it in production."
		ewarn
		ewarn "http://cockroachlabs.com/docs"
	fi
}
