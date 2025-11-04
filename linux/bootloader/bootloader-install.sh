#!/bin/sh

# This utility script is used for installing systemd-boot on a secureboot PC/Laptop
# that can chainload a grub on encrypted /boot
# for the purposes of booting directly into a btrfs snapshop via grub-btrfs
# In normal operation the intention is to use UKIs via a a signed systemd-boot

if [ "$(id -u)" -ne 0 ]; then
    echo "Need sudo!"
    exit 1
fi
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --modules="tpm btrfs lvm cryptodisk luks" --disable-shim-lock
grub-mkconfig -o /boot/grub/grub.cfg

bootctl install

# This command comes from the CachyOS community and is very good
# https://wiki.cachyos.org/configuration/secure_boot_setup/
# Most relevant information for this set up is available here in case you forget (2025)
# https://archive.ph/uw4a6

sbctl-batch-sign
