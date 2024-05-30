.PHONY: help fmt clippy build test watch

all: test build

boot:
	qemu-system-x86_64 -drive format=raw,file=target/x86_64-anos/debug/bootimage-anos.bin

setup:
	rustup component add llvm-tools-preview

fmt:
	cargo fmt --all

clippy:
	cargo fmt --all -- --check
	cargo clippy --all -- -D warnings

build:
	cargo bootimage

test: build
	cargo test --all -- --nocapture

watch: build
	cargo watch -x 'test --all -- --nocapture'

help:
	cat Makefile
