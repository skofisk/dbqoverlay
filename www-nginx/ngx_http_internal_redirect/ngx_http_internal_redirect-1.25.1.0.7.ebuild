# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit nginx-module

DESCRIPTION="NGINX HTTP Internal Redirect Module"
HOMEPAGE="https://github.com/flygoast/ngx_http_internal_redirect"
SRC_URI+=" https://github.com/flygoast/ngx_http_internal_redirect/archive/refs/heads/master.zip -> ${PN}-${MODULE_PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND="sys-libs/zlib:="
RDEPEND="${DEPEND}"
