#!/bin/bash -e


mkdir -p build/atf
cd build/atf

git init --separate-git-dir ../../fetch/CB1-Kernel
git checkout cbkernel -- external/cache/sources/arm-trusted-firmware-sunxi-mainline

cd external/cache/sources/arm-trusted-firmware-sunxi-mainline/master

make ENABLE_BACKTRACE="0" CROSS_COMPILE=aarch64-linux-gnu- PLAT=sun50i_h616 DEBUG=1 LDFLAGS="--no-warn-rwx-segment" bl31


