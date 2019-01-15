#!/bin/bash

XZ_OPT=-9 tar cvpJf $1_root.tar.xz --exclude=/$1_root.tar.xz --one-file-system /
XZ_OPT=-9 tar cvpJf $1_boot.tar.xz --one-file-system /boot
