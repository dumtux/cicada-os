#!/bin/bash -e

. versions

mkdir -p fetch
cd fetch
(
mkdir -p CB1-Kernel
cd CB1-Kernel
git init --bare
git remote add origin https://github.com/bigtreetech/CB1-Kernel/ | true
git fetch --depth 1 origin  $CB1_KERNEL_VERSION
git branch cbkernel $CB1_KERNEL_VERSION | true
git symbolic-ref HEAD refs/heads/cbkernel
)
(
mkdir -p ubuntu
cd ubuntu
wget -N https://cdimage.ubuntu.com/ubuntu-base/releases/22.10/release/ubuntu-base-22.10-base-arm64.tar.gz
wget -N https://cdimage.ubuntu.com/ubuntu-base/releases/22.10/release/SHA256SUMS

cat SHA256SUMS | grep ubuntu-base-22.10-base-arm64.tar.gz | sha256sum --check -
)
echo "Fetched"
