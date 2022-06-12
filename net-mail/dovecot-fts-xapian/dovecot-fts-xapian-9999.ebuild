# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3 autotools

DESCRIPTION="Dovecot FTS plugin using xapian"
HOMEPAGE="https://github.com/grosjo/fts-xapian"

LICENSE="LGPL-2.1"
SLOT="0"

RDEPEND=">=net-mail/dovecot-2.2:=
		>=dev-libs/icu-60
		>=dev-libs/xapian-1.4:=
		>=dev-db/sqlite-3
		"
DEPEND="${RDEPEND}"

# JRG: Special version numbers to access specific branches.
case "${PV}" in
	# Head of master branch. This is a Gentoo convention.
	9999)
		EGIT_REPO_URI="https://github.com/grosjo/fts-xapian.git"
		;;
	# Normal Gentoo releases.
	*)
		SRC_URI="https://github.com/grosjo/fts-xapian/archive/${PV}.tar.gz -> ${P}.tar.gz"
		KEYWORDS="amd64 x86"
		#PATCHES=( "${FILESDIR}"/${PN}-9999-fix-build-system.patch )
		;;
esac

src_unpack() {
	case "${PV}" in
		9999|9998|2.5.1.2)
			git-r3_fetch ${EGIT_REPO_URI} ${REFS} ${TAG}
			git-r3_checkout ${EGIT_REPO_URI} "${WORKDIR}/${P}" ${TAG}
			;;
		*)
			default
			S="${WORKDIR}"/fts-xapian-"${PV}"
			;;
	esac
}

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
	doins "${FILESDIR}"/11-fts-xapian.conf
}
