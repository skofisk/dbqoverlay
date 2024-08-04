# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

CARGO_OPTIONAL=1
PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	anyhow@1.0.86
	arc-swap@1.7.1
	atomic-waker@1.1.2
	autocfg@1.3.0
	backtrace@0.3.73
	base64@0.22.1
	bitflags@2.6.0
	block-buffer@0.10.4
	byteorder@1.5.0
	bytes@1.6.1
	cc@1.1.7
	cfg-if@1.0.0
	cpufeatures@0.2.12
	crossbeam-channel@0.5.13
	crossbeam-utils@0.8.20
	crypto-common@0.1.6
	data-encoding@2.6.0
	digest@0.10.7
	either@1.13.0
	equivalent@1.0.1
	fnv@1.0.7
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.29.0
	h2@0.4.5
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.3.9
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.1.0
	httparse@1.9.4
	httpdate@1.0.3
	hyper-util@0.1.6
	hyper@1.4.1
	indexmap@2.2.6
	indoc@2.0.5
	itertools@0.13.0
	itoa@1.0.11
	libc@0.2.155
	libmimalloc-sys@0.1.39
	lock_api@0.4.12
	log@0.4.22
	memchr@2.7.4
	memoffset@0.9.1
	mimalloc@0.1.43
	miniz_oxide@0.7.4
	mio@1.0.1
	object@0.36.2
	once_cell@1.19.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	portable-atomic@1.7.0
	ppv-lite86@0.2.19
	proc-macro2@1.0.86
	pyo3-build-config@0.22.2
	pyo3-ffi@0.22.2
	pyo3-macros-backend@0.22.2
	pyo3-macros@0.22.2
	pyo3@0.22.2
	python3-dll-a@0.2.10
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.3
	ring@0.17.8
	rustc-demangle@0.1.24
	rustls-pemfile@2.1.2
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.6
	rustls@0.22.4
	scopeguard@1.2.0
	sha1@0.10.6
	signal-hook-registry@1.4.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	spin@0.9.8
	subtle@2.6.1
	syn@2.0.72
	target-lexicon@0.12.15
	thiserror-impl@1.0.63
	thiserror@1.0.63
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tikv-jemallocator@0.5.4
	tls-listener@0.10.1
	tokio-macros@2.4.0
	tokio-rustls@0.25.0
	tokio-stream@0.1.15
	tokio-tungstenite@0.23.1
	tokio-util@0.7.11
	tokio@1.39.2
	tracing-core@0.1.32
	tracing@0.1.40
	tungstenite@0.23.0
	typenum@1.17.0
	unicode-ident@1.0.12
	unindent@0.2.3
	untrusted@0.9.0
	utf-8@0.7.6
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
	windows-sys@0.52.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zeroize@1.8.1
"

declare -A GIT_CRATES=(
	[pyo3-log]='https://github.com/vorner/pyo3-log;b62a250533f0a85e245dfcd189cadb368b1c73fc;pyo3-log-%commit%'
)

inherit distutils-r1 pypi cargo

DESCRIPTION="A Rust HTTP server for Python applications"
HOMEPAGE="https://github.com/emmett-framework/granian"

SRC_URI+="
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions ISC MIT
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

RDEPEND="
	>=dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/uvloop-0.18[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-util/maturin
"

# Rust does not respect CFLAGS/LDFLAGS
QA_FLAGS_IGNORED=".*/_rust.*"

src_unpack() {
	cargo_src_unpack
}
