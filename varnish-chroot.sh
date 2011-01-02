#!/bin/bash
#
# Autore: Amedeo Salvati
# e-mail: amedeo dot salvati chiocciola gmail dot com
# 
# Semplice script per creare l'ambiente di chroot a 
# varnish. Testato su Ubuntu 10.10

# dove risiede varnish
CHROOT=/usr/local/varnish
cd $CHROOT

mkdir -p usr/bin
mkdir -p usr/lib
mkdir -p usr/local
mkdir -p dev
mkdir -p tmp
chmod a+rwx tmp
chmod +t tmp

# bin
cd $CHROOT/bin
cp -f /bin/bash .
rm -f sh
ln -s bash sh
cp -f /bin/ls .
cp -f /bin/mv .
cp -f /bin/cp .
cp -f /bin/cat .
cp -f /bin/mkdir .
cp -f /bin/pwd .
cp -f /bin/rm .

# usr/bin
cd $CHROOT/usr/bin
cp -f /usr/bin/id .
cp -f /usr/bin/vim.tiny .
ln -s -f vim.tiny vi

# sbin
cd $CHROOT/sbin
cp -f /sbin/ldconfig.real .
ln -s -f ldconfig.real ldconfig

# lib64
cd $CHROOT
rm -f lib64
ln -s -f lib lib64

# lib
cd $CHROOT/lib
# bash
cp -f /lib/libncurses.so.5 .
cp -f /lib/libdl.so.2 .
cp -f /lib/libc.so.6 .
cp -f /lib64/ld-linux-x86-64.so.2 .
# ls
cp -f /lib/libselinux.so.1 .
cp -f /lib/librt.so.1 .
cp -f /lib/libacl.so.1 .
cp -f /lib/libpthread.so.0 .
cp -f /lib/libattr.so.1 .
# varnishd
cp -f /lib/libnsl.so.1 .
cp -f /lib/libm.so.6 .
cp -f /lib/libpcre.so.3 .
cd $CHROOT/usr/local
rm -f varnish
ln -s -f / varnish
# gcc
cd $CHROOT/lib
cp -f /lib/libz.so.1 .
cp -f /lib/libnss_compat.so.2 .
cp -f /lib/libnss_files.so.2 .
cp -f /lib/libnss_nis.so.2 .

# usr/include (da verificare)
cd $CHROOT/usr
rm -R -f include
cp -R -f /usr/include .

# resolv.conf
cd $CHROOT/etc
cp -f /etc/resolv.conf .

# /etc/nsswitch.conf
cd $CHROOT/etc
cp -f /etc/nsswitch.conf .

# etc/hosts
cd $CHROOT/etc
cp -f /etc/hosts .

# dev/null
cd $CHROOT
rm -f $CHROOT/dev/null
mknod -m 666 $CHROOT/dev/null c 1 3

# gcc
cd $CHROOT/usr/bin
cp -f /usr/bin/gcc-4.4 .
rm -f gcc
ln -s gcc-4.4 gcc
rm -f cc
ln -s gcc cc
cd $CHROOT/usr/lib
rm -R -f gcc
cp -R -f /usr/lib/gcc .
cp -f /usr/lib/libmpfr.so.4 .
cp -f /usr/lib/libgmp.so.3 .
cp -f /usr/lib/libgomp.so.1 .
cd $CHROOT/lib
cp -f /lib/libgcc_s.so.1 .
# usr/bin
cd $CHROOT/usr/bin
cp -f /usr/bin/as .
cp -f /usr/bin/ld.bfd ld
cp -f /usr/bin/nm .
cp -f /usr/bin/strip .
# usr/lib
cd $CHROOT/usr/lib
cp -f /usr/lib/libopcodes-2.20.51-system.20100908.so .
cp -f /usr/lib/libbfd-2.20.51-system.20100908.so .
cp -f /usr/lib/crti.o .
cp -f /usr/lib/libc.so .
cp -f /usr/lib/libc_nonshared.a .
cp -f /usr/lib/crtn.o .
