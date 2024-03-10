# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.2
	anstream@0.6.11
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.79
	async-channel@2.2.0
	async-io@2.3.1
	async-lock@2.8.0
	async-lock@3.3.0
	async-process@2.0.1
	async-signal@0.2.5
	async-task@4.7.0
	atomic-waker@1.1.2
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.7
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.4.2
	blocking@1.5.1
	bumpalo@3.14.0
	bytes@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	clap@4.5.0
	clap_builder@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	concurrent-queue@2.4.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	crossbeam-utils@0.8.19
	daemonize@0.5.0
	deranged@0.3.11
	encoding_rs@0.8.33
	env_filter@0.1.0
	env_logger@0.11.1
	equivalent@1.0.1
	errno@0.3.8
	error-chain@0.12.4
	event-listener-strategy@0.4.0
	event-listener-strategy@0.5.0
	event-listener@2.5.3
	event-listener@4.0.3
	event-listener@5.0.0
	fastrand@2.0.1
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@2.2.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	getrandom@0.2.12
	gimli@0.28.1
	glob@0.3.1
	h2@0.3.24
	hashbrown@0.14.3
	hermit-abi@0.3.5
	hostname@0.3.1
	http-body@0.4.6
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper-tls@0.5.0
	hyper@0.14.28
	idna@0.5.0
	indexmap@2.2.2
	ipnet@2.9.0
	itoa@1.0.10
	js-sys@0.3.68
	lazy_static@1.4.0
	libc@0.2.153
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	match_cfg@0.1.0
	memchr@2.7.1
	mime@0.3.17
	minijinja@1.0.12
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.10
	native-tls@0.2.11
	nix@0.27.1
	nom@7.1.3
	num-conv@0.1.0
	num_cpus@1.16.0
	num_threads@0.1.6
	object@0.32.2
	once_cell@1.19.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.2.2+3.2.1
	openssl-sys@0.9.99
	openssl@0.10.63
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	percent-encoding@2.3.1
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.29
	polling@3.4.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.78
	punycode@0.4.1
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	regex-automata@0.4.5
	regex-syntax@0.8.2
	regex@1.10.3
	reqwest@0.11.24
	rustc-demangle@0.1.23
	rustix@0.38.31
	rustls-pemfile@1.0.4
	ryu@1.0.16
	schannel@0.1.23
	scopeguard@1.2.0
	security-framework-sys@2.9.1
	security-framework@2.9.2
	serde@1.0.196
	serde_derive@1.0.196
	serde_json@1.0.113
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	signal-hook-registry@1.4.1
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.5.5
	strsim@0.11.0
	syn@2.0.48
	sync_wrapper@0.1.2
	syslog@6.1.0
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tempfile@3.10.0
	thiserror-impl@1.0.56
	thiserror@1.0.56
	time-core@0.1.2
	time-macros@0.2.17
	time@0.3.34
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-util@0.7.10
	tokio@1.36.0
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.22.4
	tower-service@0.3.2
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	url@2.5.0
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.91
	wasm-bindgen-futures@0.4.41
	wasm-bindgen-macro-support@0.2.91
	wasm-bindgen-macro@0.2.91
	wasm-bindgen-shared@0.2.91
	wasm-bindgen@0.2.91
	web-sys@0.3.68
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.39
	winreg@0.50.0
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
