.PHONY: help fmt clippy build run usb test

all: build

test:
	cargo test

usb:
	dd if=target/x86_64-anos/debug/bootimage-anos.bin of=/dev/sdX && sync

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

run:
	cargo run

help:
	cat Makefile
