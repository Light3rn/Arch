# Light3rn Arch
Arch install script

1) Boot Installation
2a) If UEFI, partition with fdisk: /dev/sdX1 EFI and /dev/sdX2 Linux (using GPT)

2b) If Non-UEFI, partition with fdisk: /dev/sdX1

3) wget https://github.com/lightern/arch/tarball/master -O - | tar xz
4) dir (to check folder)
5) cd lightern-arch-XXXXXXX

Xorg + XMonad:
5a) Chmod +x archinstall
6a) ./archinstall

Wayland + Gnome:
5b) Chmod +x archwayland
6b) ./archwayland
