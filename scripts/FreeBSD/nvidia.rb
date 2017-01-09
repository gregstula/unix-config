# Downloads and installs most up-to-date nvidia driver for FreeBSD
# Must be run a root

`cd ~/Downloads`
`fetch http://us.download.nvidia.com/XFree86/FreeBSD-x86_64/375.26/NVIDIA-FreeBSD-x86_64-375.26.tar.gz`
`fetch ftp://ftp.freebsd.org/pub/`uname -s`/releases/`uname -m`/`uname -r`/src.txz`
`tar -C / -xzvf src.txz`
`tar -vxzf NVIDIA-FreeBSD-x86_64-361.28.tar.gz`
`cd NVIDIA-FreeBSD-x86_64-361.28`
'make install'



