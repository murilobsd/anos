all: test build

setup:
	rustup target add thumbv7em-none-eabihf

fmt:
	cargo fmt --all

clippy:
	cargo fmt --all -- --check
	cargo clippy --all -- -D warnings

build: fmt clippy
	cargo build -target thumbv7em-none-eabihf

test: build
	cargo test --all -- --nocapture

watch: build
	cargo watch -x 'test --all -- --nocapture'


help:
	cat Makefile
