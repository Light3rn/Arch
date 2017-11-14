# Light3rn Arch install script
Arch install script

1) Boot Installation
2) If UEFI, partition with fdisk: /dev/sdX1 EFI and /dev/sdX2 Linux (using GPT)
3) If Non-UEFI, partition with fdisk: /dev/sdX1
4) wget https://github.com/lightern/arch/tarball/master -O - | tar xz
5) dir (to check folder)
6) cd lightern-arch-XXXXXXX

Xorg + XMonad:

7) Chmod +x archwayland
8) ./archwayland

Wayland + Gnome or Enlightenment:

9) Chmod +x archinstall
10) ./archinstall
