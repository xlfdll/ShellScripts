#!/bin/bash

su - lfs
su

mkdir -pv $LFS
mount -v /dev/sdb2 $LFS
mkdir -pv $LFS/boot
mount -v /dev/sdb1 $LFS/boot

mount -v --bind /dev $LFS/dev
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

chroot "$LFS" /usr/bin/env -i \
	HOME=/root TERM="$TERM" \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin \
	/bin/bash --login
