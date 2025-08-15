#!/bin/sh
if [ $(id -u) -ne 0 ]; then
    echo "Need sudo!"
    exit -1
fi
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --modules="tpm btrfs lvm cryptodisk luks" --disable-shim-lock
grub-mkconfig -o /boot/grub/grub.cfg
