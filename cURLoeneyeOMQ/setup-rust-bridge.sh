#!/usr/bin/env bash
cd "$(dirname "$0")"
[ -d omqrust ] || cargo new --lib omqrust
cat <<'RUST_EOF' > omqrust/Cargo.toml
[package]
name = "omqrust"
version = "0.1.0"
edition = "2021"
[dependencies]
libc = "0.2"
RUST_EOF

cat <<'RUST_EOF' > omqrust/src/lib.rs
pub fn verify_environment() -> bool { true }
RUST_EOF
echo "OMQrust skeleton initialized."
