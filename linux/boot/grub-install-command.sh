grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --modules="tpm btrfs lvm cryptodisk luks" --disable-shim-lock
