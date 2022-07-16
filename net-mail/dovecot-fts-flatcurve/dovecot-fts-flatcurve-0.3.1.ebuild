# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools toolchain-funcs

DESCRIPTION="Dovecot FTS plugin to enable message indexing using Xapian"
HOMEPAGE="https://github.com/slusarz/dovecot-fts-flatcurve"
SRC_URI="https://github.com/slusarz/${PN}/archive/v${PV}.tar.gz -> dovecot-fts-flatcurve-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="<net-mail/dovecot-2.4:0=[stemmer]
		>dev-libs/xapian-1.4:=
		"
PATCHES=( "${FILESDIR}"/ascii-capital-0.3.diff )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	tc-export CC CXX
	econf --with-dovecot="${EPREFIX}"/usr/$(get_libdir)/dovecot
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
	insinto /etc/dovecot/conf.d
	doins "${FILESDIR}"/11-fts-flatcurve.conf
}
