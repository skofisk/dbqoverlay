# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	aho-corasick@1.1.3
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.86
	async-channel@2.3.1
	async-io@2.3.3
	async-lock@3.4.0
	async-process@2.2.3
	async-signal@0.2.9
	async-task@4.7.1
	atomic-waker@1.1.2
	autocfg@1.3.0
	backtrace@0.3.73
	base64@0.22.1
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.6.0
	blocking@1.6.1
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.7.1
	cc@1.1.7
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	clap@4.5.13
	clap_builder@4.5.13
	clap_lex@0.7.2
	colorchoice@1.0.2
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	crossbeam-utils@0.8.20
	daemonize@0.5.0
	deranged@0.3.11
	encoding_rs@0.8.34
	env_filter@0.1.2
	env_logger@0.11.5
	equivalent@1.0.1
	errno@0.3.9
	error-chain@0.12.4
	event-listener-strategy@0.5.2
	event-listener@5.3.1
	fastrand@2.1.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@2.3.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	getrandom@0.2.15
	gimli@0.29.0
	glob@0.3.1
	h2@0.4.5
	hashbrown@0.14.5
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hostname@0.3.1
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.1.0
	httparse@1.9.4
	humantime@2.1.0
	hyper-rustls@0.27.2
	hyper-tls@0.6.0
	hyper-util@0.1.6
	hyper@1.4.1
	idna@0.5.0
	indexmap@2.3.0
	ipnet@2.9.0
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	js-sys@0.3.69
	libc@0.2.155
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	match_cfg@0.1.0
	memchr@2.7.4
	mime@0.3.17
	minijinja@1.0.21
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	mio@1.0.1
	native-tls@0.2.12
	nix@0.28.0
	nom@7.1.3
	num-conv@0.1.0
	num_threads@0.1.7
	object@0.36.2
	once_cell@1.19.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.3.1+3.3.1
	openssl-sys@0.9.103
	openssl@0.10.66
	parking@2.2.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	piper@0.2.3
	pkg-config@0.3.30
	polling@3.7.2
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.86
	punycode@0.4.1
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.3
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	reqwest@0.12.5
	ring@0.17.8
	rustc-demangle@0.1.24
	rustix@0.38.34
	rustls-pemfile@2.1.3
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.6
	rustls@0.23.12
	ryu@1.0.18
	schannel@0.1.23
	scopeguard@1.2.0
	security-framework-sys@2.11.1
	security-framework@2.11.1
	serde@1.0.204
	serde_derive@1.0.204
	serde_json@1.0.122
	serde_spanned@0.6.7
	serde_urlencoded@0.7.1
	signal-hook-registry@1.4.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	spin@0.9.8
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.72
	sync_wrapper@1.0.1
	syslog@6.1.1
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tempfile@3.11.0
	thiserror-impl@1.0.63
	thiserror@1.0.63
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio-macros@2.4.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.0
	tokio-util@0.7.11
	tokio@1.39.2
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	untrusted@0.9.0
	url@2.5.2
	utf8parse@0.2.2
	vcpkg@0.2.15
	version_check@0.9.5
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	web-sys@0.3.69
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.18
	winreg@0.52.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zeroize@1.8.1
"

inherit cargo

DESCRIPTION="ACME (RFC 8555) client daemon"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/breard-r/acmed"
SRC_URI="${CARGO_CRATE_URIS}"
SRC_URI+=" https://github.com/breard-r/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture

LICENSE+="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD MIT Unicode-DFS-2016"

SLOT="0"
KEYWORDS="amd64 arm64 x86"

DEPEND="
	dev-libs/openssl
	"
src_configure() {
	local myfeatures=(
		"openssl_dyn"
	)
	cargo_src_configure --bin acmed --no-default-features
	#cargo_src_configure --bin tacd --no-default-features
}

src_install() {
	dobin target/release/acmed
	doman man/en/acmed.8
	doman man/en/acmed.toml.5
	#doman man/en/tacd.8

	newconfd "${FILESDIR}/acmed.confd" acmed
	newinitd "${FILESDIR}/acmed.initd" acmed

	insopts -m 644
	insinto /etc/acmed
	doins acmed/config/acmed.toml
	doins acmed/config/default_hooks.toml
	doins acmed/config/letsencrypt.toml

	keepdir /var/lib/acmed
	diropts -m 755
	keepdir /var/lib/acmed/certs
	diropts -m 700
	keepdir /var/lib/acmed/accounts

}
