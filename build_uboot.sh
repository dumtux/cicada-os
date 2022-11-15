#!/bin/bash -e


mkdir -p build/u-boot
cd build/u-boot

git init --separate-git-dir ../../fetch/CB1-Kernel
git checkout cbkernel -- u-boot

cd u-boot
(
	export BL31=$PWD/../../atf/external/cache/sources/arm-trusted-firmware-sunxi-mainline/master/build/sun50i_h616/debug/bl31.bin
	make CROSS_COMPILE=aarch64-linux-gnu- orangepi_zero2_defconfig
	make CROSS_COMPILE=aarch64-linux-gnu- -j 
)
