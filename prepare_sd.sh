#!/bin/bash -e

cd build
rm -rf sdcard.img || true
truncate -s 20M sdcard.img

dd if=/dev/zero of=sdcard.img bs=1k count=1023 seek=1 status=noxfer > /dev/null 2>&1
dd if=u-boot/u-boot/u-boot-sunxi-with-spl.bin of=sdcard.img bs=1k seek=8 conv=fsync > /dev/null 2>&1

echo prepared
