# Secure Boot + BTRFS + LVM +LUKS

 Read: https://wiki.cachyos.org/configuration/secure_boot_setup/

(archive)[https://archive.is/uw4a6]

# Dracut
Dracut does all the heavy lifting after installing the pacman hooks you get UKI's and in the right place and can simply boot them directly, but it's snaer to use systemd-boot because it abstracts away horrible UEFI implementations

# grub-btrfs: Boot into snapshots when needed
systemd-boot allows us to have a menu etc, also allows to chain into grub-btrfs to boot into snapshots
This lets us encrypt and snapshot the kernel images in /boot and only have tto decrypt when falling into grub for emergency boot into snapshot (since we are using UKIs we can fully encrypt /boot and rarely ever have to decrypt, yet still can! We keep the kernels there for use with Grub, in other words this solution is best of both worlds

# Pacman Hooks for Dracut UKI + Systemd Boot + Secure boot
 These are hooks necessary to get dracut to very simply install UKI (Unified Kernel Image) for us to use systemd-boot
 in Secure Boot with sbctl auto signing on kernel package upgrades along with allowing it to still use to default hooks
 that come with dracute that build the initramfs-linux.img  vmlinuz-linux in /boot in case we want to use GRUB or
 something later, or as an option in systemd boot (GRUB is a pain to automate UKI entries)

 # grub-btrfs
 grub-btrfs can still be used bu chainloading grub so in the case where you need to boot into a btrfs snapshot you still can with this easy and simple secure boot UKI setup :)
