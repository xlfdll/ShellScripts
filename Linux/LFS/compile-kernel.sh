#!/bin/bash

make mrproper
make defconfig
make menuconfig
make
make modules_install
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-4.15.18-lfs-8.2
cp -iv System.map /boot/System.map-4.15.18
cp -iv .config /boot/config-4.15.18
install -d /usr/share/doc/linux-4.15.18
cp -r Documentation/* /usr/share/doc/linux-4.15.18
