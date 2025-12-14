# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="5c1da6ebaeb5bf3776201c7817963ee3885fd58f"
MY_P="ngx_http_allow_methods_module-${MY_COMMIT}"
NGINX_MOD_S="${WORKDIR}/${MY_P}"

inherit nginx-module

DESCRIPTION="NGINX HTTP Allow methods module"
HOMEPAGE="https://github.com/pschultz/ngx_http_allow_methods_module"
SRC_URI+=" https://github.com/pschultz/ngx_http_allow_methods_module/archive/${MY_COMMIT}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86 arm64"
RESTRICT="mirror"
PATCHES=("${FILESDIR}/config.patch")
