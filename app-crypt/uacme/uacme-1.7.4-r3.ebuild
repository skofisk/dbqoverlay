# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ACMEv2 client written in plain C with minimal dependencies"
HOMEPAGE="https://github.com/ndilieto/uacme"
SRC_URI="https://github.com/ndilieto/uacme/archive/upstream/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/uacme-upstream-${PV}"

KEYWORDS="amd64 arm64"

SLOT="0"
LICENSE="GPL-3"
IUSE="gnutls mbedtls +ualpn +man"
REQUIRED_USE="gnutls? ( !mbedtls )"

RDEPEND="
	>=net-misc/curl-7.77.0-r1
	!gnutls? ( !mbedtls? ( >=dev-libs/openssl-1.1.1k ) )
	gnutls? ( >=net-libs/gnutls-3.7.1 )
	mbedtls? ( >=net-libs/mbedtls-2.26.0 )
	ualpn? ( dev-libs/libev )
"
DEPEND="${RDEPEND}"
BDEPEND="man? ( >=app-text/asciidoc-9.0.5-r1 )"

PATCHES="${FILESDIR}/1.7.4-ualpn-return.patch"

src_configure() {
	econf --runstatedir=/run --with$(use gnutls || use mbedtls && echo out)-openssl \
		$(use_with gnutls) \
		$(use_with mbedtls) \
		$(use_with ualpn) \
		$(use_enable man docs)
}

src_install() {
	emake DESTDIR="${D}" install
	if use ualpn; then
		newconfd "${FILESDIR}/ualpn.confd" ualpn
		newinitd "${FILESDIR}/ualpn.initd" ualpn
	fi
}
